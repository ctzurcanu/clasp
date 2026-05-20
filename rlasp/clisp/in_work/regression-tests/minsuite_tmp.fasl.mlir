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
    %9 = func.call @cc_nil_value() : () -> i64
    %10 = func.call @cc_errorp(%8) : (i64) -> i64
    %11 = arith.cmpi ne, %10, %9 : i64
    %12 = scf.if %11 -> (i64) {
      scf.yield %8 : i64
    } else {
      %13 = llvm.mlir.addressof @str1 : !llvm.ptr
      %14 = arith.constant 11 : i64
      %15 = func.call @cc_make_string(%13, %14) : (!llvm.ptr, i64) -> i64
      %16 = func.call @cc_nil_value() : () -> i64
      %17 = func.call @cc_intern(%15, %16) : (i64, i64) -> i64
      %18 = func.call @cc_nil_value() : () -> i64
      %19 = func.call @cc_cons(%17, %18) : (i64, i64) -> i64
      %20 = func.call @cc_values_pack(%19) : (i64) -> i64
      func.call @stack_push_pointer(%17) : (i64) -> ()
      %21 = func.call @stack_pop_pointer() : () -> i64
      %22 = func.call @cc_in_package(%21) : (i64) -> i64
      func.call @stack_push_pointer(%22) : (i64) -> ()
      %23 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %23 : i64
    }
    %24 = func.call @cc_nil_value() : () -> i64
    %25 = func.call @cc_errorp(%12) : (i64) -> i64
    %26 = arith.cmpi ne, %25, %24 : i64
    %27 = scf.if %26 -> (i64) {
      scf.yield %12 : i64
    } else {
      %28 = llvm.mlir.addressof @str2 : !llvm.ptr
      %29 = arith.constant 25 : i64
      %30 = func.call @cc_make_string(%28, %29) : (!llvm.ptr, i64) -> i64
      %31 = func.call @cc_nil_value() : () -> i64
      %32 = func.call @cc_intern(%30, %31) : (i64, i64) -> i64
      %33 = func.call @cc_nil_value() : () -> i64
      %34 = func.call @cc_cons(%32, %33) : (i64, i64) -> i64
      %35 = func.call @cc_values_pack(%34) : (i64) -> i64
      func.call @stack_push_pointer(%32) : (i64) -> ()
      %36 = func.call @stack_pop_pointer() : () -> i64
      %37 = llvm.mlir.addressof @str3 : !llvm.ptr
      %38 = arith.constant 4 : i64
      %39 = func.call @cc_make_string(%37, %38) : (!llvm.ptr, i64) -> i64
      %40 = func.call @cc_nil_value() : () -> i64
      %41 = func.call @cc_intern(%39, %40) : (i64, i64) -> i64
      %42 = func.call @cc_nil_value() : () -> i64
      %43 = func.call @cc_cons(%41, %42) : (i64, i64) -> i64
      %44 = func.call @cc_values_pack(%43) : (i64) -> i64
      func.call @stack_push_pointer(%41) : (i64) -> ()
      %45 = llvm.mlir.addressof @str4 : !llvm.ptr
      %46 = arith.constant 3 : i64
      %47 = func.call @cc_make_string(%45, %46) : (!llvm.ptr, i64) -> i64
      %48 = func.call @cc_nil_value() : () -> i64
      %49 = func.call @cc_intern(%47, %48) : (i64, i64) -> i64
      %50 = func.call @cc_nil_value() : () -> i64
      %51 = func.call @cc_cons(%49, %50) : (i64, i64) -> i64
      %52 = func.call @cc_values_pack(%51) : (i64) -> i64
      func.call @stack_push_pointer(%49) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %53 = func.call @stack_pop_pointer() : () -> i64
      %54 = func.call @stack_pop_pointer() : () -> i64
      %55 = func.call @cc_cons(%54, %53) : (i64, i64) -> i64
      func.call @stack_push_pointer(%55) : (i64) -> ()
      %56 = func.call @stack_pop_pointer() : () -> i64
      %57 = func.call @stack_pop_pointer() : () -> i64
      %58 = func.call @cc_cons(%57, %56) : (i64, i64) -> i64
      func.call @stack_push_pointer(%58) : (i64) -> ()
      %59 = llvm.mlir.addressof @str5 : !llvm.ptr
      %60 = arith.constant 15 : i64
      %61 = func.call @cc_make_string(%59, %60) : (!llvm.ptr, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_intern(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_nil_value() : () -> i64
      %65 = func.call @cc_cons(%63, %64) : (i64, i64) -> i64
      %66 = func.call @cc_values_pack(%65) : (i64) -> i64
      func.call @stack_push_pointer(%63) : (i64) -> ()
      %67 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%67) : (i64) -> ()
      %68 = llvm.mlir.addressof @str6 : !llvm.ptr
      %69 = arith.constant 5 : i64
      %70 = func.call @cc_make_string(%68, %69) : (!llvm.ptr, i64) -> i64
      %71 = llvm.mlir.addressof @str7 : !llvm.ptr
      %72 = arith.constant 11 : i64
      %73 = func.call @cc_make_string(%71, %72) : (!llvm.ptr, i64) -> i64
      %74 = func.call @cc_intern(%70, %73) : (i64, i64) -> i64
      %75 = func.call @cc_nil_value() : () -> i64
      %76 = func.call @cc_cons(%74, %75) : (i64, i64) -> i64
      %77 = func.call @cc_values_pack(%76) : (i64) -> i64
      func.call @stack_push_pointer(%74) : (i64) -> ()
      %78 = llvm.mlir.addressof @str8 : !llvm.ptr
      %79 = arith.constant 7 : i64
      %80 = func.call @cc_make_string(%78, %79) : (!llvm.ptr, i64) -> i64
      %81 = llvm.mlir.addressof @str9 : !llvm.ptr
      %82 = arith.constant 11 : i64
      %83 = func.call @cc_make_string(%81, %82) : (!llvm.ptr, i64) -> i64
      %84 = func.call @cc_intern(%80, %83) : (i64, i64) -> i64
      %85 = func.call @cc_nil_value() : () -> i64
      %86 = func.call @cc_cons(%84, %85) : (i64, i64) -> i64
      %87 = func.call @cc_values_pack(%86) : (i64) -> i64
      func.call @stack_push_pointer(%84) : (i64) -> ()
      %88 = llvm.mlir.addressof @str10 : !llvm.ptr
      %89 = arith.constant 8 : i64
      %90 = func.call @cc_make_string(%88, %89) : (!llvm.ptr, i64) -> i64
      %91 = llvm.mlir.addressof @str11 : !llvm.ptr
      %92 = arith.constant 11 : i64
      %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
      %94 = func.call @cc_intern(%90, %93) : (i64, i64) -> i64
      %95 = func.call @cc_nil_value() : () -> i64
      %96 = func.call @cc_cons(%94, %95) : (i64, i64) -> i64
      %97 = func.call @cc_values_pack(%96) : (i64) -> i64
      func.call @stack_push_pointer(%94) : (i64) -> ()
      %98 = llvm.mlir.addressof @str12 : !llvm.ptr
      %99 = arith.constant 5 : i64
      %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
      %101 = llvm.mlir.addressof @str13 : !llvm.ptr
      %102 = arith.constant 11 : i64
      %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
      %104 = func.call @cc_intern(%100, %103) : (i64, i64) -> i64
      %105 = func.call @cc_nil_value() : () -> i64
      %106 = func.call @cc_cons(%104, %105) : (i64, i64) -> i64
      %107 = func.call @cc_values_pack(%106) : (i64) -> i64
      func.call @stack_push_pointer(%104) : (i64) -> ()
      %108 = llvm.mlir.addressof @str14 : !llvm.ptr
      %109 = arith.constant 6 : i64
      %110 = func.call @cc_make_string(%108, %109) : (!llvm.ptr, i64) -> i64
      %111 = llvm.mlir.addressof @str15 : !llvm.ptr
      %112 = arith.constant 11 : i64
      %113 = func.call @cc_make_string(%111, %112) : (!llvm.ptr, i64) -> i64
      %114 = func.call @cc_intern(%110, %113) : (i64, i64) -> i64
      %115 = func.call @cc_nil_value() : () -> i64
      %116 = func.call @cc_cons(%114, %115) : (i64, i64) -> i64
      %117 = func.call @cc_values_pack(%116) : (i64) -> i64
      func.call @stack_push_pointer(%114) : (i64) -> ()
      %118 = llvm.mlir.addressof @str16 : !llvm.ptr
      %119 = arith.constant 8 : i64
      %120 = func.call @cc_make_string(%118, %119) : (!llvm.ptr, i64) -> i64
      %121 = llvm.mlir.addressof @str17 : !llvm.ptr
      %122 = arith.constant 11 : i64
      %123 = func.call @cc_make_string(%121, %122) : (!llvm.ptr, i64) -> i64
      %124 = func.call @cc_intern(%120, %123) : (i64, i64) -> i64
      %125 = func.call @cc_nil_value() : () -> i64
      %126 = func.call @cc_cons(%124, %125) : (i64, i64) -> i64
      %127 = func.call @cc_values_pack(%126) : (i64) -> i64
      func.call @stack_push_pointer(%124) : (i64) -> ()
      %128 = llvm.mlir.addressof @str18 : !llvm.ptr
      %129 = arith.constant 9 : i64
      %130 = func.call @cc_make_string(%128, %129) : (!llvm.ptr, i64) -> i64
      %131 = llvm.mlir.addressof @str19 : !llvm.ptr
      %132 = arith.constant 11 : i64
      %133 = func.call @cc_make_string(%131, %132) : (!llvm.ptr, i64) -> i64
      %134 = func.call @cc_intern(%130, %133) : (i64, i64) -> i64
      %135 = func.call @cc_nil_value() : () -> i64
      %136 = func.call @cc_cons(%134, %135) : (i64, i64) -> i64
      %137 = func.call @cc_values_pack(%136) : (i64) -> i64
      func.call @stack_push_pointer(%134) : (i64) -> ()
      %138 = llvm.mlir.addressof @str20 : !llvm.ptr
      %139 = arith.constant 6 : i64
      %140 = func.call @cc_make_string(%138, %139) : (!llvm.ptr, i64) -> i64
      %141 = llvm.mlir.addressof @str21 : !llvm.ptr
      %142 = arith.constant 11 : i64
      %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
      %144 = func.call @cc_intern(%140, %143) : (i64, i64) -> i64
      %145 = func.call @cc_nil_value() : () -> i64
      %146 = func.call @cc_cons(%144, %145) : (i64, i64) -> i64
      %147 = func.call @cc_values_pack(%146) : (i64) -> i64
      func.call @stack_push_pointer(%144) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %148 = func.call @stack_pop_pointer() : () -> i64
      %149 = func.call @stack_pop_pointer() : () -> i64
      %150 = func.call @cc_cons(%149, %148) : (i64, i64) -> i64
      func.call @stack_push_pointer(%150) : (i64) -> ()
      %151 = func.call @stack_pop_pointer() : () -> i64
      %152 = func.call @stack_pop_pointer() : () -> i64
      %153 = func.call @cc_cons(%152, %151) : (i64, i64) -> i64
      func.call @stack_push_pointer(%153) : (i64) -> ()
      %154 = func.call @stack_pop_pointer() : () -> i64
      %155 = func.call @stack_pop_pointer() : () -> i64
      %156 = func.call @cc_cons(%155, %154) : (i64, i64) -> i64
      func.call @stack_push_pointer(%156) : (i64) -> ()
      %157 = func.call @stack_pop_pointer() : () -> i64
      %158 = func.call @stack_pop_pointer() : () -> i64
      %159 = func.call @cc_cons(%158, %157) : (i64, i64) -> i64
      func.call @stack_push_pointer(%159) : (i64) -> ()
      %160 = func.call @stack_pop_pointer() : () -> i64
      %161 = func.call @stack_pop_pointer() : () -> i64
      %162 = func.call @cc_cons(%161, %160) : (i64, i64) -> i64
      func.call @stack_push_pointer(%162) : (i64) -> ()
      %163 = func.call @stack_pop_pointer() : () -> i64
      %164 = func.call @stack_pop_pointer() : () -> i64
      %165 = func.call @cc_cons(%164, %163) : (i64, i64) -> i64
      func.call @stack_push_pointer(%165) : (i64) -> ()
      %166 = func.call @stack_pop_pointer() : () -> i64
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @cc_cons(%167, %166) : (i64, i64) -> i64
      func.call @stack_push_pointer(%168) : (i64) -> ()
      %169 = func.call @stack_pop_pointer() : () -> i64
      %170 = func.call @stack_pop_pointer() : () -> i64
      %171 = func.call @cc_cons(%170, %169) : (i64, i64) -> i64
      func.call @stack_push_pointer(%171) : (i64) -> ()
      %172 = func.call @stack_pop_pointer() : () -> i64
      %173 = func.call @stack_pop_pointer() : () -> i64
      %174 = func.call @cc_cons(%172, %173) : (i64, i64) -> i64
      %175 = llvm.mlir.addressof @str22 : !llvm.ptr
      %176 = arith.constant 5 : i64
      %177 = func.call @cc_make_string(%175, %176) : (!llvm.ptr, i64) -> i64
      %178 = func.call @cc_nil_value() : () -> i64
      %179 = func.call @cc_intern(%177, %178) : (i64, i64) -> i64
      %180 = func.call @cc_nil_value() : () -> i64
      %181 = func.call @cc_cons(%179, %180) : (i64, i64) -> i64
      %182 = func.call @cc_values_pack(%181) : (i64) -> i64
      %183 = func.call @cc_cons(%179, %174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%183) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %184 = func.call @stack_pop_pointer() : () -> i64
      %185 = func.call @stack_pop_pointer() : () -> i64
      %186 = func.call @cc_cons(%185, %184) : (i64, i64) -> i64
      func.call @stack_push_pointer(%186) : (i64) -> ()
      %187 = func.call @stack_pop_pointer() : () -> i64
      %188 = func.call @stack_pop_pointer() : () -> i64
      %189 = func.call @cc_cons(%188, %187) : (i64, i64) -> i64
      func.call @stack_push_pointer(%189) : (i64) -> ()
      %190 = llvm.mlir.addressof @str23 : !llvm.ptr
      %191 = arith.constant 15 : i64
      %192 = func.call @cc_make_string(%190, %191) : (!llvm.ptr, i64) -> i64
      %193 = func.call @cc_nil_value() : () -> i64
      %194 = func.call @cc_intern(%192, %193) : (i64, i64) -> i64
      %195 = func.call @cc_nil_value() : () -> i64
      %196 = func.call @cc_cons(%194, %195) : (i64, i64) -> i64
      %197 = func.call @cc_values_pack(%196) : (i64) -> i64
      func.call @stack_push_pointer(%194) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %198 = func.call @stack_pop_pointer() : () -> i64
      %199 = func.call @stack_pop_pointer() : () -> i64
      %200 = func.call @cc_cons(%199, %198) : (i64, i64) -> i64
      func.call @stack_push_pointer(%200) : (i64) -> ()
      %201 = func.call @stack_pop_pointer() : () -> i64
      %202 = func.call @stack_pop_pointer() : () -> i64
      %203 = func.call @cc_cons(%202, %201) : (i64, i64) -> i64
      func.call @stack_push_pointer(%203) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %204 = func.call @stack_pop_pointer() : () -> i64
      %205 = func.call @stack_pop_pointer() : () -> i64
      %206 = func.call @cc_cons(%205, %204) : (i64, i64) -> i64
      func.call @stack_push_pointer(%206) : (i64) -> ()
      %207 = func.call @stack_pop_pointer() : () -> i64
      %208 = func.call @stack_pop_pointer() : () -> i64
      %209 = func.call @cc_cons(%208, %207) : (i64, i64) -> i64
      func.call @stack_push_pointer(%209) : (i64) -> ()
      %210 = func.call @stack_pop_pointer() : () -> i64
      %211 = func.call @stack_pop_pointer() : () -> i64
      %212 = func.call @cc_cons(%211, %210) : (i64, i64) -> i64
      func.call @stack_push_pointer(%212) : (i64) -> ()
      %213 = llvm.mlir.addressof @str24 : !llvm.ptr
      %214 = arith.constant 5 : i64
      %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
      %216 = func.call @cc_nil_value() : () -> i64
      %217 = func.call @cc_intern(%215, %216) : (i64, i64) -> i64
      %218 = func.call @cc_nil_value() : () -> i64
      %219 = func.call @cc_cons(%217, %218) : (i64, i64) -> i64
      %220 = func.call @cc_values_pack(%219) : (i64) -> i64
      func.call @stack_push_pointer(%217) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %221 = llvm.mlir.addressof @str25 : !llvm.ptr
      %222 = arith.constant 5 : i64
      %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
      %224 = llvm.mlir.addressof @str26 : !llvm.ptr
      %225 = arith.constant 3 : i64
      %226 = func.call @cc_make_string(%224, %225) : (!llvm.ptr, i64) -> i64
      %227 = func.call @cc_intern(%223, %226) : (i64, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_cons(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_values_pack(%229) : (i64) -> i64
      func.call @stack_push_pointer(%227) : (i64) -> ()
      %231 = llvm.mlir.addressof @str27 : !llvm.ptr
      %232 = arith.constant 15 : i64
      %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
      %234 = func.call @cc_nil_value() : () -> i64
      %235 = func.call @cc_intern(%233, %234) : (i64, i64) -> i64
      %236 = func.call @cc_nil_value() : () -> i64
      %237 = func.call @cc_cons(%235, %236) : (i64, i64) -> i64
      %238 = func.call @cc_values_pack(%237) : (i64) -> i64
      func.call @stack_push_pointer(%235) : (i64) -> ()
      %239 = llvm.mlir.addressof @str28 : !llvm.ptr
      %240 = arith.constant 5 : i64
      %241 = func.call @cc_make_string(%239, %240) : (!llvm.ptr, i64) -> i64
      %242 = func.call @cc_nil_value() : () -> i64
      %243 = func.call @cc_intern(%241, %242) : (i64, i64) -> i64
      %244 = func.call @cc_nil_value() : () -> i64
      %245 = func.call @cc_cons(%243, %244) : (i64, i64) -> i64
      %246 = func.call @cc_values_pack(%245) : (i64) -> i64
      func.call @stack_push_pointer(%243) : (i64) -> ()
      %247 = llvm.mlir.addressof @str29 : !llvm.ptr
      %248 = arith.constant 2 : i64
      %249 = func.call @cc_make_string(%247, %248) : (!llvm.ptr, i64) -> i64
      %250 = func.call @cc_nil_value() : () -> i64
      %251 = func.call @cc_intern(%249, %250) : (i64, i64) -> i64
      %252 = func.call @cc_nil_value() : () -> i64
      %253 = func.call @cc_cons(%251, %252) : (i64, i64) -> i64
      %254 = func.call @cc_values_pack(%253) : (i64) -> i64
      func.call @stack_push_pointer(%251) : (i64) -> ()
      %255 = llvm.mlir.addressof @str30 : !llvm.ptr
      %256 = arith.constant 3 : i64
      %257 = func.call @cc_make_string(%255, %256) : (!llvm.ptr, i64) -> i64
      %258 = func.call @cc_nil_value() : () -> i64
      %259 = func.call @cc_intern(%257, %258) : (i64, i64) -> i64
      %260 = func.call @cc_nil_value() : () -> i64
      %261 = func.call @cc_cons(%259, %260) : (i64, i64) -> i64
      %262 = func.call @cc_values_pack(%261) : (i64) -> i64
      func.call @stack_push_pointer(%259) : (i64) -> ()
      %263 = llvm.mlir.addressof @str31 : !llvm.ptr
      %264 = arith.constant 3 : i64
      %265 = func.call @cc_make_string(%263, %264) : (!llvm.ptr, i64) -> i64
      %266 = func.call @cc_nil_value() : () -> i64
      %267 = func.call @cc_intern(%265, %266) : (i64, i64) -> i64
      %268 = func.call @cc_nil_value() : () -> i64
      %269 = func.call @cc_cons(%267, %268) : (i64, i64) -> i64
      %270 = func.call @cc_values_pack(%269) : (i64) -> i64
      func.call @stack_push_pointer(%267) : (i64) -> ()
      %271 = llvm.mlir.addressof @str32 : !llvm.ptr
      %272 = arith.constant 4 : i64
      %273 = func.call @cc_make_string(%271, %272) : (!llvm.ptr, i64) -> i64
      %274 = func.call @cc_nil_value() : () -> i64
      %275 = func.call @cc_intern(%273, %274) : (i64, i64) -> i64
      %276 = func.call @cc_nil_value() : () -> i64
      %277 = func.call @cc_cons(%275, %276) : (i64, i64) -> i64
      %278 = func.call @cc_values_pack(%277) : (i64) -> i64
      func.call @stack_push_pointer(%275) : (i64) -> ()
      %279 = llvm.mlir.addressof @str33 : !llvm.ptr
      %280 = arith.constant 15 : i64
      %281 = func.call @cc_make_string(%279, %280) : (!llvm.ptr, i64) -> i64
      %282 = func.call @cc_nil_value() : () -> i64
      %283 = func.call @cc_intern(%281, %282) : (i64, i64) -> i64
      %284 = func.call @cc_nil_value() : () -> i64
      %285 = func.call @cc_cons(%283, %284) : (i64, i64) -> i64
      %286 = func.call @cc_values_pack(%285) : (i64) -> i64
      func.call @stack_push_pointer(%283) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %287 = func.call @stack_pop_pointer() : () -> i64
      %288 = func.call @stack_pop_pointer() : () -> i64
      %289 = func.call @cc_cons(%288, %287) : (i64, i64) -> i64
      func.call @stack_push_pointer(%289) : (i64) -> ()
      %290 = func.call @stack_pop_pointer() : () -> i64
      %291 = func.call @stack_pop_pointer() : () -> i64
      %292 = func.call @cc_cons(%291, %290) : (i64, i64) -> i64
      func.call @stack_push_pointer(%292) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %293 = func.call @stack_pop_pointer() : () -> i64
      %294 = func.call @stack_pop_pointer() : () -> i64
      %295 = func.call @cc_cons(%294, %293) : (i64, i64) -> i64
      func.call @stack_push_pointer(%295) : (i64) -> ()
      %296 = func.call @stack_pop_pointer() : () -> i64
      %297 = func.call @stack_pop_pointer() : () -> i64
      %298 = func.call @cc_cons(%297, %296) : (i64, i64) -> i64
      func.call @stack_push_pointer(%298) : (i64) -> ()
      %299 = llvm.mlir.addressof @str34 : !llvm.ptr
      %300 = arith.constant 3 : i64
      %301 = func.call @cc_make_string(%299, %300) : (!llvm.ptr, i64) -> i64
      %302 = func.call @cc_nil_value() : () -> i64
      %303 = func.call @cc_intern(%301, %302) : (i64, i64) -> i64
      %304 = func.call @cc_nil_value() : () -> i64
      %305 = func.call @cc_cons(%303, %304) : (i64, i64) -> i64
      %306 = func.call @cc_values_pack(%305) : (i64) -> i64
      func.call @stack_push_pointer(%303) : (i64) -> ()
      %307 = llvm.mlir.addressof @str35 : !llvm.ptr
      %308 = arith.constant 5 : i64
      %309 = func.call @cc_make_string(%307, %308) : (!llvm.ptr, i64) -> i64
      %310 = func.call @cc_nil_value() : () -> i64
      %311 = func.call @cc_intern(%309, %310) : (i64, i64) -> i64
      %312 = func.call @cc_nil_value() : () -> i64
      %313 = func.call @cc_cons(%311, %312) : (i64, i64) -> i64
      %314 = func.call @cc_values_pack(%313) : (i64) -> i64
      func.call @stack_push_pointer(%311) : (i64) -> ()
      %315 = llvm.mlir.addressof @str36 : !llvm.ptr
      %316 = arith.constant 15 : i64
      %317 = func.call @cc_make_string(%315, %316) : (!llvm.ptr, i64) -> i64
      %318 = func.call @cc_nil_value() : () -> i64
      %319 = func.call @cc_intern(%317, %318) : (i64, i64) -> i64
      %320 = func.call @cc_nil_value() : () -> i64
      %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
      %322 = func.call @cc_values_pack(%321) : (i64) -> i64
      func.call @stack_push_pointer(%319) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %323 = func.call @stack_pop_pointer() : () -> i64
      %324 = func.call @stack_pop_pointer() : () -> i64
      %325 = func.call @cc_cons(%324, %323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%325) : (i64) -> ()
      %326 = func.call @stack_pop_pointer() : () -> i64
      %327 = func.call @stack_pop_pointer() : () -> i64
      %328 = func.call @cc_cons(%327, %326) : (i64, i64) -> i64
      func.call @stack_push_pointer(%328) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %329 = func.call @stack_pop_pointer() : () -> i64
      %330 = func.call @stack_pop_pointer() : () -> i64
      %331 = func.call @cc_cons(%330, %329) : (i64, i64) -> i64
      func.call @stack_push_pointer(%331) : (i64) -> ()
      %332 = func.call @stack_pop_pointer() : () -> i64
      %333 = func.call @stack_pop_pointer() : () -> i64
      %334 = func.call @cc_cons(%333, %332) : (i64, i64) -> i64
      func.call @stack_push_pointer(%334) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %335 = func.call @stack_pop_pointer() : () -> i64
      %336 = func.call @stack_pop_pointer() : () -> i64
      %337 = func.call @cc_cons(%336, %335) : (i64, i64) -> i64
      func.call @stack_push_pointer(%337) : (i64) -> ()
      %338 = func.call @stack_pop_pointer() : () -> i64
      %339 = func.call @stack_pop_pointer() : () -> i64
      %340 = func.call @cc_cons(%339, %338) : (i64, i64) -> i64
      func.call @stack_push_pointer(%340) : (i64) -> ()
      %341 = func.call @stack_pop_pointer() : () -> i64
      %342 = func.call @stack_pop_pointer() : () -> i64
      %343 = func.call @cc_cons(%342, %341) : (i64, i64) -> i64
      func.call @stack_push_pointer(%343) : (i64) -> ()
      %344 = llvm.mlir.addressof @str37 : !llvm.ptr
      %345 = arith.constant 11 : i64
      %346 = func.call @cc_make_string(%344, %345) : (!llvm.ptr, i64) -> i64
      %347 = func.call @cc_nil_value() : () -> i64
      %348 = func.call @cc_intern(%346, %347) : (i64, i64) -> i64
      %349 = func.call @cc_nil_value() : () -> i64
      %350 = func.call @cc_cons(%348, %349) : (i64, i64) -> i64
      %351 = func.call @cc_values_pack(%350) : (i64) -> i64
      func.call @stack_push_pointer(%348) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %352 = llvm.mlir.addressof @str38 : !llvm.ptr
      %353 = arith.constant 5 : i64
      %354 = func.call @cc_make_string(%352, %353) : (!llvm.ptr, i64) -> i64
      %355 = func.call @cc_nil_value() : () -> i64
      %356 = func.call @cc_intern(%354, %355) : (i64, i64) -> i64
      %357 = func.call @cc_nil_value() : () -> i64
      %358 = func.call @cc_cons(%356, %357) : (i64, i64) -> i64
      %359 = func.call @cc_values_pack(%358) : (i64) -> i64
      func.call @stack_push_pointer(%356) : (i64) -> ()
      %360 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%360) : (i64) -> ()
      %361 = llvm.mlir.addressof @str39 : !llvm.ptr
      %362 = arith.constant 10 : i64
      %363 = func.call @cc_make_string(%361, %362) : (!llvm.ptr, i64) -> i64
      %364 = func.call @cc_nil_value() : () -> i64
      %365 = func.call @cc_intern(%363, %364) : (i64, i64) -> i64
      %366 = func.call @cc_nil_value() : () -> i64
      %367 = func.call @cc_cons(%365, %366) : (i64, i64) -> i64
      %368 = func.call @cc_values_pack(%367) : (i64) -> i64
      func.call @stack_push_pointer(%365) : (i64) -> ()
      %369 = func.call @stack_pop_pointer() : () -> i64
      %370 = func.call @stack_pop_pointer() : () -> i64
      %371 = func.call @cc_cons(%369, %370) : (i64, i64) -> i64
      %372 = llvm.mlir.addressof @str40 : !llvm.ptr
      %373 = arith.constant 5 : i64
      %374 = func.call @cc_make_string(%372, %373) : (!llvm.ptr, i64) -> i64
      %375 = func.call @cc_nil_value() : () -> i64
      %376 = func.call @cc_intern(%374, %375) : (i64, i64) -> i64
      %377 = func.call @cc_nil_value() : () -> i64
      %378 = func.call @cc_cons(%376, %377) : (i64, i64) -> i64
      %379 = func.call @cc_values_pack(%378) : (i64) -> i64
      %380 = func.call @cc_cons(%376, %371) : (i64, i64) -> i64
      func.call @stack_push_pointer(%380) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %381 = func.call @stack_pop_pointer() : () -> i64
      %382 = func.call @stack_pop_pointer() : () -> i64
      %383 = func.call @cc_cons(%382, %381) : (i64, i64) -> i64
      func.call @stack_push_pointer(%383) : (i64) -> ()
      %384 = func.call @stack_pop_pointer() : () -> i64
      %385 = func.call @stack_pop_pointer() : () -> i64
      %386 = func.call @cc_cons(%385, %384) : (i64, i64) -> i64
      func.call @stack_push_pointer(%386) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %387 = func.call @stack_pop_pointer() : () -> i64
      %388 = func.call @stack_pop_pointer() : () -> i64
      %389 = func.call @cc_cons(%388, %387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%389) : (i64) -> ()
      %390 = func.call @stack_pop_pointer() : () -> i64
      %391 = func.call @stack_pop_pointer() : () -> i64
      %392 = func.call @cc_cons(%391, %390) : (i64, i64) -> i64
      func.call @stack_push_pointer(%392) : (i64) -> ()
      %393 = func.call @stack_pop_pointer() : () -> i64
      %394 = func.call @stack_pop_pointer() : () -> i64
      %395 = func.call @cc_cons(%394, %393) : (i64, i64) -> i64
      func.call @stack_push_pointer(%395) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %396 = func.call @stack_pop_pointer() : () -> i64
      %397 = func.call @stack_pop_pointer() : () -> i64
      %398 = func.call @cc_cons(%397, %396) : (i64, i64) -> i64
      func.call @stack_push_pointer(%398) : (i64) -> ()
      %399 = func.call @stack_pop_pointer() : () -> i64
      %400 = func.call @stack_pop_pointer() : () -> i64
      %401 = func.call @cc_cons(%400, %399) : (i64, i64) -> i64
      func.call @stack_push_pointer(%401) : (i64) -> ()
      %402 = func.call @stack_pop_pointer() : () -> i64
      %403 = func.call @stack_pop_pointer() : () -> i64
      %404 = func.call @cc_cons(%403, %402) : (i64, i64) -> i64
      func.call @stack_push_pointer(%404) : (i64) -> ()
      %405 = func.call @stack_pop_pointer() : () -> i64
      %406 = func.call @stack_pop_pointer() : () -> i64
      %407 = func.call @cc_cons(%406, %405) : (i64, i64) -> i64
      func.call @stack_push_pointer(%407) : (i64) -> ()
      %408 = llvm.mlir.addressof @str41 : !llvm.ptr
      %409 = arith.constant 4 : i64
      %410 = func.call @cc_make_string(%408, %409) : (!llvm.ptr, i64) -> i64
      %411 = func.call @cc_nil_value() : () -> i64
      %412 = func.call @cc_intern(%410, %411) : (i64, i64) -> i64
      %413 = func.call @cc_nil_value() : () -> i64
      %414 = func.call @cc_cons(%412, %413) : (i64, i64) -> i64
      %415 = func.call @cc_values_pack(%414) : (i64) -> i64
      func.call @stack_push_pointer(%412) : (i64) -> ()
      %416 = llvm.mlir.addressof @str42 : !llvm.ptr
      %417 = arith.constant 3 : i64
      %418 = func.call @cc_make_string(%416, %417) : (!llvm.ptr, i64) -> i64
      %419 = func.call @cc_nil_value() : () -> i64
      %420 = func.call @cc_intern(%418, %419) : (i64, i64) -> i64
      %421 = func.call @cc_nil_value() : () -> i64
      %422 = func.call @cc_cons(%420, %421) : (i64, i64) -> i64
      %423 = func.call @cc_values_pack(%422) : (i64) -> i64
      func.call @stack_push_pointer(%420) : (i64) -> ()
      %424 = llvm.mlir.addressof @str43 : !llvm.ptr
      %425 = arith.constant 3 : i64
      %426 = func.call @cc_make_string(%424, %425) : (!llvm.ptr, i64) -> i64
      %427 = func.call @cc_nil_value() : () -> i64
      %428 = func.call @cc_intern(%426, %427) : (i64, i64) -> i64
      %429 = func.call @cc_nil_value() : () -> i64
      %430 = func.call @cc_cons(%428, %429) : (i64, i64) -> i64
      %431 = func.call @cc_values_pack(%430) : (i64) -> i64
      func.call @stack_push_pointer(%428) : (i64) -> ()
      %432 = llvm.mlir.addressof @str44 : !llvm.ptr
      %433 = arith.constant 15 : i64
      %434 = func.call @cc_make_string(%432, %433) : (!llvm.ptr, i64) -> i64
      %435 = func.call @cc_nil_value() : () -> i64
      %436 = func.call @cc_intern(%434, %435) : (i64, i64) -> i64
      %437 = func.call @cc_nil_value() : () -> i64
      %438 = func.call @cc_cons(%436, %437) : (i64, i64) -> i64
      %439 = func.call @cc_values_pack(%438) : (i64) -> i64
      func.call @stack_push_pointer(%436) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %440 = func.call @stack_pop_pointer() : () -> i64
      %441 = func.call @stack_pop_pointer() : () -> i64
      %442 = func.call @cc_cons(%441, %440) : (i64, i64) -> i64
      func.call @stack_push_pointer(%442) : (i64) -> ()
      %443 = func.call @stack_pop_pointer() : () -> i64
      %444 = func.call @stack_pop_pointer() : () -> i64
      %445 = func.call @cc_cons(%444, %443) : (i64, i64) -> i64
      func.call @stack_push_pointer(%445) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %446 = func.call @stack_pop_pointer() : () -> i64
      %447 = func.call @stack_pop_pointer() : () -> i64
      %448 = func.call @cc_cons(%447, %446) : (i64, i64) -> i64
      func.call @stack_push_pointer(%448) : (i64) -> ()
      %449 = func.call @stack_pop_pointer() : () -> i64
      %450 = func.call @stack_pop_pointer() : () -> i64
      %451 = func.call @cc_cons(%450, %449) : (i64, i64) -> i64
      func.call @stack_push_pointer(%451) : (i64) -> ()
      %452 = func.call @stack_pop_pointer() : () -> i64
      %453 = func.call @stack_pop_pointer() : () -> i64
      %454 = func.call @cc_cons(%453, %452) : (i64, i64) -> i64
      func.call @stack_push_pointer(%454) : (i64) -> ()
      %455 = llvm.mlir.addressof @str45 : !llvm.ptr
      %456 = arith.constant 4 : i64
      %457 = func.call @cc_make_string(%455, %456) : (!llvm.ptr, i64) -> i64
      %458 = func.call @cc_nil_value() : () -> i64
      %459 = func.call @cc_intern(%457, %458) : (i64, i64) -> i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_cons(%459, %460) : (i64, i64) -> i64
      %462 = func.call @cc_values_pack(%461) : (i64) -> i64
      func.call @stack_push_pointer(%459) : (i64) -> ()
      %463 = llvm.mlir.addressof @str46 : !llvm.ptr
      %464 = arith.constant 15 : i64
      %465 = func.call @cc_make_string(%463, %464) : (!llvm.ptr, i64) -> i64
      %466 = func.call @cc_nil_value() : () -> i64
      %467 = func.call @cc_intern(%465, %466) : (i64, i64) -> i64
      %468 = func.call @cc_nil_value() : () -> i64
      %469 = func.call @cc_cons(%467, %468) : (i64, i64) -> i64
      %470 = func.call @cc_values_pack(%469) : (i64) -> i64
      func.call @stack_push_pointer(%467) : (i64) -> ()
      %471 = llvm.mlir.addressof @str47 : !llvm.ptr
      %472 = arith.constant 5 : i64
      %473 = func.call @cc_make_string(%471, %472) : (!llvm.ptr, i64) -> i64
      %474 = func.call @cc_nil_value() : () -> i64
      %475 = func.call @cc_intern(%473, %474) : (i64, i64) -> i64
      %476 = func.call @cc_nil_value() : () -> i64
      %477 = func.call @cc_cons(%475, %476) : (i64, i64) -> i64
      %478 = func.call @cc_values_pack(%477) : (i64) -> i64
      func.call @stack_push_pointer(%475) : (i64) -> ()
      %479 = llvm.mlir.addressof @str48 : !llvm.ptr
      %480 = arith.constant 15 : i64
      %481 = func.call @cc_make_string(%479, %480) : (!llvm.ptr, i64) -> i64
      %482 = func.call @cc_nil_value() : () -> i64
      %483 = func.call @cc_intern(%481, %482) : (i64, i64) -> i64
      %484 = func.call @cc_nil_value() : () -> i64
      %485 = func.call @cc_cons(%483, %484) : (i64, i64) -> i64
      %486 = func.call @cc_values_pack(%485) : (i64) -> i64
      func.call @stack_push_pointer(%483) : (i64) -> ()
      %487 = llvm.mlir.addressof @str49 : !llvm.ptr
      %488 = arith.constant 4 : i64
      %489 = func.call @cc_make_string(%487, %488) : (!llvm.ptr, i64) -> i64
      %490 = func.call @cc_nil_value() : () -> i64
      %491 = func.call @cc_intern(%489, %490) : (i64, i64) -> i64
      %492 = func.call @cc_nil_value() : () -> i64
      %493 = func.call @cc_cons(%491, %492) : (i64, i64) -> i64
      %494 = func.call @cc_values_pack(%493) : (i64) -> i64
      func.call @stack_push_pointer(%491) : (i64) -> ()
      %495 = llvm.mlir.addressof @str50 : !llvm.ptr
      %496 = arith.constant 3 : i64
      %497 = func.call @cc_make_string(%495, %496) : (!llvm.ptr, i64) -> i64
      %498 = func.call @cc_nil_value() : () -> i64
      %499 = func.call @cc_intern(%497, %498) : (i64, i64) -> i64
      %500 = func.call @cc_nil_value() : () -> i64
      %501 = func.call @cc_cons(%499, %500) : (i64, i64) -> i64
      %502 = func.call @cc_values_pack(%501) : (i64) -> i64
      func.call @stack_push_pointer(%499) : (i64) -> ()
      %503 = llvm.mlir.addressof @str51 : !llvm.ptr
      %504 = arith.constant 4 : i64
      %505 = func.call @cc_make_string(%503, %504) : (!llvm.ptr, i64) -> i64
      %506 = func.call @cc_nil_value() : () -> i64
      %507 = func.call @cc_intern(%505, %506) : (i64, i64) -> i64
      %508 = func.call @cc_nil_value() : () -> i64
      %509 = func.call @cc_cons(%507, %508) : (i64, i64) -> i64
      %510 = func.call @cc_values_pack(%509) : (i64) -> i64
      func.call @stack_push_pointer(%507) : (i64) -> ()
      %511 = llvm.mlir.addressof @str52 : !llvm.ptr
      %512 = arith.constant 2 : i64
      %513 = func.call @cc_make_string(%511, %512) : (!llvm.ptr, i64) -> i64
      %514 = func.call @cc_nil_value() : () -> i64
      %515 = func.call @cc_intern(%513, %514) : (i64, i64) -> i64
      %516 = func.call @cc_nil_value() : () -> i64
      %517 = func.call @cc_cons(%515, %516) : (i64, i64) -> i64
      %518 = func.call @cc_values_pack(%517) : (i64) -> i64
      func.call @stack_push_pointer(%515) : (i64) -> ()
      %519 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%519) : (i64) -> ()
      %520 = arith.constant 3.0 : f64
      %521 = func.call @cc_box_single_float(%520) : (f64) -> i64
      func.call @stack_push_pointer(%521) : (i64) -> ()
      %522 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%522) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %523 = func.call @stack_pop_pointer() : () -> i64
      %524 = func.call @stack_pop_pointer() : () -> i64
      %525 = func.call @cc_cons(%524, %523) : (i64, i64) -> i64
      func.call @stack_push_pointer(%525) : (i64) -> ()
      %526 = func.call @stack_pop_pointer() : () -> i64
      %527 = func.call @stack_pop_pointer() : () -> i64
      %528 = func.call @cc_cons(%527, %526) : (i64, i64) -> i64
      func.call @stack_push_pointer(%528) : (i64) -> ()
      %529 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%529) : (i64) -> ()
      %530 = arith.constant 2.0 : f64
      %531 = func.call @cc_box_single_float(%530) : (f64) -> i64
      func.call @stack_push_pointer(%531) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %532 = func.call @stack_pop_pointer() : () -> i64
      %533 = func.call @stack_pop_pointer() : () -> i64
      %534 = func.call @cc_cons(%533, %532) : (i64, i64) -> i64
      func.call @stack_push_pointer(%534) : (i64) -> ()
      %535 = func.call @stack_pop_pointer() : () -> i64
      %536 = func.call @stack_pop_pointer() : () -> i64
      %537 = func.call @cc_cons(%536, %535) : (i64, i64) -> i64
      func.call @stack_push_pointer(%537) : (i64) -> ()
      %538 = arith.constant 3.0 : f64
      %539 = func.call @cc_box_single_float(%538) : (f64) -> i64
      func.call @stack_push_pointer(%539) : (i64) -> ()
      %540 = llvm.mlir.addressof @str53 : !llvm.ptr
      %541 = arith.constant 1 : i64
      %542 = func.call @cc_parse_bignum(%540, %541) : (!llvm.ptr, i64) -> i64
      %543 = llvm.mlir.addressof @str54 : !llvm.ptr
      %544 = arith.constant 1 : i64
      %545 = func.call @cc_parse_bignum(%543, %544) : (!llvm.ptr, i64) -> i64
      %546 = func.call @cc_ratio(%542, %545) : (i64, i64) -> i64
      func.call @stack_push_pointer(%546) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %547 = func.call @stack_pop_pointer() : () -> i64
      %548 = func.call @stack_pop_pointer() : () -> i64
      %549 = func.call @cc_cons(%548, %547) : (i64, i64) -> i64
      func.call @stack_push_pointer(%549) : (i64) -> ()
      %550 = func.call @stack_pop_pointer() : () -> i64
      %551 = func.call @stack_pop_pointer() : () -> i64
      %552 = func.call @cc_cons(%551, %550) : (i64, i64) -> i64
      func.call @stack_push_pointer(%552) : (i64) -> ()
      %553 = llvm.mlir.addressof @str55 : !llvm.ptr
      %554 = arith.constant 2 : i64
      %555 = func.call @cc_parse_bignum(%553, %554) : (!llvm.ptr, i64) -> i64
      %556 = llvm.mlir.addressof @str56 : !llvm.ptr
      %557 = arith.constant 2 : i64
      %558 = func.call @cc_parse_bignum(%556, %557) : (!llvm.ptr, i64) -> i64
      %559 = func.call @cc_ratio(%555, %558) : (i64, i64) -> i64
      func.call @stack_push_pointer(%559) : (i64) -> ()
      %560 = arith.constant 2.0 : f64
      %561 = func.call @cc_box_single_float(%560) : (f64) -> i64
      func.call @stack_push_pointer(%561) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %562 = func.call @stack_pop_pointer() : () -> i64
      %563 = func.call @stack_pop_pointer() : () -> i64
      %564 = func.call @cc_cons(%563, %562) : (i64, i64) -> i64
      func.call @stack_push_pointer(%564) : (i64) -> ()
      %565 = func.call @stack_pop_pointer() : () -> i64
      %566 = func.call @stack_pop_pointer() : () -> i64
      %567 = func.call @cc_cons(%566, %565) : (i64, i64) -> i64
      func.call @stack_push_pointer(%567) : (i64) -> ()
      %568 = arith.constant 3.0 : f64
      %569 = func.call @cc_box_single_float(%568) : (f64) -> i64
      func.call @stack_push_pointer(%569) : (i64) -> ()
      %570 = arith.constant 2.0 : f64
      %571 = func.call @cc_box_float(%570) : (f64) -> i64
      func.call @stack_push_pointer(%571) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %572 = func.call @stack_pop_pointer() : () -> i64
      %573 = func.call @stack_pop_pointer() : () -> i64
      %574 = func.call @cc_cons(%573, %572) : (i64, i64) -> i64
      func.call @stack_push_pointer(%574) : (i64) -> ()
      %575 = func.call @stack_pop_pointer() : () -> i64
      %576 = func.call @stack_pop_pointer() : () -> i64
      %577 = func.call @cc_cons(%576, %575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%577) : (i64) -> ()
      %578 = arith.constant 3.0 : f64
      %579 = func.call @cc_box_float(%578) : (f64) -> i64
      func.call @stack_push_pointer(%579) : (i64) -> ()
      %580 = arith.constant 2.0 : f64
      %581 = func.call @cc_box_single_float(%580) : (f64) -> i64
      func.call @stack_push_pointer(%581) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %582 = func.call @stack_pop_pointer() : () -> i64
      %583 = func.call @stack_pop_pointer() : () -> i64
      %584 = func.call @cc_cons(%583, %582) : (i64, i64) -> i64
      func.call @stack_push_pointer(%584) : (i64) -> ()
      %585 = func.call @stack_pop_pointer() : () -> i64
      %586 = func.call @stack_pop_pointer() : () -> i64
      %587 = func.call @cc_cons(%586, %585) : (i64, i64) -> i64
      func.call @stack_push_pointer(%587) : (i64) -> ()
      %588 = arith.constant 3.0 : f64
      %589 = func.call @cc_box_float(%588) : (f64) -> i64
      func.call @stack_push_pointer(%589) : (i64) -> ()
      %590 = arith.constant 2.0 : f64
      %591 = func.call @cc_box_float(%590) : (f64) -> i64
      func.call @stack_push_pointer(%591) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %592 = func.call @stack_pop_pointer() : () -> i64
      %593 = func.call @stack_pop_pointer() : () -> i64
      %594 = func.call @cc_cons(%593, %592) : (i64, i64) -> i64
      func.call @stack_push_pointer(%594) : (i64) -> ()
      %595 = func.call @stack_pop_pointer() : () -> i64
      %596 = func.call @stack_pop_pointer() : () -> i64
      %597 = func.call @cc_cons(%596, %595) : (i64, i64) -> i64
      func.call @stack_push_pointer(%597) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %598 = func.call @stack_pop_pointer() : () -> i64
      %599 = func.call @stack_pop_pointer() : () -> i64
      %600 = func.call @cc_cons(%599, %598) : (i64, i64) -> i64
      func.call @stack_push_pointer(%600) : (i64) -> ()
      %601 = func.call @stack_pop_pointer() : () -> i64
      %602 = func.call @stack_pop_pointer() : () -> i64
      %603 = func.call @cc_cons(%602, %601) : (i64, i64) -> i64
      func.call @stack_push_pointer(%603) : (i64) -> ()
      %604 = func.call @stack_pop_pointer() : () -> i64
      %605 = func.call @stack_pop_pointer() : () -> i64
      %606 = func.call @cc_cons(%605, %604) : (i64, i64) -> i64
      func.call @stack_push_pointer(%606) : (i64) -> ()
      %607 = func.call @stack_pop_pointer() : () -> i64
      %608 = func.call @stack_pop_pointer() : () -> i64
      %609 = func.call @cc_cons(%608, %607) : (i64, i64) -> i64
      func.call @stack_push_pointer(%609) : (i64) -> ()
      %610 = func.call @stack_pop_pointer() : () -> i64
      %611 = func.call @stack_pop_pointer() : () -> i64
      %612 = func.call @cc_cons(%611, %610) : (i64, i64) -> i64
      func.call @stack_push_pointer(%612) : (i64) -> ()
      %613 = func.call @stack_pop_pointer() : () -> i64
      %614 = func.call @stack_pop_pointer() : () -> i64
      %615 = func.call @cc_cons(%614, %613) : (i64, i64) -> i64
      func.call @stack_push_pointer(%615) : (i64) -> ()
      %616 = func.call @stack_pop_pointer() : () -> i64
      %617 = func.call @stack_pop_pointer() : () -> i64
      %618 = func.call @cc_cons(%617, %616) : (i64, i64) -> i64
      func.call @stack_push_pointer(%618) : (i64) -> ()
      %619 = func.call @stack_pop_pointer() : () -> i64
      %620 = func.call @stack_pop_pointer() : () -> i64
      %621 = func.call @cc_cons(%619, %620) : (i64, i64) -> i64
      %622 = llvm.mlir.addressof @str57 : !llvm.ptr
      %623 = arith.constant 5 : i64
      %624 = func.call @cc_make_string(%622, %623) : (!llvm.ptr, i64) -> i64
      %625 = func.call @cc_nil_value() : () -> i64
      %626 = func.call @cc_intern(%624, %625) : (i64, i64) -> i64
      %627 = func.call @cc_nil_value() : () -> i64
      %628 = func.call @cc_cons(%626, %627) : (i64, i64) -> i64
      %629 = func.call @cc_values_pack(%628) : (i64) -> i64
      %630 = func.call @cc_cons(%626, %621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%630) : (i64) -> ()
      %631 = llvm.mlir.addressof @str58 : !llvm.ptr
      %632 = arith.constant 3 : i64
      %633 = func.call @cc_make_string(%631, %632) : (!llvm.ptr, i64) -> i64
      %634 = func.call @cc_nil_value() : () -> i64
      %635 = func.call @cc_intern(%633, %634) : (i64, i64) -> i64
      %636 = func.call @cc_nil_value() : () -> i64
      %637 = func.call @cc_cons(%635, %636) : (i64, i64) -> i64
      %638 = func.call @cc_values_pack(%637) : (i64) -> i64
      func.call @stack_push_pointer(%635) : (i64) -> ()
      %639 = llvm.mlir.addressof @str59 : !llvm.ptr
      %640 = arith.constant 5 : i64
      %641 = func.call @cc_make_string(%639, %640) : (!llvm.ptr, i64) -> i64
      %642 = func.call @cc_nil_value() : () -> i64
      %643 = func.call @cc_intern(%641, %642) : (i64, i64) -> i64
      %644 = func.call @cc_nil_value() : () -> i64
      %645 = func.call @cc_cons(%643, %644) : (i64, i64) -> i64
      %646 = func.call @cc_values_pack(%645) : (i64) -> i64
      func.call @stack_push_pointer(%643) : (i64) -> ()
      %647 = llvm.mlir.addressof @str60 : !llvm.ptr
      %648 = arith.constant 2 : i64
      %649 = func.call @cc_make_string(%647, %648) : (!llvm.ptr, i64) -> i64
      %650 = func.call @cc_nil_value() : () -> i64
      %651 = func.call @cc_intern(%649, %650) : (i64, i64) -> i64
      %652 = func.call @cc_nil_value() : () -> i64
      %653 = func.call @cc_cons(%651, %652) : (i64, i64) -> i64
      %654 = func.call @cc_values_pack(%653) : (i64) -> i64
      func.call @stack_push_pointer(%651) : (i64) -> ()
      %655 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%655) : (i64) -> ()
      %656 = llvm.mlir.addressof @str61 : !llvm.ptr
      %657 = arith.constant 12 : i64
      %658 = func.call @cc_make_string(%656, %657) : (!llvm.ptr, i64) -> i64
      %659 = llvm.mlir.addressof @str62 : !llvm.ptr
      %660 = arith.constant 11 : i64
      %661 = func.call @cc_make_string(%659, %660) : (!llvm.ptr, i64) -> i64
      %662 = func.call @cc_intern(%658, %661) : (i64, i64) -> i64
      %663 = func.call @cc_nil_value() : () -> i64
      %664 = func.call @cc_cons(%662, %663) : (i64, i64) -> i64
      %665 = func.call @cc_values_pack(%664) : (i64) -> i64
      func.call @stack_push_pointer(%662) : (i64) -> ()
      %666 = llvm.mlir.addressof @str63 : !llvm.ptr
      %667 = arith.constant 12 : i64
      %668 = func.call @cc_make_string(%666, %667) : (!llvm.ptr, i64) -> i64
      %669 = llvm.mlir.addressof @str64 : !llvm.ptr
      %670 = arith.constant 11 : i64
      %671 = func.call @cc_make_string(%669, %670) : (!llvm.ptr, i64) -> i64
      %672 = func.call @cc_intern(%668, %671) : (i64, i64) -> i64
      %673 = func.call @cc_nil_value() : () -> i64
      %674 = func.call @cc_cons(%672, %673) : (i64, i64) -> i64
      %675 = func.call @cc_values_pack(%674) : (i64) -> i64
      func.call @stack_push_pointer(%672) : (i64) -> ()
      %676 = llvm.mlir.addressof @str65 : !llvm.ptr
      %677 = arith.constant 12 : i64
      %678 = func.call @cc_make_string(%676, %677) : (!llvm.ptr, i64) -> i64
      %679 = llvm.mlir.addressof @str66 : !llvm.ptr
      %680 = arith.constant 11 : i64
      %681 = func.call @cc_make_string(%679, %680) : (!llvm.ptr, i64) -> i64
      %682 = func.call @cc_intern(%678, %681) : (i64, i64) -> i64
      %683 = func.call @cc_nil_value() : () -> i64
      %684 = func.call @cc_cons(%682, %683) : (i64, i64) -> i64
      %685 = func.call @cc_values_pack(%684) : (i64) -> i64
      func.call @stack_push_pointer(%682) : (i64) -> ()
      %686 = llvm.mlir.addressof @str67 : !llvm.ptr
      %687 = arith.constant 12 : i64
      %688 = func.call @cc_make_string(%686, %687) : (!llvm.ptr, i64) -> i64
      %689 = llvm.mlir.addressof @str68 : !llvm.ptr
      %690 = arith.constant 11 : i64
      %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
      %692 = func.call @cc_intern(%688, %691) : (i64, i64) -> i64
      %693 = func.call @cc_nil_value() : () -> i64
      %694 = func.call @cc_cons(%692, %693) : (i64, i64) -> i64
      %695 = func.call @cc_values_pack(%694) : (i64) -> i64
      func.call @stack_push_pointer(%692) : (i64) -> ()
      %696 = llvm.mlir.addressof @str69 : !llvm.ptr
      %697 = arith.constant 12 : i64
      %698 = func.call @cc_make_string(%696, %697) : (!llvm.ptr, i64) -> i64
      %699 = llvm.mlir.addressof @str70 : !llvm.ptr
      %700 = arith.constant 11 : i64
      %701 = func.call @cc_make_string(%699, %700) : (!llvm.ptr, i64) -> i64
      %702 = func.call @cc_intern(%698, %701) : (i64, i64) -> i64
      %703 = func.call @cc_nil_value() : () -> i64
      %704 = func.call @cc_cons(%702, %703) : (i64, i64) -> i64
      %705 = func.call @cc_values_pack(%704) : (i64) -> i64
      func.call @stack_push_pointer(%702) : (i64) -> ()
      %706 = llvm.mlir.addressof @str71 : !llvm.ptr
      %707 = arith.constant 12 : i64
      %708 = func.call @cc_make_string(%706, %707) : (!llvm.ptr, i64) -> i64
      %709 = llvm.mlir.addressof @str72 : !llvm.ptr
      %710 = arith.constant 11 : i64
      %711 = func.call @cc_make_string(%709, %710) : (!llvm.ptr, i64) -> i64
      %712 = func.call @cc_intern(%708, %711) : (i64, i64) -> i64
      %713 = func.call @cc_nil_value() : () -> i64
      %714 = func.call @cc_cons(%712, %713) : (i64, i64) -> i64
      %715 = func.call @cc_values_pack(%714) : (i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %716 = llvm.mlir.addressof @str73 : !llvm.ptr
      %717 = arith.constant 12 : i64
      %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
      %719 = llvm.mlir.addressof @str74 : !llvm.ptr
      %720 = arith.constant 11 : i64
      %721 = func.call @cc_make_string(%719, %720) : (!llvm.ptr, i64) -> i64
      %722 = func.call @cc_intern(%718, %721) : (i64, i64) -> i64
      %723 = func.call @cc_nil_value() : () -> i64
      %724 = func.call @cc_cons(%722, %723) : (i64, i64) -> i64
      %725 = func.call @cc_values_pack(%724) : (i64) -> i64
      func.call @stack_push_pointer(%722) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %726 = func.call @stack_pop_pointer() : () -> i64
      %727 = func.call @stack_pop_pointer() : () -> i64
      %728 = func.call @cc_cons(%727, %726) : (i64, i64) -> i64
      func.call @stack_push_pointer(%728) : (i64) -> ()
      %729 = func.call @stack_pop_pointer() : () -> i64
      %730 = func.call @stack_pop_pointer() : () -> i64
      %731 = func.call @cc_cons(%730, %729) : (i64, i64) -> i64
      func.call @stack_push_pointer(%731) : (i64) -> ()
      %732 = func.call @stack_pop_pointer() : () -> i64
      %733 = func.call @stack_pop_pointer() : () -> i64
      %734 = func.call @cc_cons(%733, %732) : (i64, i64) -> i64
      func.call @stack_push_pointer(%734) : (i64) -> ()
      %735 = func.call @stack_pop_pointer() : () -> i64
      %736 = func.call @stack_pop_pointer() : () -> i64
      %737 = func.call @cc_cons(%736, %735) : (i64, i64) -> i64
      func.call @stack_push_pointer(%737) : (i64) -> ()
      %738 = func.call @stack_pop_pointer() : () -> i64
      %739 = func.call @stack_pop_pointer() : () -> i64
      %740 = func.call @cc_cons(%739, %738) : (i64, i64) -> i64
      func.call @stack_push_pointer(%740) : (i64) -> ()
      %741 = func.call @stack_pop_pointer() : () -> i64
      %742 = func.call @stack_pop_pointer() : () -> i64
      %743 = func.call @cc_cons(%742, %741) : (i64, i64) -> i64
      func.call @stack_push_pointer(%743) : (i64) -> ()
      %744 = func.call @stack_pop_pointer() : () -> i64
      %745 = func.call @stack_pop_pointer() : () -> i64
      %746 = func.call @cc_cons(%745, %744) : (i64, i64) -> i64
      func.call @stack_push_pointer(%746) : (i64) -> ()
      %747 = func.call @stack_pop_pointer() : () -> i64
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @cc_cons(%747, %748) : (i64, i64) -> i64
      %750 = llvm.mlir.addressof @str75 : !llvm.ptr
      %751 = arith.constant 5 : i64
      %752 = func.call @cc_make_string(%750, %751) : (!llvm.ptr, i64) -> i64
      %753 = func.call @cc_nil_value() : () -> i64
      %754 = func.call @cc_intern(%752, %753) : (i64, i64) -> i64
      %755 = func.call @cc_nil_value() : () -> i64
      %756 = func.call @cc_cons(%754, %755) : (i64, i64) -> i64
      %757 = func.call @cc_values_pack(%756) : (i64) -> i64
      %758 = func.call @cc_cons(%754, %749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%758) : (i64) -> ()
      %759 = llvm.mlir.addressof @str76 : !llvm.ptr
      %760 = arith.constant 6 : i64
      %761 = func.call @cc_make_string(%759, %760) : (!llvm.ptr, i64) -> i64
      %762 = llvm.mlir.addressof @str77 : !llvm.ptr
      %763 = arith.constant 11 : i64
      %764 = func.call @cc_make_string(%762, %763) : (!llvm.ptr, i64) -> i64
      %765 = func.call @cc_intern(%761, %764) : (i64, i64) -> i64
      %766 = func.call @cc_nil_value() : () -> i64
      %767 = func.call @cc_cons(%765, %766) : (i64, i64) -> i64
      %768 = func.call @cc_values_pack(%767) : (i64) -> i64
      func.call @stack_push_pointer(%765) : (i64) -> ()
      %769 = llvm.mlir.addressof @str78 : !llvm.ptr
      %770 = arith.constant 5 : i64
      %771 = func.call @cc_make_string(%769, %770) : (!llvm.ptr, i64) -> i64
      %772 = llvm.mlir.addressof @str79 : !llvm.ptr
      %773 = arith.constant 11 : i64
      %774 = func.call @cc_make_string(%772, %773) : (!llvm.ptr, i64) -> i64
      %775 = func.call @cc_intern(%771, %774) : (i64, i64) -> i64
      %776 = func.call @cc_nil_value() : () -> i64
      %777 = func.call @cc_cons(%775, %776) : (i64, i64) -> i64
      %778 = func.call @cc_values_pack(%777) : (i64) -> i64
      func.call @stack_push_pointer(%775) : (i64) -> ()
      %779 = llvm.mlir.addressof @str80 : !llvm.ptr
      %780 = arith.constant 9 : i64
      %781 = func.call @cc_make_string(%779, %780) : (!llvm.ptr, i64) -> i64
      %782 = llvm.mlir.addressof @str81 : !llvm.ptr
      %783 = arith.constant 11 : i64
      %784 = func.call @cc_make_string(%782, %783) : (!llvm.ptr, i64) -> i64
      %785 = func.call @cc_intern(%781, %784) : (i64, i64) -> i64
      %786 = func.call @cc_nil_value() : () -> i64
      %787 = func.call @cc_cons(%785, %786) : (i64, i64) -> i64
      %788 = func.call @cc_values_pack(%787) : (i64) -> i64
      func.call @stack_push_pointer(%785) : (i64) -> ()
      %789 = arith.constant 1 : i64
      func.call @stack_push_fixnum(%789) : (i64) -> ()
      %790 = llvm.mlir.addressof @str82 : !llvm.ptr
      %791 = arith.constant 5 : i64
      %792 = func.call @cc_make_string(%790, %791) : (!llvm.ptr, i64) -> i64
      %793 = llvm.mlir.addressof @str83 : !llvm.ptr
      %794 = arith.constant 11 : i64
      %795 = func.call @cc_make_string(%793, %794) : (!llvm.ptr, i64) -> i64
      %796 = func.call @cc_intern(%792, %795) : (i64, i64) -> i64
      %797 = func.call @cc_nil_value() : () -> i64
      %798 = func.call @cc_cons(%796, %797) : (i64, i64) -> i64
      %799 = func.call @cc_values_pack(%798) : (i64) -> i64
      func.call @stack_push_pointer(%796) : (i64) -> ()
      %800 = llvm.mlir.addressof @str84 : !llvm.ptr
      %801 = arith.constant 3 : i64
      %802 = func.call @cc_make_string(%800, %801) : (!llvm.ptr, i64) -> i64
      %803 = func.call @cc_nil_value() : () -> i64
      %804 = func.call @cc_intern(%802, %803) : (i64, i64) -> i64
      %805 = func.call @cc_nil_value() : () -> i64
      %806 = func.call @cc_cons(%804, %805) : (i64, i64) -> i64
      %807 = func.call @cc_values_pack(%806) : (i64) -> i64
      func.call @stack_push_pointer(%804) : (i64) -> ()
      %808 = llvm.mlir.addressof @str85 : !llvm.ptr
      %809 = arith.constant 4 : i64
      %810 = func.call @cc_make_string(%808, %809) : (!llvm.ptr, i64) -> i64
      %811 = func.call @cc_nil_value() : () -> i64
      %812 = func.call @cc_intern(%810, %811) : (i64, i64) -> i64
      %813 = func.call @cc_nil_value() : () -> i64
      %814 = func.call @cc_cons(%812, %813) : (i64, i64) -> i64
      %815 = func.call @cc_values_pack(%814) : (i64) -> i64
      func.call @stack_push_pointer(%812) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %816 = func.call @stack_pop_pointer() : () -> i64
      %817 = func.call @stack_pop_pointer() : () -> i64
      %818 = func.call @cc_cons(%817, %816) : (i64, i64) -> i64
      func.call @stack_push_pointer(%818) : (i64) -> ()
      %819 = func.call @stack_pop_pointer() : () -> i64
      %820 = func.call @stack_pop_pointer() : () -> i64
      %821 = func.call @cc_cons(%820, %819) : (i64, i64) -> i64
      func.call @stack_push_pointer(%821) : (i64) -> ()
      %822 = func.call @stack_pop_pointer() : () -> i64
      %823 = func.call @stack_pop_pointer() : () -> i64
      %824 = func.call @cc_cons(%823, %822) : (i64, i64) -> i64
      func.call @stack_push_pointer(%824) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %825 = func.call @stack_pop_pointer() : () -> i64
      %826 = func.call @stack_pop_pointer() : () -> i64
      %827 = func.call @cc_cons(%826, %825) : (i64, i64) -> i64
      func.call @stack_push_pointer(%827) : (i64) -> ()
      %828 = func.call @stack_pop_pointer() : () -> i64
      %829 = func.call @stack_pop_pointer() : () -> i64
      %830 = func.call @cc_cons(%829, %828) : (i64, i64) -> i64
      func.call @stack_push_pointer(%830) : (i64) -> ()
      %831 = func.call @stack_pop_pointer() : () -> i64
      %832 = func.call @stack_pop_pointer() : () -> i64
      %833 = func.call @cc_cons(%832, %831) : (i64, i64) -> i64
      func.call @stack_push_pointer(%833) : (i64) -> ()
      %834 = llvm.mlir.addressof @str86 : !llvm.ptr
      %835 = arith.constant 5 : i64
      %836 = func.call @cc_make_string(%834, %835) : (!llvm.ptr, i64) -> i64
      %837 = func.call @cc_nil_value() : () -> i64
      %838 = func.call @cc_intern(%836, %837) : (i64, i64) -> i64
      %839 = func.call @cc_nil_value() : () -> i64
      %840 = func.call @cc_cons(%838, %839) : (i64, i64) -> i64
      %841 = func.call @cc_values_pack(%840) : (i64) -> i64
      func.call @stack_push_pointer(%838) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %842 = func.call @stack_pop_pointer() : () -> i64
      %843 = func.call @stack_pop_pointer() : () -> i64
      %844 = func.call @cc_cons(%843, %842) : (i64, i64) -> i64
      func.call @stack_push_pointer(%844) : (i64) -> ()
      %845 = func.call @stack_pop_pointer() : () -> i64
      %846 = func.call @stack_pop_pointer() : () -> i64
      %847 = func.call @cc_cons(%846, %845) : (i64, i64) -> i64
      func.call @stack_push_pointer(%847) : (i64) -> ()
      %848 = func.call @stack_pop_pointer() : () -> i64
      %849 = func.call @stack_pop_pointer() : () -> i64
      %850 = func.call @cc_cons(%849, %848) : (i64, i64) -> i64
      func.call @stack_push_pointer(%850) : (i64) -> ()
      %851 = llvm.mlir.addressof @str87 : !llvm.ptr
      %852 = arith.constant 7 : i64
      %853 = func.call @cc_make_string(%851, %852) : (!llvm.ptr, i64) -> i64
      %854 = func.call @cc_nil_value() : () -> i64
      %855 = func.call @cc_intern(%853, %854) : (i64, i64) -> i64
      %856 = func.call @cc_nil_value() : () -> i64
      %857 = func.call @cc_cons(%855, %856) : (i64, i64) -> i64
      %858 = func.call @cc_values_pack(%857) : (i64) -> i64
      func.call @stack_push_pointer(%855) : (i64) -> ()
      %859 = llvm.mlir.addressof @str88 : !llvm.ptr
      %860 = arith.constant 4 : i64
      %861 = func.call @cc_make_string(%859, %860) : (!llvm.ptr, i64) -> i64
      %862 = llvm.mlir.addressof @str89 : !llvm.ptr
      %863 = arith.constant 11 : i64
      %864 = func.call @cc_make_string(%862, %863) : (!llvm.ptr, i64) -> i64
      %865 = func.call @cc_intern(%861, %864) : (i64, i64) -> i64
      %866 = func.call @cc_nil_value() : () -> i64
      %867 = func.call @cc_cons(%865, %866) : (i64, i64) -> i64
      %868 = func.call @cc_values_pack(%867) : (i64) -> i64
      func.call @stack_push_pointer(%865) : (i64) -> ()
      %869 = llvm.mlir.addressof @str90 : !llvm.ptr
      %870 = arith.constant 3 : i64
      %871 = func.call @cc_make_string(%869, %870) : (!llvm.ptr, i64) -> i64
      %872 = func.call @cc_nil_value() : () -> i64
      %873 = func.call @cc_intern(%871, %872) : (i64, i64) -> i64
      %874 = func.call @cc_nil_value() : () -> i64
      %875 = func.call @cc_cons(%873, %874) : (i64, i64) -> i64
      %876 = func.call @cc_values_pack(%875) : (i64) -> i64
      func.call @stack_push_pointer(%873) : (i64) -> ()
      %877 = llvm.mlir.addressof @str91 : !llvm.ptr
      %878 = arith.constant 4 : i64
      %879 = func.call @cc_make_string(%877, %878) : (!llvm.ptr, i64) -> i64
      %880 = func.call @cc_nil_value() : () -> i64
      %881 = func.call @cc_intern(%879, %880) : (i64, i64) -> i64
      %882 = func.call @cc_nil_value() : () -> i64
      %883 = func.call @cc_cons(%881, %882) : (i64, i64) -> i64
      %884 = func.call @cc_values_pack(%883) : (i64) -> i64
      func.call @stack_push_pointer(%881) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %885 = func.call @stack_pop_pointer() : () -> i64
      %886 = func.call @stack_pop_pointer() : () -> i64
      %887 = func.call @cc_cons(%886, %885) : (i64, i64) -> i64
      func.call @stack_push_pointer(%887) : (i64) -> ()
      %888 = func.call @stack_pop_pointer() : () -> i64
      %889 = func.call @stack_pop_pointer() : () -> i64
      %890 = func.call @cc_cons(%889, %888) : (i64, i64) -> i64
      func.call @stack_push_pointer(%890) : (i64) -> ()
      %891 = func.call @stack_pop_pointer() : () -> i64
      %892 = func.call @stack_pop_pointer() : () -> i64
      %893 = func.call @cc_cons(%892, %891) : (i64, i64) -> i64
      func.call @stack_push_pointer(%893) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %894 = func.call @stack_pop_pointer() : () -> i64
      %895 = func.call @stack_pop_pointer() : () -> i64
      %896 = func.call @cc_cons(%895, %894) : (i64, i64) -> i64
      func.call @stack_push_pointer(%896) : (i64) -> ()
      %897 = func.call @stack_pop_pointer() : () -> i64
      %898 = func.call @stack_pop_pointer() : () -> i64
      %899 = func.call @cc_cons(%898, %897) : (i64, i64) -> i64
      func.call @stack_push_pointer(%899) : (i64) -> ()
      %900 = func.call @stack_pop_pointer() : () -> i64
      %901 = func.call @stack_pop_pointer() : () -> i64
      %902 = func.call @cc_cons(%901, %900) : (i64, i64) -> i64
      func.call @stack_push_pointer(%902) : (i64) -> ()
      %903 = func.call @stack_pop_pointer() : () -> i64
      %904 = func.call @stack_pop_pointer() : () -> i64
      %905 = func.call @cc_cons(%904, %903) : (i64, i64) -> i64
      func.call @stack_push_pointer(%905) : (i64) -> ()
      %906 = func.call @stack_pop_pointer() : () -> i64
      %907 = func.call @stack_pop_pointer() : () -> i64
      %908 = func.call @cc_cons(%907, %906) : (i64, i64) -> i64
      func.call @stack_push_pointer(%908) : (i64) -> ()
      %909 = func.call @stack_pop_pointer() : () -> i64
      %910 = func.call @stack_pop_pointer() : () -> i64
      %911 = func.call @cc_cons(%910, %909) : (i64, i64) -> i64
      func.call @stack_push_pointer(%911) : (i64) -> ()
      %912 = func.call @stack_pop_pointer() : () -> i64
      %913 = func.call @stack_pop_pointer() : () -> i64
      %914 = func.call @cc_cons(%913, %912) : (i64, i64) -> i64
      func.call @stack_push_pointer(%914) : (i64) -> ()
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
      %924 = func.call @stack_pop_pointer() : () -> i64
      %925 = func.call @stack_pop_pointer() : () -> i64
      %926 = func.call @cc_cons(%925, %924) : (i64, i64) -> i64
      func.call @stack_push_pointer(%926) : (i64) -> ()
      %927 = func.call @stack_pop_pointer() : () -> i64
      %928 = func.call @stack_pop_pointer() : () -> i64
      %929 = func.call @cc_cons(%928, %927) : (i64, i64) -> i64
      func.call @stack_push_pointer(%929) : (i64) -> ()
      %930 = func.call @stack_pop_pointer() : () -> i64
      %931 = func.call @stack_pop_pointer() : () -> i64
      %932 = func.call @cc_cons(%931, %930) : (i64, i64) -> i64
      func.call @stack_push_pointer(%932) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      func.call @stack_push_nil() : () -> ()
      %951 = func.call @stack_pop_pointer() : () -> i64
      %952 = func.call @stack_pop_pointer() : () -> i64
      %953 = func.call @cc_cons(%952, %951) : (i64, i64) -> i64
      func.call @stack_push_pointer(%953) : (i64) -> ()
      %954 = func.call @stack_pop_pointer() : () -> i64
      %955 = func.call @stack_pop_pointer() : () -> i64
      %956 = func.call @cc_cons(%955, %954) : (i64, i64) -> i64
      func.call @stack_push_pointer(%956) : (i64) -> ()
      %957 = func.call @stack_pop_pointer() : () -> i64
      %958 = func.call @stack_pop_pointer() : () -> i64
      %959 = func.call @cc_cons(%958, %957) : (i64, i64) -> i64
      func.call @stack_push_pointer(%959) : (i64) -> ()
      %960 = func.call @stack_pop_pointer() : () -> i64
      %961 = func.call @stack_pop_pointer() : () -> i64
      %962 = func.call @cc_cons(%961, %960) : (i64, i64) -> i64
      func.call @stack_push_pointer(%962) : (i64) -> ()
      %963 = llvm.mlir.addressof @str92 : !llvm.ptr
      %964 = arith.constant 4 : i64
      %965 = func.call @cc_make_string(%963, %964) : (!llvm.ptr, i64) -> i64
      %966 = func.call @cc_nil_value() : () -> i64
      %967 = func.call @cc_intern(%965, %966) : (i64, i64) -> i64
      %968 = func.call @cc_nil_value() : () -> i64
      %969 = func.call @cc_cons(%967, %968) : (i64, i64) -> i64
      %970 = func.call @cc_values_pack(%969) : (i64) -> i64
      func.call @stack_push_pointer(%967) : (i64) -> ()
      %971 = llvm.mlir.addressof @str93 : !llvm.ptr
      %972 = arith.constant 15 : i64
      %973 = func.call @cc_make_string(%971, %972) : (!llvm.ptr, i64) -> i64
      %974 = func.call @cc_nil_value() : () -> i64
      %975 = func.call @cc_intern(%973, %974) : (i64, i64) -> i64
      %976 = func.call @cc_nil_value() : () -> i64
      %977 = func.call @cc_cons(%975, %976) : (i64, i64) -> i64
      %978 = func.call @cc_values_pack(%977) : (i64) -> i64
      func.call @stack_push_pointer(%975) : (i64) -> ()
      %979 = llvm.mlir.addressof @str94 : !llvm.ptr
      %980 = arith.constant 3 : i64
      %981 = func.call @cc_make_string(%979, %980) : (!llvm.ptr, i64) -> i64
      %982 = func.call @cc_nil_value() : () -> i64
      %983 = func.call @cc_intern(%981, %982) : (i64, i64) -> i64
      %984 = func.call @cc_nil_value() : () -> i64
      %985 = func.call @cc_cons(%983, %984) : (i64, i64) -> i64
      %986 = func.call @cc_values_pack(%985) : (i64) -> i64
      func.call @stack_push_pointer(%983) : (i64) -> ()
      %987 = llvm.mlir.addressof @str95 : !llvm.ptr
      %988 = arith.constant 15 : i64
      %989 = func.call @cc_make_string(%987, %988) : (!llvm.ptr, i64) -> i64
      %990 = func.call @cc_nil_value() : () -> i64
      %991 = func.call @cc_intern(%989, %990) : (i64, i64) -> i64
      %992 = func.call @cc_nil_value() : () -> i64
      %993 = func.call @cc_cons(%991, %992) : (i64, i64) -> i64
      %994 = func.call @cc_values_pack(%993) : (i64) -> i64
      func.call @stack_push_pointer(%991) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %995 = func.call @stack_pop_pointer() : () -> i64
      %996 = func.call @stack_pop_pointer() : () -> i64
      %997 = func.call @cc_cons(%996, %995) : (i64, i64) -> i64
      func.call @stack_push_pointer(%997) : (i64) -> ()
      %998 = func.call @stack_pop_pointer() : () -> i64
      %999 = func.call @stack_pop_pointer() : () -> i64
      %1000 = func.call @cc_cons(%999, %998) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1000) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1001 = func.call @stack_pop_pointer() : () -> i64
      %1002 = func.call @stack_pop_pointer() : () -> i64
      %1003 = func.call @cc_cons(%1002, %1001) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1003) : (i64) -> ()
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
      %1017 = func.call @stack_pop_pointer() : () -> i64
      %1018 = func.call @cc_cons(%1017, %1016) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1018) : (i64) -> ()
      %1019 = func.call @stack_pop_pointer() : () -> i64
      %1020 = func.call @stack_pop_pointer() : () -> i64
      %1021 = func.call @cc_cons(%1020, %1019) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1021) : (i64) -> ()
      %1022 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1023 = arith.constant 15 : i64
      %1024 = func.call @cc_make_string(%1022, %1023) : (!llvm.ptr, i64) -> i64
      %1025 = func.call @cc_nil_value() : () -> i64
      %1026 = func.call @cc_intern(%1024, %1025) : (i64, i64) -> i64
      %1027 = func.call @cc_nil_value() : () -> i64
      %1028 = func.call @cc_cons(%1026, %1027) : (i64, i64) -> i64
      %1029 = func.call @cc_values_pack(%1028) : (i64) -> i64
      func.call @stack_push_pointer(%1026) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1030 = func.call @stack_pop_pointer() : () -> i64
      %1031 = func.call @stack_pop_pointer() : () -> i64
      %1032 = func.call @cc_cons(%1031, %1030) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1032) : (i64) -> ()
      %1033 = func.call @stack_pop_pointer() : () -> i64
      %1034 = func.call @stack_pop_pointer() : () -> i64
      %1035 = func.call @cc_cons(%1034, %1033) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1035) : (i64) -> ()
      %1036 = func.call @stack_pop_pointer() : () -> i64
      %1037 = func.call @stack_pop_pointer() : () -> i64
      %1038 = func.call @cc_cons(%1037, %1036) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1038) : (i64) -> ()
      %1039 = func.call @stack_pop_pointer() : () -> i64
      %1040 = func.call @stack_pop_pointer() : () -> i64
      %1041 = func.call @cc_cons(%1040, %1039) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1041) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1042 = func.call @stack_pop_pointer() : () -> i64
      %1043 = func.call @stack_pop_pointer() : () -> i64
      %1044 = func.call @cc_cons(%1043, %1042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1044) : (i64) -> ()
      %1045 = func.call @stack_pop_pointer() : () -> i64
      %1046 = func.call @stack_pop_pointer() : () -> i64
      %1047 = func.call @cc_cons(%1046, %1045) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1047) : (i64) -> ()
      %1048 = func.call @stack_pop_pointer() : () -> i64
      %1049 = func.call @stack_pop_pointer() : () -> i64
      %1050 = func.call @cc_cons(%1049, %1048) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1050) : (i64) -> ()
      %1051 = func.call @stack_pop_pointer() : () -> i64
      %1783 = arith.constant 211067594604544 : i64
      %1784 = arith.constant 0 : i64
      %1785 = func.call @cc_make_closure(%1783, %1784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1785) : (i64) -> ()
      %1786 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1787 = func.call @stack_pop_pointer() : () -> i64
      %1788 = func.call @stack_pop_pointer() : () -> i64
      %1789 = func.call @cc_cons(%1788, %1787) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1789) : (i64) -> ()
      %1790 = func.call @stack_pop_pointer() : () -> i64
      %1791 = llvm.mlir.addressof @str158 : !llvm.ptr
      %1792 = arith.constant 11 : i64
      %1793 = func.call @cc_make_string(%1791, %1792) : (!llvm.ptr, i64) -> i64
      %1794 = llvm.mlir.addressof @str159 : !llvm.ptr
      %1795 = arith.constant 7 : i64
      %1796 = func.call @cc_make_string(%1794, %1795) : (!llvm.ptr, i64) -> i64
      %1797 = func.call @cc_intern(%1793, %1796) : (i64, i64) -> i64
      %1798 = func.call @cc_nil_value() : () -> i64
      %1799 = func.call @cc_cons(%1797, %1798) : (i64, i64) -> i64
      %1800 = func.call @cc_values_pack(%1799) : (i64) -> i64
      func.call @stack_push_pointer(%1797) : (i64) -> ()
      %1801 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1802 = func.call @stack_pop_pointer() : () -> i64
      %1803 = llvm.mlir.addressof @str160 : !llvm.ptr
      %1804 = arith.constant 4 : i64
      %1805 = func.call @cc_make_string(%1803, %1804) : (!llvm.ptr, i64) -> i64
      %1806 = llvm.mlir.addressof @str161 : !llvm.ptr
      %1807 = arith.constant 7 : i64
      %1808 = func.call @cc_make_string(%1806, %1807) : (!llvm.ptr, i64) -> i64
      %1809 = func.call @cc_intern(%1805, %1808) : (i64, i64) -> i64
      %1810 = func.call @cc_nil_value() : () -> i64
      %1811 = func.call @cc_cons(%1809, %1810) : (i64, i64) -> i64
      %1812 = func.call @cc_values_pack(%1811) : (i64) -> i64
      func.call @stack_push_pointer(%1809) : (i64) -> ()
      %1813 = func.call @stack_pop_pointer() : () -> i64
      %1814 = llvm.mlir.addressof @str162 : !llvm.ptr
      %1815 = arith.constant 6 : i64
      %1816 = func.call @cc_make_string(%1814, %1815) : (!llvm.ptr, i64) -> i64
      %1817 = func.call @cc_nil_value() : () -> i64
      %1818 = func.call @cc_intern(%1816, %1817) : (i64, i64) -> i64
      %1819 = func.call @cc_nil_value() : () -> i64
      %1820 = func.call @cc_cons(%1818, %1819) : (i64, i64) -> i64
      %1821 = func.call @cc_values_pack(%1820) : (i64) -> i64
      func.call @stack_push_pointer(%1818) : (i64) -> ()
      %1822 = func.call @stack_pop_pointer() : () -> i64
      %1823 = func.call @cc_nil_value() : () -> i64
      %1824 = func.call @cc_errorp(%36) : (i64) -> i64
      %1825 = arith.cmpi ne, %1824, %1823 : i64
      %1826 = arith.cmpi eq, %1823, %1823 : i64
      %1827 = arith.andi %1825, %1826 : i1
      %1828 = scf.if %1827 -> (i64) {
        scf.yield %36 : i64
      } else {
        scf.yield %1823 : i64
      }
      %1829 = func.call @cc_errorp(%1051) : (i64) -> i64
      %1830 = arith.cmpi ne, %1829, %1823 : i64
      %1831 = arith.cmpi eq, %1828, %1823 : i64
      %1832 = arith.andi %1830, %1831 : i1
      %1833 = scf.if %1832 -> (i64) {
        scf.yield %1051 : i64
      } else {
        scf.yield %1828 : i64
      }
      %1834 = func.call @cc_errorp(%1786) : (i64) -> i64
      %1835 = arith.cmpi ne, %1834, %1823 : i64
      %1836 = arith.cmpi eq, %1833, %1823 : i64
      %1837 = arith.andi %1835, %1836 : i1
      %1838 = scf.if %1837 -> (i64) {
        scf.yield %1786 : i64
      } else {
        scf.yield %1833 : i64
      }
      %1839 = func.call @cc_errorp(%1790) : (i64) -> i64
      %1840 = arith.cmpi ne, %1839, %1823 : i64
      %1841 = arith.cmpi eq, %1838, %1823 : i64
      %1842 = arith.andi %1840, %1841 : i1
      %1843 = scf.if %1842 -> (i64) {
        scf.yield %1790 : i64
      } else {
        scf.yield %1838 : i64
      }
      %1844 = func.call @cc_errorp(%1801) : (i64) -> i64
      %1845 = arith.cmpi ne, %1844, %1823 : i64
      %1846 = arith.cmpi eq, %1843, %1823 : i64
      %1847 = arith.andi %1845, %1846 : i1
      %1848 = scf.if %1847 -> (i64) {
        scf.yield %1801 : i64
      } else {
        scf.yield %1843 : i64
      }
      %1849 = func.call @cc_errorp(%1802) : (i64) -> i64
      %1850 = arith.cmpi ne, %1849, %1823 : i64
      %1851 = arith.cmpi eq, %1848, %1823 : i64
      %1852 = arith.andi %1850, %1851 : i1
      %1853 = scf.if %1852 -> (i64) {
        scf.yield %1802 : i64
      } else {
        scf.yield %1848 : i64
      }
      %1854 = func.call @cc_errorp(%1813) : (i64) -> i64
      %1855 = arith.cmpi ne, %1854, %1823 : i64
      %1856 = arith.cmpi eq, %1853, %1823 : i64
      %1857 = arith.andi %1855, %1856 : i1
      %1858 = scf.if %1857 -> (i64) {
        scf.yield %1813 : i64
      } else {
        scf.yield %1853 : i64
      }
      %1859 = func.call @cc_errorp(%1822) : (i64) -> i64
      %1860 = arith.cmpi ne, %1859, %1823 : i64
      %1861 = arith.cmpi eq, %1858, %1823 : i64
      %1862 = arith.andi %1860, %1861 : i1
      %1863 = scf.if %1862 -> (i64) {
        scf.yield %1822 : i64
      } else {
        scf.yield %1858 : i64
      }
      %1864 = arith.cmpi ne, %1863, %1823 : i64
      scf.if %1864 {
        func.call @stack_push_pointer(%1863) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%36) : (i64) -> ()
        func.call @stack_push_pointer(%1051) : (i64) -> ()
        func.call @stack_push_pointer(%1786) : (i64) -> ()
        func.call @stack_push_pointer(%1790) : (i64) -> ()
        func.call @stack_push_pointer(%1801) : (i64) -> ()
        func.call @stack_push_pointer(%1802) : (i64) -> ()
        func.call @stack_push_pointer(%1813) : (i64) -> ()
        func.call @stack_push_pointer(%1822) : (i64) -> ()
        %1865 = llvm.mlir.addressof @str163 : !llvm.ptr
        %1866 = func.call @cc_make_function_ref_const(%1865) : (!llvm.ptr) -> i64
        %1867 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1866, %1867) : (i64, i64) -> ()
      }
      %1868 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1868 : i64
    }
    %1869 = func.call @cc_nil_value() : () -> i64
    %1870 = func.call @cc_errorp(%27) : (i64) -> i64
    %1871 = arith.cmpi ne, %1870, %1869 : i64
    %1872 = scf.if %1871 -> (i64) {
      scf.yield %27 : i64
    } else {
      %1873 = llvm.mlir.addressof @str164 : !llvm.ptr
      %1874 = arith.constant 25 : i64
      %1875 = func.call @cc_make_string(%1873, %1874) : (!llvm.ptr, i64) -> i64
      %1876 = func.call @cc_nil_value() : () -> i64
      %1877 = func.call @cc_intern(%1875, %1876) : (i64, i64) -> i64
      %1878 = func.call @cc_nil_value() : () -> i64
      %1879 = func.call @cc_cons(%1877, %1878) : (i64, i64) -> i64
      %1880 = func.call @cc_values_pack(%1879) : (i64) -> i64
      func.call @stack_push_pointer(%1877) : (i64) -> ()
      %1881 = func.call @stack_pop_pointer() : () -> i64
      %1882 = llvm.mlir.addressof @str165 : !llvm.ptr
      %1883 = arith.constant 4 : i64
      %1884 = func.call @cc_make_string(%1882, %1883) : (!llvm.ptr, i64) -> i64
      %1885 = func.call @cc_nil_value() : () -> i64
      %1886 = func.call @cc_intern(%1884, %1885) : (i64, i64) -> i64
      %1887 = func.call @cc_nil_value() : () -> i64
      %1888 = func.call @cc_cons(%1886, %1887) : (i64, i64) -> i64
      %1889 = func.call @cc_values_pack(%1888) : (i64) -> i64
      func.call @stack_push_pointer(%1886) : (i64) -> ()
      %1890 = llvm.mlir.addressof @str166 : !llvm.ptr
      %1891 = arith.constant 3 : i64
      %1892 = func.call @cc_make_string(%1890, %1891) : (!llvm.ptr, i64) -> i64
      %1893 = func.call @cc_nil_value() : () -> i64
      %1894 = func.call @cc_intern(%1892, %1893) : (i64, i64) -> i64
      %1895 = func.call @cc_nil_value() : () -> i64
      %1896 = func.call @cc_cons(%1894, %1895) : (i64, i64) -> i64
      %1897 = func.call @cc_values_pack(%1896) : (i64) -> i64
      func.call @stack_push_pointer(%1894) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1898 = func.call @stack_pop_pointer() : () -> i64
      %1899 = func.call @stack_pop_pointer() : () -> i64
      %1900 = func.call @cc_cons(%1899, %1898) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1900) : (i64) -> ()
      %1901 = func.call @stack_pop_pointer() : () -> i64
      %1902 = func.call @stack_pop_pointer() : () -> i64
      %1903 = func.call @cc_cons(%1902, %1901) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1903) : (i64) -> ()
      %1904 = llvm.mlir.addressof @str167 : !llvm.ptr
      %1905 = arith.constant 15 : i64
      %1906 = func.call @cc_make_string(%1904, %1905) : (!llvm.ptr, i64) -> i64
      %1907 = func.call @cc_nil_value() : () -> i64
      %1908 = func.call @cc_intern(%1906, %1907) : (i64, i64) -> i64
      %1909 = func.call @cc_nil_value() : () -> i64
      %1910 = func.call @cc_cons(%1908, %1909) : (i64, i64) -> i64
      %1911 = func.call @cc_values_pack(%1910) : (i64) -> i64
      func.call @stack_push_pointer(%1908) : (i64) -> ()
      %1912 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%1912) : (i64) -> ()
      %1913 = llvm.mlir.addressof @str168 : !llvm.ptr
      %1914 = arith.constant 6 : i64
      %1915 = func.call @cc_make_string(%1913, %1914) : (!llvm.ptr, i64) -> i64
      %1916 = llvm.mlir.addressof @str169 : !llvm.ptr
      %1917 = arith.constant 11 : i64
      %1918 = func.call @cc_make_string(%1916, %1917) : (!llvm.ptr, i64) -> i64
      %1919 = func.call @cc_intern(%1915, %1918) : (i64, i64) -> i64
      %1920 = func.call @cc_nil_value() : () -> i64
      %1921 = func.call @cc_cons(%1919, %1920) : (i64, i64) -> i64
      %1922 = func.call @cc_values_pack(%1921) : (i64) -> i64
      func.call @stack_push_pointer(%1919) : (i64) -> ()
      %1923 = llvm.mlir.addressof @str170 : !llvm.ptr
      %1924 = arith.constant 8 : i64
      %1925 = func.call @cc_make_string(%1923, %1924) : (!llvm.ptr, i64) -> i64
      %1926 = llvm.mlir.addressof @str171 : !llvm.ptr
      %1927 = arith.constant 11 : i64
      %1928 = func.call @cc_make_string(%1926, %1927) : (!llvm.ptr, i64) -> i64
      %1929 = func.call @cc_intern(%1925, %1928) : (i64, i64) -> i64
      %1930 = func.call @cc_nil_value() : () -> i64
      %1931 = func.call @cc_cons(%1929, %1930) : (i64, i64) -> i64
      %1932 = func.call @cc_values_pack(%1931) : (i64) -> i64
      func.call @stack_push_pointer(%1929) : (i64) -> ()
      %1933 = llvm.mlir.addressof @str172 : !llvm.ptr
      %1934 = arith.constant 9 : i64
      %1935 = func.call @cc_make_string(%1933, %1934) : (!llvm.ptr, i64) -> i64
      %1936 = llvm.mlir.addressof @str173 : !llvm.ptr
      %1937 = arith.constant 11 : i64
      %1938 = func.call @cc_make_string(%1936, %1937) : (!llvm.ptr, i64) -> i64
      %1939 = func.call @cc_intern(%1935, %1938) : (i64, i64) -> i64
      %1940 = func.call @cc_nil_value() : () -> i64
      %1941 = func.call @cc_cons(%1939, %1940) : (i64, i64) -> i64
      %1942 = func.call @cc_values_pack(%1941) : (i64) -> i64
      func.call @stack_push_pointer(%1939) : (i64) -> ()
      %1943 = llvm.mlir.addressof @str174 : !llvm.ptr
      %1944 = arith.constant 6 : i64
      %1945 = func.call @cc_make_string(%1943, %1944) : (!llvm.ptr, i64) -> i64
      %1946 = llvm.mlir.addressof @str175 : !llvm.ptr
      %1947 = arith.constant 11 : i64
      %1948 = func.call @cc_make_string(%1946, %1947) : (!llvm.ptr, i64) -> i64
      %1949 = func.call @cc_intern(%1945, %1948) : (i64, i64) -> i64
      %1950 = func.call @cc_nil_value() : () -> i64
      %1951 = func.call @cc_cons(%1949, %1950) : (i64, i64) -> i64
      %1952 = func.call @cc_values_pack(%1951) : (i64) -> i64
      func.call @stack_push_pointer(%1949) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1953 = func.call @stack_pop_pointer() : () -> i64
      %1954 = func.call @stack_pop_pointer() : () -> i64
      %1955 = func.call @cc_cons(%1954, %1953) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1955) : (i64) -> ()
      %1956 = func.call @stack_pop_pointer() : () -> i64
      %1957 = func.call @stack_pop_pointer() : () -> i64
      %1958 = func.call @cc_cons(%1957, %1956) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1958) : (i64) -> ()
      %1959 = func.call @stack_pop_pointer() : () -> i64
      %1960 = func.call @stack_pop_pointer() : () -> i64
      %1961 = func.call @cc_cons(%1960, %1959) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1961) : (i64) -> ()
      %1962 = func.call @stack_pop_pointer() : () -> i64
      %1963 = func.call @stack_pop_pointer() : () -> i64
      %1964 = func.call @cc_cons(%1963, %1962) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1964) : (i64) -> ()
      %1965 = func.call @stack_pop_pointer() : () -> i64
      %1966 = func.call @stack_pop_pointer() : () -> i64
      %1967 = func.call @cc_cons(%1965, %1966) : (i64, i64) -> i64
      %1968 = llvm.mlir.addressof @str176 : !llvm.ptr
      %1969 = arith.constant 5 : i64
      %1970 = func.call @cc_make_string(%1968, %1969) : (!llvm.ptr, i64) -> i64
      %1971 = func.call @cc_nil_value() : () -> i64
      %1972 = func.call @cc_intern(%1970, %1971) : (i64, i64) -> i64
      %1973 = func.call @cc_nil_value() : () -> i64
      %1974 = func.call @cc_cons(%1972, %1973) : (i64, i64) -> i64
      %1975 = func.call @cc_values_pack(%1974) : (i64) -> i64
      %1976 = func.call @cc_cons(%1972, %1967) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1976) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1977 = func.call @stack_pop_pointer() : () -> i64
      %1978 = func.call @stack_pop_pointer() : () -> i64
      %1979 = func.call @cc_cons(%1978, %1977) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1979) : (i64) -> ()
      %1980 = func.call @stack_pop_pointer() : () -> i64
      %1981 = func.call @stack_pop_pointer() : () -> i64
      %1982 = func.call @cc_cons(%1981, %1980) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1982) : (i64) -> ()
      %1983 = llvm.mlir.addressof @str177 : !llvm.ptr
      %1984 = arith.constant 15 : i64
      %1985 = func.call @cc_make_string(%1983, %1984) : (!llvm.ptr, i64) -> i64
      %1986 = func.call @cc_nil_value() : () -> i64
      %1987 = func.call @cc_intern(%1985, %1986) : (i64, i64) -> i64
      %1988 = func.call @cc_nil_value() : () -> i64
      %1989 = func.call @cc_cons(%1987, %1988) : (i64, i64) -> i64
      %1990 = func.call @cc_values_pack(%1989) : (i64) -> i64
      func.call @stack_push_pointer(%1987) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %1991 = func.call @stack_pop_pointer() : () -> i64
      %1992 = func.call @stack_pop_pointer() : () -> i64
      %1993 = func.call @cc_cons(%1992, %1991) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1993) : (i64) -> ()
      %1994 = func.call @stack_pop_pointer() : () -> i64
      %1995 = func.call @stack_pop_pointer() : () -> i64
      %1996 = func.call @cc_cons(%1995, %1994) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1996) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1997 = func.call @stack_pop_pointer() : () -> i64
      %1998 = func.call @stack_pop_pointer() : () -> i64
      %1999 = func.call @cc_cons(%1998, %1997) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1999) : (i64) -> ()
      %2000 = func.call @stack_pop_pointer() : () -> i64
      %2001 = func.call @stack_pop_pointer() : () -> i64
      %2002 = func.call @cc_cons(%2001, %2000) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2002) : (i64) -> ()
      %2003 = func.call @stack_pop_pointer() : () -> i64
      %2004 = func.call @stack_pop_pointer() : () -> i64
      %2005 = func.call @cc_cons(%2004, %2003) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2005) : (i64) -> ()
      %2006 = llvm.mlir.addressof @str178 : !llvm.ptr
      %2007 = arith.constant 5 : i64
      %2008 = func.call @cc_make_string(%2006, %2007) : (!llvm.ptr, i64) -> i64
      %2009 = func.call @cc_nil_value() : () -> i64
      %2010 = func.call @cc_intern(%2008, %2009) : (i64, i64) -> i64
      %2011 = func.call @cc_nil_value() : () -> i64
      %2012 = func.call @cc_cons(%2010, %2011) : (i64, i64) -> i64
      %2013 = func.call @cc_values_pack(%2012) : (i64) -> i64
      func.call @stack_push_pointer(%2010) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2014 = llvm.mlir.addressof @str179 : !llvm.ptr
      %2015 = arith.constant 5 : i64
      %2016 = func.call @cc_make_string(%2014, %2015) : (!llvm.ptr, i64) -> i64
      %2017 = llvm.mlir.addressof @str180 : !llvm.ptr
      %2018 = arith.constant 3 : i64
      %2019 = func.call @cc_make_string(%2017, %2018) : (!llvm.ptr, i64) -> i64
      %2020 = func.call @cc_intern(%2016, %2019) : (i64, i64) -> i64
      %2021 = func.call @cc_nil_value() : () -> i64
      %2022 = func.call @cc_cons(%2020, %2021) : (i64, i64) -> i64
      %2023 = func.call @cc_values_pack(%2022) : (i64) -> i64
      func.call @stack_push_pointer(%2020) : (i64) -> ()
      %2024 = llvm.mlir.addressof @str181 : !llvm.ptr
      %2025 = arith.constant 15 : i64
      %2026 = func.call @cc_make_string(%2024, %2025) : (!llvm.ptr, i64) -> i64
      %2027 = func.call @cc_nil_value() : () -> i64
      %2028 = func.call @cc_intern(%2026, %2027) : (i64, i64) -> i64
      %2029 = func.call @cc_nil_value() : () -> i64
      %2030 = func.call @cc_cons(%2028, %2029) : (i64, i64) -> i64
      %2031 = func.call @cc_values_pack(%2030) : (i64) -> i64
      func.call @stack_push_pointer(%2028) : (i64) -> ()
      %2032 = llvm.mlir.addressof @str182 : !llvm.ptr
      %2033 = arith.constant 5 : i64
      %2034 = func.call @cc_make_string(%2032, %2033) : (!llvm.ptr, i64) -> i64
      %2035 = func.call @cc_nil_value() : () -> i64
      %2036 = func.call @cc_intern(%2034, %2035) : (i64, i64) -> i64
      %2037 = func.call @cc_nil_value() : () -> i64
      %2038 = func.call @cc_cons(%2036, %2037) : (i64, i64) -> i64
      %2039 = func.call @cc_values_pack(%2038) : (i64) -> i64
      func.call @stack_push_pointer(%2036) : (i64) -> ()
      %2040 = llvm.mlir.addressof @str183 : !llvm.ptr
      %2041 = arith.constant 2 : i64
      %2042 = func.call @cc_make_string(%2040, %2041) : (!llvm.ptr, i64) -> i64
      %2043 = func.call @cc_nil_value() : () -> i64
      %2044 = func.call @cc_intern(%2042, %2043) : (i64, i64) -> i64
      %2045 = func.call @cc_nil_value() : () -> i64
      %2046 = func.call @cc_cons(%2044, %2045) : (i64, i64) -> i64
      %2047 = func.call @cc_values_pack(%2046) : (i64) -> i64
      func.call @stack_push_pointer(%2044) : (i64) -> ()
      %2048 = llvm.mlir.addressof @str184 : !llvm.ptr
      %2049 = arith.constant 3 : i64
      %2050 = func.call @cc_make_string(%2048, %2049) : (!llvm.ptr, i64) -> i64
      %2051 = func.call @cc_nil_value() : () -> i64
      %2052 = func.call @cc_intern(%2050, %2051) : (i64, i64) -> i64
      %2053 = func.call @cc_nil_value() : () -> i64
      %2054 = func.call @cc_cons(%2052, %2053) : (i64, i64) -> i64
      %2055 = func.call @cc_values_pack(%2054) : (i64) -> i64
      func.call @stack_push_pointer(%2052) : (i64) -> ()
      %2056 = llvm.mlir.addressof @str185 : !llvm.ptr
      %2057 = arith.constant 3 : i64
      %2058 = func.call @cc_make_string(%2056, %2057) : (!llvm.ptr, i64) -> i64
      %2059 = func.call @cc_nil_value() : () -> i64
      %2060 = func.call @cc_intern(%2058, %2059) : (i64, i64) -> i64
      %2061 = func.call @cc_nil_value() : () -> i64
      %2062 = func.call @cc_cons(%2060, %2061) : (i64, i64) -> i64
      %2063 = func.call @cc_values_pack(%2062) : (i64) -> i64
      func.call @stack_push_pointer(%2060) : (i64) -> ()
      %2064 = llvm.mlir.addressof @str186 : !llvm.ptr
      %2065 = arith.constant 4 : i64
      %2066 = func.call @cc_make_string(%2064, %2065) : (!llvm.ptr, i64) -> i64
      %2067 = func.call @cc_nil_value() : () -> i64
      %2068 = func.call @cc_intern(%2066, %2067) : (i64, i64) -> i64
      %2069 = func.call @cc_nil_value() : () -> i64
      %2070 = func.call @cc_cons(%2068, %2069) : (i64, i64) -> i64
      %2071 = func.call @cc_values_pack(%2070) : (i64) -> i64
      func.call @stack_push_pointer(%2068) : (i64) -> ()
      %2072 = llvm.mlir.addressof @str187 : !llvm.ptr
      %2073 = arith.constant 15 : i64
      %2074 = func.call @cc_make_string(%2072, %2073) : (!llvm.ptr, i64) -> i64
      %2075 = func.call @cc_nil_value() : () -> i64
      %2076 = func.call @cc_intern(%2074, %2075) : (i64, i64) -> i64
      %2077 = func.call @cc_nil_value() : () -> i64
      %2078 = func.call @cc_cons(%2076, %2077) : (i64, i64) -> i64
      %2079 = func.call @cc_values_pack(%2078) : (i64) -> i64
      func.call @stack_push_pointer(%2076) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2080 = func.call @stack_pop_pointer() : () -> i64
      %2081 = func.call @stack_pop_pointer() : () -> i64
      %2082 = func.call @cc_cons(%2081, %2080) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2082) : (i64) -> ()
      %2083 = func.call @stack_pop_pointer() : () -> i64
      %2084 = func.call @stack_pop_pointer() : () -> i64
      %2085 = func.call @cc_cons(%2084, %2083) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2085) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2086 = func.call @stack_pop_pointer() : () -> i64
      %2087 = func.call @stack_pop_pointer() : () -> i64
      %2088 = func.call @cc_cons(%2087, %2086) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2088) : (i64) -> ()
      %2089 = func.call @stack_pop_pointer() : () -> i64
      %2090 = func.call @stack_pop_pointer() : () -> i64
      %2091 = func.call @cc_cons(%2090, %2089) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2091) : (i64) -> ()
      %2092 = llvm.mlir.addressof @str188 : !llvm.ptr
      %2093 = arith.constant 3 : i64
      %2094 = func.call @cc_make_string(%2092, %2093) : (!llvm.ptr, i64) -> i64
      %2095 = func.call @cc_nil_value() : () -> i64
      %2096 = func.call @cc_intern(%2094, %2095) : (i64, i64) -> i64
      %2097 = func.call @cc_nil_value() : () -> i64
      %2098 = func.call @cc_cons(%2096, %2097) : (i64, i64) -> i64
      %2099 = func.call @cc_values_pack(%2098) : (i64) -> i64
      func.call @stack_push_pointer(%2096) : (i64) -> ()
      %2100 = llvm.mlir.addressof @str189 : !llvm.ptr
      %2101 = arith.constant 5 : i64
      %2102 = func.call @cc_make_string(%2100, %2101) : (!llvm.ptr, i64) -> i64
      %2103 = func.call @cc_nil_value() : () -> i64
      %2104 = func.call @cc_intern(%2102, %2103) : (i64, i64) -> i64
      %2105 = func.call @cc_nil_value() : () -> i64
      %2106 = func.call @cc_cons(%2104, %2105) : (i64, i64) -> i64
      %2107 = func.call @cc_values_pack(%2106) : (i64) -> i64
      func.call @stack_push_pointer(%2104) : (i64) -> ()
      %2108 = llvm.mlir.addressof @str190 : !llvm.ptr
      %2109 = arith.constant 15 : i64
      %2110 = func.call @cc_make_string(%2108, %2109) : (!llvm.ptr, i64) -> i64
      %2111 = func.call @cc_nil_value() : () -> i64
      %2112 = func.call @cc_intern(%2110, %2111) : (i64, i64) -> i64
      %2113 = func.call @cc_nil_value() : () -> i64
      %2114 = func.call @cc_cons(%2112, %2113) : (i64, i64) -> i64
      %2115 = func.call @cc_values_pack(%2114) : (i64) -> i64
      func.call @stack_push_pointer(%2112) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2116 = func.call @stack_pop_pointer() : () -> i64
      %2117 = func.call @stack_pop_pointer() : () -> i64
      %2118 = func.call @cc_cons(%2117, %2116) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2118) : (i64) -> ()
      %2119 = func.call @stack_pop_pointer() : () -> i64
      %2120 = func.call @stack_pop_pointer() : () -> i64
      %2121 = func.call @cc_cons(%2120, %2119) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2121) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2122 = func.call @stack_pop_pointer() : () -> i64
      %2123 = func.call @stack_pop_pointer() : () -> i64
      %2124 = func.call @cc_cons(%2123, %2122) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2124) : (i64) -> ()
      %2125 = func.call @stack_pop_pointer() : () -> i64
      %2126 = func.call @stack_pop_pointer() : () -> i64
      %2127 = func.call @cc_cons(%2126, %2125) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2127) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2128 = func.call @stack_pop_pointer() : () -> i64
      %2129 = func.call @stack_pop_pointer() : () -> i64
      %2130 = func.call @cc_cons(%2129, %2128) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2130) : (i64) -> ()
      %2131 = func.call @stack_pop_pointer() : () -> i64
      %2132 = func.call @stack_pop_pointer() : () -> i64
      %2133 = func.call @cc_cons(%2132, %2131) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2133) : (i64) -> ()
      %2134 = func.call @stack_pop_pointer() : () -> i64
      %2135 = func.call @stack_pop_pointer() : () -> i64
      %2136 = func.call @cc_cons(%2135, %2134) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2136) : (i64) -> ()
      %2137 = llvm.mlir.addressof @str191 : !llvm.ptr
      %2138 = arith.constant 11 : i64
      %2139 = func.call @cc_make_string(%2137, %2138) : (!llvm.ptr, i64) -> i64
      %2140 = func.call @cc_nil_value() : () -> i64
      %2141 = func.call @cc_intern(%2139, %2140) : (i64, i64) -> i64
      %2142 = func.call @cc_nil_value() : () -> i64
      %2143 = func.call @cc_cons(%2141, %2142) : (i64, i64) -> i64
      %2144 = func.call @cc_values_pack(%2143) : (i64) -> i64
      func.call @stack_push_pointer(%2141) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2145 = llvm.mlir.addressof @str192 : !llvm.ptr
      %2146 = arith.constant 5 : i64
      %2147 = func.call @cc_make_string(%2145, %2146) : (!llvm.ptr, i64) -> i64
      %2148 = func.call @cc_nil_value() : () -> i64
      %2149 = func.call @cc_intern(%2147, %2148) : (i64, i64) -> i64
      %2150 = func.call @cc_nil_value() : () -> i64
      %2151 = func.call @cc_cons(%2149, %2150) : (i64, i64) -> i64
      %2152 = func.call @cc_values_pack(%2151) : (i64) -> i64
      func.call @stack_push_pointer(%2149) : (i64) -> ()
      %2153 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2153) : (i64) -> ()
      %2154 = llvm.mlir.addressof @str193 : !llvm.ptr
      %2155 = arith.constant 10 : i64
      %2156 = func.call @cc_make_string(%2154, %2155) : (!llvm.ptr, i64) -> i64
      %2157 = func.call @cc_nil_value() : () -> i64
      %2158 = func.call @cc_intern(%2156, %2157) : (i64, i64) -> i64
      %2159 = func.call @cc_nil_value() : () -> i64
      %2160 = func.call @cc_cons(%2158, %2159) : (i64, i64) -> i64
      %2161 = func.call @cc_values_pack(%2160) : (i64) -> i64
      func.call @stack_push_pointer(%2158) : (i64) -> ()
      %2162 = func.call @stack_pop_pointer() : () -> i64
      %2163 = func.call @stack_pop_pointer() : () -> i64
      %2164 = func.call @cc_cons(%2162, %2163) : (i64, i64) -> i64
      %2165 = llvm.mlir.addressof @str194 : !llvm.ptr
      %2166 = arith.constant 5 : i64
      %2167 = func.call @cc_make_string(%2165, %2166) : (!llvm.ptr, i64) -> i64
      %2168 = func.call @cc_nil_value() : () -> i64
      %2169 = func.call @cc_intern(%2167, %2168) : (i64, i64) -> i64
      %2170 = func.call @cc_nil_value() : () -> i64
      %2171 = func.call @cc_cons(%2169, %2170) : (i64, i64) -> i64
      %2172 = func.call @cc_values_pack(%2171) : (i64) -> i64
      %2173 = func.call @cc_cons(%2169, %2164) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2173) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2174 = func.call @stack_pop_pointer() : () -> i64
      %2175 = func.call @stack_pop_pointer() : () -> i64
      %2176 = func.call @cc_cons(%2175, %2174) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2176) : (i64) -> ()
      %2177 = func.call @stack_pop_pointer() : () -> i64
      %2178 = func.call @stack_pop_pointer() : () -> i64
      %2179 = func.call @cc_cons(%2178, %2177) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2179) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2180 = func.call @stack_pop_pointer() : () -> i64
      %2181 = func.call @stack_pop_pointer() : () -> i64
      %2182 = func.call @cc_cons(%2181, %2180) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2182) : (i64) -> ()
      %2183 = func.call @stack_pop_pointer() : () -> i64
      %2184 = func.call @stack_pop_pointer() : () -> i64
      %2185 = func.call @cc_cons(%2184, %2183) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2185) : (i64) -> ()
      %2186 = func.call @stack_pop_pointer() : () -> i64
      %2187 = func.call @stack_pop_pointer() : () -> i64
      %2188 = func.call @cc_cons(%2187, %2186) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2188) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %2189 = func.call @stack_pop_pointer() : () -> i64
      %2190 = func.call @stack_pop_pointer() : () -> i64
      %2191 = func.call @cc_cons(%2190, %2189) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2191) : (i64) -> ()
      %2192 = func.call @stack_pop_pointer() : () -> i64
      %2193 = func.call @stack_pop_pointer() : () -> i64
      %2194 = func.call @cc_cons(%2193, %2192) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2194) : (i64) -> ()
      %2195 = func.call @stack_pop_pointer() : () -> i64
      %2196 = func.call @stack_pop_pointer() : () -> i64
      %2197 = func.call @cc_cons(%2196, %2195) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2197) : (i64) -> ()
      %2198 = func.call @stack_pop_pointer() : () -> i64
      %2199 = func.call @stack_pop_pointer() : () -> i64
      %2200 = func.call @cc_cons(%2199, %2198) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2200) : (i64) -> ()
      %2201 = llvm.mlir.addressof @str195 : !llvm.ptr
      %2202 = arith.constant 4 : i64
      %2203 = func.call @cc_make_string(%2201, %2202) : (!llvm.ptr, i64) -> i64
      %2204 = func.call @cc_nil_value() : () -> i64
      %2205 = func.call @cc_intern(%2203, %2204) : (i64, i64) -> i64
      %2206 = func.call @cc_nil_value() : () -> i64
      %2207 = func.call @cc_cons(%2205, %2206) : (i64, i64) -> i64
      %2208 = func.call @cc_values_pack(%2207) : (i64) -> i64
      func.call @stack_push_pointer(%2205) : (i64) -> ()
      %2209 = llvm.mlir.addressof @str196 : !llvm.ptr
      %2210 = arith.constant 3 : i64
      %2211 = func.call @cc_make_string(%2209, %2210) : (!llvm.ptr, i64) -> i64
      %2212 = func.call @cc_nil_value() : () -> i64
      %2213 = func.call @cc_intern(%2211, %2212) : (i64, i64) -> i64
      %2214 = func.call @cc_nil_value() : () -> i64
      %2215 = func.call @cc_cons(%2213, %2214) : (i64, i64) -> i64
      %2216 = func.call @cc_values_pack(%2215) : (i64) -> i64
      func.call @stack_push_pointer(%2213) : (i64) -> ()
      %2217 = llvm.mlir.addressof @str197 : !llvm.ptr
      %2218 = arith.constant 3 : i64
      %2219 = func.call @cc_make_string(%2217, %2218) : (!llvm.ptr, i64) -> i64
      %2220 = func.call @cc_nil_value() : () -> i64
      %2221 = func.call @cc_intern(%2219, %2220) : (i64, i64) -> i64
      %2222 = func.call @cc_nil_value() : () -> i64
      %2223 = func.call @cc_cons(%2221, %2222) : (i64, i64) -> i64
      %2224 = func.call @cc_values_pack(%2223) : (i64) -> i64
      func.call @stack_push_pointer(%2221) : (i64) -> ()
      %2225 = llvm.mlir.addressof @str198 : !llvm.ptr
      %2226 = arith.constant 15 : i64
      %2227 = func.call @cc_make_string(%2225, %2226) : (!llvm.ptr, i64) -> i64
      %2228 = func.call @cc_nil_value() : () -> i64
      %2229 = func.call @cc_intern(%2227, %2228) : (i64, i64) -> i64
      %2230 = func.call @cc_nil_value() : () -> i64
      %2231 = func.call @cc_cons(%2229, %2230) : (i64, i64) -> i64
      %2232 = func.call @cc_values_pack(%2231) : (i64) -> i64
      func.call @stack_push_pointer(%2229) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2233 = func.call @stack_pop_pointer() : () -> i64
      %2234 = func.call @stack_pop_pointer() : () -> i64
      %2235 = func.call @cc_cons(%2234, %2233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2235) : (i64) -> ()
      %2236 = func.call @stack_pop_pointer() : () -> i64
      %2237 = func.call @stack_pop_pointer() : () -> i64
      %2238 = func.call @cc_cons(%2237, %2236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2238) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2239 = func.call @stack_pop_pointer() : () -> i64
      %2240 = func.call @stack_pop_pointer() : () -> i64
      %2241 = func.call @cc_cons(%2240, %2239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2241) : (i64) -> ()
      %2242 = func.call @stack_pop_pointer() : () -> i64
      %2243 = func.call @stack_pop_pointer() : () -> i64
      %2244 = func.call @cc_cons(%2243, %2242) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2244) : (i64) -> ()
      %2245 = func.call @stack_pop_pointer() : () -> i64
      %2246 = func.call @stack_pop_pointer() : () -> i64
      %2247 = func.call @cc_cons(%2246, %2245) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2247) : (i64) -> ()
      %2248 = llvm.mlir.addressof @str199 : !llvm.ptr
      %2249 = arith.constant 4 : i64
      %2250 = func.call @cc_make_string(%2248, %2249) : (!llvm.ptr, i64) -> i64
      %2251 = func.call @cc_nil_value() : () -> i64
      %2252 = func.call @cc_intern(%2250, %2251) : (i64, i64) -> i64
      %2253 = func.call @cc_nil_value() : () -> i64
      %2254 = func.call @cc_cons(%2252, %2253) : (i64, i64) -> i64
      %2255 = func.call @cc_values_pack(%2254) : (i64) -> i64
      func.call @stack_push_pointer(%2252) : (i64) -> ()
      %2256 = llvm.mlir.addressof @str200 : !llvm.ptr
      %2257 = arith.constant 15 : i64
      %2258 = func.call @cc_make_string(%2256, %2257) : (!llvm.ptr, i64) -> i64
      %2259 = func.call @cc_nil_value() : () -> i64
      %2260 = func.call @cc_intern(%2258, %2259) : (i64, i64) -> i64
      %2261 = func.call @cc_nil_value() : () -> i64
      %2262 = func.call @cc_cons(%2260, %2261) : (i64, i64) -> i64
      %2263 = func.call @cc_values_pack(%2262) : (i64) -> i64
      func.call @stack_push_pointer(%2260) : (i64) -> ()
      %2264 = llvm.mlir.addressof @str201 : !llvm.ptr
      %2265 = arith.constant 5 : i64
      %2266 = func.call @cc_make_string(%2264, %2265) : (!llvm.ptr, i64) -> i64
      %2267 = func.call @cc_nil_value() : () -> i64
      %2268 = func.call @cc_intern(%2266, %2267) : (i64, i64) -> i64
      %2269 = func.call @cc_nil_value() : () -> i64
      %2270 = func.call @cc_cons(%2268, %2269) : (i64, i64) -> i64
      %2271 = func.call @cc_values_pack(%2270) : (i64) -> i64
      func.call @stack_push_pointer(%2268) : (i64) -> ()
      %2272 = llvm.mlir.addressof @str202 : !llvm.ptr
      %2273 = arith.constant 15 : i64
      %2274 = func.call @cc_make_string(%2272, %2273) : (!llvm.ptr, i64) -> i64
      %2275 = func.call @cc_nil_value() : () -> i64
      %2276 = func.call @cc_intern(%2274, %2275) : (i64, i64) -> i64
      %2277 = func.call @cc_nil_value() : () -> i64
      %2278 = func.call @cc_cons(%2276, %2277) : (i64, i64) -> i64
      %2279 = func.call @cc_values_pack(%2278) : (i64) -> i64
      func.call @stack_push_pointer(%2276) : (i64) -> ()
      %2280 = llvm.mlir.addressof @str203 : !llvm.ptr
      %2281 = arith.constant 4 : i64
      %2282 = func.call @cc_make_string(%2280, %2281) : (!llvm.ptr, i64) -> i64
      %2283 = func.call @cc_nil_value() : () -> i64
      %2284 = func.call @cc_intern(%2282, %2283) : (i64, i64) -> i64
      %2285 = func.call @cc_nil_value() : () -> i64
      %2286 = func.call @cc_cons(%2284, %2285) : (i64, i64) -> i64
      %2287 = func.call @cc_values_pack(%2286) : (i64) -> i64
      func.call @stack_push_pointer(%2284) : (i64) -> ()
      %2288 = llvm.mlir.addressof @str204 : !llvm.ptr
      %2289 = arith.constant 3 : i64
      %2290 = func.call @cc_make_string(%2288, %2289) : (!llvm.ptr, i64) -> i64
      %2291 = func.call @cc_nil_value() : () -> i64
      %2292 = func.call @cc_intern(%2290, %2291) : (i64, i64) -> i64
      %2293 = func.call @cc_nil_value() : () -> i64
      %2294 = func.call @cc_cons(%2292, %2293) : (i64, i64) -> i64
      %2295 = func.call @cc_values_pack(%2294) : (i64) -> i64
      func.call @stack_push_pointer(%2292) : (i64) -> ()
      %2296 = llvm.mlir.addressof @str205 : !llvm.ptr
      %2297 = arith.constant 4 : i64
      %2298 = func.call @cc_make_string(%2296, %2297) : (!llvm.ptr, i64) -> i64
      %2299 = func.call @cc_nil_value() : () -> i64
      %2300 = func.call @cc_intern(%2298, %2299) : (i64, i64) -> i64
      %2301 = func.call @cc_nil_value() : () -> i64
      %2302 = func.call @cc_cons(%2300, %2301) : (i64, i64) -> i64
      %2303 = func.call @cc_values_pack(%2302) : (i64) -> i64
      func.call @stack_push_pointer(%2300) : (i64) -> ()
      %2304 = llvm.mlir.addressof @str206 : !llvm.ptr
      %2305 = arith.constant 2 : i64
      %2306 = func.call @cc_make_string(%2304, %2305) : (!llvm.ptr, i64) -> i64
      %2307 = func.call @cc_nil_value() : () -> i64
      %2308 = func.call @cc_intern(%2306, %2307) : (i64, i64) -> i64
      %2309 = func.call @cc_nil_value() : () -> i64
      %2310 = func.call @cc_cons(%2308, %2309) : (i64, i64) -> i64
      %2311 = func.call @cc_values_pack(%2310) : (i64) -> i64
      func.call @stack_push_pointer(%2308) : (i64) -> ()
      %2312 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2312) : (i64) -> ()
      %2313 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2313) : (i64) -> ()
      %2314 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2314) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2315 = func.call @stack_pop_pointer() : () -> i64
      %2316 = func.call @stack_pop_pointer() : () -> i64
      %2317 = func.call @cc_cons(%2316, %2315) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2317) : (i64) -> ()
      %2318 = func.call @stack_pop_pointer() : () -> i64
      %2319 = func.call @stack_pop_pointer() : () -> i64
      %2320 = func.call @cc_cons(%2319, %2318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2320) : (i64) -> ()
      %2321 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2321) : (i64) -> ()
      %2322 = llvm.mlir.addressof @str207 : !llvm.ptr
      %2323 = arith.constant 1 : i64
      %2324 = func.call @cc_parse_bignum(%2322, %2323) : (!llvm.ptr, i64) -> i64
      %2325 = llvm.mlir.addressof @str208 : !llvm.ptr
      %2326 = arith.constant 1 : i64
      %2327 = func.call @cc_parse_bignum(%2325, %2326) : (!llvm.ptr, i64) -> i64
      %2328 = func.call @cc_ratio(%2324, %2327) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2328) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2329 = func.call @stack_pop_pointer() : () -> i64
      %2330 = func.call @stack_pop_pointer() : () -> i64
      %2331 = func.call @cc_cons(%2330, %2329) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2331) : (i64) -> ()
      %2332 = func.call @stack_pop_pointer() : () -> i64
      %2333 = func.call @stack_pop_pointer() : () -> i64
      %2334 = func.call @cc_cons(%2333, %2332) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2334) : (i64) -> ()
      %2335 = llvm.mlir.addressof @str209 : !llvm.ptr
      %2336 = arith.constant 2 : i64
      %2337 = func.call @cc_parse_bignum(%2335, %2336) : (!llvm.ptr, i64) -> i64
      %2338 = llvm.mlir.addressof @str210 : !llvm.ptr
      %2339 = arith.constant 2 : i64
      %2340 = func.call @cc_parse_bignum(%2338, %2339) : (!llvm.ptr, i64) -> i64
      %2341 = func.call @cc_ratio(%2337, %2340) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2341) : (i64) -> ()
      %2342 = arith.constant 2 : i64
      func.call @stack_push_fixnum(%2342) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2343 = func.call @stack_pop_pointer() : () -> i64
      %2344 = func.call @stack_pop_pointer() : () -> i64
      %2345 = func.call @cc_cons(%2344, %2343) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2345) : (i64) -> ()
      %2346 = func.call @stack_pop_pointer() : () -> i64
      %2347 = func.call @stack_pop_pointer() : () -> i64
      %2348 = func.call @cc_cons(%2347, %2346) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2348) : (i64) -> ()
      %2349 = arith.constant 3.0 : f64
      %2350 = func.call @cc_box_single_float(%2349) : (f64) -> i64
      func.call @stack_push_pointer(%2350) : (i64) -> ()
      %2351 = arith.constant 2 : i64
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
      %2358 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%2358) : (i64) -> ()
      %2359 = arith.constant 2.0 : f64
      %2360 = func.call @cc_box_single_float(%2359) : (f64) -> i64
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
      %2367 = arith.constant 3.0 : f64
      %2368 = func.call @cc_box_single_float(%2367) : (f64) -> i64
      func.call @stack_push_pointer(%2368) : (i64) -> ()
      %2369 = llvm.mlir.addressof @str211 : !llvm.ptr
      %2370 = arith.constant 1 : i64
      %2371 = func.call @cc_parse_bignum(%2369, %2370) : (!llvm.ptr, i64) -> i64
      %2372 = llvm.mlir.addressof @str212 : !llvm.ptr
      %2373 = arith.constant 1 : i64
      %2374 = func.call @cc_parse_bignum(%2372, %2373) : (!llvm.ptr, i64) -> i64
      %2375 = func.call @cc_ratio(%2371, %2374) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2375) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2376 = func.call @stack_pop_pointer() : () -> i64
      %2377 = func.call @stack_pop_pointer() : () -> i64
      %2378 = func.call @cc_cons(%2377, %2376) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2378) : (i64) -> ()
      %2379 = func.call @stack_pop_pointer() : () -> i64
      %2380 = func.call @stack_pop_pointer() : () -> i64
      %2381 = func.call @cc_cons(%2380, %2379) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2381) : (i64) -> ()
      %2382 = llvm.mlir.addressof @str213 : !llvm.ptr
      %2383 = arith.constant 2 : i64
      %2384 = func.call @cc_parse_bignum(%2382, %2383) : (!llvm.ptr, i64) -> i64
      %2385 = llvm.mlir.addressof @str214 : !llvm.ptr
      %2386 = arith.constant 2 : i64
      %2387 = func.call @cc_parse_bignum(%2385, %2386) : (!llvm.ptr, i64) -> i64
      %2388 = func.call @cc_ratio(%2384, %2387) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2388) : (i64) -> ()
      %2389 = arith.constant 2.0 : f64
      %2390 = func.call @cc_box_single_float(%2389) : (f64) -> i64
      func.call @stack_push_pointer(%2390) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2391 = func.call @stack_pop_pointer() : () -> i64
      %2392 = func.call @stack_pop_pointer() : () -> i64
      %2393 = func.call @cc_cons(%2392, %2391) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2393) : (i64) -> ()
      %2394 = func.call @stack_pop_pointer() : () -> i64
      %2395 = func.call @stack_pop_pointer() : () -> i64
      %2396 = func.call @cc_cons(%2395, %2394) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2396) : (i64) -> ()
      %2397 = arith.constant 3.0 : f64
      %2398 = func.call @cc_box_single_float(%2397) : (f64) -> i64
      func.call @stack_push_pointer(%2398) : (i64) -> ()
      %2399 = arith.constant 2.0 : f64
      %2400 = func.call @cc_box_float(%2399) : (f64) -> i64
      func.call @stack_push_pointer(%2400) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2401 = func.call @stack_pop_pointer() : () -> i64
      %2402 = func.call @stack_pop_pointer() : () -> i64
      %2403 = func.call @cc_cons(%2402, %2401) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2403) : (i64) -> ()
      %2404 = func.call @stack_pop_pointer() : () -> i64
      %2405 = func.call @stack_pop_pointer() : () -> i64
      %2406 = func.call @cc_cons(%2405, %2404) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2406) : (i64) -> ()
      %2407 = arith.constant 3.0 : f64
      %2408 = func.call @cc_box_float(%2407) : (f64) -> i64
      func.call @stack_push_pointer(%2408) : (i64) -> ()
      %2409 = arith.constant 2.0 : f64
      %2410 = func.call @cc_box_single_float(%2409) : (f64) -> i64
      func.call @stack_push_pointer(%2410) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2411 = func.call @stack_pop_pointer() : () -> i64
      %2412 = func.call @stack_pop_pointer() : () -> i64
      %2413 = func.call @cc_cons(%2412, %2411) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2413) : (i64) -> ()
      %2414 = func.call @stack_pop_pointer() : () -> i64
      %2415 = func.call @stack_pop_pointer() : () -> i64
      %2416 = func.call @cc_cons(%2415, %2414) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2416) : (i64) -> ()
      %2417 = arith.constant 3.0 : f64
      %2418 = func.call @cc_box_float(%2417) : (f64) -> i64
      func.call @stack_push_pointer(%2418) : (i64) -> ()
      %2419 = arith.constant 2.0 : f64
      %2420 = func.call @cc_box_float(%2419) : (f64) -> i64
      func.call @stack_push_pointer(%2420) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2421 = func.call @stack_pop_pointer() : () -> i64
      %2422 = func.call @stack_pop_pointer() : () -> i64
      %2423 = func.call @cc_cons(%2422, %2421) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2423) : (i64) -> ()
      %2424 = func.call @stack_pop_pointer() : () -> i64
      %2425 = func.call @stack_pop_pointer() : () -> i64
      %2426 = func.call @cc_cons(%2425, %2424) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2426) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2427 = func.call @stack_pop_pointer() : () -> i64
      %2428 = func.call @stack_pop_pointer() : () -> i64
      %2429 = func.call @cc_cons(%2428, %2427) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2429) : (i64) -> ()
      %2430 = func.call @stack_pop_pointer() : () -> i64
      %2431 = func.call @stack_pop_pointer() : () -> i64
      %2432 = func.call @cc_cons(%2431, %2430) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2432) : (i64) -> ()
      %2433 = func.call @stack_pop_pointer() : () -> i64
      %2434 = func.call @stack_pop_pointer() : () -> i64
      %2435 = func.call @cc_cons(%2434, %2433) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2435) : (i64) -> ()
      %2436 = func.call @stack_pop_pointer() : () -> i64
      %2437 = func.call @stack_pop_pointer() : () -> i64
      %2438 = func.call @cc_cons(%2437, %2436) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2438) : (i64) -> ()
      %2439 = func.call @stack_pop_pointer() : () -> i64
      %2440 = func.call @stack_pop_pointer() : () -> i64
      %2441 = func.call @cc_cons(%2440, %2439) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2441) : (i64) -> ()
      %2442 = func.call @stack_pop_pointer() : () -> i64
      %2443 = func.call @stack_pop_pointer() : () -> i64
      %2444 = func.call @cc_cons(%2443, %2442) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2444) : (i64) -> ()
      %2445 = func.call @stack_pop_pointer() : () -> i64
      %2446 = func.call @stack_pop_pointer() : () -> i64
      %2447 = func.call @cc_cons(%2446, %2445) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2447) : (i64) -> ()
      %2448 = func.call @stack_pop_pointer() : () -> i64
      %2449 = func.call @stack_pop_pointer() : () -> i64
      %2450 = func.call @cc_cons(%2449, %2448) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2450) : (i64) -> ()
      %2451 = func.call @stack_pop_pointer() : () -> i64
      %2452 = func.call @stack_pop_pointer() : () -> i64
      %2453 = func.call @cc_cons(%2452, %2451) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2453) : (i64) -> ()
      %2454 = func.call @stack_pop_pointer() : () -> i64
      %2455 = func.call @stack_pop_pointer() : () -> i64
      %2456 = func.call @cc_cons(%2455, %2454) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2456) : (i64) -> ()
      %2457 = func.call @stack_pop_pointer() : () -> i64
      %2458 = func.call @stack_pop_pointer() : () -> i64
      %2459 = func.call @cc_cons(%2457, %2458) : (i64, i64) -> i64
      %2460 = llvm.mlir.addressof @str215 : !llvm.ptr
      %2461 = arith.constant 5 : i64
      %2462 = func.call @cc_make_string(%2460, %2461) : (!llvm.ptr, i64) -> i64
      %2463 = func.call @cc_nil_value() : () -> i64
      %2464 = func.call @cc_intern(%2462, %2463) : (i64, i64) -> i64
      %2465 = func.call @cc_nil_value() : () -> i64
      %2466 = func.call @cc_cons(%2464, %2465) : (i64, i64) -> i64
      %2467 = func.call @cc_values_pack(%2466) : (i64) -> i64
      %2468 = func.call @cc_cons(%2464, %2459) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2468) : (i64) -> ()
      %2469 = llvm.mlir.addressof @str216 : !llvm.ptr
      %2470 = arith.constant 3 : i64
      %2471 = func.call @cc_make_string(%2469, %2470) : (!llvm.ptr, i64) -> i64
      %2472 = func.call @cc_nil_value() : () -> i64
      %2473 = func.call @cc_intern(%2471, %2472) : (i64, i64) -> i64
      %2474 = func.call @cc_nil_value() : () -> i64
      %2475 = func.call @cc_cons(%2473, %2474) : (i64, i64) -> i64
      %2476 = func.call @cc_values_pack(%2475) : (i64) -> i64
      func.call @stack_push_pointer(%2473) : (i64) -> ()
      %2477 = llvm.mlir.addressof @str217 : !llvm.ptr
      %2478 = arith.constant 5 : i64
      %2479 = func.call @cc_make_string(%2477, %2478) : (!llvm.ptr, i64) -> i64
      %2480 = func.call @cc_nil_value() : () -> i64
      %2481 = func.call @cc_intern(%2479, %2480) : (i64, i64) -> i64
      %2482 = func.call @cc_nil_value() : () -> i64
      %2483 = func.call @cc_cons(%2481, %2482) : (i64, i64) -> i64
      %2484 = func.call @cc_values_pack(%2483) : (i64) -> i64
      func.call @stack_push_pointer(%2481) : (i64) -> ()
      %2485 = llvm.mlir.addressof @str218 : !llvm.ptr
      %2486 = arith.constant 2 : i64
      %2487 = func.call @cc_make_string(%2485, %2486) : (!llvm.ptr, i64) -> i64
      %2488 = func.call @cc_nil_value() : () -> i64
      %2489 = func.call @cc_intern(%2487, %2488) : (i64, i64) -> i64
      %2490 = func.call @cc_nil_value() : () -> i64
      %2491 = func.call @cc_cons(%2489, %2490) : (i64, i64) -> i64
      %2492 = func.call @cc_values_pack(%2491) : (i64) -> i64
      func.call @stack_push_pointer(%2489) : (i64) -> ()
      %2493 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%2493) : (i64) -> ()
      %2494 = llvm.mlir.addressof @str219 : !llvm.ptr
      %2495 = arith.constant 12 : i64
      %2496 = func.call @cc_make_string(%2494, %2495) : (!llvm.ptr, i64) -> i64
      %2497 = llvm.mlir.addressof @str220 : !llvm.ptr
      %2498 = arith.constant 11 : i64
      %2499 = func.call @cc_make_string(%2497, %2498) : (!llvm.ptr, i64) -> i64
      %2500 = func.call @cc_intern(%2496, %2499) : (i64, i64) -> i64
      %2501 = func.call @cc_nil_value() : () -> i64
      %2502 = func.call @cc_cons(%2500, %2501) : (i64, i64) -> i64
      %2503 = func.call @cc_values_pack(%2502) : (i64) -> i64
      func.call @stack_push_pointer(%2500) : (i64) -> ()
      %2504 = llvm.mlir.addressof @str221 : !llvm.ptr
      %2505 = arith.constant 12 : i64
      %2506 = func.call @cc_make_string(%2504, %2505) : (!llvm.ptr, i64) -> i64
      %2507 = llvm.mlir.addressof @str222 : !llvm.ptr
      %2508 = arith.constant 11 : i64
      %2509 = func.call @cc_make_string(%2507, %2508) : (!llvm.ptr, i64) -> i64
      %2510 = func.call @cc_intern(%2506, %2509) : (i64, i64) -> i64
      %2511 = func.call @cc_nil_value() : () -> i64
      %2512 = func.call @cc_cons(%2510, %2511) : (i64, i64) -> i64
      %2513 = func.call @cc_values_pack(%2512) : (i64) -> i64
      func.call @stack_push_pointer(%2510) : (i64) -> ()
      %2514 = llvm.mlir.addressof @str223 : !llvm.ptr
      %2515 = arith.constant 12 : i64
      %2516 = func.call @cc_make_string(%2514, %2515) : (!llvm.ptr, i64) -> i64
      %2517 = llvm.mlir.addressof @str224 : !llvm.ptr
      %2518 = arith.constant 11 : i64
      %2519 = func.call @cc_make_string(%2517, %2518) : (!llvm.ptr, i64) -> i64
      %2520 = func.call @cc_intern(%2516, %2519) : (i64, i64) -> i64
      %2521 = func.call @cc_nil_value() : () -> i64
      %2522 = func.call @cc_cons(%2520, %2521) : (i64, i64) -> i64
      %2523 = func.call @cc_values_pack(%2522) : (i64) -> i64
      func.call @stack_push_pointer(%2520) : (i64) -> ()
      %2524 = llvm.mlir.addressof @str225 : !llvm.ptr
      %2525 = arith.constant 12 : i64
      %2526 = func.call @cc_make_string(%2524, %2525) : (!llvm.ptr, i64) -> i64
      %2527 = llvm.mlir.addressof @str226 : !llvm.ptr
      %2528 = arith.constant 11 : i64
      %2529 = func.call @cc_make_string(%2527, %2528) : (!llvm.ptr, i64) -> i64
      %2530 = func.call @cc_intern(%2526, %2529) : (i64, i64) -> i64
      %2531 = func.call @cc_nil_value() : () -> i64
      %2532 = func.call @cc_cons(%2530, %2531) : (i64, i64) -> i64
      %2533 = func.call @cc_values_pack(%2532) : (i64) -> i64
      func.call @stack_push_pointer(%2530) : (i64) -> ()
      %2534 = llvm.mlir.addressof @str227 : !llvm.ptr
      %2535 = arith.constant 12 : i64
      %2536 = func.call @cc_make_string(%2534, %2535) : (!llvm.ptr, i64) -> i64
      %2537 = llvm.mlir.addressof @str228 : !llvm.ptr
      %2538 = arith.constant 11 : i64
      %2539 = func.call @cc_make_string(%2537, %2538) : (!llvm.ptr, i64) -> i64
      %2540 = func.call @cc_intern(%2536, %2539) : (i64, i64) -> i64
      %2541 = func.call @cc_nil_value() : () -> i64
      %2542 = func.call @cc_cons(%2540, %2541) : (i64, i64) -> i64
      %2543 = func.call @cc_values_pack(%2542) : (i64) -> i64
      func.call @stack_push_pointer(%2540) : (i64) -> ()
      %2544 = llvm.mlir.addressof @str229 : !llvm.ptr
      %2545 = arith.constant 12 : i64
      %2546 = func.call @cc_make_string(%2544, %2545) : (!llvm.ptr, i64) -> i64
      %2547 = llvm.mlir.addressof @str230 : !llvm.ptr
      %2548 = arith.constant 11 : i64
      %2549 = func.call @cc_make_string(%2547, %2548) : (!llvm.ptr, i64) -> i64
      %2550 = func.call @cc_intern(%2546, %2549) : (i64, i64) -> i64
      %2551 = func.call @cc_nil_value() : () -> i64
      %2552 = func.call @cc_cons(%2550, %2551) : (i64, i64) -> i64
      %2553 = func.call @cc_values_pack(%2552) : (i64) -> i64
      func.call @stack_push_pointer(%2550) : (i64) -> ()
      %2554 = llvm.mlir.addressof @str231 : !llvm.ptr
      %2555 = arith.constant 12 : i64
      %2556 = func.call @cc_make_string(%2554, %2555) : (!llvm.ptr, i64) -> i64
      %2557 = llvm.mlir.addressof @str232 : !llvm.ptr
      %2558 = arith.constant 11 : i64
      %2559 = func.call @cc_make_string(%2557, %2558) : (!llvm.ptr, i64) -> i64
      %2560 = func.call @cc_intern(%2556, %2559) : (i64, i64) -> i64
      %2561 = func.call @cc_nil_value() : () -> i64
      %2562 = func.call @cc_cons(%2560, %2561) : (i64, i64) -> i64
      %2563 = func.call @cc_values_pack(%2562) : (i64) -> i64
      func.call @stack_push_pointer(%2560) : (i64) -> ()
      %2564 = llvm.mlir.addressof @str233 : !llvm.ptr
      %2565 = arith.constant 12 : i64
      %2566 = func.call @cc_make_string(%2564, %2565) : (!llvm.ptr, i64) -> i64
      %2567 = llvm.mlir.addressof @str234 : !llvm.ptr
      %2568 = arith.constant 11 : i64
      %2569 = func.call @cc_make_string(%2567, %2568) : (!llvm.ptr, i64) -> i64
      %2570 = func.call @cc_intern(%2566, %2569) : (i64, i64) -> i64
      %2571 = func.call @cc_nil_value() : () -> i64
      %2572 = func.call @cc_cons(%2570, %2571) : (i64, i64) -> i64
      %2573 = func.call @cc_values_pack(%2572) : (i64) -> i64
      func.call @stack_push_pointer(%2570) : (i64) -> ()
      %2574 = llvm.mlir.addressof @str235 : !llvm.ptr
      %2575 = arith.constant 12 : i64
      %2576 = func.call @cc_make_string(%2574, %2575) : (!llvm.ptr, i64) -> i64
      %2577 = llvm.mlir.addressof @str236 : !llvm.ptr
      %2578 = arith.constant 11 : i64
      %2579 = func.call @cc_make_string(%2577, %2578) : (!llvm.ptr, i64) -> i64
      %2580 = func.call @cc_intern(%2576, %2579) : (i64, i64) -> i64
      %2581 = func.call @cc_nil_value() : () -> i64
      %2582 = func.call @cc_cons(%2580, %2581) : (i64, i64) -> i64
      %2583 = func.call @cc_values_pack(%2582) : (i64) -> i64
      func.call @stack_push_pointer(%2580) : (i64) -> ()
      %2584 = llvm.mlir.addressof @str237 : !llvm.ptr
      %2585 = arith.constant 12 : i64
      %2586 = func.call @cc_make_string(%2584, %2585) : (!llvm.ptr, i64) -> i64
      %2587 = llvm.mlir.addressof @str238 : !llvm.ptr
      %2588 = arith.constant 11 : i64
      %2589 = func.call @cc_make_string(%2587, %2588) : (!llvm.ptr, i64) -> i64
      %2590 = func.call @cc_intern(%2586, %2589) : (i64, i64) -> i64
      %2591 = func.call @cc_nil_value() : () -> i64
      %2592 = func.call @cc_cons(%2590, %2591) : (i64, i64) -> i64
      %2593 = func.call @cc_values_pack(%2592) : (i64) -> i64
      func.call @stack_push_pointer(%2590) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2594 = func.call @stack_pop_pointer() : () -> i64
      %2595 = func.call @stack_pop_pointer() : () -> i64
      %2596 = func.call @cc_cons(%2595, %2594) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2596) : (i64) -> ()
      %2597 = func.call @stack_pop_pointer() : () -> i64
      %2598 = func.call @stack_pop_pointer() : () -> i64
      %2599 = func.call @cc_cons(%2598, %2597) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2599) : (i64) -> ()
      %2600 = func.call @stack_pop_pointer() : () -> i64
      %2601 = func.call @stack_pop_pointer() : () -> i64
      %2602 = func.call @cc_cons(%2601, %2600) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2602) : (i64) -> ()
      %2603 = func.call @stack_pop_pointer() : () -> i64
      %2604 = func.call @stack_pop_pointer() : () -> i64
      %2605 = func.call @cc_cons(%2604, %2603) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2605) : (i64) -> ()
      %2606 = func.call @stack_pop_pointer() : () -> i64
      %2607 = func.call @stack_pop_pointer() : () -> i64
      %2608 = func.call @cc_cons(%2607, %2606) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2608) : (i64) -> ()
      %2609 = func.call @stack_pop_pointer() : () -> i64
      %2610 = func.call @stack_pop_pointer() : () -> i64
      %2611 = func.call @cc_cons(%2610, %2609) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2611) : (i64) -> ()
      %2612 = func.call @stack_pop_pointer() : () -> i64
      %2613 = func.call @stack_pop_pointer() : () -> i64
      %2614 = func.call @cc_cons(%2613, %2612) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2614) : (i64) -> ()
      %2615 = func.call @stack_pop_pointer() : () -> i64
      %2616 = func.call @stack_pop_pointer() : () -> i64
      %2617 = func.call @cc_cons(%2616, %2615) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2617) : (i64) -> ()
      %2618 = func.call @stack_pop_pointer() : () -> i64
      %2619 = func.call @stack_pop_pointer() : () -> i64
      %2620 = func.call @cc_cons(%2619, %2618) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2620) : (i64) -> ()
      %2621 = func.call @stack_pop_pointer() : () -> i64
      %2622 = func.call @stack_pop_pointer() : () -> i64
      %2623 = func.call @cc_cons(%2622, %2621) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2623) : (i64) -> ()
      %2624 = func.call @stack_pop_pointer() : () -> i64
      %2625 = func.call @stack_pop_pointer() : () -> i64
      %2626 = func.call @cc_cons(%2624, %2625) : (i64, i64) -> i64
      %2627 = llvm.mlir.addressof @str239 : !llvm.ptr
      %2628 = arith.constant 5 : i64
      %2629 = func.call @cc_make_string(%2627, %2628) : (!llvm.ptr, i64) -> i64
      %2630 = func.call @cc_nil_value() : () -> i64
      %2631 = func.call @cc_intern(%2629, %2630) : (i64, i64) -> i64
      %2632 = func.call @cc_nil_value() : () -> i64
      %2633 = func.call @cc_cons(%2631, %2632) : (i64, i64) -> i64
      %2634 = func.call @cc_values_pack(%2633) : (i64) -> i64
      %2635 = func.call @cc_cons(%2631, %2626) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2635) : (i64) -> ()
      %2636 = llvm.mlir.addressof @str240 : !llvm.ptr
      %2637 = arith.constant 6 : i64
      %2638 = func.call @cc_make_string(%2636, %2637) : (!llvm.ptr, i64) -> i64
      %2639 = llvm.mlir.addressof @str241 : !llvm.ptr
      %2640 = arith.constant 11 : i64
      %2641 = func.call @cc_make_string(%2639, %2640) : (!llvm.ptr, i64) -> i64
      %2642 = func.call @cc_intern(%2638, %2641) : (i64, i64) -> i64
      %2643 = func.call @cc_nil_value() : () -> i64
      %2644 = func.call @cc_cons(%2642, %2643) : (i64, i64) -> i64
      %2645 = func.call @cc_values_pack(%2644) : (i64) -> i64
      func.call @stack_push_pointer(%2642) : (i64) -> ()
      %2646 = llvm.mlir.addressof @str242 : !llvm.ptr
      %2647 = arith.constant 5 : i64
      %2648 = func.call @cc_make_string(%2646, %2647) : (!llvm.ptr, i64) -> i64
      %2649 = llvm.mlir.addressof @str243 : !llvm.ptr
      %2650 = arith.constant 11 : i64
      %2651 = func.call @cc_make_string(%2649, %2650) : (!llvm.ptr, i64) -> i64
      %2652 = func.call @cc_intern(%2648, %2651) : (i64, i64) -> i64
      %2653 = func.call @cc_nil_value() : () -> i64
      %2654 = func.call @cc_cons(%2652, %2653) : (i64, i64) -> i64
      %2655 = func.call @cc_values_pack(%2654) : (i64) -> i64
      func.call @stack_push_pointer(%2652) : (i64) -> ()
      %2656 = llvm.mlir.addressof @str244 : !llvm.ptr
      %2657 = arith.constant 5 : i64
      %2658 = func.call @cc_make_string(%2656, %2657) : (!llvm.ptr, i64) -> i64
      %2659 = llvm.mlir.addressof @str245 : !llvm.ptr
      %2660 = arith.constant 11 : i64
      %2661 = func.call @cc_make_string(%2659, %2660) : (!llvm.ptr, i64) -> i64
      %2662 = func.call @cc_intern(%2658, %2661) : (i64, i64) -> i64
      %2663 = func.call @cc_nil_value() : () -> i64
      %2664 = func.call @cc_cons(%2662, %2663) : (i64, i64) -> i64
      %2665 = func.call @cc_values_pack(%2664) : (i64) -> i64
      func.call @stack_push_pointer(%2662) : (i64) -> ()
      %2666 = llvm.mlir.addressof @str246 : !llvm.ptr
      %2667 = arith.constant 3 : i64
      %2668 = func.call @cc_make_string(%2666, %2667) : (!llvm.ptr, i64) -> i64
      %2669 = func.call @cc_nil_value() : () -> i64
      %2670 = func.call @cc_intern(%2668, %2669) : (i64, i64) -> i64
      %2671 = func.call @cc_nil_value() : () -> i64
      %2672 = func.call @cc_cons(%2670, %2671) : (i64, i64) -> i64
      %2673 = func.call @cc_values_pack(%2672) : (i64) -> i64
      func.call @stack_push_pointer(%2670) : (i64) -> ()
      %2674 = llvm.mlir.addressof @str247 : !llvm.ptr
      %2675 = arith.constant 4 : i64
      %2676 = func.call @cc_make_string(%2674, %2675) : (!llvm.ptr, i64) -> i64
      %2677 = func.call @cc_nil_value() : () -> i64
      %2678 = func.call @cc_intern(%2676, %2677) : (i64, i64) -> i64
      %2679 = func.call @cc_nil_value() : () -> i64
      %2680 = func.call @cc_cons(%2678, %2679) : (i64, i64) -> i64
      %2681 = func.call @cc_values_pack(%2680) : (i64) -> i64
      func.call @stack_push_pointer(%2678) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2682 = func.call @stack_pop_pointer() : () -> i64
      %2683 = func.call @stack_pop_pointer() : () -> i64
      %2684 = func.call @cc_cons(%2683, %2682) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2684) : (i64) -> ()
      %2685 = func.call @stack_pop_pointer() : () -> i64
      %2686 = func.call @stack_pop_pointer() : () -> i64
      %2687 = func.call @cc_cons(%2686, %2685) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2687) : (i64) -> ()
      %2688 = func.call @stack_pop_pointer() : () -> i64
      %2689 = func.call @stack_pop_pointer() : () -> i64
      %2690 = func.call @cc_cons(%2689, %2688) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2690) : (i64) -> ()
      %2691 = llvm.mlir.addressof @str248 : !llvm.ptr
      %2692 = arith.constant 5 : i64
      %2693 = func.call @cc_make_string(%2691, %2692) : (!llvm.ptr, i64) -> i64
      %2694 = func.call @cc_nil_value() : () -> i64
      %2695 = func.call @cc_intern(%2693, %2694) : (i64, i64) -> i64
      %2696 = func.call @cc_nil_value() : () -> i64
      %2697 = func.call @cc_cons(%2695, %2696) : (i64, i64) -> i64
      %2698 = func.call @cc_values_pack(%2697) : (i64) -> i64
      func.call @stack_push_pointer(%2695) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2699 = func.call @stack_pop_pointer() : () -> i64
      %2700 = func.call @stack_pop_pointer() : () -> i64
      %2701 = func.call @cc_cons(%2700, %2699) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2701) : (i64) -> ()
      %2702 = func.call @stack_pop_pointer() : () -> i64
      %2703 = func.call @stack_pop_pointer() : () -> i64
      %2704 = func.call @cc_cons(%2703, %2702) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2704) : (i64) -> ()
      %2705 = func.call @stack_pop_pointer() : () -> i64
      %2706 = func.call @stack_pop_pointer() : () -> i64
      %2707 = func.call @cc_cons(%2706, %2705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2707) : (i64) -> ()
      %2708 = llvm.mlir.addressof @str249 : !llvm.ptr
      %2709 = arith.constant 7 : i64
      %2710 = func.call @cc_make_string(%2708, %2709) : (!llvm.ptr, i64) -> i64
      %2711 = func.call @cc_nil_value() : () -> i64
      %2712 = func.call @cc_intern(%2710, %2711) : (i64, i64) -> i64
      %2713 = func.call @cc_nil_value() : () -> i64
      %2714 = func.call @cc_cons(%2712, %2713) : (i64, i64) -> i64
      %2715 = func.call @cc_values_pack(%2714) : (i64) -> i64
      func.call @stack_push_pointer(%2712) : (i64) -> ()
      %2716 = llvm.mlir.addressof @str250 : !llvm.ptr
      %2717 = arith.constant 4 : i64
      %2718 = func.call @cc_make_string(%2716, %2717) : (!llvm.ptr, i64) -> i64
      %2719 = llvm.mlir.addressof @str251 : !llvm.ptr
      %2720 = arith.constant 11 : i64
      %2721 = func.call @cc_make_string(%2719, %2720) : (!llvm.ptr, i64) -> i64
      %2722 = func.call @cc_intern(%2718, %2721) : (i64, i64) -> i64
      %2723 = func.call @cc_nil_value() : () -> i64
      %2724 = func.call @cc_cons(%2722, %2723) : (i64, i64) -> i64
      %2725 = func.call @cc_values_pack(%2724) : (i64) -> i64
      func.call @stack_push_pointer(%2722) : (i64) -> ()
      %2726 = llvm.mlir.addressof @str252 : !llvm.ptr
      %2727 = arith.constant 3 : i64
      %2728 = func.call @cc_make_string(%2726, %2727) : (!llvm.ptr, i64) -> i64
      %2729 = func.call @cc_nil_value() : () -> i64
      %2730 = func.call @cc_intern(%2728, %2729) : (i64, i64) -> i64
      %2731 = func.call @cc_nil_value() : () -> i64
      %2732 = func.call @cc_cons(%2730, %2731) : (i64, i64) -> i64
      %2733 = func.call @cc_values_pack(%2732) : (i64) -> i64
      func.call @stack_push_pointer(%2730) : (i64) -> ()
      %2734 = llvm.mlir.addressof @str253 : !llvm.ptr
      %2735 = arith.constant 4 : i64
      %2736 = func.call @cc_make_string(%2734, %2735) : (!llvm.ptr, i64) -> i64
      %2737 = func.call @cc_nil_value() : () -> i64
      %2738 = func.call @cc_intern(%2736, %2737) : (i64, i64) -> i64
      %2739 = func.call @cc_nil_value() : () -> i64
      %2740 = func.call @cc_cons(%2738, %2739) : (i64, i64) -> i64
      %2741 = func.call @cc_values_pack(%2740) : (i64) -> i64
      func.call @stack_push_pointer(%2738) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2742 = func.call @stack_pop_pointer() : () -> i64
      %2743 = func.call @stack_pop_pointer() : () -> i64
      %2744 = func.call @cc_cons(%2743, %2742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2744) : (i64) -> ()
      %2745 = func.call @stack_pop_pointer() : () -> i64
      %2746 = func.call @stack_pop_pointer() : () -> i64
      %2747 = func.call @cc_cons(%2746, %2745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2747) : (i64) -> ()
      %2748 = func.call @stack_pop_pointer() : () -> i64
      %2749 = func.call @stack_pop_pointer() : () -> i64
      %2750 = func.call @cc_cons(%2749, %2748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2750) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2751 = func.call @stack_pop_pointer() : () -> i64
      %2752 = func.call @stack_pop_pointer() : () -> i64
      %2753 = func.call @cc_cons(%2752, %2751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2753) : (i64) -> ()
      %2754 = func.call @stack_pop_pointer() : () -> i64
      %2755 = func.call @stack_pop_pointer() : () -> i64
      %2756 = func.call @cc_cons(%2755, %2754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2756) : (i64) -> ()
      %2757 = func.call @stack_pop_pointer() : () -> i64
      %2758 = func.call @stack_pop_pointer() : () -> i64
      %2759 = func.call @cc_cons(%2758, %2757) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2759) : (i64) -> ()
      %2760 = func.call @stack_pop_pointer() : () -> i64
      %2761 = func.call @stack_pop_pointer() : () -> i64
      %2762 = func.call @cc_cons(%2761, %2760) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2762) : (i64) -> ()
      %2763 = func.call @stack_pop_pointer() : () -> i64
      %2764 = func.call @stack_pop_pointer() : () -> i64
      %2765 = func.call @cc_cons(%2764, %2763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2765) : (i64) -> ()
      %2766 = func.call @stack_pop_pointer() : () -> i64
      %2767 = func.call @stack_pop_pointer() : () -> i64
      %2768 = func.call @cc_cons(%2767, %2766) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2768) : (i64) -> ()
      %2769 = func.call @stack_pop_pointer() : () -> i64
      %2770 = func.call @stack_pop_pointer() : () -> i64
      %2771 = func.call @cc_cons(%2770, %2769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2771) : (i64) -> ()
      %2772 = func.call @stack_pop_pointer() : () -> i64
      %2773 = func.call @stack_pop_pointer() : () -> i64
      %2774 = func.call @cc_cons(%2773, %2772) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2774) : (i64) -> ()
      %2775 = func.call @stack_pop_pointer() : () -> i64
      %2776 = func.call @stack_pop_pointer() : () -> i64
      %2777 = func.call @cc_cons(%2776, %2775) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2777) : (i64) -> ()
      %2778 = func.call @stack_pop_pointer() : () -> i64
      %2779 = func.call @stack_pop_pointer() : () -> i64
      %2780 = func.call @cc_cons(%2779, %2778) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2780) : (i64) -> ()
      %2781 = func.call @stack_pop_pointer() : () -> i64
      %2782 = func.call @stack_pop_pointer() : () -> i64
      %2783 = func.call @cc_cons(%2782, %2781) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2783) : (i64) -> ()
      %2784 = func.call @stack_pop_pointer() : () -> i64
      %2785 = func.call @stack_pop_pointer() : () -> i64
      %2786 = func.call @cc_cons(%2785, %2784) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2786) : (i64) -> ()
      %2787 = func.call @stack_pop_pointer() : () -> i64
      %2788 = func.call @stack_pop_pointer() : () -> i64
      %2789 = func.call @cc_cons(%2788, %2787) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2789) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2790 = func.call @stack_pop_pointer() : () -> i64
      %2791 = func.call @stack_pop_pointer() : () -> i64
      %2792 = func.call @cc_cons(%2791, %2790) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2792) : (i64) -> ()
      %2793 = func.call @stack_pop_pointer() : () -> i64
      %2794 = func.call @stack_pop_pointer() : () -> i64
      %2795 = func.call @cc_cons(%2794, %2793) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2795) : (i64) -> ()
      %2796 = func.call @stack_pop_pointer() : () -> i64
      %2797 = func.call @stack_pop_pointer() : () -> i64
      %2798 = func.call @cc_cons(%2797, %2796) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2798) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2799 = func.call @stack_pop_pointer() : () -> i64
      %2800 = func.call @stack_pop_pointer() : () -> i64
      %2801 = func.call @cc_cons(%2800, %2799) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2801) : (i64) -> ()
      %2802 = func.call @stack_pop_pointer() : () -> i64
      %2803 = func.call @stack_pop_pointer() : () -> i64
      %2804 = func.call @cc_cons(%2803, %2802) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2804) : (i64) -> ()
      %2805 = func.call @stack_pop_pointer() : () -> i64
      %2806 = func.call @stack_pop_pointer() : () -> i64
      %2807 = func.call @cc_cons(%2806, %2805) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2807) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2808 = func.call @stack_pop_pointer() : () -> i64
      %2809 = func.call @stack_pop_pointer() : () -> i64
      %2810 = func.call @cc_cons(%2809, %2808) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2810) : (i64) -> ()
      %2811 = func.call @stack_pop_pointer() : () -> i64
      %2812 = func.call @stack_pop_pointer() : () -> i64
      %2813 = func.call @cc_cons(%2812, %2811) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2813) : (i64) -> ()
      %2814 = func.call @stack_pop_pointer() : () -> i64
      %2815 = func.call @stack_pop_pointer() : () -> i64
      %2816 = func.call @cc_cons(%2815, %2814) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2816) : (i64) -> ()
      %2817 = func.call @stack_pop_pointer() : () -> i64
      %2818 = func.call @stack_pop_pointer() : () -> i64
      %2819 = func.call @cc_cons(%2818, %2817) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2819) : (i64) -> ()
      %2820 = llvm.mlir.addressof @str254 : !llvm.ptr
      %2821 = arith.constant 4 : i64
      %2822 = func.call @cc_make_string(%2820, %2821) : (!llvm.ptr, i64) -> i64
      %2823 = func.call @cc_nil_value() : () -> i64
      %2824 = func.call @cc_intern(%2822, %2823) : (i64, i64) -> i64
      %2825 = func.call @cc_nil_value() : () -> i64
      %2826 = func.call @cc_cons(%2824, %2825) : (i64, i64) -> i64
      %2827 = func.call @cc_values_pack(%2826) : (i64) -> i64
      func.call @stack_push_pointer(%2824) : (i64) -> ()
      %2828 = llvm.mlir.addressof @str255 : !llvm.ptr
      %2829 = arith.constant 15 : i64
      %2830 = func.call @cc_make_string(%2828, %2829) : (!llvm.ptr, i64) -> i64
      %2831 = func.call @cc_nil_value() : () -> i64
      %2832 = func.call @cc_intern(%2830, %2831) : (i64, i64) -> i64
      %2833 = func.call @cc_nil_value() : () -> i64
      %2834 = func.call @cc_cons(%2832, %2833) : (i64, i64) -> i64
      %2835 = func.call @cc_values_pack(%2834) : (i64) -> i64
      func.call @stack_push_pointer(%2832) : (i64) -> ()
      %2836 = llvm.mlir.addressof @str256 : !llvm.ptr
      %2837 = arith.constant 3 : i64
      %2838 = func.call @cc_make_string(%2836, %2837) : (!llvm.ptr, i64) -> i64
      %2839 = func.call @cc_nil_value() : () -> i64
      %2840 = func.call @cc_intern(%2838, %2839) : (i64, i64) -> i64
      %2841 = func.call @cc_nil_value() : () -> i64
      %2842 = func.call @cc_cons(%2840, %2841) : (i64, i64) -> i64
      %2843 = func.call @cc_values_pack(%2842) : (i64) -> i64
      func.call @stack_push_pointer(%2840) : (i64) -> ()
      %2844 = llvm.mlir.addressof @str257 : !llvm.ptr
      %2845 = arith.constant 15 : i64
      %2846 = func.call @cc_make_string(%2844, %2845) : (!llvm.ptr, i64) -> i64
      %2847 = func.call @cc_nil_value() : () -> i64
      %2848 = func.call @cc_intern(%2846, %2847) : (i64, i64) -> i64
      %2849 = func.call @cc_nil_value() : () -> i64
      %2850 = func.call @cc_cons(%2848, %2849) : (i64, i64) -> i64
      %2851 = func.call @cc_values_pack(%2850) : (i64) -> i64
      func.call @stack_push_pointer(%2848) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2852 = func.call @stack_pop_pointer() : () -> i64
      %2853 = func.call @stack_pop_pointer() : () -> i64
      %2854 = func.call @cc_cons(%2853, %2852) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2854) : (i64) -> ()
      %2855 = func.call @stack_pop_pointer() : () -> i64
      %2856 = func.call @stack_pop_pointer() : () -> i64
      %2857 = func.call @cc_cons(%2856, %2855) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2857) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2858 = func.call @stack_pop_pointer() : () -> i64
      %2859 = func.call @stack_pop_pointer() : () -> i64
      %2860 = func.call @cc_cons(%2859, %2858) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2860) : (i64) -> ()
      %2861 = func.call @stack_pop_pointer() : () -> i64
      %2862 = func.call @stack_pop_pointer() : () -> i64
      %2863 = func.call @cc_cons(%2862, %2861) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2863) : (i64) -> ()
      %2864 = func.call @stack_pop_pointer() : () -> i64
      %2865 = func.call @stack_pop_pointer() : () -> i64
      %2866 = func.call @cc_cons(%2865, %2864) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2866) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2867 = func.call @stack_pop_pointer() : () -> i64
      %2868 = func.call @stack_pop_pointer() : () -> i64
      %2869 = func.call @cc_cons(%2868, %2867) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2869) : (i64) -> ()
      %2870 = func.call @stack_pop_pointer() : () -> i64
      %2871 = func.call @stack_pop_pointer() : () -> i64
      %2872 = func.call @cc_cons(%2871, %2870) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2872) : (i64) -> ()
      %2873 = func.call @stack_pop_pointer() : () -> i64
      %2874 = func.call @stack_pop_pointer() : () -> i64
      %2875 = func.call @cc_cons(%2874, %2873) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2875) : (i64) -> ()
      %2876 = func.call @stack_pop_pointer() : () -> i64
      %2877 = func.call @stack_pop_pointer() : () -> i64
      %2878 = func.call @cc_cons(%2877, %2876) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2878) : (i64) -> ()
      %2879 = llvm.mlir.addressof @str258 : !llvm.ptr
      %2880 = arith.constant 15 : i64
      %2881 = func.call @cc_make_string(%2879, %2880) : (!llvm.ptr, i64) -> i64
      %2882 = func.call @cc_nil_value() : () -> i64
      %2883 = func.call @cc_intern(%2881, %2882) : (i64, i64) -> i64
      %2884 = func.call @cc_nil_value() : () -> i64
      %2885 = func.call @cc_cons(%2883, %2884) : (i64, i64) -> i64
      %2886 = func.call @cc_values_pack(%2885) : (i64) -> i64
      func.call @stack_push_pointer(%2883) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2887 = func.call @stack_pop_pointer() : () -> i64
      %2888 = func.call @stack_pop_pointer() : () -> i64
      %2889 = func.call @cc_cons(%2888, %2887) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2889) : (i64) -> ()
      %2890 = func.call @stack_pop_pointer() : () -> i64
      %2891 = func.call @stack_pop_pointer() : () -> i64
      %2892 = func.call @cc_cons(%2891, %2890) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2892) : (i64) -> ()
      %2893 = func.call @stack_pop_pointer() : () -> i64
      %2894 = func.call @stack_pop_pointer() : () -> i64
      %2895 = func.call @cc_cons(%2894, %2893) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2895) : (i64) -> ()
      %2896 = func.call @stack_pop_pointer() : () -> i64
      %2897 = func.call @stack_pop_pointer() : () -> i64
      %2898 = func.call @cc_cons(%2897, %2896) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2898) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2899 = func.call @stack_pop_pointer() : () -> i64
      %2900 = func.call @stack_pop_pointer() : () -> i64
      %2901 = func.call @cc_cons(%2900, %2899) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2901) : (i64) -> ()
      %2902 = func.call @stack_pop_pointer() : () -> i64
      %2903 = func.call @stack_pop_pointer() : () -> i64
      %2904 = func.call @cc_cons(%2903, %2902) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2904) : (i64) -> ()
      %2905 = func.call @stack_pop_pointer() : () -> i64
      %2906 = func.call @stack_pop_pointer() : () -> i64
      %2907 = func.call @cc_cons(%2906, %2905) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2907) : (i64) -> ()
      %2908 = func.call @stack_pop_pointer() : () -> i64
      %3667 = arith.constant 211067594604547 : i64
      %3668 = arith.constant 0 : i64
      %3669 = func.call @cc_make_closure(%3667, %3668) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3669) : (i64) -> ()
      %3670 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      func.call @stack_push_nil() : () -> ()
      %3671 = func.call @stack_pop_pointer() : () -> i64
      %3672 = func.call @stack_pop_pointer() : () -> i64
      %3673 = func.call @cc_cons(%3672, %3671) : (i64, i64) -> i64
      func.call @stack_push_pointer(%3673) : (i64) -> ()
      %3674 = func.call @stack_pop_pointer() : () -> i64
      %3675 = llvm.mlir.addressof @str322 : !llvm.ptr
      %3676 = arith.constant 11 : i64
      %3677 = func.call @cc_make_string(%3675, %3676) : (!llvm.ptr, i64) -> i64
      %3678 = llvm.mlir.addressof @str323 : !llvm.ptr
      %3679 = arith.constant 7 : i64
      %3680 = func.call @cc_make_string(%3678, %3679) : (!llvm.ptr, i64) -> i64
      %3681 = func.call @cc_intern(%3677, %3680) : (i64, i64) -> i64
      %3682 = func.call @cc_nil_value() : () -> i64
      %3683 = func.call @cc_cons(%3681, %3682) : (i64, i64) -> i64
      %3684 = func.call @cc_values_pack(%3683) : (i64) -> i64
      func.call @stack_push_pointer(%3681) : (i64) -> ()
      %3685 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %3686 = func.call @stack_pop_pointer() : () -> i64
      %3687 = llvm.mlir.addressof @str324 : !llvm.ptr
      %3688 = arith.constant 4 : i64
      %3689 = func.call @cc_make_string(%3687, %3688) : (!llvm.ptr, i64) -> i64
      %3690 = llvm.mlir.addressof @str325 : !llvm.ptr
      %3691 = arith.constant 7 : i64
      %3692 = func.call @cc_make_string(%3690, %3691) : (!llvm.ptr, i64) -> i64
      %3693 = func.call @cc_intern(%3689, %3692) : (i64, i64) -> i64
      %3694 = func.call @cc_nil_value() : () -> i64
      %3695 = func.call @cc_cons(%3693, %3694) : (i64, i64) -> i64
      %3696 = func.call @cc_values_pack(%3695) : (i64) -> i64
      func.call @stack_push_pointer(%3693) : (i64) -> ()
      %3697 = func.call @stack_pop_pointer() : () -> i64
      %3698 = llvm.mlir.addressof @str326 : !llvm.ptr
      %3699 = arith.constant 6 : i64
      %3700 = func.call @cc_make_string(%3698, %3699) : (!llvm.ptr, i64) -> i64
      %3701 = func.call @cc_nil_value() : () -> i64
      %3702 = func.call @cc_intern(%3700, %3701) : (i64, i64) -> i64
      %3703 = func.call @cc_nil_value() : () -> i64
      %3704 = func.call @cc_cons(%3702, %3703) : (i64, i64) -> i64
      %3705 = func.call @cc_values_pack(%3704) : (i64) -> i64
      func.call @stack_push_pointer(%3702) : (i64) -> ()
      %3706 = func.call @stack_pop_pointer() : () -> i64
      %3707 = func.call @cc_nil_value() : () -> i64
      %3708 = func.call @cc_errorp(%1881) : (i64) -> i64
      %3709 = arith.cmpi ne, %3708, %3707 : i64
      %3710 = arith.cmpi eq, %3707, %3707 : i64
      %3711 = arith.andi %3709, %3710 : i1
      %3712 = scf.if %3711 -> (i64) {
        scf.yield %1881 : i64
      } else {
        scf.yield %3707 : i64
      }
      %3713 = func.call @cc_errorp(%2908) : (i64) -> i64
      %3714 = arith.cmpi ne, %3713, %3707 : i64
      %3715 = arith.cmpi eq, %3712, %3707 : i64
      %3716 = arith.andi %3714, %3715 : i1
      %3717 = scf.if %3716 -> (i64) {
        scf.yield %2908 : i64
      } else {
        scf.yield %3712 : i64
      }
      %3718 = func.call @cc_errorp(%3670) : (i64) -> i64
      %3719 = arith.cmpi ne, %3718, %3707 : i64
      %3720 = arith.cmpi eq, %3717, %3707 : i64
      %3721 = arith.andi %3719, %3720 : i1
      %3722 = scf.if %3721 -> (i64) {
        scf.yield %3670 : i64
      } else {
        scf.yield %3717 : i64
      }
      %3723 = func.call @cc_errorp(%3674) : (i64) -> i64
      %3724 = arith.cmpi ne, %3723, %3707 : i64
      %3725 = arith.cmpi eq, %3722, %3707 : i64
      %3726 = arith.andi %3724, %3725 : i1
      %3727 = scf.if %3726 -> (i64) {
        scf.yield %3674 : i64
      } else {
        scf.yield %3722 : i64
      }
      %3728 = func.call @cc_errorp(%3685) : (i64) -> i64
      %3729 = arith.cmpi ne, %3728, %3707 : i64
      %3730 = arith.cmpi eq, %3727, %3707 : i64
      %3731 = arith.andi %3729, %3730 : i1
      %3732 = scf.if %3731 -> (i64) {
        scf.yield %3685 : i64
      } else {
        scf.yield %3727 : i64
      }
      %3733 = func.call @cc_errorp(%3686) : (i64) -> i64
      %3734 = arith.cmpi ne, %3733, %3707 : i64
      %3735 = arith.cmpi eq, %3732, %3707 : i64
      %3736 = arith.andi %3734, %3735 : i1
      %3737 = scf.if %3736 -> (i64) {
        scf.yield %3686 : i64
      } else {
        scf.yield %3732 : i64
      }
      %3738 = func.call @cc_errorp(%3697) : (i64) -> i64
      %3739 = arith.cmpi ne, %3738, %3707 : i64
      %3740 = arith.cmpi eq, %3737, %3707 : i64
      %3741 = arith.andi %3739, %3740 : i1
      %3742 = scf.if %3741 -> (i64) {
        scf.yield %3697 : i64
      } else {
        scf.yield %3737 : i64
      }
      %3743 = func.call @cc_errorp(%3706) : (i64) -> i64
      %3744 = arith.cmpi ne, %3743, %3707 : i64
      %3745 = arith.cmpi eq, %3742, %3707 : i64
      %3746 = arith.andi %3744, %3745 : i1
      %3747 = scf.if %3746 -> (i64) {
        scf.yield %3706 : i64
      } else {
        scf.yield %3742 : i64
      }
      %3748 = arith.cmpi ne, %3747, %3707 : i64
      scf.if %3748 {
        func.call @stack_push_pointer(%3747) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1881) : (i64) -> ()
        func.call @stack_push_pointer(%2908) : (i64) -> ()
        func.call @stack_push_pointer(%3670) : (i64) -> ()
        func.call @stack_push_pointer(%3674) : (i64) -> ()
        func.call @stack_push_pointer(%3685) : (i64) -> ()
        func.call @stack_push_pointer(%3686) : (i64) -> ()
        func.call @stack_push_pointer(%3697) : (i64) -> ()
        func.call @stack_push_pointer(%3706) : (i64) -> ()
        %3749 = llvm.mlir.addressof @str327 : !llvm.ptr
        %3750 = func.call @cc_make_function_ref_const(%3749) : (!llvm.ptr) -> i64
        %3751 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%3750, %3751) : (i64, i64) -> ()
      }
      %3752 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3752 : i64
    }
    func.call @stack_push_pointer(%1872) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_211067594604544"() {
    %1052 = func.call @cc_nil_value() : () -> i64
    %1053 = func.call @cc_nil_value() : () -> i64
    %1054 = func.call @cc_errorp(%1052) : (i64) -> i64
    %1055 = arith.cmpi ne, %1054, %1053 : i64
    %1056 = scf.if %1055 -> (i64) {
      scf.yield %1052 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %1057 = func.call @stack_pop_pointer() : () -> i64
      %1058 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1059 = arith.constant 5 : i64
      %1060 = func.call @cc_make_string(%1058, %1059) : (!llvm.ptr, i64) -> i64
      %1061 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1062 = arith.constant 11 : i64
      %1063 = func.call @cc_make_string(%1061, %1062) : (!llvm.ptr, i64) -> i64
      %1064 = func.call @cc_intern(%1060, %1063) : (i64, i64) -> i64
      %1065 = func.call @cc_nil_value() : () -> i64
      %1066 = func.call @cc_cons(%1064, %1065) : (i64, i64) -> i64
      %1067 = func.call @cc_values_pack(%1066) : (i64) -> i64
      func.call @stack_push_pointer(%1064) : (i64) -> ()
      %1068 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1069 = arith.constant 7 : i64
      %1070 = func.call @cc_make_string(%1068, %1069) : (!llvm.ptr, i64) -> i64
      %1071 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1072 = arith.constant 11 : i64
      %1073 = func.call @cc_make_string(%1071, %1072) : (!llvm.ptr, i64) -> i64
      %1074 = func.call @cc_intern(%1070, %1073) : (i64, i64) -> i64
      %1075 = func.call @cc_nil_value() : () -> i64
      %1076 = func.call @cc_cons(%1074, %1075) : (i64, i64) -> i64
      %1077 = func.call @cc_values_pack(%1076) : (i64) -> i64
      func.call @stack_push_pointer(%1074) : (i64) -> ()
      %1078 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1079 = arith.constant 8 : i64
      %1080 = func.call @cc_make_string(%1078, %1079) : (!llvm.ptr, i64) -> i64
      %1081 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1082 = arith.constant 11 : i64
      %1083 = func.call @cc_make_string(%1081, %1082) : (!llvm.ptr, i64) -> i64
      %1084 = func.call @cc_intern(%1080, %1083) : (i64, i64) -> i64
      %1085 = func.call @cc_nil_value() : () -> i64
      %1086 = func.call @cc_cons(%1084, %1085) : (i64, i64) -> i64
      %1087 = func.call @cc_values_pack(%1086) : (i64) -> i64
      func.call @stack_push_pointer(%1084) : (i64) -> ()
      %1088 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1089 = arith.constant 5 : i64
      %1090 = func.call @cc_make_string(%1088, %1089) : (!llvm.ptr, i64) -> i64
      %1091 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1092 = arith.constant 11 : i64
      %1093 = func.call @cc_make_string(%1091, %1092) : (!llvm.ptr, i64) -> i64
      %1094 = func.call @cc_intern(%1090, %1093) : (i64, i64) -> i64
      %1095 = func.call @cc_nil_value() : () -> i64
      %1096 = func.call @cc_cons(%1094, %1095) : (i64, i64) -> i64
      %1097 = func.call @cc_values_pack(%1096) : (i64) -> i64
      func.call @stack_push_pointer(%1094) : (i64) -> ()
      %1098 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1099 = arith.constant 6 : i64
      %1100 = func.call @cc_make_string(%1098, %1099) : (!llvm.ptr, i64) -> i64
      %1101 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1102 = arith.constant 11 : i64
      %1103 = func.call @cc_make_string(%1101, %1102) : (!llvm.ptr, i64) -> i64
      %1104 = func.call @cc_intern(%1100, %1103) : (i64, i64) -> i64
      %1105 = func.call @cc_nil_value() : () -> i64
      %1106 = func.call @cc_cons(%1104, %1105) : (i64, i64) -> i64
      %1107 = func.call @cc_values_pack(%1106) : (i64) -> i64
      func.call @stack_push_pointer(%1104) : (i64) -> ()
      %1108 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1109 = arith.constant 8 : i64
      %1110 = func.call @cc_make_string(%1108, %1109) : (!llvm.ptr, i64) -> i64
      %1111 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1112 = arith.constant 11 : i64
      %1113 = func.call @cc_make_string(%1111, %1112) : (!llvm.ptr, i64) -> i64
      %1114 = func.call @cc_intern(%1110, %1113) : (i64, i64) -> i64
      %1115 = func.call @cc_nil_value() : () -> i64
      %1116 = func.call @cc_cons(%1114, %1115) : (i64, i64) -> i64
      %1117 = func.call @cc_values_pack(%1116) : (i64) -> i64
      func.call @stack_push_pointer(%1114) : (i64) -> ()
      %1118 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1119 = arith.constant 9 : i64
      %1120 = func.call @cc_make_string(%1118, %1119) : (!llvm.ptr, i64) -> i64
      %1121 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1122 = arith.constant 11 : i64
      %1123 = func.call @cc_make_string(%1121, %1122) : (!llvm.ptr, i64) -> i64
      %1124 = func.call @cc_intern(%1120, %1123) : (i64, i64) -> i64
      %1125 = func.call @cc_nil_value() : () -> i64
      %1126 = func.call @cc_cons(%1124, %1125) : (i64, i64) -> i64
      %1127 = func.call @cc_values_pack(%1126) : (i64) -> i64
      func.call @stack_push_pointer(%1124) : (i64) -> ()
      %1128 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1129 = arith.constant 6 : i64
      %1130 = func.call @cc_make_string(%1128, %1129) : (!llvm.ptr, i64) -> i64
      %1131 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1132 = arith.constant 11 : i64
      %1133 = func.call @cc_make_string(%1131, %1132) : (!llvm.ptr, i64) -> i64
      %1134 = func.call @cc_intern(%1130, %1133) : (i64, i64) -> i64
      %1135 = func.call @cc_nil_value() : () -> i64
      %1136 = func.call @cc_cons(%1134, %1135) : (i64, i64) -> i64
      %1137 = func.call @cc_values_pack(%1136) : (i64) -> i64
      func.call @stack_push_pointer(%1134) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1138 = func.call @stack_pop_pointer() : () -> i64
      %1139 = func.call @stack_pop_pointer() : () -> i64
      %1140 = func.call @cc_cons(%1139, %1138) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1140) : (i64) -> ()
      %1141 = func.call @stack_pop_pointer() : () -> i64
      %1142 = func.call @stack_pop_pointer() : () -> i64
      %1143 = func.call @cc_cons(%1142, %1141) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1143) : (i64) -> ()
      %1144 = func.call @stack_pop_pointer() : () -> i64
      %1145 = func.call @stack_pop_pointer() : () -> i64
      %1146 = func.call @cc_cons(%1145, %1144) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1146) : (i64) -> ()
      %1147 = func.call @stack_pop_pointer() : () -> i64
      %1148 = func.call @stack_pop_pointer() : () -> i64
      %1149 = func.call @cc_cons(%1148, %1147) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1149) : (i64) -> ()
      %1150 = func.call @stack_pop_pointer() : () -> i64
      %1151 = func.call @stack_pop_pointer() : () -> i64
      %1152 = func.call @cc_cons(%1151, %1150) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1152) : (i64) -> ()
      %1153 = func.call @stack_pop_pointer() : () -> i64
      %1154 = func.call @stack_pop_pointer() : () -> i64
      %1155 = func.call @cc_cons(%1154, %1153) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1155) : (i64) -> ()
      %1156 = func.call @stack_pop_pointer() : () -> i64
      %1157 = func.call @stack_pop_pointer() : () -> i64
      %1158 = func.call @cc_cons(%1157, %1156) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1158) : (i64) -> ()
      %1159 = func.call @stack_pop_pointer() : () -> i64
      %1160 = func.call @stack_pop_pointer() : () -> i64
      %1161 = func.call @cc_cons(%1160, %1159) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1161) : (i64) -> ()
      %1162 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1163 = func.call @stack_pop_pointer() : () -> i64
      %1164 = func.call @cc_nil_value() : () -> i64
      %1165 = func.call @cc_nil_value() : () -> i64
      %1166 = func.call @cc_errorp(%1164) : (i64) -> i64
      %1167 = arith.cmpi ne, %1166, %1165 : i64
      %1168:4 = scf.if %1167 -> (i64, i64, i64, i64) {
        scf.yield %1164, %1162, %1163, %1057 : i64, i64, i64, i64
      } else {
        %1169 = func.call @cc_nil_value() : () -> i64
        %1170 = llvm.mlir.addressof @str113 : !llvm.ptr
        %1171 = arith.constant 38 : i64
        %1172 = func.call @cc_make_symbol(%1170, %1171) : (!llvm.ptr, i64) -> i64
        %1173 = func.call @cc_set_symbol_value(%1172, %1169) : (i64, i64) -> i64
        %1174 = llvm.mlir.addressof @str114 : !llvm.ptr
        %1175 = arith.constant 39 : i64
        %1176 = func.call @cc_make_symbol(%1174, %1175) : (!llvm.ptr, i64) -> i64
        %1177 = func.call @cc_set_symbol_value(%1176, %1169) : (i64, i64) -> i64
        %1178 = llvm.mlir.addressof @str115 : !llvm.ptr
        %1179 = arith.constant 40 : i64
        %1180 = func.call @cc_make_symbol(%1178, %1179) : (!llvm.ptr, i64) -> i64
        %1181 = func.call @cc_set_symbol_value(%1180, %1169) : (i64, i64) -> i64
        %1182:3 = scf.while (%arg0 = %1057, %arg1 = %1163, %arg2 = %1162) : (i64, i64, i64) -> (i64, i64, i64) {
          func.call @stack_push_pointer(%arg2) : (i64) -> ()
          %1183 = func.call @stack_pop_pointer() : () -> i64
          %1184 = func.call @cc_nil_value() : () -> i64
          %1185 = arith.cmpi ne, %1183, %1184 : i64
          scf.condition(%1185) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%1186: i64, %1187: i64, %1188: i64):
          %1189 = func.call @cc_nil_value() : () -> i64
          %1190 = func.call @cc_nil_value() : () -> i64
          %1191 = func.call @cc_errorp(%1189) : (i64) -> i64
          %1192 = arith.cmpi ne, %1191, %1190 : i64
          %1193:3 = scf.if %1192 -> (i64, i64, i64) {
            scf.yield %1189, %1187, %1186 : i64, i64, i64
          } else {
            %1194 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%1188) : (i64) -> ()
            %1195 = func.call @stack_pop_pointer() : () -> i64
            %1196 = func.call @cc_nil_value() : () -> i64
            %1197 = arith.cmpi eq, %1195, %1196 : i64
            %1199 = func.call @cc_t_value() : () -> i64
            %1198 = arith.select %1197, %1199, %1196 : i64
            func.call @stack_push_pointer(%1198) : (i64) -> ()
            %1200 = func.call @stack_pop_pointer() : () -> i64
            %1201 = func.call @cc_nil_value() : () -> i64
            %1202 = func.call @cc_cons(%1200, %1201) : (i64, i64) -> i64
            %1203 = func.call @cc_not(%1202) : (i64) -> i64
            func.call @stack_push_pointer(%1203) : (i64) -> ()
            %1204 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1188) : (i64) -> ()
            %1205 = func.call @stack_pop_pointer() : () -> i64
            %1206 = func.call @cc_is_cons(%1205) : (i64) -> i32
            %1207 = arith.constant 0 : i32
            %1208 = arith.cmpi ne, %1206, %1207 : i32
            %1209 = func.call @cc_t_value() : () -> i64
            %1210 = func.call @cc_nil_value() : () -> i64
            %1211 = arith.select %1208, %1209, %1210 : i64
            func.call @stack_push_pointer(%1211) : (i64) -> ()
            %1212 = func.call @stack_pop_pointer() : () -> i64
            %1213 = func.call @cc_nil_value() : () -> i64
            %1214 = func.call @cc_cons(%1212, %1213) : (i64, i64) -> i64
            %1215 = func.call @cc_not(%1214) : (i64) -> i64
            func.call @stack_push_pointer(%1215) : (i64) -> ()
            %1216 = func.call @stack_pop_pointer() : () -> i64
            %1217 = func.call @cc_cons(%1216, %1194) : (i64, i64) -> i64
            %1218 = func.call @cc_cons(%1204, %1217) : (i64, i64) -> i64
            %1219 = func.call @cc_and(%1218) : (i64) -> i64
            func.call @stack_push_pointer(%1219) : (i64) -> ()
            %1220 = func.call @stack_pop_pointer() : () -> i64
            %1221 = func.call @cc_nil_value() : () -> i64
            %1222 = arith.cmpi ne, %1220, %1221 : i64
            scf.if %1222 {
              %1223 = llvm.mlir.addressof @str116 : !llvm.ptr
              %1224 = arith.constant 10 : i64
              %1225 = func.call @cc_make_string(%1223, %1224) : (!llvm.ptr, i64) -> i64
              %1226 = func.call @cc_nil_value() : () -> i64
              %1227 = func.call @cc_intern(%1225, %1226) : (i64, i64) -> i64
              %1228 = func.call @cc_nil_value() : () -> i64
              %1229 = func.call @cc_cons(%1227, %1228) : (i64, i64) -> i64
              %1230 = func.call @cc_values_pack(%1229) : (i64) -> i64
              func.call @stack_push_pointer(%1227) : (i64) -> ()
              %1231 = func.call @stack_pop_pointer() : () -> i64
              %1232 = func.call @cc_nil_value() : () -> i64
              %1233 = func.call @cc_errorp(%1231) : (i64) -> i64
              %1234 = arith.cmpi ne, %1233, %1232 : i64
              %1235 = arith.cmpi eq, %1232, %1232 : i64
              %1236 = arith.andi %1234, %1235 : i1
              %1237 = scf.if %1236 -> (i64) {
                scf.yield %1231 : i64
              } else {
                scf.yield %1232 : i64
              }
              %1238 = arith.cmpi ne, %1237, %1232 : i64
              scf.if %1238 {
                func.call @stack_push_pointer(%1237) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%1231) : (i64) -> ()
                %1239 = llvm.mlir.addressof @str117 : !llvm.ptr
                %1240 = func.call @cc_make_function_ref_const(%1239) : (!llvm.ptr) -> i64
                %1241 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%1240, %1241) : (i64, i64) -> ()
              }
              %1242 = func.call @stack_pop_pointer() : () -> i64
              %1243 = func.call @cc_multiple_value_list(%1242) : (i64) -> i64
              %1244 = func.call @cc_t_value() : () -> i64
              %1245 = llvm.mlir.addressof @str118 : !llvm.ptr
              %1246 = arith.constant 38 : i64
              %1247 = func.call @cc_make_symbol(%1245, %1246) : (!llvm.ptr, i64) -> i64
              %1248 = func.call @cc_set_symbol_value(%1247, %1244) : (i64, i64) -> i64
              %1249 = llvm.mlir.addressof @str119 : !llvm.ptr
              %1250 = arith.constant 39 : i64
              %1251 = func.call @cc_make_symbol(%1249, %1250) : (!llvm.ptr, i64) -> i64
              %1252 = func.call @cc_set_symbol_value(%1251, %1242) : (i64, i64) -> i64
              %1253 = llvm.mlir.addressof @str120 : !llvm.ptr
              %1254 = arith.constant 40 : i64
              %1255 = func.call @cc_make_symbol(%1253, %1254) : (!llvm.ptr, i64) -> i64
              %1256 = func.call @cc_set_symbol_value(%1255, %1243) : (i64, i64) -> i64
              func.call @stack_push_pointer(%1242) : (i64) -> ()
            } else {
              func.call @stack_push_nil() : () -> ()
            }
            %1257 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1257, %1187, %1186 : i64, i64, i64
          }
          %1258 = func.call @cc_nil_value() : () -> i64
          %1259 = func.call @cc_errorp(%1193#0) : (i64) -> i64
          %1260 = arith.cmpi ne, %1259, %1258 : i64
          %1261:3 = scf.if %1260 -> (i64, i64, i64) {
            scf.yield %1193#0, %1193#1, %1193#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%1188) : (i64) -> ()
            %1262 = func.call @stack_pop_pointer() : () -> i64
            %1263 = func.call @cc_car(%1262) : (i64) -> i64
            func.call @stack_push_pointer(%1263) : (i64) -> ()
            %1264 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1264) : (i64) -> ()
            %1265 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1265, %1193#1, %1264 : i64, i64, i64
          }
          %1266 = func.call @cc_nil_value() : () -> i64
          %1267 = func.call @cc_errorp(%1261#0) : (i64) -> i64
          %1268 = arith.cmpi ne, %1267, %1266 : i64
          %1269:3 = scf.if %1268 -> (i64, i64, i64) {
            scf.yield %1261#0, %1261#1, %1261#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%1261#1) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1270 = func.call @stack_pop_pointer() : () -> i64
            %1271 = arith.constant 3.0 : f64
            %1272 = func.call @cc_box_single_float(%1271) : (f64) -> i64
            func.call @stack_push_pointer(%1272) : (i64) -> ()
            %1273 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%1273) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1274 = func.call @stack_pop_pointer() : () -> i64
            %1275 = func.call @stack_pop_pointer() : () -> i64
            %1276 = func.call @cc_cons(%1275, %1274) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1276) : (i64) -> ()
            %1277 = func.call @stack_pop_pointer() : () -> i64
            %1278 = func.call @stack_pop_pointer() : () -> i64
            %1279 = func.call @cc_cons(%1278, %1277) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1279) : (i64) -> ()
            %1280 = arith.constant 3 : i64
            func.call @stack_push_fixnum(%1280) : (i64) -> ()
            %1281 = arith.constant 2.0 : f64
            %1282 = func.call @cc_box_single_float(%1281) : (f64) -> i64
            func.call @stack_push_pointer(%1282) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1283 = func.call @stack_pop_pointer() : () -> i64
            %1284 = func.call @stack_pop_pointer() : () -> i64
            %1285 = func.call @cc_cons(%1284, %1283) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1285) : (i64) -> ()
            %1286 = func.call @stack_pop_pointer() : () -> i64
            %1287 = func.call @stack_pop_pointer() : () -> i64
            %1288 = func.call @cc_cons(%1287, %1286) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1288) : (i64) -> ()
            %1289 = arith.constant 3.0 : f64
            %1290 = func.call @cc_box_single_float(%1289) : (f64) -> i64
            func.call @stack_push_pointer(%1290) : (i64) -> ()
            %1291 = llvm.mlir.addressof @str121 : !llvm.ptr
            %1292 = arith.constant 1 : i64
            %1293 = func.call @cc_parse_bignum(%1291, %1292) : (!llvm.ptr, i64) -> i64
            %1294 = llvm.mlir.addressof @str122 : !llvm.ptr
            %1295 = arith.constant 1 : i64
            %1296 = func.call @cc_parse_bignum(%1294, %1295) : (!llvm.ptr, i64) -> i64
            %1297 = func.call @cc_ratio(%1293, %1296) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1297) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1298 = func.call @stack_pop_pointer() : () -> i64
            %1299 = func.call @stack_pop_pointer() : () -> i64
            %1300 = func.call @cc_cons(%1299, %1298) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1300) : (i64) -> ()
            %1301 = func.call @stack_pop_pointer() : () -> i64
            %1302 = func.call @stack_pop_pointer() : () -> i64
            %1303 = func.call @cc_cons(%1302, %1301) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1303) : (i64) -> ()
            %1304 = llvm.mlir.addressof @str123 : !llvm.ptr
            %1305 = arith.constant 2 : i64
            %1306 = func.call @cc_parse_bignum(%1304, %1305) : (!llvm.ptr, i64) -> i64
            %1307 = llvm.mlir.addressof @str124 : !llvm.ptr
            %1308 = arith.constant 2 : i64
            %1309 = func.call @cc_parse_bignum(%1307, %1308) : (!llvm.ptr, i64) -> i64
            %1310 = func.call @cc_ratio(%1306, %1309) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1310) : (i64) -> ()
            %1311 = arith.constant 2.0 : f64
            %1312 = func.call @cc_box_single_float(%1311) : (f64) -> i64
            func.call @stack_push_pointer(%1312) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1313 = func.call @stack_pop_pointer() : () -> i64
            %1314 = func.call @stack_pop_pointer() : () -> i64
            %1315 = func.call @cc_cons(%1314, %1313) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1315) : (i64) -> ()
            %1316 = func.call @stack_pop_pointer() : () -> i64
            %1317 = func.call @stack_pop_pointer() : () -> i64
            %1318 = func.call @cc_cons(%1317, %1316) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1318) : (i64) -> ()
            %1319 = arith.constant 3.0 : f64
            %1320 = func.call @cc_box_single_float(%1319) : (f64) -> i64
            func.call @stack_push_pointer(%1320) : (i64) -> ()
            %1321 = arith.constant 2.0 : f64
            %1322 = func.call @cc_box_float(%1321) : (f64) -> i64
            func.call @stack_push_pointer(%1322) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1323 = func.call @stack_pop_pointer() : () -> i64
            %1324 = func.call @stack_pop_pointer() : () -> i64
            %1325 = func.call @cc_cons(%1324, %1323) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1325) : (i64) -> ()
            %1326 = func.call @stack_pop_pointer() : () -> i64
            %1327 = func.call @stack_pop_pointer() : () -> i64
            %1328 = func.call @cc_cons(%1327, %1326) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1328) : (i64) -> ()
            %1329 = arith.constant 3.0 : f64
            %1330 = func.call @cc_box_float(%1329) : (f64) -> i64
            func.call @stack_push_pointer(%1330) : (i64) -> ()
            %1331 = arith.constant 2.0 : f64
            %1332 = func.call @cc_box_single_float(%1331) : (f64) -> i64
            func.call @stack_push_pointer(%1332) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1333 = func.call @stack_pop_pointer() : () -> i64
            %1334 = func.call @stack_pop_pointer() : () -> i64
            %1335 = func.call @cc_cons(%1334, %1333) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1335) : (i64) -> ()
            %1336 = func.call @stack_pop_pointer() : () -> i64
            %1337 = func.call @stack_pop_pointer() : () -> i64
            %1338 = func.call @cc_cons(%1337, %1336) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1338) : (i64) -> ()
            %1339 = arith.constant 3.0 : f64
            %1340 = func.call @cc_box_float(%1339) : (f64) -> i64
            func.call @stack_push_pointer(%1340) : (i64) -> ()
            %1341 = arith.constant 2.0 : f64
            %1342 = func.call @cc_box_float(%1341) : (f64) -> i64
            func.call @stack_push_pointer(%1342) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1343 = func.call @stack_pop_pointer() : () -> i64
            %1344 = func.call @stack_pop_pointer() : () -> i64
            %1345 = func.call @cc_cons(%1344, %1343) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1345) : (i64) -> ()
            %1346 = func.call @stack_pop_pointer() : () -> i64
            %1347 = func.call @stack_pop_pointer() : () -> i64
            %1348 = func.call @cc_cons(%1347, %1346) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1348) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1349 = func.call @stack_pop_pointer() : () -> i64
            %1350 = func.call @stack_pop_pointer() : () -> i64
            %1351 = func.call @cc_cons(%1350, %1349) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1351) : (i64) -> ()
            %1352 = func.call @stack_pop_pointer() : () -> i64
            %1353 = func.call @stack_pop_pointer() : () -> i64
            %1354 = func.call @cc_cons(%1353, %1352) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1354) : (i64) -> ()
            %1355 = func.call @stack_pop_pointer() : () -> i64
            %1356 = func.call @stack_pop_pointer() : () -> i64
            %1357 = func.call @cc_cons(%1356, %1355) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1357) : (i64) -> ()
            %1358 = func.call @stack_pop_pointer() : () -> i64
            %1359 = func.call @stack_pop_pointer() : () -> i64
            %1360 = func.call @cc_cons(%1359, %1358) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1360) : (i64) -> ()
            %1361 = func.call @stack_pop_pointer() : () -> i64
            %1362 = func.call @stack_pop_pointer() : () -> i64
            %1363 = func.call @cc_cons(%1362, %1361) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1363) : (i64) -> ()
            %1364 = func.call @stack_pop_pointer() : () -> i64
            %1365 = func.call @stack_pop_pointer() : () -> i64
            %1366 = func.call @cc_cons(%1365, %1364) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1366) : (i64) -> ()
            %1367 = func.call @stack_pop_pointer() : () -> i64
            %1368 = func.call @stack_pop_pointer() : () -> i64
            %1369 = func.call @cc_cons(%1368, %1367) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1369) : (i64) -> ()
            %1370 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %1371 = func.call @stack_pop_pointer() : () -> i64
            %1372 = llvm.mlir.addressof @str125 : !llvm.ptr
            %1373 = arith.constant 12 : i64
            %1374 = func.call @cc_make_string(%1372, %1373) : (!llvm.ptr, i64) -> i64
            %1375 = llvm.mlir.addressof @str126 : !llvm.ptr
            %1376 = arith.constant 11 : i64
            %1377 = func.call @cc_make_string(%1375, %1376) : (!llvm.ptr, i64) -> i64
            %1378 = func.call @cc_intern(%1374, %1377) : (i64, i64) -> i64
            %1379 = func.call @cc_nil_value() : () -> i64
            %1380 = func.call @cc_cons(%1378, %1379) : (i64, i64) -> i64
            %1381 = func.call @cc_values_pack(%1380) : (i64) -> i64
            func.call @stack_push_pointer(%1378) : (i64) -> ()
            %1382 = llvm.mlir.addressof @str127 : !llvm.ptr
            %1383 = arith.constant 12 : i64
            %1384 = func.call @cc_make_string(%1382, %1383) : (!llvm.ptr, i64) -> i64
            %1385 = llvm.mlir.addressof @str128 : !llvm.ptr
            %1386 = arith.constant 11 : i64
            %1387 = func.call @cc_make_string(%1385, %1386) : (!llvm.ptr, i64) -> i64
            %1388 = func.call @cc_intern(%1384, %1387) : (i64, i64) -> i64
            %1389 = func.call @cc_nil_value() : () -> i64
            %1390 = func.call @cc_cons(%1388, %1389) : (i64, i64) -> i64
            %1391 = func.call @cc_values_pack(%1390) : (i64) -> i64
            func.call @stack_push_pointer(%1388) : (i64) -> ()
            %1392 = llvm.mlir.addressof @str129 : !llvm.ptr
            %1393 = arith.constant 12 : i64
            %1394 = func.call @cc_make_string(%1392, %1393) : (!llvm.ptr, i64) -> i64
            %1395 = llvm.mlir.addressof @str130 : !llvm.ptr
            %1396 = arith.constant 11 : i64
            %1397 = func.call @cc_make_string(%1395, %1396) : (!llvm.ptr, i64) -> i64
            %1398 = func.call @cc_intern(%1394, %1397) : (i64, i64) -> i64
            %1399 = func.call @cc_nil_value() : () -> i64
            %1400 = func.call @cc_cons(%1398, %1399) : (i64, i64) -> i64
            %1401 = func.call @cc_values_pack(%1400) : (i64) -> i64
            func.call @stack_push_pointer(%1398) : (i64) -> ()
            %1402 = llvm.mlir.addressof @str131 : !llvm.ptr
            %1403 = arith.constant 12 : i64
            %1404 = func.call @cc_make_string(%1402, %1403) : (!llvm.ptr, i64) -> i64
            %1405 = llvm.mlir.addressof @str132 : !llvm.ptr
            %1406 = arith.constant 11 : i64
            %1407 = func.call @cc_make_string(%1405, %1406) : (!llvm.ptr, i64) -> i64
            %1408 = func.call @cc_intern(%1404, %1407) : (i64, i64) -> i64
            %1409 = func.call @cc_nil_value() : () -> i64
            %1410 = func.call @cc_cons(%1408, %1409) : (i64, i64) -> i64
            %1411 = func.call @cc_values_pack(%1410) : (i64) -> i64
            func.call @stack_push_pointer(%1408) : (i64) -> ()
            %1412 = llvm.mlir.addressof @str133 : !llvm.ptr
            %1413 = arith.constant 12 : i64
            %1414 = func.call @cc_make_string(%1412, %1413) : (!llvm.ptr, i64) -> i64
            %1415 = llvm.mlir.addressof @str134 : !llvm.ptr
            %1416 = arith.constant 11 : i64
            %1417 = func.call @cc_make_string(%1415, %1416) : (!llvm.ptr, i64) -> i64
            %1418 = func.call @cc_intern(%1414, %1417) : (i64, i64) -> i64
            %1419 = func.call @cc_nil_value() : () -> i64
            %1420 = func.call @cc_cons(%1418, %1419) : (i64, i64) -> i64
            %1421 = func.call @cc_values_pack(%1420) : (i64) -> i64
            func.call @stack_push_pointer(%1418) : (i64) -> ()
            %1422 = llvm.mlir.addressof @str135 : !llvm.ptr
            %1423 = arith.constant 12 : i64
            %1424 = func.call @cc_make_string(%1422, %1423) : (!llvm.ptr, i64) -> i64
            %1425 = llvm.mlir.addressof @str136 : !llvm.ptr
            %1426 = arith.constant 11 : i64
            %1427 = func.call @cc_make_string(%1425, %1426) : (!llvm.ptr, i64) -> i64
            %1428 = func.call @cc_intern(%1424, %1427) : (i64, i64) -> i64
            %1429 = func.call @cc_nil_value() : () -> i64
            %1430 = func.call @cc_cons(%1428, %1429) : (i64, i64) -> i64
            %1431 = func.call @cc_values_pack(%1430) : (i64) -> i64
            func.call @stack_push_pointer(%1428) : (i64) -> ()
            %1432 = llvm.mlir.addressof @str137 : !llvm.ptr
            %1433 = arith.constant 12 : i64
            %1434 = func.call @cc_make_string(%1432, %1433) : (!llvm.ptr, i64) -> i64
            %1435 = llvm.mlir.addressof @str138 : !llvm.ptr
            %1436 = arith.constant 11 : i64
            %1437 = func.call @cc_make_string(%1435, %1436) : (!llvm.ptr, i64) -> i64
            %1438 = func.call @cc_intern(%1434, %1437) : (i64, i64) -> i64
            %1439 = func.call @cc_nil_value() : () -> i64
            %1440 = func.call @cc_cons(%1438, %1439) : (i64, i64) -> i64
            %1441 = func.call @cc_values_pack(%1440) : (i64) -> i64
            func.call @stack_push_pointer(%1438) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %1442 = func.call @stack_pop_pointer() : () -> i64
            %1443 = func.call @stack_pop_pointer() : () -> i64
            %1444 = func.call @cc_cons(%1443, %1442) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1444) : (i64) -> ()
            %1445 = func.call @stack_pop_pointer() : () -> i64
            %1446 = func.call @stack_pop_pointer() : () -> i64
            %1447 = func.call @cc_cons(%1446, %1445) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1447) : (i64) -> ()
            %1448 = func.call @stack_pop_pointer() : () -> i64
            %1449 = func.call @stack_pop_pointer() : () -> i64
            %1450 = func.call @cc_cons(%1449, %1448) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1450) : (i64) -> ()
            %1451 = func.call @stack_pop_pointer() : () -> i64
            %1452 = func.call @stack_pop_pointer() : () -> i64
            %1453 = func.call @cc_cons(%1452, %1451) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1453) : (i64) -> ()
            %1454 = func.call @stack_pop_pointer() : () -> i64
            %1455 = func.call @stack_pop_pointer() : () -> i64
            %1456 = func.call @cc_cons(%1455, %1454) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1456) : (i64) -> ()
            %1457 = func.call @stack_pop_pointer() : () -> i64
            %1458 = func.call @stack_pop_pointer() : () -> i64
            %1459 = func.call @cc_cons(%1458, %1457) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1459) : (i64) -> ()
            %1460 = func.call @stack_pop_pointer() : () -> i64
            %1461 = func.call @stack_pop_pointer() : () -> i64
            %1462 = func.call @cc_cons(%1461, %1460) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1462) : (i64) -> ()
            %1463 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %1464 = func.call @stack_pop_pointer() : () -> i64
            %1465 = func.call @cc_nil_value() : () -> i64
            %1466 = func.call @cc_nil_value() : () -> i64
            %1467 = func.call @cc_errorp(%1465) : (i64) -> i64
            %1468 = arith.cmpi ne, %1467, %1466 : i64
            %1469 = scf.if %1468 -> (i64) {
              scf.yield %1465 : i64
            } else {
              %1470 = func.call @cc_nil_value() : () -> i64
              %1471 = llvm.mlir.addressof @str139 : !llvm.ptr
              %1472 = arith.constant 38 : i64
              %1473 = func.call @cc_make_symbol(%1471, %1472) : (!llvm.ptr, i64) -> i64
              %1474 = func.call @cc_set_symbol_value(%1473, %1470) : (i64, i64) -> i64
              %1475 = llvm.mlir.addressof @str140 : !llvm.ptr
              %1476 = arith.constant 39 : i64
              %1477 = func.call @cc_make_symbol(%1475, %1476) : (!llvm.ptr, i64) -> i64
              %1478 = func.call @cc_set_symbol_value(%1477, %1470) : (i64, i64) -> i64
              %1479 = llvm.mlir.addressof @str141 : !llvm.ptr
              %1480 = arith.constant 40 : i64
              %1481 = func.call @cc_make_symbol(%1479, %1480) : (!llvm.ptr, i64) -> i64
              %1482 = func.call @cc_set_symbol_value(%1481, %1470) : (i64, i64) -> i64
              %1483:5 = scf.while (%arg0 = %1270, %arg1 = %1371, %arg2 = %1464, %arg3 = %1463, %arg4 = %1370) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
                %1484 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%arg4) : (i64) -> ()
                %1485 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%arg3) : (i64) -> ()
                %1486 = func.call @stack_pop_pointer() : () -> i64
                %1487 = func.call @cc_cons(%1486, %1484) : (i64, i64) -> i64
                %1488 = func.call @cc_cons(%1485, %1487) : (i64, i64) -> i64
                %1489 = func.call @cc_and(%1488) : (i64) -> i64
                func.call @stack_push_pointer(%1489) : (i64) -> ()
                %1490 = func.call @stack_pop_pointer() : () -> i64
                %1491 = func.call @cc_nil_value() : () -> i64
                %1492 = arith.cmpi ne, %1490, %1491 : i64
                scf.condition(%1492) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
              } do {
                ^bb0(%1493: i64, %1494: i64, %1495: i64, %1496: i64, %1497: i64):
                %1498 = func.call @cc_nil_value() : () -> i64
                %1499 = func.call @cc_nil_value() : () -> i64
                %1500 = func.call @cc_errorp(%1498) : (i64) -> i64
                %1501 = arith.cmpi ne, %1500, %1499 : i64
                %1502:4 = scf.if %1501 -> (i64, i64, i64, i64) {
                  scf.yield %1498, %1495, %1493, %1494 : i64, i64, i64, i64
                } else {
                  %1503 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%1497) : (i64) -> ()
                  %1504 = func.call @stack_pop_pointer() : () -> i64
                  %1505 = func.call @cc_nil_value() : () -> i64
                  %1506 = arith.cmpi eq, %1504, %1505 : i64
                  %1508 = func.call @cc_t_value() : () -> i64
                  %1507 = arith.select %1506, %1508, %1505 : i64
                  func.call @stack_push_pointer(%1507) : (i64) -> ()
                  %1509 = func.call @stack_pop_pointer() : () -> i64
                  %1510 = func.call @cc_nil_value() : () -> i64
                  %1511 = func.call @cc_cons(%1509, %1510) : (i64, i64) -> i64
                  %1512 = func.call @cc_not(%1511) : (i64) -> i64
                  func.call @stack_push_pointer(%1512) : (i64) -> ()
                  %1513 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1497) : (i64) -> ()
                  %1514 = func.call @stack_pop_pointer() : () -> i64
                  %1515 = func.call @cc_is_cons(%1514) : (i64) -> i32
                  %1516 = arith.constant 0 : i32
                  %1517 = arith.cmpi ne, %1515, %1516 : i32
                  %1518 = func.call @cc_t_value() : () -> i64
                  %1519 = func.call @cc_nil_value() : () -> i64
                  %1520 = arith.select %1517, %1518, %1519 : i64
                  func.call @stack_push_pointer(%1520) : (i64) -> ()
                  %1521 = func.call @stack_pop_pointer() : () -> i64
                  %1522 = func.call @cc_nil_value() : () -> i64
                  %1523 = func.call @cc_cons(%1521, %1522) : (i64, i64) -> i64
                  %1524 = func.call @cc_not(%1523) : (i64) -> i64
                  func.call @stack_push_pointer(%1524) : (i64) -> ()
                  %1525 = func.call @stack_pop_pointer() : () -> i64
                  %1526 = func.call @cc_cons(%1525, %1503) : (i64, i64) -> i64
                  %1527 = func.call @cc_cons(%1513, %1526) : (i64, i64) -> i64
                  %1528 = func.call @cc_and(%1527) : (i64) -> i64
                  func.call @stack_push_pointer(%1528) : (i64) -> ()
                  %1529 = func.call @stack_pop_pointer() : () -> i64
                  %1530 = func.call @cc_nil_value() : () -> i64
                  %1531 = arith.cmpi ne, %1529, %1530 : i64
                  scf.if %1531 {
                    %1532 = llvm.mlir.addressof @str142 : !llvm.ptr
                    %1533 = arith.constant 10 : i64
                    %1534 = func.call @cc_make_string(%1532, %1533) : (!llvm.ptr, i64) -> i64
                    %1535 = func.call @cc_nil_value() : () -> i64
                    %1536 = func.call @cc_intern(%1534, %1535) : (i64, i64) -> i64
                    %1537 = func.call @cc_nil_value() : () -> i64
                    %1538 = func.call @cc_cons(%1536, %1537) : (i64, i64) -> i64
                    %1539 = func.call @cc_values_pack(%1538) : (i64) -> i64
                    func.call @stack_push_pointer(%1536) : (i64) -> ()
                    %1540 = func.call @stack_pop_pointer() : () -> i64
                    %1541 = func.call @cc_nil_value() : () -> i64
                    %1542 = func.call @cc_errorp(%1540) : (i64) -> i64
                    %1543 = arith.cmpi ne, %1542, %1541 : i64
                    %1544 = arith.cmpi eq, %1541, %1541 : i64
                    %1545 = arith.andi %1543, %1544 : i1
                    %1546 = scf.if %1545 -> (i64) {
                      scf.yield %1540 : i64
                    } else {
                      scf.yield %1541 : i64
                    }
                    %1547 = arith.cmpi ne, %1546, %1541 : i64
                    scf.if %1547 {
                      func.call @stack_push_pointer(%1546) : (i64) -> ()
                    } else {
                      func.call @stack_push_pointer(%1540) : (i64) -> ()
                      %1548 = llvm.mlir.addressof @str143 : !llvm.ptr
                      %1549 = func.call @cc_make_function_ref_const(%1548) : (!llvm.ptr) -> i64
                      %1550 = arith.constant 1 : i64
                      func.call @cc_funcall_stack(%1549, %1550) : (i64, i64) -> ()
                    }
                    %1551 = func.call @stack_pop_pointer() : () -> i64
                    %1552 = func.call @cc_multiple_value_list(%1551) : (i64) -> i64
                    %1553 = func.call @cc_t_value() : () -> i64
                    %1554 = llvm.mlir.addressof @str144 : !llvm.ptr
                    %1555 = arith.constant 38 : i64
                    %1556 = func.call @cc_make_symbol(%1554, %1555) : (!llvm.ptr, i64) -> i64
                    %1557 = func.call @cc_set_symbol_value(%1556, %1553) : (i64, i64) -> i64
                    %1558 = llvm.mlir.addressof @str145 : !llvm.ptr
                    %1559 = arith.constant 39 : i64
                    %1560 = func.call @cc_make_symbol(%1558, %1559) : (!llvm.ptr, i64) -> i64
                    %1561 = func.call @cc_set_symbol_value(%1560, %1551) : (i64, i64) -> i64
                    %1562 = llvm.mlir.addressof @str146 : !llvm.ptr
                    %1563 = arith.constant 40 : i64
                    %1564 = func.call @cc_make_symbol(%1562, %1563) : (!llvm.ptr, i64) -> i64
                    %1565 = func.call @cc_set_symbol_value(%1564, %1552) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%1551) : (i64) -> ()
                  } else {
                    func.call @stack_push_nil() : () -> ()
                  }
                  %1566 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %1566, %1495, %1493, %1494 : i64, i64, i64, i64
                }
                %1567 = func.call @cc_nil_value() : () -> i64
                %1568 = func.call @cc_errorp(%1502#0) : (i64) -> i64
                %1569 = arith.cmpi ne, %1568, %1567 : i64
                %1570:4 = scf.if %1569 -> (i64, i64, i64, i64) {
                  scf.yield %1502#0, %1502#1, %1502#2, %1502#3 : i64, i64, i64, i64
                } else {
                  %1571 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%1496) : (i64) -> ()
                  %1572 = func.call @stack_pop_pointer() : () -> i64
                  %1573 = func.call @cc_nil_value() : () -> i64
                  %1574 = arith.cmpi eq, %1572, %1573 : i64
                  %1576 = func.call @cc_t_value() : () -> i64
                  %1575 = arith.select %1574, %1576, %1573 : i64
                  func.call @stack_push_pointer(%1575) : (i64) -> ()
                  %1577 = func.call @stack_pop_pointer() : () -> i64
                  %1578 = func.call @cc_nil_value() : () -> i64
                  %1579 = func.call @cc_cons(%1577, %1578) : (i64, i64) -> i64
                  %1580 = func.call @cc_not(%1579) : (i64) -> i64
                  func.call @stack_push_pointer(%1580) : (i64) -> ()
                  %1581 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1496) : (i64) -> ()
                  %1582 = func.call @stack_pop_pointer() : () -> i64
                  %1583 = func.call @cc_is_cons(%1582) : (i64) -> i32
                  %1584 = arith.constant 0 : i32
                  %1585 = arith.cmpi ne, %1583, %1584 : i32
                  %1586 = func.call @cc_t_value() : () -> i64
                  %1587 = func.call @cc_nil_value() : () -> i64
                  %1588 = arith.select %1585, %1586, %1587 : i64
                  func.call @stack_push_pointer(%1588) : (i64) -> ()
                  %1589 = func.call @stack_pop_pointer() : () -> i64
                  %1590 = func.call @cc_nil_value() : () -> i64
                  %1591 = func.call @cc_cons(%1589, %1590) : (i64, i64) -> i64
                  %1592 = func.call @cc_not(%1591) : (i64) -> i64
                  func.call @stack_push_pointer(%1592) : (i64) -> ()
                  %1593 = func.call @stack_pop_pointer() : () -> i64
                  %1594 = func.call @cc_cons(%1593, %1571) : (i64, i64) -> i64
                  %1595 = func.call @cc_cons(%1581, %1594) : (i64, i64) -> i64
                  %1596 = func.call @cc_and(%1595) : (i64) -> i64
                  func.call @stack_push_pointer(%1596) : (i64) -> ()
                  %1597 = func.call @stack_pop_pointer() : () -> i64
                  %1598 = func.call @cc_nil_value() : () -> i64
                  %1599 = arith.cmpi ne, %1597, %1598 : i64
                  scf.if %1599 {
                    %1600 = llvm.mlir.addressof @str147 : !llvm.ptr
                    %1601 = arith.constant 10 : i64
                    %1602 = func.call @cc_make_string(%1600, %1601) : (!llvm.ptr, i64) -> i64
                    %1603 = func.call @cc_nil_value() : () -> i64
                    %1604 = func.call @cc_intern(%1602, %1603) : (i64, i64) -> i64
                    %1605 = func.call @cc_nil_value() : () -> i64
                    %1606 = func.call @cc_cons(%1604, %1605) : (i64, i64) -> i64
                    %1607 = func.call @cc_values_pack(%1606) : (i64) -> i64
                    func.call @stack_push_pointer(%1604) : (i64) -> ()
                    %1608 = func.call @stack_pop_pointer() : () -> i64
                    %1609 = func.call @cc_nil_value() : () -> i64
                    %1610 = func.call @cc_errorp(%1608) : (i64) -> i64
                    %1611 = arith.cmpi ne, %1610, %1609 : i64
                    %1612 = arith.cmpi eq, %1609, %1609 : i64
                    %1613 = arith.andi %1611, %1612 : i1
                    %1614 = scf.if %1613 -> (i64) {
                      scf.yield %1608 : i64
                    } else {
                      scf.yield %1609 : i64
                    }
                    %1615 = arith.cmpi ne, %1614, %1609 : i64
                    scf.if %1615 {
                      func.call @stack_push_pointer(%1614) : (i64) -> ()
                    } else {
                      func.call @stack_push_pointer(%1608) : (i64) -> ()
                      %1616 = llvm.mlir.addressof @str148 : !llvm.ptr
                      %1617 = func.call @cc_make_function_ref_const(%1616) : (!llvm.ptr) -> i64
                      %1618 = arith.constant 1 : i64
                      func.call @cc_funcall_stack(%1617, %1618) : (i64, i64) -> ()
                    }
                    %1619 = func.call @stack_pop_pointer() : () -> i64
                    %1620 = func.call @cc_multiple_value_list(%1619) : (i64) -> i64
                    %1621 = func.call @cc_t_value() : () -> i64
                    %1622 = llvm.mlir.addressof @str149 : !llvm.ptr
                    %1623 = arith.constant 38 : i64
                    %1624 = func.call @cc_make_symbol(%1622, %1623) : (!llvm.ptr, i64) -> i64
                    %1625 = func.call @cc_set_symbol_value(%1624, %1621) : (i64, i64) -> i64
                    %1626 = llvm.mlir.addressof @str150 : !llvm.ptr
                    %1627 = arith.constant 39 : i64
                    %1628 = func.call @cc_make_symbol(%1626, %1627) : (!llvm.ptr, i64) -> i64
                    %1629 = func.call @cc_set_symbol_value(%1628, %1619) : (i64, i64) -> i64
                    %1630 = llvm.mlir.addressof @str151 : !llvm.ptr
                    %1631 = arith.constant 40 : i64
                    %1632 = func.call @cc_make_symbol(%1630, %1631) : (!llvm.ptr, i64) -> i64
                    %1633 = func.call @cc_set_symbol_value(%1632, %1620) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%1619) : (i64) -> ()
                  } else {
                    func.call @stack_push_nil() : () -> ()
                  }
                  %1634 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %1634, %1502#1, %1502#2, %1502#3 : i64, i64, i64, i64
                }
                %1635 = func.call @cc_nil_value() : () -> i64
                %1636 = func.call @cc_errorp(%1570#0) : (i64) -> i64
                %1637 = arith.cmpi ne, %1636, %1635 : i64
                %1638:4 = scf.if %1637 -> (i64, i64, i64, i64) {
                  scf.yield %1570#0, %1570#1, %1570#2, %1570#3 : i64, i64, i64, i64
                } else {
                  func.call @stack_push_pointer(%1497) : (i64) -> ()
                  %1639 = func.call @stack_pop_pointer() : () -> i64
                  %1640 = func.call @cc_car(%1639) : (i64) -> i64
                  func.call @stack_push_pointer(%1640) : (i64) -> ()
                  %1641 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1641) : (i64) -> ()
                  %1642 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %1642, %1570#1, %1641, %1570#3 : i64, i64, i64, i64
                }
                %1643 = func.call @cc_nil_value() : () -> i64
                %1644 = func.call @cc_errorp(%1638#0) : (i64) -> i64
                %1645 = arith.cmpi ne, %1644, %1643 : i64
                %1646:4 = scf.if %1645 -> (i64, i64, i64, i64) {
                  scf.yield %1638#0, %1638#1, %1638#2, %1638#3 : i64, i64, i64, i64
                } else {
                  func.call @stack_push_pointer(%1496) : (i64) -> ()
                  %1647 = func.call @stack_pop_pointer() : () -> i64
                  %1648 = func.call @cc_car(%1647) : (i64) -> i64
                  func.call @stack_push_pointer(%1648) : (i64) -> ()
                  %1649 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1649) : (i64) -> ()
                  %1650 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %1650, %1638#1, %1638#2, %1649 : i64, i64, i64, i64
                }
                %1651 = func.call @cc_nil_value() : () -> i64
                %1652 = func.call @cc_errorp(%1646#0) : (i64) -> i64
                %1653 = arith.cmpi ne, %1652, %1651 : i64
                %1654:4 = scf.if %1653 -> (i64, i64, i64, i64) {
                  scf.yield %1646#0, %1646#1, %1646#2, %1646#3 : i64, i64, i64, i64
                } else {
                  %1655 = arith.constant 1 : i64
                  func.call @stack_push_fixnum(%1655) : (i64) -> ()
                  %1656 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1261#2) : (i64) -> ()
                  %1657 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%1646#2) : (i64) -> ()
                  %1658 = func.call @stack_pop_pointer() : () -> i64
                  %1659 = func.call @cc_apply(%1657, %1658) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%1659) : (i64) -> ()
                  %1660 = func.call @stack_pop_pointer() : () -> i64
                  %1661 = func.call @cc_multiple_value_list(%1660) : (i64) -> i64
                  %1662 = func.call @cc_nth(%1656, %1661) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%1662) : (i64) -> ()
                  func.call @stack_push_pointer(%1646#3) : (i64) -> ()
                  %1663 = func.call @stack_pop_pointer() : () -> i64
                  %1664 = func.call @stack_pop_pointer() : () -> i64
                  %1665 = func.call @cc_typep(%1664, %1663) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%1665) : (i64) -> ()
                  %1666 = func.call @stack_pop_pointer() : () -> i64
                  %1667 = func.call @cc_nil_value() : () -> i64
                  %1668 = func.call @cc_cons(%1666, %1667) : (i64, i64) -> i64
                  %1669 = func.call @cc_not(%1668) : (i64) -> i64
                  func.call @stack_push_pointer(%1669) : (i64) -> ()
                  %1670 = func.call @stack_pop_pointer() : () -> i64
                  %1671 = func.call @cc_nil_value() : () -> i64
                  %1672 = arith.cmpi ne, %1670, %1671 : i64
                  %1673:1 = scf.if %1672 -> (i64) {
                    %1674 = func.call @cc_nil_value() : () -> i64
                    %1675 = func.call @cc_nil_value() : () -> i64
                    %1676 = func.call @cc_errorp(%1674) : (i64) -> i64
                    %1677 = arith.cmpi ne, %1676, %1675 : i64
                    %1678:2 = scf.if %1677 -> (i64, i64) {
                      scf.yield %1674, %1646#1 : i64, i64
                    } else {
                      func.call @stack_push_pointer(%1646#1) : (i64) -> ()
                      func.call @stack_push_pointer(%1261#2) : (i64) -> ()
                      func.call @stack_push_pointer(%1646#2) : (i64) -> ()
                      %1679 = func.call @stack_pop_pointer() : () -> i64
                      %1680 = func.call @stack_pop_pointer() : () -> i64
                      %1681 = func.call @cc_cons(%1680, %1679) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%1681) : (i64) -> ()
                      %1682 = func.call @stack_pop_pointer() : () -> i64
                      %1683 = func.call @cc_nil_value() : () -> i64
                      %1684 = func.call @cc_errorp(%1682) : (i64) -> i64
                      %1685 = arith.cmpi ne, %1684, %1683 : i64
                      %1686 = arith.cmpi eq, %1683, %1683 : i64
                      %1687 = arith.andi %1685, %1686 : i1
                      %1688 = scf.if %1687 -> (i64) {
                        scf.yield %1682 : i64
                      } else {
                        scf.yield %1683 : i64
                      }
                      %1689 = arith.cmpi ne, %1688, %1683 : i64
                      scf.if %1689 {
                        func.call @stack_push_pointer(%1688) : (i64) -> ()
                      } else {
                        %1690 = func.call @cc_nil_value() : () -> i64
                        func.call @stack_push_pointer(%1690) : (i64) -> ()
                        func.call @stack_push_pointer(%1682) : (i64) -> ()
                        %1691 = func.call @stack_pop_pointer() : () -> i64
                        %1692 = func.call @stack_pop_pointer() : () -> i64
                        %1693 = func.call @cc_cons(%1691, %1692) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%1693) : (i64) -> ()
                      }
                      %1694 = func.call @stack_pop_pointer() : () -> i64
                      %1695 = func.call @stack_pop_pointer() : () -> i64
                      %1696 = func.call @cc_append(%1695, %1694) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%1696) : (i64) -> ()
                      %1697 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%1697) : (i64) -> ()
                      %1698 = func.call @stack_pop_pointer() : () -> i64
                      scf.yield %1698, %1697 : i64, i64
                    }
                    func.call @stack_push_pointer(%1678#0) : (i64) -> ()
                    %1699 = func.call @stack_depth() : () -> i64
                    %1700 = arith.constant 0 : i64
                    %1701 = arith.cmpi sgt, %1699, %1700 : i64
                    scf.if %1701 {
                      %1702 = func.call @stack_pop_pointer() : () -> i64
                    }
                    scf.yield %1678#1 : i64
                  } else {
                    func.call @stack_push_nil() : () -> ()
                    %1703 = func.call @stack_depth() : () -> i64
                    %1704 = arith.constant 0 : i64
                    %1705 = arith.cmpi sgt, %1703, %1704 : i64
                    scf.if %1705 {
                      %1706 = func.call @stack_pop_pointer() : () -> i64
                    }
                    scf.yield %1646#1 : i64
                  }
                  func.call @stack_push_nil() : () -> ()
                  %1707 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %1707, %1673, %1646#2, %1646#3 : i64, i64, i64, i64
                }
                func.call @stack_push_pointer(%1654#0) : (i64) -> ()
                %1708 = func.call @stack_depth() : () -> i64
                %1709 = arith.constant 0 : i64
                %1710 = arith.cmpi sgt, %1708, %1709 : i64
                scf.if %1710 {
                  %1711 = func.call @stack_pop_pointer() : () -> i64
                }
                func.call @stack_push_pointer(%1496) : (i64) -> ()
                %1712 = func.call @stack_pop_pointer() : () -> i64
                %1713 = func.call @cc_cdr(%1712) : (i64) -> i64
                func.call @stack_push_pointer(%1713) : (i64) -> ()
                %1714 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%1714) : (i64) -> ()
                %1715 = func.call @stack_depth() : () -> i64
                %1716 = arith.constant 0 : i64
                %1717 = arith.cmpi sgt, %1715, %1716 : i64
                scf.if %1717 {
                  %1718 = func.call @stack_pop_pointer() : () -> i64
                }
                func.call @stack_push_pointer(%1497) : (i64) -> ()
                %1719 = func.call @stack_pop_pointer() : () -> i64
                %1720 = func.call @cc_cdr(%1719) : (i64) -> i64
                func.call @stack_push_pointer(%1720) : (i64) -> ()
                %1721 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%1721) : (i64) -> ()
                %1722 = func.call @stack_depth() : () -> i64
                %1723 = arith.constant 0 : i64
                %1724 = arith.cmpi sgt, %1722, %1723 : i64
                scf.if %1724 {
                  %1725 = func.call @stack_pop_pointer() : () -> i64
                }
                scf.yield %1654#2, %1654#3, %1654#1, %1714, %1721 : i64, i64, i64, i64, i64
              }
              func.call @stack_push_nil() : () -> ()
              %1726 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%1483#2) : (i64) -> ()
              %1727 = func.call @stack_pop_pointer() : () -> i64
              %1728 = func.call @cc_multiple_value_list(%1727) : (i64) -> i64
              %1729 = llvm.mlir.addressof @str152 : !llvm.ptr
              %1730 = arith.constant 38 : i64
              %1731 = func.call @cc_make_symbol(%1729, %1730) : (!llvm.ptr, i64) -> i64
              %1732 = func.call @cc_symbol_value(%1731) : (i64) -> i64
              %1733 = llvm.mlir.addressof @str153 : !llvm.ptr
              %1734 = arith.constant 39 : i64
              %1735 = func.call @cc_make_symbol(%1733, %1734) : (!llvm.ptr, i64) -> i64
              %1736 = func.call @cc_symbol_value(%1735) : (i64) -> i64
              %1737 = llvm.mlir.addressof @str154 : !llvm.ptr
              %1738 = arith.constant 40 : i64
              %1739 = func.call @cc_make_symbol(%1737, %1738) : (!llvm.ptr, i64) -> i64
              %1740 = func.call @cc_symbol_value(%1739) : (i64) -> i64
              %1741 = func.call @cc_nil_value() : () -> i64
              %1742 = arith.cmpi ne, %1732, %1741 : i64
              %1743 = scf.if %1742 -> (i64) {
                scf.yield %1740 : i64
              } else {
                scf.yield %1728 : i64
              }
              %1744 = func.call @cc_values_pack(%1743) : (i64) -> i64
              func.call @stack_push_pointer(%1744) : (i64) -> ()
              %1745 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %1745 : i64
            }
            func.call @stack_push_pointer(%1469) : (i64) -> ()
            %1746 = func.call @stack_pop_pointer() : () -> i64
            %1747 = func.call @stack_pop_pointer() : () -> i64
            %1748 = func.call @cc_nconc(%1747, %1746) : (i64, i64) -> i64
            func.call @stack_push_pointer(%1748) : (i64) -> ()
            %1749 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%1749) : (i64) -> ()
            %1750 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %1750, %1749, %1261#2 : i64, i64, i64
          }
          func.call @stack_push_pointer(%1269#0) : (i64) -> ()
          %1751 = func.call @stack_depth() : () -> i64
          %1752 = arith.constant 0 : i64
          %1753 = arith.cmpi sgt, %1751, %1752 : i64
          scf.if %1753 {
            %1754 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%1188) : (i64) -> ()
          %1755 = func.call @stack_pop_pointer() : () -> i64
          %1756 = func.call @cc_cdr(%1755) : (i64) -> i64
          func.call @stack_push_pointer(%1756) : (i64) -> ()
          %1757 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%1757) : (i64) -> ()
          %1758 = func.call @stack_depth() : () -> i64
          %1759 = arith.constant 0 : i64
          %1760 = arith.cmpi sgt, %1758, %1759 : i64
          scf.if %1760 {
            %1761 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %1269#2, %1269#1, %1757 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %1762 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1182#1) : (i64) -> ()
        %1763 = func.call @stack_pop_pointer() : () -> i64
        %1764 = func.call @cc_multiple_value_list(%1763) : (i64) -> i64
        %1765 = llvm.mlir.addressof @str155 : !llvm.ptr
        %1766 = arith.constant 38 : i64
        %1767 = func.call @cc_make_symbol(%1765, %1766) : (!llvm.ptr, i64) -> i64
        %1768 = func.call @cc_symbol_value(%1767) : (i64) -> i64
        %1769 = llvm.mlir.addressof @str156 : !llvm.ptr
        %1770 = arith.constant 39 : i64
        %1771 = func.call @cc_make_symbol(%1769, %1770) : (!llvm.ptr, i64) -> i64
        %1772 = func.call @cc_symbol_value(%1771) : (i64) -> i64
        %1773 = llvm.mlir.addressof @str157 : !llvm.ptr
        %1774 = arith.constant 40 : i64
        %1775 = func.call @cc_make_symbol(%1773, %1774) : (!llvm.ptr, i64) -> i64
        %1776 = func.call @cc_symbol_value(%1775) : (i64) -> i64
        %1777 = func.call @cc_nil_value() : () -> i64
        %1778 = arith.cmpi ne, %1768, %1777 : i64
        %1779 = scf.if %1778 -> (i64) {
          scf.yield %1776 : i64
        } else {
          scf.yield %1764 : i64
        }
        %1780 = func.call @cc_values_pack(%1779) : (i64) -> i64
        func.call @stack_push_pointer(%1780) : (i64) -> ()
        %1781 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1781, %1182#2, %1182#1, %1182#0 : i64, i64, i64, i64
      }
      func.call @stack_push_pointer(%1168#0) : (i64) -> ()
      %1782 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1782 : i64
    }
    func.call @stack_push_pointer(%1056) : (i64) -> ()
    func.return
  }
  func.func @"__lambda_211067594604547"() {
    %2909 = func.call @cc_nil_value() : () -> i64
    %2910 = func.call @cc_nil_value() : () -> i64
    %2911 = func.call @cc_errorp(%2909) : (i64) -> i64
    %2912 = arith.cmpi ne, %2911, %2910 : i64
    %2913 = scf.if %2912 -> (i64) {
      scf.yield %2909 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %2914 = func.call @stack_pop_pointer() : () -> i64
      %2915 = llvm.mlir.addressof @str259 : !llvm.ptr
      %2916 = arith.constant 6 : i64
      %2917 = func.call @cc_make_string(%2915, %2916) : (!llvm.ptr, i64) -> i64
      %2918 = llvm.mlir.addressof @str260 : !llvm.ptr
      %2919 = arith.constant 11 : i64
      %2920 = func.call @cc_make_string(%2918, %2919) : (!llvm.ptr, i64) -> i64
      %2921 = func.call @cc_intern(%2917, %2920) : (i64, i64) -> i64
      %2922 = func.call @cc_nil_value() : () -> i64
      %2923 = func.call @cc_cons(%2921, %2922) : (i64, i64) -> i64
      %2924 = func.call @cc_values_pack(%2923) : (i64) -> i64
      func.call @stack_push_pointer(%2921) : (i64) -> ()
      %2925 = llvm.mlir.addressof @str261 : !llvm.ptr
      %2926 = arith.constant 8 : i64
      %2927 = func.call @cc_make_string(%2925, %2926) : (!llvm.ptr, i64) -> i64
      %2928 = llvm.mlir.addressof @str262 : !llvm.ptr
      %2929 = arith.constant 11 : i64
      %2930 = func.call @cc_make_string(%2928, %2929) : (!llvm.ptr, i64) -> i64
      %2931 = func.call @cc_intern(%2927, %2930) : (i64, i64) -> i64
      %2932 = func.call @cc_nil_value() : () -> i64
      %2933 = func.call @cc_cons(%2931, %2932) : (i64, i64) -> i64
      %2934 = func.call @cc_values_pack(%2933) : (i64) -> i64
      func.call @stack_push_pointer(%2931) : (i64) -> ()
      %2935 = llvm.mlir.addressof @str263 : !llvm.ptr
      %2936 = arith.constant 9 : i64
      %2937 = func.call @cc_make_string(%2935, %2936) : (!llvm.ptr, i64) -> i64
      %2938 = llvm.mlir.addressof @str264 : !llvm.ptr
      %2939 = arith.constant 11 : i64
      %2940 = func.call @cc_make_string(%2938, %2939) : (!llvm.ptr, i64) -> i64
      %2941 = func.call @cc_intern(%2937, %2940) : (i64, i64) -> i64
      %2942 = func.call @cc_nil_value() : () -> i64
      %2943 = func.call @cc_cons(%2941, %2942) : (i64, i64) -> i64
      %2944 = func.call @cc_values_pack(%2943) : (i64) -> i64
      func.call @stack_push_pointer(%2941) : (i64) -> ()
      %2945 = llvm.mlir.addressof @str265 : !llvm.ptr
      %2946 = arith.constant 6 : i64
      %2947 = func.call @cc_make_string(%2945, %2946) : (!llvm.ptr, i64) -> i64
      %2948 = llvm.mlir.addressof @str266 : !llvm.ptr
      %2949 = arith.constant 11 : i64
      %2950 = func.call @cc_make_string(%2948, %2949) : (!llvm.ptr, i64) -> i64
      %2951 = func.call @cc_intern(%2947, %2950) : (i64, i64) -> i64
      %2952 = func.call @cc_nil_value() : () -> i64
      %2953 = func.call @cc_cons(%2951, %2952) : (i64, i64) -> i64
      %2954 = func.call @cc_values_pack(%2953) : (i64) -> i64
      func.call @stack_push_pointer(%2951) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %2955 = func.call @stack_pop_pointer() : () -> i64
      %2956 = func.call @stack_pop_pointer() : () -> i64
      %2957 = func.call @cc_cons(%2956, %2955) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2957) : (i64) -> ()
      %2958 = func.call @stack_pop_pointer() : () -> i64
      %2959 = func.call @stack_pop_pointer() : () -> i64
      %2960 = func.call @cc_cons(%2959, %2958) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2960) : (i64) -> ()
      %2961 = func.call @stack_pop_pointer() : () -> i64
      %2962 = func.call @stack_pop_pointer() : () -> i64
      %2963 = func.call @cc_cons(%2962, %2961) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2963) : (i64) -> ()
      %2964 = func.call @stack_pop_pointer() : () -> i64
      %2965 = func.call @stack_pop_pointer() : () -> i64
      %2966 = func.call @cc_cons(%2965, %2964) : (i64, i64) -> i64
      func.call @stack_push_pointer(%2966) : (i64) -> ()
      %2967 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %2968 = func.call @stack_pop_pointer() : () -> i64
      %2969 = func.call @cc_nil_value() : () -> i64
      %2970 = func.call @cc_nil_value() : () -> i64
      %2971 = func.call @cc_errorp(%2969) : (i64) -> i64
      %2972 = arith.cmpi ne, %2971, %2970 : i64
      %2973:4 = scf.if %2972 -> (i64, i64, i64, i64) {
        scf.yield %2969, %2967, %2968, %2914 : i64, i64, i64, i64
      } else {
        %2974 = func.call @cc_nil_value() : () -> i64
        %2975 = llvm.mlir.addressof @str267 : !llvm.ptr
        %2976 = arith.constant 38 : i64
        %2977 = func.call @cc_make_symbol(%2975, %2976) : (!llvm.ptr, i64) -> i64
        %2978 = func.call @cc_set_symbol_value(%2977, %2974) : (i64, i64) -> i64
        %2979 = llvm.mlir.addressof @str268 : !llvm.ptr
        %2980 = arith.constant 39 : i64
        %2981 = func.call @cc_make_symbol(%2979, %2980) : (!llvm.ptr, i64) -> i64
        %2982 = func.call @cc_set_symbol_value(%2981, %2974) : (i64, i64) -> i64
        %2983 = llvm.mlir.addressof @str269 : !llvm.ptr
        %2984 = arith.constant 40 : i64
        %2985 = func.call @cc_make_symbol(%2983, %2984) : (!llvm.ptr, i64) -> i64
        %2986 = func.call @cc_set_symbol_value(%2985, %2974) : (i64, i64) -> i64
        %2987:3 = scf.while (%arg0 = %2914, %arg1 = %2968, %arg2 = %2967) : (i64, i64, i64) -> (i64, i64, i64) {
          func.call @stack_push_pointer(%arg2) : (i64) -> ()
          %2988 = func.call @stack_pop_pointer() : () -> i64
          %2989 = func.call @cc_nil_value() : () -> i64
          %2990 = arith.cmpi ne, %2988, %2989 : i64
          scf.condition(%2990) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%2991: i64, %2992: i64, %2993: i64):
          %2994 = func.call @cc_nil_value() : () -> i64
          %2995 = func.call @cc_nil_value() : () -> i64
          %2996 = func.call @cc_errorp(%2994) : (i64) -> i64
          %2997 = arith.cmpi ne, %2996, %2995 : i64
          %2998:3 = scf.if %2997 -> (i64, i64, i64) {
            scf.yield %2994, %2992, %2991 : i64, i64, i64
          } else {
            %2999 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%2993) : (i64) -> ()
            %3000 = func.call @stack_pop_pointer() : () -> i64
            %3001 = func.call @cc_nil_value() : () -> i64
            %3002 = arith.cmpi eq, %3000, %3001 : i64
            %3004 = func.call @cc_t_value() : () -> i64
            %3003 = arith.select %3002, %3004, %3001 : i64
            func.call @stack_push_pointer(%3003) : (i64) -> ()
            %3005 = func.call @stack_pop_pointer() : () -> i64
            %3006 = func.call @cc_nil_value() : () -> i64
            %3007 = func.call @cc_cons(%3005, %3006) : (i64, i64) -> i64
            %3008 = func.call @cc_not(%3007) : (i64) -> i64
            func.call @stack_push_pointer(%3008) : (i64) -> ()
            %3009 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%2993) : (i64) -> ()
            %3010 = func.call @stack_pop_pointer() : () -> i64
            %3011 = func.call @cc_is_cons(%3010) : (i64) -> i32
            %3012 = arith.constant 0 : i32
            %3013 = arith.cmpi ne, %3011, %3012 : i32
            %3014 = func.call @cc_t_value() : () -> i64
            %3015 = func.call @cc_nil_value() : () -> i64
            %3016 = arith.select %3013, %3014, %3015 : i64
            func.call @stack_push_pointer(%3016) : (i64) -> ()
            %3017 = func.call @stack_pop_pointer() : () -> i64
            %3018 = func.call @cc_nil_value() : () -> i64
            %3019 = func.call @cc_cons(%3017, %3018) : (i64, i64) -> i64
            %3020 = func.call @cc_not(%3019) : (i64) -> i64
            func.call @stack_push_pointer(%3020) : (i64) -> ()
            %3021 = func.call @stack_pop_pointer() : () -> i64
            %3022 = func.call @cc_cons(%3021, %2999) : (i64, i64) -> i64
            %3023 = func.call @cc_cons(%3009, %3022) : (i64, i64) -> i64
            %3024 = func.call @cc_and(%3023) : (i64) -> i64
            func.call @stack_push_pointer(%3024) : (i64) -> ()
            %3025 = func.call @stack_pop_pointer() : () -> i64
            %3026 = func.call @cc_nil_value() : () -> i64
            %3027 = arith.cmpi ne, %3025, %3026 : i64
            scf.if %3027 {
              %3028 = llvm.mlir.addressof @str270 : !llvm.ptr
              %3029 = arith.constant 10 : i64
              %3030 = func.call @cc_make_string(%3028, %3029) : (!llvm.ptr, i64) -> i64
              %3031 = func.call @cc_nil_value() : () -> i64
              %3032 = func.call @cc_intern(%3030, %3031) : (i64, i64) -> i64
              %3033 = func.call @cc_nil_value() : () -> i64
              %3034 = func.call @cc_cons(%3032, %3033) : (i64, i64) -> i64
              %3035 = func.call @cc_values_pack(%3034) : (i64) -> i64
              func.call @stack_push_pointer(%3032) : (i64) -> ()
              %3036 = func.call @stack_pop_pointer() : () -> i64
              %3037 = func.call @cc_nil_value() : () -> i64
              %3038 = func.call @cc_errorp(%3036) : (i64) -> i64
              %3039 = arith.cmpi ne, %3038, %3037 : i64
              %3040 = arith.cmpi eq, %3037, %3037 : i64
              %3041 = arith.andi %3039, %3040 : i1
              %3042 = scf.if %3041 -> (i64) {
                scf.yield %3036 : i64
              } else {
                scf.yield %3037 : i64
              }
              %3043 = arith.cmpi ne, %3042, %3037 : i64
              scf.if %3043 {
                func.call @stack_push_pointer(%3042) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%3036) : (i64) -> ()
                %3044 = llvm.mlir.addressof @str271 : !llvm.ptr
                %3045 = func.call @cc_make_function_ref_const(%3044) : (!llvm.ptr) -> i64
                %3046 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%3045, %3046) : (i64, i64) -> ()
              }
              %3047 = func.call @stack_pop_pointer() : () -> i64
              %3048 = func.call @cc_multiple_value_list(%3047) : (i64) -> i64
              %3049 = func.call @cc_t_value() : () -> i64
              %3050 = llvm.mlir.addressof @str272 : !llvm.ptr
              %3051 = arith.constant 38 : i64
              %3052 = func.call @cc_make_symbol(%3050, %3051) : (!llvm.ptr, i64) -> i64
              %3053 = func.call @cc_set_symbol_value(%3052, %3049) : (i64, i64) -> i64
              %3054 = llvm.mlir.addressof @str273 : !llvm.ptr
              %3055 = arith.constant 39 : i64
              %3056 = func.call @cc_make_symbol(%3054, %3055) : (!llvm.ptr, i64) -> i64
              %3057 = func.call @cc_set_symbol_value(%3056, %3047) : (i64, i64) -> i64
              %3058 = llvm.mlir.addressof @str274 : !llvm.ptr
              %3059 = arith.constant 40 : i64
              %3060 = func.call @cc_make_symbol(%3058, %3059) : (!llvm.ptr, i64) -> i64
              %3061 = func.call @cc_set_symbol_value(%3060, %3048) : (i64, i64) -> i64
              func.call @stack_push_pointer(%3047) : (i64) -> ()
            } else {
              func.call @stack_push_nil() : () -> ()
            }
            %3062 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3062, %2992, %2991 : i64, i64, i64
          }
          %3063 = func.call @cc_nil_value() : () -> i64
          %3064 = func.call @cc_errorp(%2998#0) : (i64) -> i64
          %3065 = arith.cmpi ne, %3064, %3063 : i64
          %3066:3 = scf.if %3065 -> (i64, i64, i64) {
            scf.yield %2998#0, %2998#1, %2998#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%2993) : (i64) -> ()
            %3067 = func.call @stack_pop_pointer() : () -> i64
            %3068 = func.call @cc_car(%3067) : (i64) -> i64
            func.call @stack_push_pointer(%3068) : (i64) -> ()
            %3069 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3069) : (i64) -> ()
            %3070 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3070, %2998#1, %3069 : i64, i64, i64
          }
          %3071 = func.call @cc_nil_value() : () -> i64
          %3072 = func.call @cc_errorp(%3066#0) : (i64) -> i64
          %3073 = arith.cmpi ne, %3072, %3071 : i64
          %3074:3 = scf.if %3073 -> (i64, i64, i64) {
            scf.yield %3066#0, %3066#1, %3066#2 : i64, i64, i64
          } else {
            func.call @stack_push_pointer(%3066#1) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3075 = func.call @stack_pop_pointer() : () -> i64
            %3076 = arith.constant 3 : i64
            func.call @stack_push_fixnum(%3076) : (i64) -> ()
            %3077 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%3077) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3078 = func.call @stack_pop_pointer() : () -> i64
            %3079 = func.call @stack_pop_pointer() : () -> i64
            %3080 = func.call @cc_cons(%3079, %3078) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3080) : (i64) -> ()
            %3081 = func.call @stack_pop_pointer() : () -> i64
            %3082 = func.call @stack_pop_pointer() : () -> i64
            %3083 = func.call @cc_cons(%3082, %3081) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3083) : (i64) -> ()
            %3084 = arith.constant 3 : i64
            func.call @stack_push_fixnum(%3084) : (i64) -> ()
            %3085 = llvm.mlir.addressof @str275 : !llvm.ptr
            %3086 = arith.constant 1 : i64
            %3087 = func.call @cc_parse_bignum(%3085, %3086) : (!llvm.ptr, i64) -> i64
            %3088 = llvm.mlir.addressof @str276 : !llvm.ptr
            %3089 = arith.constant 1 : i64
            %3090 = func.call @cc_parse_bignum(%3088, %3089) : (!llvm.ptr, i64) -> i64
            %3091 = func.call @cc_ratio(%3087, %3090) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3091) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3092 = func.call @stack_pop_pointer() : () -> i64
            %3093 = func.call @stack_pop_pointer() : () -> i64
            %3094 = func.call @cc_cons(%3093, %3092) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3094) : (i64) -> ()
            %3095 = func.call @stack_pop_pointer() : () -> i64
            %3096 = func.call @stack_pop_pointer() : () -> i64
            %3097 = func.call @cc_cons(%3096, %3095) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3097) : (i64) -> ()
            %3098 = llvm.mlir.addressof @str277 : !llvm.ptr
            %3099 = arith.constant 2 : i64
            %3100 = func.call @cc_parse_bignum(%3098, %3099) : (!llvm.ptr, i64) -> i64
            %3101 = llvm.mlir.addressof @str278 : !llvm.ptr
            %3102 = arith.constant 2 : i64
            %3103 = func.call @cc_parse_bignum(%3101, %3102) : (!llvm.ptr, i64) -> i64
            %3104 = func.call @cc_ratio(%3100, %3103) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3104) : (i64) -> ()
            %3105 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%3105) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3106 = func.call @stack_pop_pointer() : () -> i64
            %3107 = func.call @stack_pop_pointer() : () -> i64
            %3108 = func.call @cc_cons(%3107, %3106) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3108) : (i64) -> ()
            %3109 = func.call @stack_pop_pointer() : () -> i64
            %3110 = func.call @stack_pop_pointer() : () -> i64
            %3111 = func.call @cc_cons(%3110, %3109) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3111) : (i64) -> ()
            %3112 = arith.constant 3.0 : f64
            %3113 = func.call @cc_box_single_float(%3112) : (f64) -> i64
            func.call @stack_push_pointer(%3113) : (i64) -> ()
            %3114 = arith.constant 2 : i64
            func.call @stack_push_fixnum(%3114) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3115 = func.call @stack_pop_pointer() : () -> i64
            %3116 = func.call @stack_pop_pointer() : () -> i64
            %3117 = func.call @cc_cons(%3116, %3115) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3117) : (i64) -> ()
            %3118 = func.call @stack_pop_pointer() : () -> i64
            %3119 = func.call @stack_pop_pointer() : () -> i64
            %3120 = func.call @cc_cons(%3119, %3118) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3120) : (i64) -> ()
            %3121 = arith.constant 3 : i64
            func.call @stack_push_fixnum(%3121) : (i64) -> ()
            %3122 = arith.constant 2.0 : f64
            %3123 = func.call @cc_box_single_float(%3122) : (f64) -> i64
            func.call @stack_push_pointer(%3123) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3124 = func.call @stack_pop_pointer() : () -> i64
            %3125 = func.call @stack_pop_pointer() : () -> i64
            %3126 = func.call @cc_cons(%3125, %3124) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3126) : (i64) -> ()
            %3127 = func.call @stack_pop_pointer() : () -> i64
            %3128 = func.call @stack_pop_pointer() : () -> i64
            %3129 = func.call @cc_cons(%3128, %3127) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3129) : (i64) -> ()
            %3130 = arith.constant 3.0 : f64
            %3131 = func.call @cc_box_single_float(%3130) : (f64) -> i64
            func.call @stack_push_pointer(%3131) : (i64) -> ()
            %3132 = llvm.mlir.addressof @str279 : !llvm.ptr
            %3133 = arith.constant 1 : i64
            %3134 = func.call @cc_parse_bignum(%3132, %3133) : (!llvm.ptr, i64) -> i64
            %3135 = llvm.mlir.addressof @str280 : !llvm.ptr
            %3136 = arith.constant 1 : i64
            %3137 = func.call @cc_parse_bignum(%3135, %3136) : (!llvm.ptr, i64) -> i64
            %3138 = func.call @cc_ratio(%3134, %3137) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3138) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3139 = func.call @stack_pop_pointer() : () -> i64
            %3140 = func.call @stack_pop_pointer() : () -> i64
            %3141 = func.call @cc_cons(%3140, %3139) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3141) : (i64) -> ()
            %3142 = func.call @stack_pop_pointer() : () -> i64
            %3143 = func.call @stack_pop_pointer() : () -> i64
            %3144 = func.call @cc_cons(%3143, %3142) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3144) : (i64) -> ()
            %3145 = llvm.mlir.addressof @str281 : !llvm.ptr
            %3146 = arith.constant 2 : i64
            %3147 = func.call @cc_parse_bignum(%3145, %3146) : (!llvm.ptr, i64) -> i64
            %3148 = llvm.mlir.addressof @str282 : !llvm.ptr
            %3149 = arith.constant 2 : i64
            %3150 = func.call @cc_parse_bignum(%3148, %3149) : (!llvm.ptr, i64) -> i64
            %3151 = func.call @cc_ratio(%3147, %3150) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3151) : (i64) -> ()
            %3152 = arith.constant 2.0 : f64
            %3153 = func.call @cc_box_single_float(%3152) : (f64) -> i64
            func.call @stack_push_pointer(%3153) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3154 = func.call @stack_pop_pointer() : () -> i64
            %3155 = func.call @stack_pop_pointer() : () -> i64
            %3156 = func.call @cc_cons(%3155, %3154) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3156) : (i64) -> ()
            %3157 = func.call @stack_pop_pointer() : () -> i64
            %3158 = func.call @stack_pop_pointer() : () -> i64
            %3159 = func.call @cc_cons(%3158, %3157) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3159) : (i64) -> ()
            %3160 = arith.constant 3.0 : f64
            %3161 = func.call @cc_box_single_float(%3160) : (f64) -> i64
            func.call @stack_push_pointer(%3161) : (i64) -> ()
            %3162 = arith.constant 2.0 : f64
            %3163 = func.call @cc_box_float(%3162) : (f64) -> i64
            func.call @stack_push_pointer(%3163) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3164 = func.call @stack_pop_pointer() : () -> i64
            %3165 = func.call @stack_pop_pointer() : () -> i64
            %3166 = func.call @cc_cons(%3165, %3164) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3166) : (i64) -> ()
            %3167 = func.call @stack_pop_pointer() : () -> i64
            %3168 = func.call @stack_pop_pointer() : () -> i64
            %3169 = func.call @cc_cons(%3168, %3167) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3169) : (i64) -> ()
            %3170 = arith.constant 3.0 : f64
            %3171 = func.call @cc_box_float(%3170) : (f64) -> i64
            func.call @stack_push_pointer(%3171) : (i64) -> ()
            %3172 = arith.constant 2.0 : f64
            %3173 = func.call @cc_box_single_float(%3172) : (f64) -> i64
            func.call @stack_push_pointer(%3173) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3174 = func.call @stack_pop_pointer() : () -> i64
            %3175 = func.call @stack_pop_pointer() : () -> i64
            %3176 = func.call @cc_cons(%3175, %3174) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3176) : (i64) -> ()
            %3177 = func.call @stack_pop_pointer() : () -> i64
            %3178 = func.call @stack_pop_pointer() : () -> i64
            %3179 = func.call @cc_cons(%3178, %3177) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3179) : (i64) -> ()
            %3180 = arith.constant 3.0 : f64
            %3181 = func.call @cc_box_float(%3180) : (f64) -> i64
            func.call @stack_push_pointer(%3181) : (i64) -> ()
            %3182 = arith.constant 2.0 : f64
            %3183 = func.call @cc_box_float(%3182) : (f64) -> i64
            func.call @stack_push_pointer(%3183) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3184 = func.call @stack_pop_pointer() : () -> i64
            %3185 = func.call @stack_pop_pointer() : () -> i64
            %3186 = func.call @cc_cons(%3185, %3184) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3186) : (i64) -> ()
            %3187 = func.call @stack_pop_pointer() : () -> i64
            %3188 = func.call @stack_pop_pointer() : () -> i64
            %3189 = func.call @cc_cons(%3188, %3187) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3189) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3190 = func.call @stack_pop_pointer() : () -> i64
            %3191 = func.call @stack_pop_pointer() : () -> i64
            %3192 = func.call @cc_cons(%3191, %3190) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3192) : (i64) -> ()
            %3193 = func.call @stack_pop_pointer() : () -> i64
            %3194 = func.call @stack_pop_pointer() : () -> i64
            %3195 = func.call @cc_cons(%3194, %3193) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3195) : (i64) -> ()
            %3196 = func.call @stack_pop_pointer() : () -> i64
            %3197 = func.call @stack_pop_pointer() : () -> i64
            %3198 = func.call @cc_cons(%3197, %3196) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3198) : (i64) -> ()
            %3199 = func.call @stack_pop_pointer() : () -> i64
            %3200 = func.call @stack_pop_pointer() : () -> i64
            %3201 = func.call @cc_cons(%3200, %3199) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3201) : (i64) -> ()
            %3202 = func.call @stack_pop_pointer() : () -> i64
            %3203 = func.call @stack_pop_pointer() : () -> i64
            %3204 = func.call @cc_cons(%3203, %3202) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3204) : (i64) -> ()
            %3205 = func.call @stack_pop_pointer() : () -> i64
            %3206 = func.call @stack_pop_pointer() : () -> i64
            %3207 = func.call @cc_cons(%3206, %3205) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3207) : (i64) -> ()
            %3208 = func.call @stack_pop_pointer() : () -> i64
            %3209 = func.call @stack_pop_pointer() : () -> i64
            %3210 = func.call @cc_cons(%3209, %3208) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3210) : (i64) -> ()
            %3211 = func.call @stack_pop_pointer() : () -> i64
            %3212 = func.call @stack_pop_pointer() : () -> i64
            %3213 = func.call @cc_cons(%3212, %3211) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3213) : (i64) -> ()
            %3214 = func.call @stack_pop_pointer() : () -> i64
            %3215 = func.call @stack_pop_pointer() : () -> i64
            %3216 = func.call @cc_cons(%3215, %3214) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3216) : (i64) -> ()
            %3217 = func.call @stack_pop_pointer() : () -> i64
            %3218 = func.call @stack_pop_pointer() : () -> i64
            %3219 = func.call @cc_cons(%3218, %3217) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3219) : (i64) -> ()
            %3220 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %3221 = func.call @stack_pop_pointer() : () -> i64
            %3222 = llvm.mlir.addressof @str283 : !llvm.ptr
            %3223 = arith.constant 12 : i64
            %3224 = func.call @cc_make_string(%3222, %3223) : (!llvm.ptr, i64) -> i64
            %3225 = llvm.mlir.addressof @str284 : !llvm.ptr
            %3226 = arith.constant 11 : i64
            %3227 = func.call @cc_make_string(%3225, %3226) : (!llvm.ptr, i64) -> i64
            %3228 = func.call @cc_intern(%3224, %3227) : (i64, i64) -> i64
            %3229 = func.call @cc_nil_value() : () -> i64
            %3230 = func.call @cc_cons(%3228, %3229) : (i64, i64) -> i64
            %3231 = func.call @cc_values_pack(%3230) : (i64) -> i64
            func.call @stack_push_pointer(%3228) : (i64) -> ()
            %3232 = llvm.mlir.addressof @str285 : !llvm.ptr
            %3233 = arith.constant 12 : i64
            %3234 = func.call @cc_make_string(%3232, %3233) : (!llvm.ptr, i64) -> i64
            %3235 = llvm.mlir.addressof @str286 : !llvm.ptr
            %3236 = arith.constant 11 : i64
            %3237 = func.call @cc_make_string(%3235, %3236) : (!llvm.ptr, i64) -> i64
            %3238 = func.call @cc_intern(%3234, %3237) : (i64, i64) -> i64
            %3239 = func.call @cc_nil_value() : () -> i64
            %3240 = func.call @cc_cons(%3238, %3239) : (i64, i64) -> i64
            %3241 = func.call @cc_values_pack(%3240) : (i64) -> i64
            func.call @stack_push_pointer(%3238) : (i64) -> ()
            %3242 = llvm.mlir.addressof @str287 : !llvm.ptr
            %3243 = arith.constant 12 : i64
            %3244 = func.call @cc_make_string(%3242, %3243) : (!llvm.ptr, i64) -> i64
            %3245 = llvm.mlir.addressof @str288 : !llvm.ptr
            %3246 = arith.constant 11 : i64
            %3247 = func.call @cc_make_string(%3245, %3246) : (!llvm.ptr, i64) -> i64
            %3248 = func.call @cc_intern(%3244, %3247) : (i64, i64) -> i64
            %3249 = func.call @cc_nil_value() : () -> i64
            %3250 = func.call @cc_cons(%3248, %3249) : (i64, i64) -> i64
            %3251 = func.call @cc_values_pack(%3250) : (i64) -> i64
            func.call @stack_push_pointer(%3248) : (i64) -> ()
            %3252 = llvm.mlir.addressof @str289 : !llvm.ptr
            %3253 = arith.constant 12 : i64
            %3254 = func.call @cc_make_string(%3252, %3253) : (!llvm.ptr, i64) -> i64
            %3255 = llvm.mlir.addressof @str290 : !llvm.ptr
            %3256 = arith.constant 11 : i64
            %3257 = func.call @cc_make_string(%3255, %3256) : (!llvm.ptr, i64) -> i64
            %3258 = func.call @cc_intern(%3254, %3257) : (i64, i64) -> i64
            %3259 = func.call @cc_nil_value() : () -> i64
            %3260 = func.call @cc_cons(%3258, %3259) : (i64, i64) -> i64
            %3261 = func.call @cc_values_pack(%3260) : (i64) -> i64
            func.call @stack_push_pointer(%3258) : (i64) -> ()
            %3262 = llvm.mlir.addressof @str291 : !llvm.ptr
            %3263 = arith.constant 12 : i64
            %3264 = func.call @cc_make_string(%3262, %3263) : (!llvm.ptr, i64) -> i64
            %3265 = llvm.mlir.addressof @str292 : !llvm.ptr
            %3266 = arith.constant 11 : i64
            %3267 = func.call @cc_make_string(%3265, %3266) : (!llvm.ptr, i64) -> i64
            %3268 = func.call @cc_intern(%3264, %3267) : (i64, i64) -> i64
            %3269 = func.call @cc_nil_value() : () -> i64
            %3270 = func.call @cc_cons(%3268, %3269) : (i64, i64) -> i64
            %3271 = func.call @cc_values_pack(%3270) : (i64) -> i64
            func.call @stack_push_pointer(%3268) : (i64) -> ()
            %3272 = llvm.mlir.addressof @str293 : !llvm.ptr
            %3273 = arith.constant 12 : i64
            %3274 = func.call @cc_make_string(%3272, %3273) : (!llvm.ptr, i64) -> i64
            %3275 = llvm.mlir.addressof @str294 : !llvm.ptr
            %3276 = arith.constant 11 : i64
            %3277 = func.call @cc_make_string(%3275, %3276) : (!llvm.ptr, i64) -> i64
            %3278 = func.call @cc_intern(%3274, %3277) : (i64, i64) -> i64
            %3279 = func.call @cc_nil_value() : () -> i64
            %3280 = func.call @cc_cons(%3278, %3279) : (i64, i64) -> i64
            %3281 = func.call @cc_values_pack(%3280) : (i64) -> i64
            func.call @stack_push_pointer(%3278) : (i64) -> ()
            %3282 = llvm.mlir.addressof @str295 : !llvm.ptr
            %3283 = arith.constant 12 : i64
            %3284 = func.call @cc_make_string(%3282, %3283) : (!llvm.ptr, i64) -> i64
            %3285 = llvm.mlir.addressof @str296 : !llvm.ptr
            %3286 = arith.constant 11 : i64
            %3287 = func.call @cc_make_string(%3285, %3286) : (!llvm.ptr, i64) -> i64
            %3288 = func.call @cc_intern(%3284, %3287) : (i64, i64) -> i64
            %3289 = func.call @cc_nil_value() : () -> i64
            %3290 = func.call @cc_cons(%3288, %3289) : (i64, i64) -> i64
            %3291 = func.call @cc_values_pack(%3290) : (i64) -> i64
            func.call @stack_push_pointer(%3288) : (i64) -> ()
            %3292 = llvm.mlir.addressof @str297 : !llvm.ptr
            %3293 = arith.constant 12 : i64
            %3294 = func.call @cc_make_string(%3292, %3293) : (!llvm.ptr, i64) -> i64
            %3295 = llvm.mlir.addressof @str298 : !llvm.ptr
            %3296 = arith.constant 11 : i64
            %3297 = func.call @cc_make_string(%3295, %3296) : (!llvm.ptr, i64) -> i64
            %3298 = func.call @cc_intern(%3294, %3297) : (i64, i64) -> i64
            %3299 = func.call @cc_nil_value() : () -> i64
            %3300 = func.call @cc_cons(%3298, %3299) : (i64, i64) -> i64
            %3301 = func.call @cc_values_pack(%3300) : (i64) -> i64
            func.call @stack_push_pointer(%3298) : (i64) -> ()
            %3302 = llvm.mlir.addressof @str299 : !llvm.ptr
            %3303 = arith.constant 12 : i64
            %3304 = func.call @cc_make_string(%3302, %3303) : (!llvm.ptr, i64) -> i64
            %3305 = llvm.mlir.addressof @str300 : !llvm.ptr
            %3306 = arith.constant 11 : i64
            %3307 = func.call @cc_make_string(%3305, %3306) : (!llvm.ptr, i64) -> i64
            %3308 = func.call @cc_intern(%3304, %3307) : (i64, i64) -> i64
            %3309 = func.call @cc_nil_value() : () -> i64
            %3310 = func.call @cc_cons(%3308, %3309) : (i64, i64) -> i64
            %3311 = func.call @cc_values_pack(%3310) : (i64) -> i64
            func.call @stack_push_pointer(%3308) : (i64) -> ()
            %3312 = llvm.mlir.addressof @str301 : !llvm.ptr
            %3313 = arith.constant 12 : i64
            %3314 = func.call @cc_make_string(%3312, %3313) : (!llvm.ptr, i64) -> i64
            %3315 = llvm.mlir.addressof @str302 : !llvm.ptr
            %3316 = arith.constant 11 : i64
            %3317 = func.call @cc_make_string(%3315, %3316) : (!llvm.ptr, i64) -> i64
            %3318 = func.call @cc_intern(%3314, %3317) : (i64, i64) -> i64
            %3319 = func.call @cc_nil_value() : () -> i64
            %3320 = func.call @cc_cons(%3318, %3319) : (i64, i64) -> i64
            %3321 = func.call @cc_values_pack(%3320) : (i64) -> i64
            func.call @stack_push_pointer(%3318) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %3322 = func.call @stack_pop_pointer() : () -> i64
            %3323 = func.call @stack_pop_pointer() : () -> i64
            %3324 = func.call @cc_cons(%3323, %3322) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3324) : (i64) -> ()
            %3325 = func.call @stack_pop_pointer() : () -> i64
            %3326 = func.call @stack_pop_pointer() : () -> i64
            %3327 = func.call @cc_cons(%3326, %3325) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3327) : (i64) -> ()
            %3328 = func.call @stack_pop_pointer() : () -> i64
            %3329 = func.call @stack_pop_pointer() : () -> i64
            %3330 = func.call @cc_cons(%3329, %3328) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3330) : (i64) -> ()
            %3331 = func.call @stack_pop_pointer() : () -> i64
            %3332 = func.call @stack_pop_pointer() : () -> i64
            %3333 = func.call @cc_cons(%3332, %3331) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3333) : (i64) -> ()
            %3334 = func.call @stack_pop_pointer() : () -> i64
            %3335 = func.call @stack_pop_pointer() : () -> i64
            %3336 = func.call @cc_cons(%3335, %3334) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3336) : (i64) -> ()
            %3337 = func.call @stack_pop_pointer() : () -> i64
            %3338 = func.call @stack_pop_pointer() : () -> i64
            %3339 = func.call @cc_cons(%3338, %3337) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3339) : (i64) -> ()
            %3340 = func.call @stack_pop_pointer() : () -> i64
            %3341 = func.call @stack_pop_pointer() : () -> i64
            %3342 = func.call @cc_cons(%3341, %3340) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3342) : (i64) -> ()
            %3343 = func.call @stack_pop_pointer() : () -> i64
            %3344 = func.call @stack_pop_pointer() : () -> i64
            %3345 = func.call @cc_cons(%3344, %3343) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3345) : (i64) -> ()
            %3346 = func.call @stack_pop_pointer() : () -> i64
            %3347 = func.call @stack_pop_pointer() : () -> i64
            %3348 = func.call @cc_cons(%3347, %3346) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3348) : (i64) -> ()
            %3349 = func.call @stack_pop_pointer() : () -> i64
            %3350 = func.call @stack_pop_pointer() : () -> i64
            %3351 = func.call @cc_cons(%3350, %3349) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3351) : (i64) -> ()
            %3352 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_nil() : () -> ()
            %3353 = func.call @stack_pop_pointer() : () -> i64
            %3354 = func.call @cc_nil_value() : () -> i64
            %3355 = func.call @cc_nil_value() : () -> i64
            %3356 = func.call @cc_errorp(%3354) : (i64) -> i64
            %3357 = arith.cmpi ne, %3356, %3355 : i64
            %3358 = scf.if %3357 -> (i64) {
              scf.yield %3354 : i64
            } else {
              %3359 = func.call @cc_nil_value() : () -> i64
              %3360 = llvm.mlir.addressof @str303 : !llvm.ptr
              %3361 = arith.constant 38 : i64
              %3362 = func.call @cc_make_symbol(%3360, %3361) : (!llvm.ptr, i64) -> i64
              %3363 = func.call @cc_set_symbol_value(%3362, %3359) : (i64, i64) -> i64
              %3364 = llvm.mlir.addressof @str304 : !llvm.ptr
              %3365 = arith.constant 39 : i64
              %3366 = func.call @cc_make_symbol(%3364, %3365) : (!llvm.ptr, i64) -> i64
              %3367 = func.call @cc_set_symbol_value(%3366, %3359) : (i64, i64) -> i64
              %3368 = llvm.mlir.addressof @str305 : !llvm.ptr
              %3369 = arith.constant 40 : i64
              %3370 = func.call @cc_make_symbol(%3368, %3369) : (!llvm.ptr, i64) -> i64
              %3371 = func.call @cc_set_symbol_value(%3370, %3359) : (i64, i64) -> i64
              %3372:5 = scf.while (%arg0 = %3075, %arg1 = %3221, %arg2 = %3353, %arg3 = %3352, %arg4 = %3220) : (i64, i64, i64, i64, i64) -> (i64, i64, i64, i64, i64) {
                %3373 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%arg4) : (i64) -> ()
                %3374 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%arg3) : (i64) -> ()
                %3375 = func.call @stack_pop_pointer() : () -> i64
                %3376 = func.call @cc_cons(%3375, %3373) : (i64, i64) -> i64
                %3377 = func.call @cc_cons(%3374, %3376) : (i64, i64) -> i64
                %3378 = func.call @cc_and(%3377) : (i64) -> i64
                func.call @stack_push_pointer(%3378) : (i64) -> ()
                %3379 = func.call @stack_pop_pointer() : () -> i64
                %3380 = func.call @cc_nil_value() : () -> i64
                %3381 = arith.cmpi ne, %3379, %3380 : i64
                scf.condition(%3381) %arg0, %arg1, %arg2, %arg3, %arg4 : i64, i64, i64, i64, i64
              } do {
                ^bb0(%3382: i64, %3383: i64, %3384: i64, %3385: i64, %3386: i64):
                %3387 = func.call @cc_nil_value() : () -> i64
                %3388 = func.call @cc_nil_value() : () -> i64
                %3389 = func.call @cc_errorp(%3387) : (i64) -> i64
                %3390 = arith.cmpi ne, %3389, %3388 : i64
                %3391:4 = scf.if %3390 -> (i64, i64, i64, i64) {
                  scf.yield %3387, %3384, %3382, %3383 : i64, i64, i64, i64
                } else {
                  %3392 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%3386) : (i64) -> ()
                  %3393 = func.call @stack_pop_pointer() : () -> i64
                  %3394 = func.call @cc_nil_value() : () -> i64
                  %3395 = arith.cmpi eq, %3393, %3394 : i64
                  %3397 = func.call @cc_t_value() : () -> i64
                  %3396 = arith.select %3395, %3397, %3394 : i64
                  func.call @stack_push_pointer(%3396) : (i64) -> ()
                  %3398 = func.call @stack_pop_pointer() : () -> i64
                  %3399 = func.call @cc_nil_value() : () -> i64
                  %3400 = func.call @cc_cons(%3398, %3399) : (i64, i64) -> i64
                  %3401 = func.call @cc_not(%3400) : (i64) -> i64
                  func.call @stack_push_pointer(%3401) : (i64) -> ()
                  %3402 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%3386) : (i64) -> ()
                  %3403 = func.call @stack_pop_pointer() : () -> i64
                  %3404 = func.call @cc_is_cons(%3403) : (i64) -> i32
                  %3405 = arith.constant 0 : i32
                  %3406 = arith.cmpi ne, %3404, %3405 : i32
                  %3407 = func.call @cc_t_value() : () -> i64
                  %3408 = func.call @cc_nil_value() : () -> i64
                  %3409 = arith.select %3406, %3407, %3408 : i64
                  func.call @stack_push_pointer(%3409) : (i64) -> ()
                  %3410 = func.call @stack_pop_pointer() : () -> i64
                  %3411 = func.call @cc_nil_value() : () -> i64
                  %3412 = func.call @cc_cons(%3410, %3411) : (i64, i64) -> i64
                  %3413 = func.call @cc_not(%3412) : (i64) -> i64
                  func.call @stack_push_pointer(%3413) : (i64) -> ()
                  %3414 = func.call @stack_pop_pointer() : () -> i64
                  %3415 = func.call @cc_cons(%3414, %3392) : (i64, i64) -> i64
                  %3416 = func.call @cc_cons(%3402, %3415) : (i64, i64) -> i64
                  %3417 = func.call @cc_and(%3416) : (i64) -> i64
                  func.call @stack_push_pointer(%3417) : (i64) -> ()
                  %3418 = func.call @stack_pop_pointer() : () -> i64
                  %3419 = func.call @cc_nil_value() : () -> i64
                  %3420 = arith.cmpi ne, %3418, %3419 : i64
                  scf.if %3420 {
                    %3421 = llvm.mlir.addressof @str306 : !llvm.ptr
                    %3422 = arith.constant 10 : i64
                    %3423 = func.call @cc_make_string(%3421, %3422) : (!llvm.ptr, i64) -> i64
                    %3424 = func.call @cc_nil_value() : () -> i64
                    %3425 = func.call @cc_intern(%3423, %3424) : (i64, i64) -> i64
                    %3426 = func.call @cc_nil_value() : () -> i64
                    %3427 = func.call @cc_cons(%3425, %3426) : (i64, i64) -> i64
                    %3428 = func.call @cc_values_pack(%3427) : (i64) -> i64
                    func.call @stack_push_pointer(%3425) : (i64) -> ()
                    %3429 = func.call @stack_pop_pointer() : () -> i64
                    %3430 = func.call @cc_nil_value() : () -> i64
                    %3431 = func.call @cc_errorp(%3429) : (i64) -> i64
                    %3432 = arith.cmpi ne, %3431, %3430 : i64
                    %3433 = arith.cmpi eq, %3430, %3430 : i64
                    %3434 = arith.andi %3432, %3433 : i1
                    %3435 = scf.if %3434 -> (i64) {
                      scf.yield %3429 : i64
                    } else {
                      scf.yield %3430 : i64
                    }
                    %3436 = arith.cmpi ne, %3435, %3430 : i64
                    scf.if %3436 {
                      func.call @stack_push_pointer(%3435) : (i64) -> ()
                    } else {
                      func.call @stack_push_pointer(%3429) : (i64) -> ()
                      %3437 = llvm.mlir.addressof @str307 : !llvm.ptr
                      %3438 = func.call @cc_make_function_ref_const(%3437) : (!llvm.ptr) -> i64
                      %3439 = arith.constant 1 : i64
                      func.call @cc_funcall_stack(%3438, %3439) : (i64, i64) -> ()
                    }
                    %3440 = func.call @stack_pop_pointer() : () -> i64
                    %3441 = func.call @cc_multiple_value_list(%3440) : (i64) -> i64
                    %3442 = func.call @cc_t_value() : () -> i64
                    %3443 = llvm.mlir.addressof @str308 : !llvm.ptr
                    %3444 = arith.constant 38 : i64
                    %3445 = func.call @cc_make_symbol(%3443, %3444) : (!llvm.ptr, i64) -> i64
                    %3446 = func.call @cc_set_symbol_value(%3445, %3442) : (i64, i64) -> i64
                    %3447 = llvm.mlir.addressof @str309 : !llvm.ptr
                    %3448 = arith.constant 39 : i64
                    %3449 = func.call @cc_make_symbol(%3447, %3448) : (!llvm.ptr, i64) -> i64
                    %3450 = func.call @cc_set_symbol_value(%3449, %3440) : (i64, i64) -> i64
                    %3451 = llvm.mlir.addressof @str310 : !llvm.ptr
                    %3452 = arith.constant 40 : i64
                    %3453 = func.call @cc_make_symbol(%3451, %3452) : (!llvm.ptr, i64) -> i64
                    %3454 = func.call @cc_set_symbol_value(%3453, %3441) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%3440) : (i64) -> ()
                  } else {
                    func.call @stack_push_nil() : () -> ()
                  }
                  %3455 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %3455, %3384, %3382, %3383 : i64, i64, i64, i64
                }
                %3456 = func.call @cc_nil_value() : () -> i64
                %3457 = func.call @cc_errorp(%3391#0) : (i64) -> i64
                %3458 = arith.cmpi ne, %3457, %3456 : i64
                %3459:4 = scf.if %3458 -> (i64, i64, i64, i64) {
                  scf.yield %3391#0, %3391#1, %3391#2, %3391#3 : i64, i64, i64, i64
                } else {
                  %3460 = func.call @cc_nil_value() : () -> i64
                  func.call @stack_push_pointer(%3385) : (i64) -> ()
                  %3461 = func.call @stack_pop_pointer() : () -> i64
                  %3462 = func.call @cc_nil_value() : () -> i64
                  %3463 = arith.cmpi eq, %3461, %3462 : i64
                  %3465 = func.call @cc_t_value() : () -> i64
                  %3464 = arith.select %3463, %3465, %3462 : i64
                  func.call @stack_push_pointer(%3464) : (i64) -> ()
                  %3466 = func.call @stack_pop_pointer() : () -> i64
                  %3467 = func.call @cc_nil_value() : () -> i64
                  %3468 = func.call @cc_cons(%3466, %3467) : (i64, i64) -> i64
                  %3469 = func.call @cc_not(%3468) : (i64) -> i64
                  func.call @stack_push_pointer(%3469) : (i64) -> ()
                  %3470 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%3385) : (i64) -> ()
                  %3471 = func.call @stack_pop_pointer() : () -> i64
                  %3472 = func.call @cc_is_cons(%3471) : (i64) -> i32
                  %3473 = arith.constant 0 : i32
                  %3474 = arith.cmpi ne, %3472, %3473 : i32
                  %3475 = func.call @cc_t_value() : () -> i64
                  %3476 = func.call @cc_nil_value() : () -> i64
                  %3477 = arith.select %3474, %3475, %3476 : i64
                  func.call @stack_push_pointer(%3477) : (i64) -> ()
                  %3478 = func.call @stack_pop_pointer() : () -> i64
                  %3479 = func.call @cc_nil_value() : () -> i64
                  %3480 = func.call @cc_cons(%3478, %3479) : (i64, i64) -> i64
                  %3481 = func.call @cc_not(%3480) : (i64) -> i64
                  func.call @stack_push_pointer(%3481) : (i64) -> ()
                  %3482 = func.call @stack_pop_pointer() : () -> i64
                  %3483 = func.call @cc_cons(%3482, %3460) : (i64, i64) -> i64
                  %3484 = func.call @cc_cons(%3470, %3483) : (i64, i64) -> i64
                  %3485 = func.call @cc_and(%3484) : (i64) -> i64
                  func.call @stack_push_pointer(%3485) : (i64) -> ()
                  %3486 = func.call @stack_pop_pointer() : () -> i64
                  %3487 = func.call @cc_nil_value() : () -> i64
                  %3488 = arith.cmpi ne, %3486, %3487 : i64
                  scf.if %3488 {
                    %3489 = llvm.mlir.addressof @str311 : !llvm.ptr
                    %3490 = arith.constant 10 : i64
                    %3491 = func.call @cc_make_string(%3489, %3490) : (!llvm.ptr, i64) -> i64
                    %3492 = func.call @cc_nil_value() : () -> i64
                    %3493 = func.call @cc_intern(%3491, %3492) : (i64, i64) -> i64
                    %3494 = func.call @cc_nil_value() : () -> i64
                    %3495 = func.call @cc_cons(%3493, %3494) : (i64, i64) -> i64
                    %3496 = func.call @cc_values_pack(%3495) : (i64) -> i64
                    func.call @stack_push_pointer(%3493) : (i64) -> ()
                    %3497 = func.call @stack_pop_pointer() : () -> i64
                    %3498 = func.call @cc_nil_value() : () -> i64
                    %3499 = func.call @cc_errorp(%3497) : (i64) -> i64
                    %3500 = arith.cmpi ne, %3499, %3498 : i64
                    %3501 = arith.cmpi eq, %3498, %3498 : i64
                    %3502 = arith.andi %3500, %3501 : i1
                    %3503 = scf.if %3502 -> (i64) {
                      scf.yield %3497 : i64
                    } else {
                      scf.yield %3498 : i64
                    }
                    %3504 = arith.cmpi ne, %3503, %3498 : i64
                    scf.if %3504 {
                      func.call @stack_push_pointer(%3503) : (i64) -> ()
                    } else {
                      func.call @stack_push_pointer(%3497) : (i64) -> ()
                      %3505 = llvm.mlir.addressof @str312 : !llvm.ptr
                      %3506 = func.call @cc_make_function_ref_const(%3505) : (!llvm.ptr) -> i64
                      %3507 = arith.constant 1 : i64
                      func.call @cc_funcall_stack(%3506, %3507) : (i64, i64) -> ()
                    }
                    %3508 = func.call @stack_pop_pointer() : () -> i64
                    %3509 = func.call @cc_multiple_value_list(%3508) : (i64) -> i64
                    %3510 = func.call @cc_t_value() : () -> i64
                    %3511 = llvm.mlir.addressof @str313 : !llvm.ptr
                    %3512 = arith.constant 38 : i64
                    %3513 = func.call @cc_make_symbol(%3511, %3512) : (!llvm.ptr, i64) -> i64
                    %3514 = func.call @cc_set_symbol_value(%3513, %3510) : (i64, i64) -> i64
                    %3515 = llvm.mlir.addressof @str314 : !llvm.ptr
                    %3516 = arith.constant 39 : i64
                    %3517 = func.call @cc_make_symbol(%3515, %3516) : (!llvm.ptr, i64) -> i64
                    %3518 = func.call @cc_set_symbol_value(%3517, %3508) : (i64, i64) -> i64
                    %3519 = llvm.mlir.addressof @str315 : !llvm.ptr
                    %3520 = arith.constant 40 : i64
                    %3521 = func.call @cc_make_symbol(%3519, %3520) : (!llvm.ptr, i64) -> i64
                    %3522 = func.call @cc_set_symbol_value(%3521, %3509) : (i64, i64) -> i64
                    func.call @stack_push_pointer(%3508) : (i64) -> ()
                  } else {
                    func.call @stack_push_nil() : () -> ()
                  }
                  %3523 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %3523, %3391#1, %3391#2, %3391#3 : i64, i64, i64, i64
                }
                %3524 = func.call @cc_nil_value() : () -> i64
                %3525 = func.call @cc_errorp(%3459#0) : (i64) -> i64
                %3526 = arith.cmpi ne, %3525, %3524 : i64
                %3527:4 = scf.if %3526 -> (i64, i64, i64, i64) {
                  scf.yield %3459#0, %3459#1, %3459#2, %3459#3 : i64, i64, i64, i64
                } else {
                  func.call @stack_push_pointer(%3386) : (i64) -> ()
                  %3528 = func.call @stack_pop_pointer() : () -> i64
                  %3529 = func.call @cc_car(%3528) : (i64) -> i64
                  func.call @stack_push_pointer(%3529) : (i64) -> ()
                  %3530 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%3530) : (i64) -> ()
                  %3531 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %3531, %3459#1, %3530, %3459#3 : i64, i64, i64, i64
                }
                %3532 = func.call @cc_nil_value() : () -> i64
                %3533 = func.call @cc_errorp(%3527#0) : (i64) -> i64
                %3534 = arith.cmpi ne, %3533, %3532 : i64
                %3535:4 = scf.if %3534 -> (i64, i64, i64, i64) {
                  scf.yield %3527#0, %3527#1, %3527#2, %3527#3 : i64, i64, i64, i64
                } else {
                  func.call @stack_push_pointer(%3385) : (i64) -> ()
                  %3536 = func.call @stack_pop_pointer() : () -> i64
                  %3537 = func.call @cc_car(%3536) : (i64) -> i64
                  func.call @stack_push_pointer(%3537) : (i64) -> ()
                  %3538 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%3538) : (i64) -> ()
                  %3539 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %3539, %3527#1, %3527#2, %3538 : i64, i64, i64, i64
                }
                %3540 = func.call @cc_nil_value() : () -> i64
                %3541 = func.call @cc_errorp(%3535#0) : (i64) -> i64
                %3542 = arith.cmpi ne, %3541, %3540 : i64
                %3543:4 = scf.if %3542 -> (i64, i64, i64, i64) {
                  scf.yield %3535#0, %3535#1, %3535#2, %3535#3 : i64, i64, i64, i64
                } else {
                  func.call @stack_push_pointer(%3066#2) : (i64) -> ()
                  %3544 = func.call @stack_pop_pointer() : () -> i64
                  func.call @stack_push_pointer(%3535#2) : (i64) -> ()
                  %3545 = func.call @stack_pop_pointer() : () -> i64
                  %3546 = func.call @cc_apply(%3544, %3545) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%3546) : (i64) -> ()
                  func.call @stack_push_pointer(%3535#3) : (i64) -> ()
                  %3547 = func.call @stack_pop_pointer() : () -> i64
                  %3548 = func.call @stack_pop_pointer() : () -> i64
                  %3549 = func.call @cc_typep(%3548, %3547) : (i64, i64) -> i64
                  func.call @stack_push_pointer(%3549) : (i64) -> ()
                  %3550 = func.call @stack_pop_pointer() : () -> i64
                  %3551 = func.call @cc_nil_value() : () -> i64
                  %3552 = func.call @cc_cons(%3550, %3551) : (i64, i64) -> i64
                  %3553 = func.call @cc_not(%3552) : (i64) -> i64
                  func.call @stack_push_pointer(%3553) : (i64) -> ()
                  %3554 = func.call @stack_pop_pointer() : () -> i64
                  %3555 = func.call @cc_nil_value() : () -> i64
                  %3556 = arith.cmpi ne, %3554, %3555 : i64
                  %3557:1 = scf.if %3556 -> (i64) {
                    %3558 = func.call @cc_nil_value() : () -> i64
                    %3559 = func.call @cc_nil_value() : () -> i64
                    %3560 = func.call @cc_errorp(%3558) : (i64) -> i64
                    %3561 = arith.cmpi ne, %3560, %3559 : i64
                    %3562:2 = scf.if %3561 -> (i64, i64) {
                      scf.yield %3558, %3535#1 : i64, i64
                    } else {
                      func.call @stack_push_pointer(%3535#1) : (i64) -> ()
                      func.call @stack_push_pointer(%3066#2) : (i64) -> ()
                      func.call @stack_push_pointer(%3535#2) : (i64) -> ()
                      %3563 = func.call @stack_pop_pointer() : () -> i64
                      %3564 = func.call @stack_pop_pointer() : () -> i64
                      %3565 = func.call @cc_cons(%3564, %3563) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%3565) : (i64) -> ()
                      %3566 = func.call @stack_pop_pointer() : () -> i64
                      %3567 = func.call @cc_nil_value() : () -> i64
                      %3568 = func.call @cc_errorp(%3566) : (i64) -> i64
                      %3569 = arith.cmpi ne, %3568, %3567 : i64
                      %3570 = arith.cmpi eq, %3567, %3567 : i64
                      %3571 = arith.andi %3569, %3570 : i1
                      %3572 = scf.if %3571 -> (i64) {
                        scf.yield %3566 : i64
                      } else {
                        scf.yield %3567 : i64
                      }
                      %3573 = arith.cmpi ne, %3572, %3567 : i64
                      scf.if %3573 {
                        func.call @stack_push_pointer(%3572) : (i64) -> ()
                      } else {
                        %3574 = func.call @cc_nil_value() : () -> i64
                        func.call @stack_push_pointer(%3574) : (i64) -> ()
                        func.call @stack_push_pointer(%3566) : (i64) -> ()
                        %3575 = func.call @stack_pop_pointer() : () -> i64
                        %3576 = func.call @stack_pop_pointer() : () -> i64
                        %3577 = func.call @cc_cons(%3575, %3576) : (i64, i64) -> i64
                        func.call @stack_push_pointer(%3577) : (i64) -> ()
                      }
                      %3578 = func.call @stack_pop_pointer() : () -> i64
                      %3579 = func.call @stack_pop_pointer() : () -> i64
                      %3580 = func.call @cc_append(%3579, %3578) : (i64, i64) -> i64
                      func.call @stack_push_pointer(%3580) : (i64) -> ()
                      %3581 = func.call @stack_pop_pointer() : () -> i64
                      func.call @stack_push_pointer(%3581) : (i64) -> ()
                      %3582 = func.call @stack_pop_pointer() : () -> i64
                      scf.yield %3582, %3581 : i64, i64
                    }
                    func.call @stack_push_pointer(%3562#0) : (i64) -> ()
                    %3583 = func.call @stack_depth() : () -> i64
                    %3584 = arith.constant 0 : i64
                    %3585 = arith.cmpi sgt, %3583, %3584 : i64
                    scf.if %3585 {
                      %3586 = func.call @stack_pop_pointer() : () -> i64
                    }
                    scf.yield %3562#1 : i64
                  } else {
                    func.call @stack_push_nil() : () -> ()
                    %3587 = func.call @stack_depth() : () -> i64
                    %3588 = arith.constant 0 : i64
                    %3589 = arith.cmpi sgt, %3587, %3588 : i64
                    scf.if %3589 {
                      %3590 = func.call @stack_pop_pointer() : () -> i64
                    }
                    scf.yield %3535#1 : i64
                  }
                  func.call @stack_push_nil() : () -> ()
                  %3591 = func.call @stack_pop_pointer() : () -> i64
                  scf.yield %3591, %3557, %3535#2, %3535#3 : i64, i64, i64, i64
                }
                func.call @stack_push_pointer(%3543#0) : (i64) -> ()
                %3592 = func.call @stack_depth() : () -> i64
                %3593 = arith.constant 0 : i64
                %3594 = arith.cmpi sgt, %3592, %3593 : i64
                scf.if %3594 {
                  %3595 = func.call @stack_pop_pointer() : () -> i64
                }
                func.call @stack_push_pointer(%3385) : (i64) -> ()
                %3596 = func.call @stack_pop_pointer() : () -> i64
                %3597 = func.call @cc_cdr(%3596) : (i64) -> i64
                func.call @stack_push_pointer(%3597) : (i64) -> ()
                %3598 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%3598) : (i64) -> ()
                %3599 = func.call @stack_depth() : () -> i64
                %3600 = arith.constant 0 : i64
                %3601 = arith.cmpi sgt, %3599, %3600 : i64
                scf.if %3601 {
                  %3602 = func.call @stack_pop_pointer() : () -> i64
                }
                func.call @stack_push_pointer(%3386) : (i64) -> ()
                %3603 = func.call @stack_pop_pointer() : () -> i64
                %3604 = func.call @cc_cdr(%3603) : (i64) -> i64
                func.call @stack_push_pointer(%3604) : (i64) -> ()
                %3605 = func.call @stack_pop_pointer() : () -> i64
                func.call @stack_push_pointer(%3605) : (i64) -> ()
                %3606 = func.call @stack_depth() : () -> i64
                %3607 = arith.constant 0 : i64
                %3608 = arith.cmpi sgt, %3606, %3607 : i64
                scf.if %3608 {
                  %3609 = func.call @stack_pop_pointer() : () -> i64
                }
                scf.yield %3543#2, %3543#3, %3543#1, %3598, %3605 : i64, i64, i64, i64, i64
              }
              func.call @stack_push_nil() : () -> ()
              %3610 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%3372#2) : (i64) -> ()
              %3611 = func.call @stack_pop_pointer() : () -> i64
              %3612 = func.call @cc_multiple_value_list(%3611) : (i64) -> i64
              %3613 = llvm.mlir.addressof @str316 : !llvm.ptr
              %3614 = arith.constant 38 : i64
              %3615 = func.call @cc_make_symbol(%3613, %3614) : (!llvm.ptr, i64) -> i64
              %3616 = func.call @cc_symbol_value(%3615) : (i64) -> i64
              %3617 = llvm.mlir.addressof @str317 : !llvm.ptr
              %3618 = arith.constant 39 : i64
              %3619 = func.call @cc_make_symbol(%3617, %3618) : (!llvm.ptr, i64) -> i64
              %3620 = func.call @cc_symbol_value(%3619) : (i64) -> i64
              %3621 = llvm.mlir.addressof @str318 : !llvm.ptr
              %3622 = arith.constant 40 : i64
              %3623 = func.call @cc_make_symbol(%3621, %3622) : (!llvm.ptr, i64) -> i64
              %3624 = func.call @cc_symbol_value(%3623) : (i64) -> i64
              %3625 = func.call @cc_nil_value() : () -> i64
              %3626 = arith.cmpi ne, %3616, %3625 : i64
              %3627 = scf.if %3626 -> (i64) {
                scf.yield %3624 : i64
              } else {
                scf.yield %3612 : i64
              }
              %3628 = func.call @cc_values_pack(%3627) : (i64) -> i64
              func.call @stack_push_pointer(%3628) : (i64) -> ()
              %3629 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %3629 : i64
            }
            func.call @stack_push_pointer(%3358) : (i64) -> ()
            %3630 = func.call @stack_pop_pointer() : () -> i64
            %3631 = func.call @stack_pop_pointer() : () -> i64
            %3632 = func.call @cc_nconc(%3631, %3630) : (i64, i64) -> i64
            func.call @stack_push_pointer(%3632) : (i64) -> ()
            %3633 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%3633) : (i64) -> ()
            %3634 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %3634, %3633, %3066#2 : i64, i64, i64
          }
          func.call @stack_push_pointer(%3074#0) : (i64) -> ()
          %3635 = func.call @stack_depth() : () -> i64
          %3636 = arith.constant 0 : i64
          %3637 = arith.cmpi sgt, %3635, %3636 : i64
          scf.if %3637 {
            %3638 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%2993) : (i64) -> ()
          %3639 = func.call @stack_pop_pointer() : () -> i64
          %3640 = func.call @cc_cdr(%3639) : (i64) -> i64
          func.call @stack_push_pointer(%3640) : (i64) -> ()
          %3641 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%3641) : (i64) -> ()
          %3642 = func.call @stack_depth() : () -> i64
          %3643 = arith.constant 0 : i64
          %3644 = arith.cmpi sgt, %3642, %3643 : i64
          scf.if %3644 {
            %3645 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %3074#2, %3074#1, %3641 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %3646 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%2987#1) : (i64) -> ()
        %3647 = func.call @stack_pop_pointer() : () -> i64
        %3648 = func.call @cc_multiple_value_list(%3647) : (i64) -> i64
        %3649 = llvm.mlir.addressof @str319 : !llvm.ptr
        %3650 = arith.constant 38 : i64
        %3651 = func.call @cc_make_symbol(%3649, %3650) : (!llvm.ptr, i64) -> i64
        %3652 = func.call @cc_symbol_value(%3651) : (i64) -> i64
        %3653 = llvm.mlir.addressof @str320 : !llvm.ptr
        %3654 = arith.constant 39 : i64
        %3655 = func.call @cc_make_symbol(%3653, %3654) : (!llvm.ptr, i64) -> i64
        %3656 = func.call @cc_symbol_value(%3655) : (i64) -> i64
        %3657 = llvm.mlir.addressof @str321 : !llvm.ptr
        %3658 = arith.constant 40 : i64
        %3659 = func.call @cc_make_symbol(%3657, %3658) : (!llvm.ptr, i64) -> i64
        %3660 = func.call @cc_symbol_value(%3659) : (i64) -> i64
        %3661 = func.call @cc_nil_value() : () -> i64
        %3662 = arith.cmpi ne, %3652, %3661 : i64
        %3663 = scf.if %3662 -> (i64) {
          scf.yield %3660 : i64
        } else {
          scf.yield %3648 : i64
        }
        %3664 = func.call @cc_values_pack(%3663) : (i64) -> i64
        func.call @stack_push_pointer(%3664) : (i64) -> ()
        %3665 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %3665, %2987#2, %2987#1, %2987#0 : i64, i64, i64, i64
      }
      func.call @stack_push_pointer(%2973#0) : (i64) -> ()
      %3666 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %3666 : i64
    }
    func.call @stack_push_pointer(%2913) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str2("FLOOR-REMAINDER-CONTAGION\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str3("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str4("FUN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str5("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str6("FLOOR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("CEILING\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str9("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("TRUNCATE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("ROUND\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("FFLOOR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("FCEILING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("FTRUNCATE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str19("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("FROUND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str21("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str23("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str24("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str25("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str26("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str27("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str28("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str29("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str30("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str31("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str32("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str33("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str34("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str35("CONSP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str36("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str37("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str38("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str39("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str40("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str41("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("FUN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str43("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str44("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str45("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str46("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str47("NCONC\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str48("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str49("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str50("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str51("ARGS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str52("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str53("4\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str54("7\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str55("31\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str56("30\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str57("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str58("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str59("RTYPE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str60("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str61("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str66("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str68("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str70("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str74("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str75("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str76("UNLESS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str77("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str79("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("NTH-VALUE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str81("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("APPLY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str83("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("FUN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str85("ARGS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str86("RTYPE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str87("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str88("CONS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str89("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("FUN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str91("ARGS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str92("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str93("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str94("CDR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str95("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str96("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str97("FLOOR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str98("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str99("CEILING\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str100("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str101("TRUNCATE\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str102("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str103("ROUND\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str104("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str105("FFLOOR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str106("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str107("FCEILING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str108("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str109("FTRUNCATE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str110("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str111("FROUND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str112("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str113("*__MLIR_BLOCK_RETFLAG_211067594604545*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str114("*__MLIR_BLOCK_RETVALUE_211067594604545*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str115("*__MLIR_BLOCK_RETMVLIST_211067594604545*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str116("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str117("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str118("*__MLIR_BLOCK_RETFLAG_211067594604545*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str119("*__MLIR_BLOCK_RETVALUE_211067594604545*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str120("*__MLIR_BLOCK_RETMVLIST_211067594604545*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str121("4\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str122("7\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str123("31\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str124("30\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str125("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str126("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str127("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str128("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str129("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str130("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str131("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str132("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str133("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str134("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str135("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str136("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str137("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str138("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str139("*__MLIR_BLOCK_RETFLAG_211067594604546*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str140("*__MLIR_BLOCK_RETVALUE_211067594604546*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str141("*__MLIR_BLOCK_RETMVLIST_211067594604546*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str142("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str143("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str144("*__MLIR_BLOCK_RETFLAG_211067594604546*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str145("*__MLIR_BLOCK_RETVALUE_211067594604546*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str146("*__MLIR_BLOCK_RETMVLIST_211067594604546*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str147("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str148("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str149("*__MLIR_BLOCK_RETFLAG_211067594604546*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str150("*__MLIR_BLOCK_RETVALUE_211067594604546*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str151("*__MLIR_BLOCK_RETMVLIST_211067594604546*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str152("*__MLIR_BLOCK_RETFLAG_211067594604546*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str153("*__MLIR_BLOCK_RETVALUE_211067594604546*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str154("*__MLIR_BLOCK_RETMVLIST_211067594604546*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str155("*__MLIR_BLOCK_RETFLAG_211067594604545*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str156("*__MLIR_BLOCK_RETVALUE_211067594604545*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str157("*__MLIR_BLOCK_RETMVLIST_211067594604545*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str158("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str159("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str160("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str161("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str162("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str163("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str164("FFLOOR-QUOTIENT-CONTAGION\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str165("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str166("FUN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str167("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str168("FFLOOR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str169("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str170("FCEILING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str171("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str172("FTRUNCATE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str173("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str174("FROUND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str175("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str176("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str177("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str178("BLOCK\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str179("WHILE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str180("SYS\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str181("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str182("PROGN\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str183("IF\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str184("AND\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str185("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str186("NULL\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str187("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str188("NOT\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str189("CONSP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str190("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str191("RETURN-FROM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str192("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str193("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str194("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str195("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str196("FUN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str197("CAR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str198("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str199("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str200("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str201("NCONC\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str202("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str203("LOOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str204("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str205("ARGS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str206("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str207("4\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str208("7\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str209("31\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str210("30\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str211("4\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str212("7\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str213("31\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str214("30\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str215("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str216("FOR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str217("RTYPE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str218("IN\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str219("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str220("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str221("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str222("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str223("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str224("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str225("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str226("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str227("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str228("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str229("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str230("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str231("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str232("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str233("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str234("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str235("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str236("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str237("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str238("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str239("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str240("UNLESS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str241("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str242("TYPEP\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str243("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str244("APPLY\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str245("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str246("FUN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str247("ARGS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str248("RTYPE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str249("COLLECT\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str250("CONS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str251("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str252("FUN\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str253("ARGS\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str254("SETQ\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str255("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str256("CDR\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str257("__LOOP_LIST_0__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str258("__LOOP_RESULT__\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str259("FFLOOR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str260("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str261("FCEILING\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str262("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str263("FTRUNCATE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str264("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str265("FROUND\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str266("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str267("*__MLIR_BLOCK_RETFLAG_211067594604548*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str268("*__MLIR_BLOCK_RETVALUE_211067594604548*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str269("*__MLIR_BLOCK_RETMVLIST_211067594604548*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str270("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str271("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str272("*__MLIR_BLOCK_RETFLAG_211067594604548*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str273("*__MLIR_BLOCK_RETVALUE_211067594604548*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str274("*__MLIR_BLOCK_RETMVLIST_211067594604548*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str275("4\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str276("7\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str277("31\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str278("30\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str279("4\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str280("7\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str281("31\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str282("30\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str283("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str284("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str285("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str286("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str287("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str288("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str289("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str290("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str291("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str292("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str293("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str294("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str295("SINGLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str296("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str297("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str298("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str299("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str300("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str301("DOUBLE-FLOAT\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str302("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str303("*__MLIR_BLOCK_RETFLAG_211067594604549*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str304("*__MLIR_BLOCK_RETVALUE_211067594604549*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str305("*__MLIR_BLOCK_RETMVLIST_211067594604549*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str306("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str307("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str308("*__MLIR_BLOCK_RETFLAG_211067594604549*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str309("*__MLIR_BLOCK_RETVALUE_211067594604549*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str310("*__MLIR_BLOCK_RETMVLIST_211067594604549*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str311("TYPE-ERROR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str312("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str313("*__MLIR_BLOCK_RETFLAG_211067594604549*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str314("*__MLIR_BLOCK_RETVALUE_211067594604549*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str315("*__MLIR_BLOCK_RETMVLIST_211067594604549*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str316("*__MLIR_BLOCK_RETFLAG_211067594604549*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str317("*__MLIR_BLOCK_RETVALUE_211067594604549*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str318("*__MLIR_BLOCK_RETMVLIST_211067594604549*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str319("*__MLIR_BLOCK_RETFLAG_211067594604548*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str320("*__MLIR_BLOCK_RETVALUE_211067594604548*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str321("*__MLIR_BLOCK_RETMVLIST_211067594604548*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str322("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str323("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str324("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str325("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str326("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str327("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
}
