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
      %16 = llvm.mlir.addressof @str2 : !llvm.ptr
      %17 = arith.constant 7 : i64
      %18 = func.call @cc_make_string(%16, %17) : (!llvm.ptr, i64) -> i64
      %19 = func.call @cc_intern(%15, %18) : (i64, i64) -> i64
      %20 = func.call @cc_nil_value() : () -> i64
      %21 = func.call @cc_cons(%19, %20) : (i64, i64) -> i64
      %22 = func.call @cc_values_pack(%21) : (i64) -> i64
      func.call @stack_push_pointer(%19) : (i64) -> ()
      %23 = func.call @stack_pop_pointer() : () -> i64
      %24 = func.call @cc_in_package(%23) : (i64) -> i64
      func.call @stack_push_pointer(%24) : (i64) -> ()
      %25 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %25 : i64
    }
    %26 = func.call @cc_nil_value() : () -> i64
    %27 = func.call @cc_errorp(%12) : (i64) -> i64
    %28 = arith.cmpi ne, %27, %26 : i64
    %29 = scf.if %28 -> (i64) {
      scf.yield %12 : i64
    } else {
      %30 = llvm.mlir.addressof @str3 : !llvm.ptr
      %31 = arith.constant 17 : i64
      %32 = func.call @cc_make_string(%30, %31) : (!llvm.ptr, i64) -> i64
      %33 = func.call @cc_nil_value() : () -> i64
      %34 = func.call @cc_intern(%32, %33) : (i64, i64) -> i64
      %35 = func.call @cc_nil_value() : () -> i64
      %36 = func.call @cc_cons(%34, %35) : (i64, i64) -> i64
      %37 = func.call @cc_values_pack(%36) : (i64) -> i64
      func.call @stack_push_pointer(%34) : (i64) -> ()
      %38 = func.call @stack_pop_pointer() : () -> i64
      %39 = llvm.mlir.addressof @str4 : !llvm.ptr
      %40 = arith.constant 4 : i64
      %41 = func.call @cc_make_string(%39, %40) : (!llvm.ptr, i64) -> i64
      %42 = func.call @cc_nil_value() : () -> i64
      %43 = func.call @cc_intern(%41, %42) : (i64, i64) -> i64
      %44 = func.call @cc_nil_value() : () -> i64
      %45 = func.call @cc_cons(%43, %44) : (i64, i64) -> i64
      %46 = func.call @cc_values_pack(%45) : (i64) -> i64
      func.call @stack_push_pointer(%43) : (i64) -> ()
      %47 = llvm.mlir.addressof @str5 : !llvm.ptr
      %48 = arith.constant 4 : i64
      %49 = func.call @cc_make_string(%47, %48) : (!llvm.ptr, i64) -> i64
      %50 = func.call @cc_nil_value() : () -> i64
      %51 = func.call @cc_intern(%49, %50) : (i64, i64) -> i64
      %52 = func.call @cc_nil_value() : () -> i64
      %53 = func.call @cc_cons(%51, %52) : (i64, i64) -> i64
      %54 = func.call @cc_values_pack(%53) : (i64) -> i64
      func.call @stack_push_pointer(%51) : (i64) -> ()
      %55 = llvm.mlir.addressof @str6 : !llvm.ptr
      %56 = arith.constant 7 : i64
      %57 = func.call @cc_make_string(%55, %56) : (!llvm.ptr, i64) -> i64
      %58 = llvm.mlir.addressof @str7 : !llvm.ptr
      %59 = arith.constant 4 : i64
      %60 = func.call @cc_make_string(%58, %59) : (!llvm.ptr, i64) -> i64
      %61 = func.call @cc_intern(%57, %60) : (i64, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_cons(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_values_pack(%63) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %65 = llvm.mlir.addressof @str8 : !llvm.ptr
      %66 = arith.constant 11 : i64
      %67 = func.call @cc_make_string(%65, %66) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%67) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %68 = func.call @stack_pop_pointer() : () -> i64
      %69 = func.call @stack_pop_pointer() : () -> i64
      %70 = func.call @cc_cons(%69, %68) : (i64, i64) -> i64
      func.call @stack_push_pointer(%70) : (i64) -> ()
      %71 = func.call @stack_pop_pointer() : () -> i64
      %72 = func.call @stack_pop_pointer() : () -> i64
      %73 = func.call @cc_cons(%72, %71) : (i64, i64) -> i64
      func.call @stack_push_pointer(%73) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %74 = func.call @stack_pop_pointer() : () -> i64
      %75 = func.call @stack_pop_pointer() : () -> i64
      %76 = func.call @cc_cons(%75, %74) : (i64, i64) -> i64
      func.call @stack_push_pointer(%76) : (i64) -> ()
      %77 = func.call @stack_pop_pointer() : () -> i64
      %78 = func.call @stack_pop_pointer() : () -> i64
      %79 = func.call @cc_cons(%78, %77) : (i64, i64) -> i64
      func.call @stack_push_pointer(%79) : (i64) -> ()
      %80 = llvm.mlir.addressof @str9 : !llvm.ptr
      %81 = arith.constant 6 : i64
      %82 = func.call @cc_make_string(%80, %81) : (!llvm.ptr, i64) -> i64
      %83 = llvm.mlir.addressof @str10 : !llvm.ptr
      %84 = arith.constant 11 : i64
      %85 = func.call @cc_make_string(%83, %84) : (!llvm.ptr, i64) -> i64
      %86 = func.call @cc_intern(%82, %85) : (i64, i64) -> i64
      %87 = func.call @cc_nil_value() : () -> i64
      %88 = func.call @cc_cons(%86, %87) : (i64, i64) -> i64
      %89 = func.call @cc_values_pack(%88) : (i64) -> i64
      func.call @stack_push_pointer(%86) : (i64) -> ()
      %90 = llvm.mlir.addressof @str11 : !llvm.ptr
      %91 = arith.constant 4 : i64
      %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
      %93 = llvm.mlir.addressof @str12 : !llvm.ptr
      %94 = arith.constant 11 : i64
      %95 = func.call @cc_make_string(%93, %94) : (!llvm.ptr, i64) -> i64
      %96 = func.call @cc_intern(%92, %95) : (i64, i64) -> i64
      %97 = func.call @cc_nil_value() : () -> i64
      %98 = func.call @cc_cons(%96, %97) : (i64, i64) -> i64
      %99 = func.call @cc_values_pack(%98) : (i64) -> i64
      func.call @stack_push_pointer(%96) : (i64) -> ()
      %100 = llvm.mlir.addressof @str13 : !llvm.ptr
      %101 = arith.constant 4 : i64
      %102 = func.call @cc_make_string(%100, %101) : (!llvm.ptr, i64) -> i64
      %103 = func.call @cc_nil_value() : () -> i64
      %104 = func.call @cc_intern(%102, %103) : (i64, i64) -> i64
      %105 = func.call @cc_nil_value() : () -> i64
      %106 = func.call @cc_cons(%104, %105) : (i64, i64) -> i64
      %107 = func.call @cc_values_pack(%106) : (i64) -> i64
      func.call @stack_push_pointer(%104) : (i64) -> ()
      %108 = llvm.mlir.addressof @str14 : !llvm.ptr
      %109 = arith.constant 17 : i64
      %110 = func.call @cc_make_string(%108, %109) : (!llvm.ptr, i64) -> i64
      %111 = llvm.mlir.addressof @str15 : !llvm.ptr
      %112 = arith.constant 7 : i64
      %113 = func.call @cc_make_string(%111, %112) : (!llvm.ptr, i64) -> i64
      %114 = func.call @cc_intern(%110, %113) : (i64, i64) -> i64
      %115 = func.call @cc_nil_value() : () -> i64
      %116 = func.call @cc_cons(%114, %115) : (i64, i64) -> i64
      %117 = func.call @cc_values_pack(%116) : (i64) -> i64
      func.call @stack_push_pointer(%114) : (i64) -> ()
      %118 = llvm.mlir.addressof @str16 : !llvm.ptr
      %119 = arith.constant 6 : i64
      %120 = func.call @cc_make_string(%118, %119) : (!llvm.ptr, i64) -> i64
      %121 = llvm.mlir.addressof @str17 : !llvm.ptr
      %122 = arith.constant 7 : i64
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
      %132 = arith.constant 7 : i64
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
      %142 = arith.constant 7 : i64
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
      func.call @stack_push_nil() : () -> ()
      %166 = func.call @stack_pop_pointer() : () -> i64
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @cc_cons(%167, %166) : (i64, i64) -> i64
      func.call @stack_push_pointer(%168) : (i64) -> ()
      %169 = func.call @stack_pop_pointer() : () -> i64
      %170 = func.call @stack_pop_pointer() : () -> i64
      %171 = func.call @cc_cons(%170, %169) : (i64, i64) -> i64
      func.call @stack_push_pointer(%171) : (i64) -> ()
      %172 = llvm.mlir.addressof @str22 : !llvm.ptr
      %173 = arith.constant 6 : i64
      %174 = func.call @cc_make_string(%172, %173) : (!llvm.ptr, i64) -> i64
      %175 = func.call @cc_nil_value() : () -> i64
      %176 = func.call @cc_intern(%174, %175) : (i64, i64) -> i64
      %177 = func.call @cc_nil_value() : () -> i64
      %178 = func.call @cc_cons(%176, %177) : (i64, i64) -> i64
      %179 = func.call @cc_values_pack(%178) : (i64) -> i64
      func.call @stack_push_pointer(%176) : (i64) -> ()
      %180 = llvm.mlir.addressof @str23 : !llvm.ptr
      %181 = arith.constant 10 : i64
      %182 = func.call @cc_make_string(%180, %181) : (!llvm.ptr, i64) -> i64
      %183 = llvm.mlir.addressof @str24 : !llvm.ptr
      %184 = arith.constant 11 : i64
      %185 = func.call @cc_make_string(%183, %184) : (!llvm.ptr, i64) -> i64
      %186 = func.call @cc_intern(%182, %185) : (i64, i64) -> i64
      %187 = func.call @cc_nil_value() : () -> i64
      %188 = func.call @cc_cons(%186, %187) : (i64, i64) -> i64
      %189 = func.call @cc_values_pack(%188) : (i64) -> i64
      func.call @stack_push_pointer(%186) : (i64) -> ()
      %190 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%190) : (i64) -> ()
      %191 = llvm.mlir.addressof @str25 : !llvm.ptr
      %192 = arith.constant 12 : i64
      %193 = func.call @cc_make_string(%191, %192) : (!llvm.ptr, i64) -> i64
      %194 = llvm.mlir.addressof @str26 : !llvm.ptr
      %195 = arith.constant 7 : i64
      %196 = func.call @cc_make_string(%194, %195) : (!llvm.ptr, i64) -> i64
      %197 = func.call @cc_intern(%193, %196) : (i64, i64) -> i64
      %198 = func.call @cc_nil_value() : () -> i64
      %199 = func.call @cc_cons(%197, %198) : (i64, i64) -> i64
      %200 = func.call @cc_values_pack(%199) : (i64) -> i64
      func.call @stack_push_pointer(%197) : (i64) -> ()
      %201 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%201) : (i64) -> ()
      %202 = llvm.mlir.addressof @str27 : !llvm.ptr
      %203 = arith.constant 9 : i64
      %204 = func.call @cc_make_string(%202, %203) : (!llvm.ptr, i64) -> i64
      %205 = llvm.mlir.addressof @str28 : !llvm.ptr
      %206 = arith.constant 11 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = func.call @cc_intern(%204, %207) : (i64, i64) -> i64
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
      %211 = func.call @cc_values_pack(%210) : (i64) -> i64
      func.call @stack_push_pointer(%208) : (i64) -> ()
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = func.call @stack_pop_pointer() : () -> i64
      %214 = func.call @cc_cons(%212, %213) : (i64, i64) -> i64
      %215 = llvm.mlir.addressof @str29 : !llvm.ptr
      %216 = arith.constant 5 : i64
      %217 = func.call @cc_make_string(%215, %216) : (!llvm.ptr, i64) -> i64
      %218 = func.call @cc_nil_value() : () -> i64
      %219 = func.call @cc_intern(%217, %218) : (i64, i64) -> i64
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_cons(%219, %220) : (i64, i64) -> i64
      %222 = func.call @cc_values_pack(%221) : (i64) -> i64
      %223 = func.call @cc_cons(%219, %214) : (i64, i64) -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %224 = func.call @stack_pop_pointer() : () -> i64
      %225 = func.call @stack_pop_pointer() : () -> i64
      %226 = func.call @cc_cons(%225, %224) : (i64, i64) -> i64
      func.call @stack_push_pointer(%226) : (i64) -> ()
      %227 = func.call @stack_pop_pointer() : () -> i64
      %228 = func.call @stack_pop_pointer() : () -> i64
      %229 = func.call @cc_cons(%228, %227) : (i64, i64) -> i64
      func.call @stack_push_pointer(%229) : (i64) -> ()
      %230 = func.call @stack_pop_pointer() : () -> i64
      %231 = func.call @stack_pop_pointer() : () -> i64
      %232 = func.call @cc_cons(%231, %230) : (i64, i64) -> i64
      func.call @stack_push_pointer(%232) : (i64) -> ()
      %233 = func.call @stack_pop_pointer() : () -> i64
      %234 = func.call @stack_pop_pointer() : () -> i64
      %235 = func.call @cc_cons(%234, %233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%235) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %236 = func.call @stack_pop_pointer() : () -> i64
      %237 = func.call @stack_pop_pointer() : () -> i64
      %238 = func.call @cc_cons(%237, %236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%238) : (i64) -> ()
      %239 = func.call @stack_pop_pointer() : () -> i64
      %240 = func.call @stack_pop_pointer() : () -> i64
      %241 = func.call @cc_cons(%240, %239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%241) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %242 = func.call @stack_pop_pointer() : () -> i64
      %243 = func.call @stack_pop_pointer() : () -> i64
      %244 = func.call @cc_cons(%243, %242) : (i64, i64) -> i64
      func.call @stack_push_pointer(%244) : (i64) -> ()
      %245 = func.call @stack_pop_pointer() : () -> i64
      %246 = func.call @stack_pop_pointer() : () -> i64
      %247 = func.call @cc_cons(%246, %245) : (i64, i64) -> i64
      func.call @stack_push_pointer(%247) : (i64) -> ()
      %248 = func.call @stack_pop_pointer() : () -> i64
      %249 = func.call @stack_pop_pointer() : () -> i64
      %250 = func.call @cc_cons(%249, %248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%250) : (i64) -> ()
      %251 = llvm.mlir.addressof @str30 : !llvm.ptr
      %252 = arith.constant 12 : i64
      %253 = func.call @cc_make_string(%251, %252) : (!llvm.ptr, i64) -> i64
      %254 = llvm.mlir.addressof @str31 : !llvm.ptr
      %255 = arith.constant 11 : i64
      %256 = func.call @cc_make_string(%254, %255) : (!llvm.ptr, i64) -> i64
      %257 = func.call @cc_intern(%253, %256) : (i64, i64) -> i64
      %258 = func.call @cc_nil_value() : () -> i64
      %259 = func.call @cc_cons(%257, %258) : (i64, i64) -> i64
      %260 = func.call @cc_values_pack(%259) : (i64) -> i64
      func.call @stack_push_pointer(%257) : (i64) -> ()
      %261 = llvm.mlir.addressof @str32 : !llvm.ptr
      %262 = arith.constant 3 : i64
      %263 = func.call @cc_make_string(%261, %262) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%263) : (i64) -> ()
      %264 = llvm.mlir.addressof @str33 : !llvm.ptr
      %265 = arith.constant 6 : i64
      %266 = func.call @cc_make_string(%264, %265) : (!llvm.ptr, i64) -> i64
      %267 = llvm.mlir.addressof @str34 : !llvm.ptr
      %268 = arith.constant 11 : i64
      %269 = func.call @cc_make_string(%267, %268) : (!llvm.ptr, i64) -> i64
      %270 = func.call @cc_intern(%266, %269) : (i64, i64) -> i64
      %271 = func.call @cc_nil_value() : () -> i64
      %272 = func.call @cc_cons(%270, %271) : (i64, i64) -> i64
      %273 = func.call @cc_values_pack(%272) : (i64) -> i64
      func.call @stack_push_pointer(%270) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %274 = func.call @stack_pop_pointer() : () -> i64
      %275 = func.call @stack_pop_pointer() : () -> i64
      %276 = func.call @cc_cons(%275, %274) : (i64, i64) -> i64
      func.call @stack_push_pointer(%276) : (i64) -> ()
      %277 = func.call @stack_pop_pointer() : () -> i64
      %278 = func.call @stack_pop_pointer() : () -> i64
      %279 = func.call @cc_cons(%278, %277) : (i64, i64) -> i64
      func.call @stack_push_pointer(%279) : (i64) -> ()
      %280 = func.call @stack_pop_pointer() : () -> i64
      %281 = func.call @stack_pop_pointer() : () -> i64
      %282 = func.call @cc_cons(%281, %280) : (i64, i64) -> i64
      func.call @stack_push_pointer(%282) : (i64) -> ()
      %283 = llvm.mlir.addressof @str35 : !llvm.ptr
      %284 = arith.constant 5 : i64
      %285 = func.call @cc_make_string(%283, %284) : (!llvm.ptr, i64) -> i64
      %286 = llvm.mlir.addressof @str36 : !llvm.ptr
      %287 = arith.constant 11 : i64
      %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
      %289 = func.call @cc_intern(%285, %288) : (i64, i64) -> i64
      %290 = func.call @cc_nil_value() : () -> i64
      %291 = func.call @cc_cons(%289, %290) : (i64, i64) -> i64
      %292 = func.call @cc_values_pack(%291) : (i64) -> i64
      func.call @stack_push_pointer(%289) : (i64) -> ()
      %293 = llvm.mlir.addressof @str37 : !llvm.ptr
      %294 = arith.constant 6 : i64
      %295 = func.call @cc_make_string(%293, %294) : (!llvm.ptr, i64) -> i64
      %296 = llvm.mlir.addressof @str38 : !llvm.ptr
      %297 = arith.constant 11 : i64
      %298 = func.call @cc_make_string(%296, %297) : (!llvm.ptr, i64) -> i64
      %299 = func.call @cc_intern(%295, %298) : (i64, i64) -> i64
      %300 = func.call @cc_nil_value() : () -> i64
      %301 = func.call @cc_cons(%299, %300) : (i64, i64) -> i64
      %302 = func.call @cc_values_pack(%301) : (i64) -> i64
      func.call @stack_push_pointer(%299) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %303 = func.call @stack_pop_pointer() : () -> i64
      %304 = func.call @stack_pop_pointer() : () -> i64
      %305 = func.call @cc_cons(%304, %303) : (i64, i64) -> i64
      func.call @stack_push_pointer(%305) : (i64) -> ()
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = func.call @stack_pop_pointer() : () -> i64
      %308 = func.call @cc_cons(%307, %306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%308) : (i64) -> ()
      %309 = llvm.mlir.addressof @str39 : !llvm.ptr
      %310 = arith.constant 4 : i64
      %311 = func.call @cc_make_string(%309, %310) : (!llvm.ptr, i64) -> i64
      %312 = llvm.mlir.addressof @str40 : !llvm.ptr
      %313 = arith.constant 11 : i64
      %314 = func.call @cc_make_string(%312, %313) : (!llvm.ptr, i64) -> i64
      %315 = func.call @cc_intern(%311, %314) : (i64, i64) -> i64
      %316 = func.call @cc_nil_value() : () -> i64
      %317 = func.call @cc_cons(%315, %316) : (i64, i64) -> i64
      %318 = func.call @cc_values_pack(%317) : (i64) -> i64
      func.call @stack_push_pointer(%315) : (i64) -> ()
      %319 = llvm.mlir.addressof @str41 : !llvm.ptr
      %320 = arith.constant 6 : i64
      %321 = func.call @cc_make_string(%319, %320) : (!llvm.ptr, i64) -> i64
      %322 = llvm.mlir.addressof @str42 : !llvm.ptr
      %323 = arith.constant 11 : i64
      %324 = func.call @cc_make_string(%322, %323) : (!llvm.ptr, i64) -> i64
      %325 = func.call @cc_intern(%321, %324) : (i64, i64) -> i64
      %326 = func.call @cc_nil_value() : () -> i64
      %327 = func.call @cc_cons(%325, %326) : (i64, i64) -> i64
      %328 = func.call @cc_values_pack(%327) : (i64) -> i64
      func.call @stack_push_pointer(%325) : (i64) -> ()
      %329 = llvm.mlir.addressof @str43 : !llvm.ptr
      %330 = arith.constant 4 : i64
      %331 = func.call @cc_make_string(%329, %330) : (!llvm.ptr, i64) -> i64
      %332 = llvm.mlir.addressof @str44 : !llvm.ptr
      %333 = arith.constant 11 : i64
      %334 = func.call @cc_make_string(%332, %333) : (!llvm.ptr, i64) -> i64
      %335 = func.call @cc_intern(%331, %334) : (i64, i64) -> i64
      %336 = func.call @cc_nil_value() : () -> i64
      %337 = func.call @cc_cons(%335, %336) : (i64, i64) -> i64
      %338 = func.call @cc_values_pack(%337) : (i64) -> i64
      func.call @stack_push_pointer(%335) : (i64) -> ()
      %339 = llvm.mlir.addressof @str45 : !llvm.ptr
      %340 = arith.constant 4 : i64
      %341 = func.call @cc_make_string(%339, %340) : (!llvm.ptr, i64) -> i64
      %342 = func.call @cc_nil_value() : () -> i64
      %343 = func.call @cc_intern(%341, %342) : (i64, i64) -> i64
      %344 = func.call @cc_nil_value() : () -> i64
      %345 = func.call @cc_cons(%343, %344) : (i64, i64) -> i64
      %346 = func.call @cc_values_pack(%345) : (i64) -> i64
      func.call @stack_push_pointer(%343) : (i64) -> ()
      %347 = llvm.mlir.addressof @str46 : !llvm.ptr
      %348 = arith.constant 17 : i64
      %349 = func.call @cc_make_string(%347, %348) : (!llvm.ptr, i64) -> i64
      %350 = llvm.mlir.addressof @str47 : !llvm.ptr
      %351 = arith.constant 7 : i64
      %352 = func.call @cc_make_string(%350, %351) : (!llvm.ptr, i64) -> i64
      %353 = func.call @cc_intern(%349, %352) : (i64, i64) -> i64
      %354 = func.call @cc_nil_value() : () -> i64
      %355 = func.call @cc_cons(%353, %354) : (i64, i64) -> i64
      %356 = func.call @cc_values_pack(%355) : (i64) -> i64
      func.call @stack_push_pointer(%353) : (i64) -> ()
      %357 = llvm.mlir.addressof @str48 : !llvm.ptr
      %358 = arith.constant 6 : i64
      %359 = func.call @cc_make_string(%357, %358) : (!llvm.ptr, i64) -> i64
      %360 = llvm.mlir.addressof @str49 : !llvm.ptr
      %361 = arith.constant 7 : i64
      %362 = func.call @cc_make_string(%360, %361) : (!llvm.ptr, i64) -> i64
      %363 = func.call @cc_intern(%359, %362) : (i64, i64) -> i64
      %364 = func.call @cc_nil_value() : () -> i64
      %365 = func.call @cc_cons(%363, %364) : (i64, i64) -> i64
      %366 = func.call @cc_values_pack(%365) : (i64) -> i64
      func.call @stack_push_pointer(%363) : (i64) -> ()
      %367 = llvm.mlir.addressof @str50 : !llvm.ptr
      %368 = arith.constant 9 : i64
      %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
      %370 = llvm.mlir.addressof @str51 : !llvm.ptr
      %371 = arith.constant 7 : i64
      %372 = func.call @cc_make_string(%370, %371) : (!llvm.ptr, i64) -> i64
      %373 = func.call @cc_intern(%369, %372) : (i64, i64) -> i64
      %374 = func.call @cc_nil_value() : () -> i64
      %375 = func.call @cc_cons(%373, %374) : (i64, i64) -> i64
      %376 = func.call @cc_values_pack(%375) : (i64) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %377 = llvm.mlir.addressof @str52 : !llvm.ptr
      %378 = arith.constant 9 : i64
      %379 = func.call @cc_make_string(%377, %378) : (!llvm.ptr, i64) -> i64
      %380 = llvm.mlir.addressof @str53 : !llvm.ptr
      %381 = arith.constant 7 : i64
      %382 = func.call @cc_make_string(%380, %381) : (!llvm.ptr, i64) -> i64
      %383 = func.call @cc_intern(%379, %382) : (i64, i64) -> i64
      %384 = func.call @cc_nil_value() : () -> i64
      %385 = func.call @cc_cons(%383, %384) : (i64, i64) -> i64
      %386 = func.call @cc_values_pack(%385) : (i64) -> i64
      func.call @stack_push_pointer(%383) : (i64) -> ()
      %387 = llvm.mlir.addressof @str54 : !llvm.ptr
      %388 = arith.constant 9 : i64
      %389 = func.call @cc_make_string(%387, %388) : (!llvm.ptr, i64) -> i64
      %390 = llvm.mlir.addressof @str55 : !llvm.ptr
      %391 = arith.constant 7 : i64
      %392 = func.call @cc_make_string(%390, %391) : (!llvm.ptr, i64) -> i64
      %393 = func.call @cc_intern(%389, %392) : (i64, i64) -> i64
      %394 = func.call @cc_nil_value() : () -> i64
      %395 = func.call @cc_cons(%393, %394) : (i64, i64) -> i64
      %396 = func.call @cc_values_pack(%395) : (i64) -> i64
      func.call @stack_push_pointer(%393) : (i64) -> ()
      %397 = llvm.mlir.addressof @str56 : !llvm.ptr
      %398 = arith.constant 6 : i64
      %399 = func.call @cc_make_string(%397, %398) : (!llvm.ptr, i64) -> i64
      %400 = llvm.mlir.addressof @str57 : !llvm.ptr
      %401 = arith.constant 7 : i64
      %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
      %403 = func.call @cc_intern(%399, %402) : (i64, i64) -> i64
      %404 = func.call @cc_nil_value() : () -> i64
      %405 = func.call @cc_cons(%403, %404) : (i64, i64) -> i64
      %406 = func.call @cc_values_pack(%405) : (i64) -> i64
      func.call @stack_push_pointer(%403) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %407 = func.call @stack_pop_pointer() : () -> i64
      %408 = func.call @stack_pop_pointer() : () -> i64
      %409 = func.call @cc_cons(%408, %407) : (i64, i64) -> i64
      func.call @stack_push_pointer(%409) : (i64) -> ()
      %410 = func.call @stack_pop_pointer() : () -> i64
      %411 = func.call @stack_pop_pointer() : () -> i64
      %412 = func.call @cc_cons(%411, %410) : (i64, i64) -> i64
      func.call @stack_push_pointer(%412) : (i64) -> ()
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
      %422 = func.call @stack_pop_pointer() : () -> i64
      %423 = func.call @stack_pop_pointer() : () -> i64
      %424 = func.call @cc_cons(%423, %422) : (i64, i64) -> i64
      func.call @stack_push_pointer(%424) : (i64) -> ()
      %425 = func.call @stack_pop_pointer() : () -> i64
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @cc_cons(%426, %425) : (i64, i64) -> i64
      func.call @stack_push_pointer(%427) : (i64) -> ()
      %428 = func.call @stack_pop_pointer() : () -> i64
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @cc_cons(%429, %428) : (i64, i64) -> i64
      func.call @stack_push_pointer(%430) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %431 = func.call @stack_pop_pointer() : () -> i64
      %432 = func.call @stack_pop_pointer() : () -> i64
      %433 = func.call @cc_cons(%432, %431) : (i64, i64) -> i64
      func.call @stack_push_pointer(%433) : (i64) -> ()
      %434 = func.call @stack_pop_pointer() : () -> i64
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @cc_cons(%435, %434) : (i64, i64) -> i64
      func.call @stack_push_pointer(%436) : (i64) -> ()
      %437 = func.call @stack_pop_pointer() : () -> i64
      %438 = func.call @stack_pop_pointer() : () -> i64
      %439 = func.call @cc_cons(%438, %437) : (i64, i64) -> i64
      func.call @stack_push_pointer(%439) : (i64) -> ()
      %440 = llvm.mlir.addressof @str58 : !llvm.ptr
      %441 = arith.constant 12 : i64
      %442 = func.call @cc_make_string(%440, %441) : (!llvm.ptr, i64) -> i64
      %443 = llvm.mlir.addressof @str59 : !llvm.ptr
      %444 = arith.constant 11 : i64
      %445 = func.call @cc_make_string(%443, %444) : (!llvm.ptr, i64) -> i64
      %446 = func.call @cc_intern(%442, %445) : (i64, i64) -> i64
      %447 = func.call @cc_nil_value() : () -> i64
      %448 = func.call @cc_cons(%446, %447) : (i64, i64) -> i64
      %449 = func.call @cc_values_pack(%448) : (i64) -> i64
      func.call @stack_push_pointer(%446) : (i64) -> ()
      %450 = llvm.mlir.addressof @str60 : !llvm.ptr
      %451 = arith.constant 3 : i64
      %452 = func.call @cc_make_string(%450, %451) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%452) : (i64) -> ()
      %453 = llvm.mlir.addressof @str61 : !llvm.ptr
      %454 = arith.constant 6 : i64
      %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
      %456 = llvm.mlir.addressof @str62 : !llvm.ptr
      %457 = arith.constant 11 : i64
      %458 = func.call @cc_make_string(%456, %457) : (!llvm.ptr, i64) -> i64
      %459 = func.call @cc_intern(%455, %458) : (i64, i64) -> i64
      %460 = func.call @cc_nil_value() : () -> i64
      %461 = func.call @cc_cons(%459, %460) : (i64, i64) -> i64
      %462 = func.call @cc_values_pack(%461) : (i64) -> i64
      func.call @stack_push_pointer(%459) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %463 = func.call @stack_pop_pointer() : () -> i64
      %464 = func.call @stack_pop_pointer() : () -> i64
      %465 = func.call @cc_cons(%464, %463) : (i64, i64) -> i64
      func.call @stack_push_pointer(%465) : (i64) -> ()
      %466 = func.call @stack_pop_pointer() : () -> i64
      %467 = func.call @stack_pop_pointer() : () -> i64
      %468 = func.call @cc_cons(%467, %466) : (i64, i64) -> i64
      func.call @stack_push_pointer(%468) : (i64) -> ()
      %469 = func.call @stack_pop_pointer() : () -> i64
      %470 = func.call @stack_pop_pointer() : () -> i64
      %471 = func.call @cc_cons(%470, %469) : (i64, i64) -> i64
      func.call @stack_push_pointer(%471) : (i64) -> ()
      %472 = llvm.mlir.addressof @str63 : !llvm.ptr
      %473 = arith.constant 5 : i64
      %474 = func.call @cc_make_string(%472, %473) : (!llvm.ptr, i64) -> i64
      %475 = llvm.mlir.addressof @str64 : !llvm.ptr
      %476 = arith.constant 11 : i64
      %477 = func.call @cc_make_string(%475, %476) : (!llvm.ptr, i64) -> i64
      %478 = func.call @cc_intern(%474, %477) : (i64, i64) -> i64
      %479 = func.call @cc_nil_value() : () -> i64
      %480 = func.call @cc_cons(%478, %479) : (i64, i64) -> i64
      %481 = func.call @cc_values_pack(%480) : (i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      %482 = llvm.mlir.addressof @str65 : !llvm.ptr
      %483 = arith.constant 6 : i64
      %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
      %485 = llvm.mlir.addressof @str66 : !llvm.ptr
      %486 = arith.constant 11 : i64
      %487 = func.call @cc_make_string(%485, %486) : (!llvm.ptr, i64) -> i64
      %488 = func.call @cc_intern(%484, %487) : (i64, i64) -> i64
      %489 = func.call @cc_nil_value() : () -> i64
      %490 = func.call @cc_cons(%488, %489) : (i64, i64) -> i64
      %491 = func.call @cc_values_pack(%490) : (i64) -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %492 = func.call @stack_pop_pointer() : () -> i64
      %493 = func.call @stack_pop_pointer() : () -> i64
      %494 = func.call @cc_cons(%493, %492) : (i64, i64) -> i64
      func.call @stack_push_pointer(%494) : (i64) -> ()
      %495 = func.call @stack_pop_pointer() : () -> i64
      %496 = func.call @stack_pop_pointer() : () -> i64
      %497 = func.call @cc_cons(%496, %495) : (i64, i64) -> i64
      func.call @stack_push_pointer(%497) : (i64) -> ()
      %498 = llvm.mlir.addressof @str67 : !llvm.ptr
      %499 = arith.constant 4 : i64
      %500 = func.call @cc_make_string(%498, %499) : (!llvm.ptr, i64) -> i64
      %501 = llvm.mlir.addressof @str68 : !llvm.ptr
      %502 = arith.constant 11 : i64
      %503 = func.call @cc_make_string(%501, %502) : (!llvm.ptr, i64) -> i64
      %504 = func.call @cc_intern(%500, %503) : (i64, i64) -> i64
      %505 = func.call @cc_nil_value() : () -> i64
      %506 = func.call @cc_cons(%504, %505) : (i64, i64) -> i64
      %507 = func.call @cc_values_pack(%506) : (i64) -> i64
      func.call @stack_push_pointer(%504) : (i64) -> ()
      %508 = llvm.mlir.addressof @str69 : !llvm.ptr
      %509 = arith.constant 6 : i64
      %510 = func.call @cc_make_string(%508, %509) : (!llvm.ptr, i64) -> i64
      %511 = llvm.mlir.addressof @str70 : !llvm.ptr
      %512 = arith.constant 11 : i64
      %513 = func.call @cc_make_string(%511, %512) : (!llvm.ptr, i64) -> i64
      %514 = func.call @cc_intern(%510, %513) : (i64, i64) -> i64
      %515 = func.call @cc_nil_value() : () -> i64
      %516 = func.call @cc_cons(%514, %515) : (i64, i64) -> i64
      %517 = func.call @cc_values_pack(%516) : (i64) -> i64
      func.call @stack_push_pointer(%514) : (i64) -> ()
      %518 = llvm.mlir.addressof @str71 : !llvm.ptr
      %519 = arith.constant 4 : i64
      %520 = func.call @cc_make_string(%518, %519) : (!llvm.ptr, i64) -> i64
      %521 = llvm.mlir.addressof @str72 : !llvm.ptr
      %522 = arith.constant 11 : i64
      %523 = func.call @cc_make_string(%521, %522) : (!llvm.ptr, i64) -> i64
      %524 = func.call @cc_intern(%520, %523) : (i64, i64) -> i64
      %525 = func.call @cc_nil_value() : () -> i64
      %526 = func.call @cc_cons(%524, %525) : (i64, i64) -> i64
      %527 = func.call @cc_values_pack(%526) : (i64) -> i64
      func.call @stack_push_pointer(%524) : (i64) -> ()
      %528 = llvm.mlir.addressof @str73 : !llvm.ptr
      %529 = arith.constant 4 : i64
      %530 = func.call @cc_make_string(%528, %529) : (!llvm.ptr, i64) -> i64
      %531 = func.call @cc_nil_value() : () -> i64
      %532 = func.call @cc_intern(%530, %531) : (i64, i64) -> i64
      %533 = func.call @cc_nil_value() : () -> i64
      %534 = func.call @cc_cons(%532, %533) : (i64, i64) -> i64
      %535 = func.call @cc_values_pack(%534) : (i64) -> i64
      func.call @stack_push_pointer(%532) : (i64) -> ()
      %536 = llvm.mlir.addressof @str74 : !llvm.ptr
      %537 = arith.constant 9 : i64
      %538 = func.call @cc_make_string(%536, %537) : (!llvm.ptr, i64) -> i64
      %539 = llvm.mlir.addressof @str75 : !llvm.ptr
      %540 = arith.constant 7 : i64
      %541 = func.call @cc_make_string(%539, %540) : (!llvm.ptr, i64) -> i64
      %542 = func.call @cc_intern(%538, %541) : (i64, i64) -> i64
      %543 = func.call @cc_nil_value() : () -> i64
      %544 = func.call @cc_cons(%542, %543) : (i64, i64) -> i64
      %545 = func.call @cc_values_pack(%544) : (i64) -> i64
      func.call @stack_push_pointer(%542) : (i64) -> ()
      %546 = llvm.mlir.addressof @str76 : !llvm.ptr
      %547 = arith.constant 5 : i64
      %548 = func.call @cc_make_string(%546, %547) : (!llvm.ptr, i64) -> i64
      %549 = llvm.mlir.addressof @str77 : !llvm.ptr
      %550 = arith.constant 7 : i64
      %551 = func.call @cc_make_string(%549, %550) : (!llvm.ptr, i64) -> i64
      %552 = func.call @cc_intern(%548, %551) : (i64, i64) -> i64
      %553 = func.call @cc_nil_value() : () -> i64
      %554 = func.call @cc_cons(%552, %553) : (i64, i64) -> i64
      %555 = func.call @cc_values_pack(%554) : (i64) -> i64
      func.call @stack_push_pointer(%552) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %556 = func.call @stack_pop_pointer() : () -> i64
      %557 = func.call @stack_pop_pointer() : () -> i64
      %558 = func.call @cc_cons(%557, %556) : (i64, i64) -> i64
      func.call @stack_push_pointer(%558) : (i64) -> ()
      %559 = func.call @stack_pop_pointer() : () -> i64
      %560 = func.call @stack_pop_pointer() : () -> i64
      %561 = func.call @cc_cons(%560, %559) : (i64, i64) -> i64
      func.call @stack_push_pointer(%561) : (i64) -> ()
      %562 = func.call @stack_pop_pointer() : () -> i64
      %563 = func.call @stack_pop_pointer() : () -> i64
      %564 = func.call @cc_cons(%563, %562) : (i64, i64) -> i64
      func.call @stack_push_pointer(%564) : (i64) -> ()
      %565 = func.call @stack_pop_pointer() : () -> i64
      %566 = func.call @stack_pop_pointer() : () -> i64
      %567 = func.call @cc_cons(%566, %565) : (i64, i64) -> i64
      func.call @stack_push_pointer(%567) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %568 = func.call @stack_pop_pointer() : () -> i64
      %569 = func.call @stack_pop_pointer() : () -> i64
      %570 = func.call @cc_cons(%569, %568) : (i64, i64) -> i64
      func.call @stack_push_pointer(%570) : (i64) -> ()
      %571 = func.call @stack_pop_pointer() : () -> i64
      %572 = func.call @stack_pop_pointer() : () -> i64
      %573 = func.call @cc_cons(%572, %571) : (i64, i64) -> i64
      func.call @stack_push_pointer(%573) : (i64) -> ()
      %574 = func.call @stack_pop_pointer() : () -> i64
      %575 = func.call @stack_pop_pointer() : () -> i64
      %576 = func.call @cc_cons(%575, %574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%576) : (i64) -> ()
      %577 = llvm.mlir.addressof @str78 : !llvm.ptr
      %578 = arith.constant 13 : i64
      %579 = func.call @cc_make_string(%577, %578) : (!llvm.ptr, i64) -> i64
      %580 = llvm.mlir.addressof @str79 : !llvm.ptr
      %581 = arith.constant 11 : i64
      %582 = func.call @cc_make_string(%580, %581) : (!llvm.ptr, i64) -> i64
      %583 = func.call @cc_intern(%579, %582) : (i64, i64) -> i64
      %584 = func.call @cc_nil_value() : () -> i64
      %585 = func.call @cc_cons(%583, %584) : (i64, i64) -> i64
      %586 = func.call @cc_values_pack(%585) : (i64) -> i64
      func.call @stack_push_pointer(%583) : (i64) -> ()
      %587 = llvm.mlir.addressof @str80 : !llvm.ptr
      %588 = arith.constant 6 : i64
      %589 = func.call @cc_make_string(%587, %588) : (!llvm.ptr, i64) -> i64
      %590 = func.call @cc_nil_value() : () -> i64
      %591 = func.call @cc_intern(%589, %590) : (i64, i64) -> i64
      %592 = func.call @cc_nil_value() : () -> i64
      %593 = func.call @cc_cons(%591, %592) : (i64, i64) -> i64
      %594 = func.call @cc_values_pack(%593) : (i64) -> i64
      func.call @stack_push_pointer(%591) : (i64) -> ()
      %595 = llvm.mlir.addressof @str81 : !llvm.ptr
      %596 = arith.constant 6 : i64
      %597 = func.call @cc_make_string(%595, %596) : (!llvm.ptr, i64) -> i64
      %598 = llvm.mlir.addressof @str82 : !llvm.ptr
      %599 = arith.constant 11 : i64
      %600 = func.call @cc_make_string(%598, %599) : (!llvm.ptr, i64) -> i64
      %601 = func.call @cc_intern(%597, %600) : (i64, i64) -> i64
      %602 = func.call @cc_nil_value() : () -> i64
      %603 = func.call @cc_cons(%601, %602) : (i64, i64) -> i64
      %604 = func.call @cc_values_pack(%603) : (i64) -> i64
      func.call @stack_push_pointer(%601) : (i64) -> ()
      %605 = llvm.mlir.addressof @str83 : !llvm.ptr
      %606 = arith.constant 5 : i64
      %607 = func.call @cc_make_string(%605, %606) : (!llvm.ptr, i64) -> i64
      %608 = llvm.mlir.addressof @str84 : !llvm.ptr
      %609 = arith.constant 7 : i64
      %610 = func.call @cc_make_string(%608, %609) : (!llvm.ptr, i64) -> i64
      %611 = func.call @cc_intern(%607, %610) : (i64, i64) -> i64
      %612 = func.call @cc_nil_value() : () -> i64
      %613 = func.call @cc_cons(%611, %612) : (i64, i64) -> i64
      %614 = func.call @cc_values_pack(%613) : (i64) -> i64
      func.call @stack_push_pointer(%611) : (i64) -> ()
      %615 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%615) : (i64) -> ()
      %616 = llvm.mlir.addressof @str85 : !llvm.ptr
      %617 = arith.constant 3 : i64
      %618 = func.call @cc_make_string(%616, %617) : (!llvm.ptr, i64) -> i64
      %619 = llvm.mlir.addressof @str86 : !llvm.ptr
      %620 = arith.constant 7 : i64
      %621 = func.call @cc_make_string(%619, %620) : (!llvm.ptr, i64) -> i64
      %622 = func.call @cc_intern(%618, %621) : (i64, i64) -> i64
      %623 = func.call @cc_nil_value() : () -> i64
      %624 = func.call @cc_cons(%622, %623) : (i64, i64) -> i64
      %625 = func.call @cc_values_pack(%624) : (i64) -> i64
      func.call @stack_push_pointer(%622) : (i64) -> ()
      %626 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%626) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %627 = func.call @stack_pop_pointer() : () -> i64
      %628 = func.call @stack_pop_pointer() : () -> i64
      %629 = func.call @cc_cons(%628, %627) : (i64, i64) -> i64
      func.call @stack_push_pointer(%629) : (i64) -> ()
      %630 = func.call @stack_pop_pointer() : () -> i64
      %631 = func.call @stack_pop_pointer() : () -> i64
      %632 = func.call @cc_cons(%631, %630) : (i64, i64) -> i64
      func.call @stack_push_pointer(%632) : (i64) -> ()
      %633 = func.call @stack_pop_pointer() : () -> i64
      %634 = func.call @stack_pop_pointer() : () -> i64
      %635 = func.call @cc_cons(%634, %633) : (i64, i64) -> i64
      func.call @stack_push_pointer(%635) : (i64) -> ()
      %636 = func.call @stack_pop_pointer() : () -> i64
      %637 = func.call @stack_pop_pointer() : () -> i64
      %638 = func.call @cc_cons(%637, %636) : (i64, i64) -> i64
      func.call @stack_push_pointer(%638) : (i64) -> ()
      %639 = func.call @stack_pop_pointer() : () -> i64
      %640 = func.call @stack_pop_pointer() : () -> i64
      %641 = func.call @cc_cons(%640, %639) : (i64, i64) -> i64
      func.call @stack_push_pointer(%641) : (i64) -> ()
      %642 = func.call @stack_pop_pointer() : () -> i64
      %643 = func.call @stack_pop_pointer() : () -> i64
      %644 = func.call @cc_cons(%643, %642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%644) : (i64) -> ()
      %645 = func.call @stack_pop_pointer() : () -> i64
      %646 = func.call @stack_pop_pointer() : () -> i64
      %647 = func.call @cc_cons(%646, %645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%647) : (i64) -> ()
      %648 = llvm.mlir.addressof @str87 : !llvm.ptr
      %649 = arith.constant 5 : i64
      %650 = func.call @cc_make_string(%648, %649) : (!llvm.ptr, i64) -> i64
      %651 = llvm.mlir.addressof @str88 : !llvm.ptr
      %652 = arith.constant 11 : i64
      %653 = func.call @cc_make_string(%651, %652) : (!llvm.ptr, i64) -> i64
      %654 = func.call @cc_intern(%650, %653) : (i64, i64) -> i64
      %655 = func.call @cc_nil_value() : () -> i64
      %656 = func.call @cc_cons(%654, %655) : (i64, i64) -> i64
      %657 = func.call @cc_values_pack(%656) : (i64) -> i64
      func.call @stack_push_pointer(%654) : (i64) -> ()
      %658 = llvm.mlir.addressof @str89 : !llvm.ptr
      %659 = arith.constant 6 : i64
      %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
      %661 = llvm.mlir.addressof @str90 : !llvm.ptr
      %662 = arith.constant 11 : i64
      %663 = func.call @cc_make_string(%661, %662) : (!llvm.ptr, i64) -> i64
      %664 = func.call @cc_intern(%660, %663) : (i64, i64) -> i64
      %665 = func.call @cc_nil_value() : () -> i64
      %666 = func.call @cc_cons(%664, %665) : (i64, i64) -> i64
      %667 = func.call @cc_values_pack(%666) : (i64) -> i64
      func.call @stack_push_pointer(%664) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %668 = func.call @stack_pop_pointer() : () -> i64
      %669 = func.call @stack_pop_pointer() : () -> i64
      %670 = func.call @cc_cons(%669, %668) : (i64, i64) -> i64
      func.call @stack_push_pointer(%670) : (i64) -> ()
      %671 = func.call @stack_pop_pointer() : () -> i64
      %672 = func.call @stack_pop_pointer() : () -> i64
      %673 = func.call @cc_cons(%672, %671) : (i64, i64) -> i64
      func.call @stack_push_pointer(%673) : (i64) -> ()
      %674 = llvm.mlir.addressof @str91 : !llvm.ptr
      %675 = arith.constant 11 : i64
      %676 = func.call @cc_make_string(%674, %675) : (!llvm.ptr, i64) -> i64
      %677 = llvm.mlir.addressof @str92 : !llvm.ptr
      %678 = arith.constant 11 : i64
      %679 = func.call @cc_make_string(%677, %678) : (!llvm.ptr, i64) -> i64
      %680 = func.call @cc_intern(%676, %679) : (i64, i64) -> i64
      %681 = func.call @cc_nil_value() : () -> i64
      %682 = func.call @cc_cons(%680, %681) : (i64, i64) -> i64
      %683 = func.call @cc_values_pack(%682) : (i64) -> i64
      func.call @stack_push_pointer(%680) : (i64) -> ()
      %684 = llvm.mlir.addressof @str93 : !llvm.ptr
      %685 = arith.constant 4 : i64
      %686 = func.call @cc_make_string(%684, %685) : (!llvm.ptr, i64) -> i64
      %687 = func.call @cc_nil_value() : () -> i64
      %688 = func.call @cc_intern(%686, %687) : (i64, i64) -> i64
      %689 = func.call @cc_nil_value() : () -> i64
      %690 = func.call @cc_cons(%688, %689) : (i64, i64) -> i64
      %691 = func.call @cc_values_pack(%690) : (i64) -> i64
      func.call @stack_push_pointer(%688) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %692 = func.call @stack_pop_pointer() : () -> i64
      %693 = func.call @stack_pop_pointer() : () -> i64
      %694 = func.call @cc_cons(%693, %692) : (i64, i64) -> i64
      func.call @stack_push_pointer(%694) : (i64) -> ()
      %695 = func.call @stack_pop_pointer() : () -> i64
      %696 = func.call @stack_pop_pointer() : () -> i64
      %697 = func.call @cc_cons(%696, %695) : (i64, i64) -> i64
      func.call @stack_push_pointer(%697) : (i64) -> ()
      %698 = llvm.mlir.addressof @str94 : !llvm.ptr
      %699 = arith.constant 6 : i64
      %700 = func.call @cc_make_string(%698, %699) : (!llvm.ptr, i64) -> i64
      %701 = func.call @cc_nil_value() : () -> i64
      %702 = func.call @cc_intern(%700, %701) : (i64, i64) -> i64
      %703 = func.call @cc_nil_value() : () -> i64
      %704 = func.call @cc_cons(%702, %703) : (i64, i64) -> i64
      %705 = func.call @cc_values_pack(%704) : (i64) -> i64
      func.call @stack_push_pointer(%702) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %706 = func.call @stack_pop_pointer() : () -> i64
      %707 = func.call @stack_pop_pointer() : () -> i64
      %708 = func.call @cc_cons(%707, %706) : (i64, i64) -> i64
      func.call @stack_push_pointer(%708) : (i64) -> ()
      %709 = func.call @stack_pop_pointer() : () -> i64
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = func.call @cc_cons(%710, %709) : (i64, i64) -> i64
      func.call @stack_push_pointer(%711) : (i64) -> ()
      %712 = func.call @stack_pop_pointer() : () -> i64
      %713 = func.call @stack_pop_pointer() : () -> i64
      %714 = func.call @cc_cons(%713, %712) : (i64, i64) -> i64
      func.call @stack_push_pointer(%714) : (i64) -> ()
      %715 = func.call @stack_pop_pointer() : () -> i64
      %716 = func.call @stack_pop_pointer() : () -> i64
      %717 = func.call @cc_cons(%716, %715) : (i64, i64) -> i64
      func.call @stack_push_pointer(%717) : (i64) -> ()
      %718 = func.call @stack_pop_pointer() : () -> i64
      %719 = func.call @stack_pop_pointer() : () -> i64
      %720 = func.call @cc_cons(%719, %718) : (i64, i64) -> i64
      func.call @stack_push_pointer(%720) : (i64) -> ()
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @stack_pop_pointer() : () -> i64
      %723 = func.call @cc_cons(%722, %721) : (i64, i64) -> i64
      func.call @stack_push_pointer(%723) : (i64) -> ()
      %724 = func.call @stack_pop_pointer() : () -> i64
      %725 = func.call @stack_pop_pointer() : () -> i64
      %726 = func.call @cc_cons(%725, %724) : (i64, i64) -> i64
      func.call @stack_push_pointer(%726) : (i64) -> ()
      %727 = func.call @stack_pop_pointer() : () -> i64
      %728 = func.call @stack_pop_pointer() : () -> i64
      %729 = func.call @cc_cons(%728, %727) : (i64, i64) -> i64
      func.call @stack_push_pointer(%729) : (i64) -> ()
      %730 = func.call @stack_pop_pointer() : () -> i64
      %731 = func.call @stack_pop_pointer() : () -> i64
      %732 = func.call @cc_cons(%731, %730) : (i64, i64) -> i64
      func.call @stack_push_pointer(%732) : (i64) -> ()
      %733 = func.call @stack_pop_pointer() : () -> i64
      %734 = func.call @stack_pop_pointer() : () -> i64
      %735 = func.call @cc_cons(%734, %733) : (i64, i64) -> i64
      func.call @stack_push_pointer(%735) : (i64) -> ()
      %736 = func.call @stack_pop_pointer() : () -> i64
      %737 = func.call @stack_pop_pointer() : () -> i64
      %738 = func.call @cc_cons(%737, %736) : (i64, i64) -> i64
      func.call @stack_push_pointer(%738) : (i64) -> ()
      %739 = func.call @stack_pop_pointer() : () -> i64
      %740 = func.call @stack_pop_pointer() : () -> i64
      %741 = func.call @cc_cons(%740, %739) : (i64, i64) -> i64
      func.call @stack_push_pointer(%741) : (i64) -> ()
      %742 = func.call @stack_pop_pointer() : () -> i64
      %1239 = arith.constant 60624168026112 : i64
      %1240 = arith.constant 0 : i64
      %1241 = func.call @cc_make_closure(%1239, %1240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1241) : (i64) -> ()
      %1242 = func.call @stack_pop_pointer() : () -> i64
      %1243 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1244 = arith.constant 3 : i64
      %1245 = func.call @cc_make_string(%1243, %1244) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1245) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1246 = func.call @stack_pop_pointer() : () -> i64
      %1247 = func.call @stack_pop_pointer() : () -> i64
      %1248 = func.call @cc_cons(%1247, %1246) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1248) : (i64) -> ()
      %1249 = func.call @stack_pop_pointer() : () -> i64
      %1250 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1251 = arith.constant 11 : i64
      %1252 = func.call @cc_make_string(%1250, %1251) : (!llvm.ptr, i64) -> i64
      %1253 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1254 = arith.constant 7 : i64
      %1255 = func.call @cc_make_string(%1253, %1254) : (!llvm.ptr, i64) -> i64
      %1256 = func.call @cc_intern(%1252, %1255) : (i64, i64) -> i64
      %1257 = func.call @cc_nil_value() : () -> i64
      %1258 = func.call @cc_cons(%1256, %1257) : (i64, i64) -> i64
      %1259 = func.call @cc_values_pack(%1258) : (i64) -> i64
      func.call @stack_push_pointer(%1256) : (i64) -> ()
      %1260 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1261 = func.call @stack_pop_pointer() : () -> i64
      %1262 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1263 = arith.constant 4 : i64
      %1264 = func.call @cc_make_string(%1262, %1263) : (!llvm.ptr, i64) -> i64
      %1265 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1266 = arith.constant 7 : i64
      %1267 = func.call @cc_make_string(%1265, %1266) : (!llvm.ptr, i64) -> i64
      %1268 = func.call @cc_intern(%1264, %1267) : (i64, i64) -> i64
      %1269 = func.call @cc_nil_value() : () -> i64
      %1270 = func.call @cc_cons(%1268, %1269) : (i64, i64) -> i64
      %1271 = func.call @cc_values_pack(%1270) : (i64) -> i64
      func.call @stack_push_pointer(%1268) : (i64) -> ()
      %1272 = func.call @stack_pop_pointer() : () -> i64
      %1273 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1274 = arith.constant 6 : i64
      %1275 = func.call @cc_make_string(%1273, %1274) : (!llvm.ptr, i64) -> i64
      %1276 = func.call @cc_nil_value() : () -> i64
      %1277 = func.call @cc_intern(%1275, %1276) : (i64, i64) -> i64
      %1278 = func.call @cc_nil_value() : () -> i64
      %1279 = func.call @cc_cons(%1277, %1278) : (i64, i64) -> i64
      %1280 = func.call @cc_values_pack(%1279) : (i64) -> i64
      func.call @stack_push_pointer(%1277) : (i64) -> ()
      %1281 = func.call @stack_pop_pointer() : () -> i64
      %1282 = func.call @cc_nil_value() : () -> i64
      %1283 = func.call @cc_errorp(%38) : (i64) -> i64
      %1284 = arith.cmpi ne, %1283, %1282 : i64
      %1285 = arith.cmpi eq, %1282, %1282 : i64
      %1286 = arith.andi %1284, %1285 : i1
      %1287 = scf.if %1286 -> (i64) {
        scf.yield %38 : i64
      } else {
        scf.yield %1282 : i64
      }
      %1288 = func.call @cc_errorp(%742) : (i64) -> i64
      %1289 = arith.cmpi ne, %1288, %1282 : i64
      %1290 = arith.cmpi eq, %1287, %1282 : i64
      %1291 = arith.andi %1289, %1290 : i1
      %1292 = scf.if %1291 -> (i64) {
        scf.yield %742 : i64
      } else {
        scf.yield %1287 : i64
      }
      %1293 = func.call @cc_errorp(%1242) : (i64) -> i64
      %1294 = arith.cmpi ne, %1293, %1282 : i64
      %1295 = arith.cmpi eq, %1292, %1282 : i64
      %1296 = arith.andi %1294, %1295 : i1
      %1297 = scf.if %1296 -> (i64) {
        scf.yield %1242 : i64
      } else {
        scf.yield %1292 : i64
      }
      %1298 = func.call @cc_errorp(%1249) : (i64) -> i64
      %1299 = arith.cmpi ne, %1298, %1282 : i64
      %1300 = arith.cmpi eq, %1297, %1282 : i64
      %1301 = arith.andi %1299, %1300 : i1
      %1302 = scf.if %1301 -> (i64) {
        scf.yield %1249 : i64
      } else {
        scf.yield %1297 : i64
      }
      %1303 = func.call @cc_errorp(%1260) : (i64) -> i64
      %1304 = arith.cmpi ne, %1303, %1282 : i64
      %1305 = arith.cmpi eq, %1302, %1282 : i64
      %1306 = arith.andi %1304, %1305 : i1
      %1307 = scf.if %1306 -> (i64) {
        scf.yield %1260 : i64
      } else {
        scf.yield %1302 : i64
      }
      %1308 = func.call @cc_errorp(%1261) : (i64) -> i64
      %1309 = arith.cmpi ne, %1308, %1282 : i64
      %1310 = arith.cmpi eq, %1307, %1282 : i64
      %1311 = arith.andi %1309, %1310 : i1
      %1312 = scf.if %1311 -> (i64) {
        scf.yield %1261 : i64
      } else {
        scf.yield %1307 : i64
      }
      %1313 = func.call @cc_errorp(%1272) : (i64) -> i64
      %1314 = arith.cmpi ne, %1313, %1282 : i64
      %1315 = arith.cmpi eq, %1312, %1282 : i64
      %1316 = arith.andi %1314, %1315 : i1
      %1317 = scf.if %1316 -> (i64) {
        scf.yield %1272 : i64
      } else {
        scf.yield %1312 : i64
      }
      %1318 = func.call @cc_errorp(%1281) : (i64) -> i64
      %1319 = arith.cmpi ne, %1318, %1282 : i64
      %1320 = arith.cmpi eq, %1317, %1282 : i64
      %1321 = arith.andi %1319, %1320 : i1
      %1322 = scf.if %1321 -> (i64) {
        scf.yield %1281 : i64
      } else {
        scf.yield %1317 : i64
      }
      %1323 = arith.cmpi ne, %1322, %1282 : i64
      scf.if %1323 {
        func.call @stack_push_pointer(%1322) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%38) : (i64) -> ()
        func.call @stack_push_pointer(%742) : (i64) -> ()
        func.call @stack_push_pointer(%1242) : (i64) -> ()
        func.call @stack_push_pointer(%1249) : (i64) -> ()
        func.call @stack_push_pointer(%1260) : (i64) -> ()
        func.call @stack_push_pointer(%1261) : (i64) -> ()
        func.call @stack_push_pointer(%1272) : (i64) -> ()
        func.call @stack_push_pointer(%1281) : (i64) -> ()
        %1324 = llvm.mlir.addressof @str147 : !llvm.ptr
        %1325 = func.call @cc_make_function_ref_const(%1324) : (!llvm.ptr) -> i64
        %1326 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1325, %1326) : (i64, i64) -> ()
      }
      %1327 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1327 : i64
    }
    func.call @stack_push_pointer(%29) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_60624168026112"() {
    %743 = func.call @cc_nil_value() : () -> i64
    %744 = func.call @cc_nil_value() : () -> i64
    %745 = func.call @cc_errorp(%743) : (i64) -> i64
    %746 = arith.cmpi ne, %745, %744 : i64
    %747 = scf.if %746 -> (i64) {
      scf.yield %743 : i64
    } else {
      %748 = llvm.mlir.addressof @str95 : !llvm.ptr
      %749 = arith.constant 11 : i64
      %750 = func.call @cc_make_string(%748, %749) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%750) : (i64) -> ()
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @cc_nil_value() : () -> i64
      %753 = func.call @cc_errorp(%751) : (i64) -> i64
      %754 = arith.cmpi ne, %753, %752 : i64
      %755 = arith.cmpi eq, %752, %752 : i64
      %756 = arith.andi %754, %755 : i1
      %757 = scf.if %756 -> (i64) {
        scf.yield %751 : i64
      } else {
        scf.yield %752 : i64
      }
      %758 = arith.cmpi ne, %757, %752 : i64
      scf.if %758 {
        func.call @stack_push_pointer(%757) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%751) : (i64) -> ()
        %759 = llvm.mlir.addressof @str96 : !llvm.ptr
        %760 = func.call @cc_make_function_ref_const(%759) : (!llvm.ptr) -> i64
        %761 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%760, %761) : (i64, i64) -> ()
      }
      %762 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%762) : (i64) -> ()
      %763 = func.call @stack_pop_pointer() : () -> i64
      %764 = llvm.mlir.addressof @str97 : !llvm.ptr
      %765 = arith.constant 17 : i64
      %766 = func.call @cc_make_string(%764, %765) : (!llvm.ptr, i64) -> i64
      %767 = llvm.mlir.addressof @str98 : !llvm.ptr
      %768 = arith.constant 7 : i64
      %769 = func.call @cc_make_string(%767, %768) : (!llvm.ptr, i64) -> i64
      %770 = func.call @cc_intern(%766, %769) : (i64, i64) -> i64
      %771 = func.call @cc_nil_value() : () -> i64
      %772 = func.call @cc_cons(%770, %771) : (i64, i64) -> i64
      %773 = func.call @cc_values_pack(%772) : (i64) -> i64
      func.call @stack_push_pointer(%770) : (i64) -> ()
      %774 = func.call @stack_pop_pointer() : () -> i64
      %775 = llvm.mlir.addressof @str99 : !llvm.ptr
      %776 = arith.constant 6 : i64
      %777 = func.call @cc_make_string(%775, %776) : (!llvm.ptr, i64) -> i64
      %778 = llvm.mlir.addressof @str100 : !llvm.ptr
      %779 = arith.constant 7 : i64
      %780 = func.call @cc_make_string(%778, %779) : (!llvm.ptr, i64) -> i64
      %781 = func.call @cc_intern(%777, %780) : (i64, i64) -> i64
      %782 = func.call @cc_nil_value() : () -> i64
      %783 = func.call @cc_cons(%781, %782) : (i64, i64) -> i64
      %784 = func.call @cc_values_pack(%783) : (i64) -> i64
      func.call @stack_push_pointer(%781) : (i64) -> ()
      %785 = func.call @stack_pop_pointer() : () -> i64
      %786 = llvm.mlir.addressof @str101 : !llvm.ptr
      %787 = arith.constant 9 : i64
      %788 = func.call @cc_make_string(%786, %787) : (!llvm.ptr, i64) -> i64
      %789 = llvm.mlir.addressof @str102 : !llvm.ptr
      %790 = arith.constant 7 : i64
      %791 = func.call @cc_make_string(%789, %790) : (!llvm.ptr, i64) -> i64
      %792 = func.call @cc_intern(%788, %791) : (i64, i64) -> i64
      %793 = func.call @cc_nil_value() : () -> i64
      %794 = func.call @cc_cons(%792, %793) : (i64, i64) -> i64
      %795 = func.call @cc_values_pack(%794) : (i64) -> i64
      func.call @stack_push_pointer(%792) : (i64) -> ()
      %796 = func.call @stack_pop_pointer() : () -> i64
      %797 = llvm.mlir.addressof @str103 : !llvm.ptr
      %798 = arith.constant 6 : i64
      %799 = func.call @cc_make_string(%797, %798) : (!llvm.ptr, i64) -> i64
      %800 = llvm.mlir.addressof @str104 : !llvm.ptr
      %801 = arith.constant 7 : i64
      %802 = func.call @cc_make_string(%800, %801) : (!llvm.ptr, i64) -> i64
      %803 = func.call @cc_intern(%799, %802) : (i64, i64) -> i64
      %804 = func.call @cc_nil_value() : () -> i64
      %805 = func.call @cc_cons(%803, %804) : (i64, i64) -> i64
      %806 = func.call @cc_values_pack(%805) : (i64) -> i64
      func.call @stack_push_pointer(%803) : (i64) -> ()
      %807 = func.call @stack_pop_pointer() : () -> i64
      %808 = func.call @cc_nil_value() : () -> i64
      %809 = func.call @cc_errorp(%763) : (i64) -> i64
      %810 = arith.cmpi ne, %809, %808 : i64
      %811 = arith.cmpi eq, %808, %808 : i64
      %812 = arith.andi %810, %811 : i1
      %813 = scf.if %812 -> (i64) {
        scf.yield %763 : i64
      } else {
        scf.yield %808 : i64
      }
      %814 = func.call @cc_errorp(%774) : (i64) -> i64
      %815 = arith.cmpi ne, %814, %808 : i64
      %816 = arith.cmpi eq, %813, %808 : i64
      %817 = arith.andi %815, %816 : i1
      %818 = scf.if %817 -> (i64) {
        scf.yield %774 : i64
      } else {
        scf.yield %813 : i64
      }
      %819 = func.call @cc_errorp(%785) : (i64) -> i64
      %820 = arith.cmpi ne, %819, %808 : i64
      %821 = arith.cmpi eq, %818, %808 : i64
      %822 = arith.andi %820, %821 : i1
      %823 = scf.if %822 -> (i64) {
        scf.yield %785 : i64
      } else {
        scf.yield %818 : i64
      }
      %824 = func.call @cc_errorp(%796) : (i64) -> i64
      %825 = arith.cmpi ne, %824, %808 : i64
      %826 = arith.cmpi eq, %823, %808 : i64
      %827 = arith.andi %825, %826 : i1
      %828 = scf.if %827 -> (i64) {
        scf.yield %796 : i64
      } else {
        scf.yield %823 : i64
      }
      %829 = func.call @cc_errorp(%807) : (i64) -> i64
      %830 = arith.cmpi ne, %829, %808 : i64
      %831 = arith.cmpi eq, %828, %808 : i64
      %832 = arith.andi %830, %831 : i1
      %833 = scf.if %832 -> (i64) {
        scf.yield %807 : i64
      } else {
        scf.yield %828 : i64
      }
      %834 = arith.cmpi ne, %833, %808 : i64
      scf.if %834 {
        func.call @stack_push_pointer(%833) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%763) : (i64) -> ()
        func.call @stack_push_pointer(%774) : (i64) -> ()
        func.call @stack_push_pointer(%785) : (i64) -> ()
        func.call @stack_push_pointer(%796) : (i64) -> ()
        func.call @stack_push_pointer(%807) : (i64) -> ()
        %835 = llvm.mlir.addressof @str105 : !llvm.ptr
        %836 = func.call @cc_make_function_ref_const(%835) : (!llvm.ptr) -> i64
        %837 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%836, %837) : (i64, i64) -> ()
      }
      %838 = func.call @stack_pop_pointer() : () -> i64
      %839 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%839) : (i64) -> ()
      %840 = func.call @stack_pop_pointer() : () -> i64
      %841 = llvm.mlir.addressof @str106 : !llvm.ptr
      %842 = arith.constant 12 : i64
      %843 = func.call @cc_make_string(%841, %842) : (!llvm.ptr, i64) -> i64
      %844 = llvm.mlir.addressof @str107 : !llvm.ptr
      %845 = arith.constant 7 : i64
      %846 = func.call @cc_make_string(%844, %845) : (!llvm.ptr, i64) -> i64
      %847 = func.call @cc_intern(%843, %846) : (i64, i64) -> i64
      %848 = func.call @cc_nil_value() : () -> i64
      %849 = func.call @cc_cons(%847, %848) : (i64, i64) -> i64
      %850 = func.call @cc_values_pack(%849) : (i64) -> i64
      func.call @stack_push_pointer(%847) : (i64) -> ()
      %851 = func.call @stack_pop_pointer() : () -> i64
      %852 = llvm.mlir.addressof @str108 : !llvm.ptr
      %853 = arith.constant 9 : i64
      %854 = func.call @cc_make_string(%852, %853) : (!llvm.ptr, i64) -> i64
      %855 = llvm.mlir.addressof @str109 : !llvm.ptr
      %856 = arith.constant 11 : i64
      %857 = func.call @cc_make_string(%855, %856) : (!llvm.ptr, i64) -> i64
      %858 = func.call @cc_intern(%854, %857) : (i64, i64) -> i64
      %859 = func.call @cc_nil_value() : () -> i64
      %860 = func.call @cc_cons(%858, %859) : (i64, i64) -> i64
      %861 = func.call @cc_values_pack(%860) : (i64) -> i64
      func.call @stack_push_pointer(%858) : (i64) -> ()
      %862 = func.call @stack_pop_pointer() : () -> i64
      %863 = func.call @cc_nil_value() : () -> i64
      %864 = func.call @cc_errorp(%840) : (i64) -> i64
      %865 = arith.cmpi ne, %864, %863 : i64
      %866 = arith.cmpi eq, %863, %863 : i64
      %867 = arith.andi %865, %866 : i1
      %868 = scf.if %867 -> (i64) {
        scf.yield %840 : i64
      } else {
        scf.yield %863 : i64
      }
      %869 = func.call @cc_errorp(%851) : (i64) -> i64
      %870 = arith.cmpi ne, %869, %863 : i64
      %871 = arith.cmpi eq, %868, %863 : i64
      %872 = arith.andi %870, %871 : i1
      %873 = scf.if %872 -> (i64) {
        scf.yield %851 : i64
      } else {
        scf.yield %868 : i64
      }
      %874 = func.call @cc_errorp(%862) : (i64) -> i64
      %875 = arith.cmpi ne, %874, %863 : i64
      %876 = arith.cmpi eq, %873, %863 : i64
      %877 = arith.andi %875, %876 : i1
      %878 = scf.if %877 -> (i64) {
        scf.yield %862 : i64
      } else {
        scf.yield %873 : i64
      }
      %879 = arith.cmpi ne, %878, %863 : i64
      scf.if %879 {
        func.call @stack_push_pointer(%878) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%840) : (i64) -> ()
        func.call @stack_push_pointer(%851) : (i64) -> ()
        func.call @stack_push_pointer(%862) : (i64) -> ()
        %880 = llvm.mlir.addressof @str110 : !llvm.ptr
        %881 = func.call @cc_make_function_ref_const(%880) : (!llvm.ptr) -> i64
        %882 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%881, %882) : (i64, i64) -> ()
      }
      %883 = func.call @stack_pop_pointer() : () -> i64
      %884 = func.call @cc_nil_value() : () -> i64
      %885 = func.call @cc_nil_value() : () -> i64
      %886 = func.call @cc_errorp(%884) : (i64) -> i64
      %887 = arith.cmpi ne, %886, %885 : i64
      %888 = scf.if %887 -> (i64) {
        scf.yield %884 : i64
      } else {
        %889 = llvm.mlir.addressof @str111 : !llvm.ptr
        %890 = arith.constant 3 : i64
        %891 = func.call @cc_make_string(%889, %890) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%891) : (i64) -> ()
        %892 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%838) : (i64) -> ()
        %893 = func.call @stack_pop_pointer() : () -> i64
        %894 = func.call @cc_nil_value() : () -> i64
        %895 = func.call @cc_errorp(%892) : (i64) -> i64
        %896 = arith.cmpi ne, %895, %894 : i64
        %897 = arith.cmpi eq, %894, %894 : i64
        %898 = arith.andi %896, %897 : i1
        %899 = scf.if %898 -> (i64) {
          scf.yield %892 : i64
        } else {
          scf.yield %894 : i64
        }
        %900 = func.call @cc_errorp(%893) : (i64) -> i64
        %901 = arith.cmpi ne, %900, %894 : i64
        %902 = arith.cmpi eq, %899, %894 : i64
        %903 = arith.andi %901, %902 : i1
        %904 = scf.if %903 -> (i64) {
          scf.yield %893 : i64
        } else {
          scf.yield %899 : i64
        }
        %905 = arith.cmpi ne, %904, %894 : i64
        scf.if %905 {
          func.call @stack_push_pointer(%904) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%892) : (i64) -> ()
          func.call @stack_push_pointer(%893) : (i64) -> ()
          %906 = llvm.mlir.addressof @str112 : !llvm.ptr
          %907 = func.call @cc_make_function_ref_const(%906) : (!llvm.ptr) -> i64
          %908 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%907, %908) : (i64, i64) -> ()
        }
        %909 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %909 : i64
      }
      %910 = func.call @cc_nil_value() : () -> i64
      %911 = func.call @cc_errorp(%888) : (i64) -> i64
      %912 = arith.cmpi ne, %911, %910 : i64
      %913 = scf.if %912 -> (i64) {
        scf.yield %888 : i64
      } else {
        func.call @stack_push_pointer(%838) : (i64) -> ()
        %914 = func.call @stack_pop_pointer() : () -> i64
        %915 = func.call @cc_nil_value() : () -> i64
        %916 = func.call @cc_errorp(%914) : (i64) -> i64
        %917 = arith.cmpi ne, %916, %915 : i64
        %918 = arith.cmpi eq, %915, %915 : i64
        %919 = arith.andi %917, %918 : i1
        %920 = scf.if %919 -> (i64) {
          scf.yield %914 : i64
        } else {
          scf.yield %915 : i64
        }
        %921 = arith.cmpi ne, %920, %915 : i64
        scf.if %921 {
          func.call @stack_push_pointer(%920) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%914) : (i64) -> ()
          %922 = llvm.mlir.addressof @str113 : !llvm.ptr
          %923 = func.call @cc_make_function_ref_const(%922) : (!llvm.ptr) -> i64
          %924 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%923, %924) : (i64, i64) -> ()
        }
        %925 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %925 : i64
      }
      %926 = func.call @cc_nil_value() : () -> i64
      %927 = func.call @cc_errorp(%913) : (i64) -> i64
      %928 = arith.cmpi ne, %927, %926 : i64
      %929 = scf.if %928 -> (i64) {
        scf.yield %913 : i64
      } else {
        func.call @stack_push_pointer(%762) : (i64) -> ()
        %930 = func.call @stack_pop_pointer() : () -> i64
        %931 = llvm.mlir.addressof @str114 : !llvm.ptr
        %932 = arith.constant 17 : i64
        %933 = func.call @cc_make_string(%931, %932) : (!llvm.ptr, i64) -> i64
        %934 = llvm.mlir.addressof @str115 : !llvm.ptr
        %935 = arith.constant 7 : i64
        %936 = func.call @cc_make_string(%934, %935) : (!llvm.ptr, i64) -> i64
        %937 = func.call @cc_intern(%933, %936) : (i64, i64) -> i64
        %938 = func.call @cc_nil_value() : () -> i64
        %939 = func.call @cc_cons(%937, %938) : (i64, i64) -> i64
        %940 = func.call @cc_values_pack(%939) : (i64) -> i64
        func.call @stack_push_pointer(%937) : (i64) -> ()
        %941 = func.call @stack_pop_pointer() : () -> i64
        %942 = llvm.mlir.addressof @str116 : !llvm.ptr
        %943 = arith.constant 6 : i64
        %944 = func.call @cc_make_string(%942, %943) : (!llvm.ptr, i64) -> i64
        %945 = llvm.mlir.addressof @str117 : !llvm.ptr
        %946 = arith.constant 7 : i64
        %947 = func.call @cc_make_string(%945, %946) : (!llvm.ptr, i64) -> i64
        %948 = func.call @cc_intern(%944, %947) : (i64, i64) -> i64
        %949 = func.call @cc_nil_value() : () -> i64
        %950 = func.call @cc_cons(%948, %949) : (i64, i64) -> i64
        %951 = func.call @cc_values_pack(%950) : (i64) -> i64
        func.call @stack_push_pointer(%948) : (i64) -> ()
        %952 = func.call @stack_pop_pointer() : () -> i64
        %953 = llvm.mlir.addressof @str118 : !llvm.ptr
        %954 = arith.constant 9 : i64
        %955 = func.call @cc_make_string(%953, %954) : (!llvm.ptr, i64) -> i64
        %956 = llvm.mlir.addressof @str119 : !llvm.ptr
        %957 = arith.constant 7 : i64
        %958 = func.call @cc_make_string(%956, %957) : (!llvm.ptr, i64) -> i64
        %959 = func.call @cc_intern(%955, %958) : (i64, i64) -> i64
        %960 = func.call @cc_nil_value() : () -> i64
        %961 = func.call @cc_cons(%959, %960) : (i64, i64) -> i64
        %962 = func.call @cc_values_pack(%961) : (i64) -> i64
        func.call @stack_push_pointer(%959) : (i64) -> ()
        %963 = func.call @stack_pop_pointer() : () -> i64
        %964 = llvm.mlir.addressof @str120 : !llvm.ptr
        %965 = arith.constant 9 : i64
        %966 = func.call @cc_make_string(%964, %965) : (!llvm.ptr, i64) -> i64
        %967 = llvm.mlir.addressof @str121 : !llvm.ptr
        %968 = arith.constant 7 : i64
        %969 = func.call @cc_make_string(%967, %968) : (!llvm.ptr, i64) -> i64
        %970 = func.call @cc_intern(%966, %969) : (i64, i64) -> i64
        %971 = func.call @cc_nil_value() : () -> i64
        %972 = func.call @cc_cons(%970, %971) : (i64, i64) -> i64
        %973 = func.call @cc_values_pack(%972) : (i64) -> i64
        func.call @stack_push_pointer(%970) : (i64) -> ()
        %974 = func.call @stack_pop_pointer() : () -> i64
        %975 = llvm.mlir.addressof @str122 : !llvm.ptr
        %976 = arith.constant 9 : i64
        %977 = func.call @cc_make_string(%975, %976) : (!llvm.ptr, i64) -> i64
        %978 = llvm.mlir.addressof @str123 : !llvm.ptr
        %979 = arith.constant 7 : i64
        %980 = func.call @cc_make_string(%978, %979) : (!llvm.ptr, i64) -> i64
        %981 = func.call @cc_intern(%977, %980) : (i64, i64) -> i64
        %982 = func.call @cc_nil_value() : () -> i64
        %983 = func.call @cc_cons(%981, %982) : (i64, i64) -> i64
        %984 = func.call @cc_values_pack(%983) : (i64) -> i64
        func.call @stack_push_pointer(%981) : (i64) -> ()
        %985 = func.call @stack_pop_pointer() : () -> i64
        %986 = llvm.mlir.addressof @str124 : !llvm.ptr
        %987 = arith.constant 6 : i64
        %988 = func.call @cc_make_string(%986, %987) : (!llvm.ptr, i64) -> i64
        %989 = llvm.mlir.addressof @str125 : !llvm.ptr
        %990 = arith.constant 7 : i64
        %991 = func.call @cc_make_string(%989, %990) : (!llvm.ptr, i64) -> i64
        %992 = func.call @cc_intern(%988, %991) : (i64, i64) -> i64
        %993 = func.call @cc_nil_value() : () -> i64
        %994 = func.call @cc_cons(%992, %993) : (i64, i64) -> i64
        %995 = func.call @cc_values_pack(%994) : (i64) -> i64
        func.call @stack_push_pointer(%992) : (i64) -> ()
        %996 = func.call @stack_pop_pointer() : () -> i64
        %997 = func.call @cc_nil_value() : () -> i64
        %998 = func.call @cc_errorp(%930) : (i64) -> i64
        %999 = arith.cmpi ne, %998, %997 : i64
        %1000 = arith.cmpi eq, %997, %997 : i64
        %1001 = arith.andi %999, %1000 : i1
        %1002 = scf.if %1001 -> (i64) {
          scf.yield %930 : i64
        } else {
          scf.yield %997 : i64
        }
        %1003 = func.call @cc_errorp(%941) : (i64) -> i64
        %1004 = arith.cmpi ne, %1003, %997 : i64
        %1005 = arith.cmpi eq, %1002, %997 : i64
        %1006 = arith.andi %1004, %1005 : i1
        %1007 = scf.if %1006 -> (i64) {
          scf.yield %941 : i64
        } else {
          scf.yield %1002 : i64
        }
        %1008 = func.call @cc_errorp(%952) : (i64) -> i64
        %1009 = arith.cmpi ne, %1008, %997 : i64
        %1010 = arith.cmpi eq, %1007, %997 : i64
        %1011 = arith.andi %1009, %1010 : i1
        %1012 = scf.if %1011 -> (i64) {
          scf.yield %952 : i64
        } else {
          scf.yield %1007 : i64
        }
        %1013 = func.call @cc_errorp(%963) : (i64) -> i64
        %1014 = arith.cmpi ne, %1013, %997 : i64
        %1015 = arith.cmpi eq, %1012, %997 : i64
        %1016 = arith.andi %1014, %1015 : i1
        %1017 = scf.if %1016 -> (i64) {
          scf.yield %963 : i64
        } else {
          scf.yield %1012 : i64
        }
        %1018 = func.call @cc_errorp(%974) : (i64) -> i64
        %1019 = arith.cmpi ne, %1018, %997 : i64
        %1020 = arith.cmpi eq, %1017, %997 : i64
        %1021 = arith.andi %1019, %1020 : i1
        %1022 = scf.if %1021 -> (i64) {
          scf.yield %974 : i64
        } else {
          scf.yield %1017 : i64
        }
        %1023 = func.call @cc_errorp(%985) : (i64) -> i64
        %1024 = arith.cmpi ne, %1023, %997 : i64
        %1025 = arith.cmpi eq, %1022, %997 : i64
        %1026 = arith.andi %1024, %1025 : i1
        %1027 = scf.if %1026 -> (i64) {
          scf.yield %985 : i64
        } else {
          scf.yield %1022 : i64
        }
        %1028 = func.call @cc_errorp(%996) : (i64) -> i64
        %1029 = arith.cmpi ne, %1028, %997 : i64
        %1030 = arith.cmpi eq, %1027, %997 : i64
        %1031 = arith.andi %1029, %1030 : i1
        %1032 = scf.if %1031 -> (i64) {
          scf.yield %996 : i64
        } else {
          scf.yield %1027 : i64
        }
        %1033 = arith.cmpi ne, %1032, %997 : i64
        scf.if %1033 {
          func.call @stack_push_pointer(%1032) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%930) : (i64) -> ()
          func.call @stack_push_pointer(%941) : (i64) -> ()
          func.call @stack_push_pointer(%952) : (i64) -> ()
          func.call @stack_push_pointer(%963) : (i64) -> ()
          func.call @stack_push_pointer(%974) : (i64) -> ()
          func.call @stack_push_pointer(%985) : (i64) -> ()
          func.call @stack_push_pointer(%996) : (i64) -> ()
          %1034 = llvm.mlir.addressof @str126 : !llvm.ptr
          %1035 = func.call @cc_make_function_ref_const(%1034) : (!llvm.ptr) -> i64
          %1036 = arith.constant 7 : i64
          func.call @cc_funcall_stack(%1035, %1036) : (i64, i64) -> ()
        }
        %1037 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1037) : (i64) -> ()
        %1038 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1038 : i64
      }
      %1039 = func.call @cc_nil_value() : () -> i64
      %1040 = func.call @cc_errorp(%929) : (i64) -> i64
      %1041 = arith.cmpi ne, %1040, %1039 : i64
      %1042 = scf.if %1041 -> (i64) {
        scf.yield %929 : i64
      } else {
        %1043 = llvm.mlir.addressof @str127 : !llvm.ptr
        %1044 = arith.constant 3 : i64
        %1045 = func.call @cc_make_string(%1043, %1044) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1045) : (i64) -> ()
        %1046 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%838) : (i64) -> ()
        %1047 = func.call @stack_pop_pointer() : () -> i64
        %1048 = func.call @cc_nil_value() : () -> i64
        %1049 = func.call @cc_errorp(%1046) : (i64) -> i64
        %1050 = arith.cmpi ne, %1049, %1048 : i64
        %1051 = arith.cmpi eq, %1048, %1048 : i64
        %1052 = arith.andi %1050, %1051 : i1
        %1053 = scf.if %1052 -> (i64) {
          scf.yield %1046 : i64
        } else {
          scf.yield %1048 : i64
        }
        %1054 = func.call @cc_errorp(%1047) : (i64) -> i64
        %1055 = arith.cmpi ne, %1054, %1048 : i64
        %1056 = arith.cmpi eq, %1053, %1048 : i64
        %1057 = arith.andi %1055, %1056 : i1
        %1058 = scf.if %1057 -> (i64) {
          scf.yield %1047 : i64
        } else {
          scf.yield %1053 : i64
        }
        %1059 = arith.cmpi ne, %1058, %1048 : i64
        scf.if %1059 {
          func.call @stack_push_pointer(%1058) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1046) : (i64) -> ()
          func.call @stack_push_pointer(%1047) : (i64) -> ()
          %1060 = llvm.mlir.addressof @str128 : !llvm.ptr
          %1061 = func.call @cc_make_function_ref_const(%1060) : (!llvm.ptr) -> i64
          %1062 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1061, %1062) : (i64, i64) -> ()
        }
        %1063 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1063 : i64
      }
      %1064 = func.call @cc_nil_value() : () -> i64
      %1065 = func.call @cc_errorp(%1042) : (i64) -> i64
      %1066 = arith.cmpi ne, %1065, %1064 : i64
      %1067 = scf.if %1066 -> (i64) {
        scf.yield %1042 : i64
      } else {
        func.call @stack_push_pointer(%838) : (i64) -> ()
        %1068 = func.call @stack_pop_pointer() : () -> i64
        %1069 = func.call @cc_nil_value() : () -> i64
        %1070 = func.call @cc_errorp(%1068) : (i64) -> i64
        %1071 = arith.cmpi ne, %1070, %1069 : i64
        %1072 = arith.cmpi eq, %1069, %1069 : i64
        %1073 = arith.andi %1071, %1072 : i1
        %1074 = scf.if %1073 -> (i64) {
          scf.yield %1068 : i64
        } else {
          scf.yield %1069 : i64
        }
        %1075 = arith.cmpi ne, %1074, %1069 : i64
        scf.if %1075 {
          func.call @stack_push_pointer(%1074) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1068) : (i64) -> ()
          %1076 = llvm.mlir.addressof @str129 : !llvm.ptr
          %1077 = func.call @cc_make_function_ref_const(%1076) : (!llvm.ptr) -> i64
          %1078 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1077, %1078) : (i64, i64) -> ()
        }
        %1079 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1079 : i64
      }
      %1080 = func.call @cc_nil_value() : () -> i64
      %1081 = func.call @cc_errorp(%1067) : (i64) -> i64
      %1082 = arith.cmpi ne, %1081, %1080 : i64
      %1083 = scf.if %1082 -> (i64) {
        scf.yield %1067 : i64
      } else {
        func.call @stack_push_pointer(%762) : (i64) -> ()
        %1084 = func.call @stack_pop_pointer() : () -> i64
        %1085 = llvm.mlir.addressof @str130 : !llvm.ptr
        %1086 = arith.constant 9 : i64
        %1087 = func.call @cc_make_string(%1085, %1086) : (!llvm.ptr, i64) -> i64
        %1088 = llvm.mlir.addressof @str131 : !llvm.ptr
        %1089 = arith.constant 7 : i64
        %1090 = func.call @cc_make_string(%1088, %1089) : (!llvm.ptr, i64) -> i64
        %1091 = func.call @cc_intern(%1087, %1090) : (i64, i64) -> i64
        %1092 = func.call @cc_nil_value() : () -> i64
        %1093 = func.call @cc_cons(%1091, %1092) : (i64, i64) -> i64
        %1094 = func.call @cc_values_pack(%1093) : (i64) -> i64
        func.call @stack_push_pointer(%1091) : (i64) -> ()
        %1095 = func.call @stack_pop_pointer() : () -> i64
        %1096 = llvm.mlir.addressof @str132 : !llvm.ptr
        %1097 = arith.constant 5 : i64
        %1098 = func.call @cc_make_string(%1096, %1097) : (!llvm.ptr, i64) -> i64
        %1099 = llvm.mlir.addressof @str133 : !llvm.ptr
        %1100 = arith.constant 7 : i64
        %1101 = func.call @cc_make_string(%1099, %1100) : (!llvm.ptr, i64) -> i64
        %1102 = func.call @cc_intern(%1098, %1101) : (i64, i64) -> i64
        %1103 = func.call @cc_nil_value() : () -> i64
        %1104 = func.call @cc_cons(%1102, %1103) : (i64, i64) -> i64
        %1105 = func.call @cc_values_pack(%1104) : (i64) -> i64
        func.call @stack_push_pointer(%1102) : (i64) -> ()
        %1106 = func.call @stack_pop_pointer() : () -> i64
        %1107 = func.call @cc_nil_value() : () -> i64
        %1108 = func.call @cc_errorp(%1084) : (i64) -> i64
        %1109 = arith.cmpi ne, %1108, %1107 : i64
        %1110 = arith.cmpi eq, %1107, %1107 : i64
        %1111 = arith.andi %1109, %1110 : i1
        %1112 = scf.if %1111 -> (i64) {
          scf.yield %1084 : i64
        } else {
          scf.yield %1107 : i64
        }
        %1113 = func.call @cc_errorp(%1095) : (i64) -> i64
        %1114 = arith.cmpi ne, %1113, %1107 : i64
        %1115 = arith.cmpi eq, %1112, %1107 : i64
        %1116 = arith.andi %1114, %1115 : i1
        %1117 = scf.if %1116 -> (i64) {
          scf.yield %1095 : i64
        } else {
          scf.yield %1112 : i64
        }
        %1118 = func.call @cc_errorp(%1106) : (i64) -> i64
        %1119 = arith.cmpi ne, %1118, %1107 : i64
        %1120 = arith.cmpi eq, %1117, %1107 : i64
        %1121 = arith.andi %1119, %1120 : i1
        %1122 = scf.if %1121 -> (i64) {
          scf.yield %1106 : i64
        } else {
          scf.yield %1117 : i64
        }
        %1123 = arith.cmpi ne, %1122, %1107 : i64
        scf.if %1123 {
          func.call @stack_push_pointer(%1122) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1084) : (i64) -> ()
          func.call @stack_push_pointer(%1095) : (i64) -> ()
          func.call @stack_push_pointer(%1106) : (i64) -> ()
          %1124 = llvm.mlir.addressof @str134 : !llvm.ptr
          %1125 = func.call @cc_make_function_ref_const(%1124) : (!llvm.ptr) -> i64
          %1126 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1125, %1126) : (i64, i64) -> ()
        }
        %1127 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1127) : (i64) -> ()
        %1128 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1128 : i64
      }
      %1129 = func.call @cc_nil_value() : () -> i64
      %1130 = func.call @cc_errorp(%1083) : (i64) -> i64
      %1131 = arith.cmpi ne, %1130, %1129 : i64
      %1132 = scf.if %1131 -> (i64) {
        scf.yield %1083 : i64
      } else {
        func.call @stack_push_pointer(%883) : (i64) -> ()
        %1133 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%838) : (i64) -> ()
        %1134 = func.call @stack_pop_pointer() : () -> i64
        %1135 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1136 = arith.constant 5 : i64
        %1137 = func.call @cc_make_string(%1135, %1136) : (!llvm.ptr, i64) -> i64
        %1138 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1139 = arith.constant 7 : i64
        %1140 = func.call @cc_make_string(%1138, %1139) : (!llvm.ptr, i64) -> i64
        %1141 = func.call @cc_intern(%1137, %1140) : (i64, i64) -> i64
        %1142 = func.call @cc_nil_value() : () -> i64
        %1143 = func.call @cc_cons(%1141, %1142) : (i64, i64) -> i64
        %1144 = func.call @cc_values_pack(%1143) : (i64) -> i64
        func.call @stack_push_pointer(%1141) : (i64) -> ()
        %1145 = func.call @stack_pop_pointer() : () -> i64
        %1146 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%1146) : (i64) -> ()
        %1147 = func.call @stack_pop_pointer() : () -> i64
        %1148 = llvm.mlir.addressof @str137 : !llvm.ptr
        %1149 = arith.constant 3 : i64
        %1150 = func.call @cc_make_string(%1148, %1149) : (!llvm.ptr, i64) -> i64
        %1151 = llvm.mlir.addressof @str138 : !llvm.ptr
        %1152 = arith.constant 7 : i64
        %1153 = func.call @cc_make_string(%1151, %1152) : (!llvm.ptr, i64) -> i64
        %1154 = func.call @cc_intern(%1150, %1153) : (i64, i64) -> i64
        %1155 = func.call @cc_nil_value() : () -> i64
        %1156 = func.call @cc_cons(%1154, %1155) : (i64, i64) -> i64
        %1157 = func.call @cc_values_pack(%1156) : (i64) -> i64
        func.call @stack_push_pointer(%1154) : (i64) -> ()
        %1158 = func.call @stack_pop_pointer() : () -> i64
        %1159 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%1159) : (i64) -> ()
        %1160 = func.call @stack_pop_pointer() : () -> i64
        %1161 = func.call @cc_nil_value() : () -> i64
        %1162 = func.call @cc_errorp(%1133) : (i64) -> i64
        %1163 = arith.cmpi ne, %1162, %1161 : i64
        %1164 = arith.cmpi eq, %1161, %1161 : i64
        %1165 = arith.andi %1163, %1164 : i1
        %1166 = scf.if %1165 -> (i64) {
          scf.yield %1133 : i64
        } else {
          scf.yield %1161 : i64
        }
        %1167 = func.call @cc_errorp(%1134) : (i64) -> i64
        %1168 = arith.cmpi ne, %1167, %1161 : i64
        %1169 = arith.cmpi eq, %1166, %1161 : i64
        %1170 = arith.andi %1168, %1169 : i1
        %1171 = scf.if %1170 -> (i64) {
          scf.yield %1134 : i64
        } else {
          scf.yield %1166 : i64
        }
        %1172 = func.call @cc_errorp(%1145) : (i64) -> i64
        %1173 = arith.cmpi ne, %1172, %1161 : i64
        %1174 = arith.cmpi eq, %1171, %1161 : i64
        %1175 = arith.andi %1173, %1174 : i1
        %1176 = scf.if %1175 -> (i64) {
          scf.yield %1145 : i64
        } else {
          scf.yield %1171 : i64
        }
        %1177 = func.call @cc_errorp(%1147) : (i64) -> i64
        %1178 = arith.cmpi ne, %1177, %1161 : i64
        %1179 = arith.cmpi eq, %1176, %1161 : i64
        %1180 = arith.andi %1178, %1179 : i1
        %1181 = scf.if %1180 -> (i64) {
          scf.yield %1147 : i64
        } else {
          scf.yield %1176 : i64
        }
        %1182 = func.call @cc_errorp(%1158) : (i64) -> i64
        %1183 = arith.cmpi ne, %1182, %1161 : i64
        %1184 = arith.cmpi eq, %1181, %1161 : i64
        %1185 = arith.andi %1183, %1184 : i1
        %1186 = scf.if %1185 -> (i64) {
          scf.yield %1158 : i64
        } else {
          scf.yield %1181 : i64
        }
        %1187 = func.call @cc_errorp(%1160) : (i64) -> i64
        %1188 = arith.cmpi ne, %1187, %1161 : i64
        %1189 = arith.cmpi eq, %1186, %1161 : i64
        %1190 = arith.andi %1188, %1189 : i1
        %1191 = scf.if %1190 -> (i64) {
          scf.yield %1160 : i64
        } else {
          scf.yield %1186 : i64
        }
        %1192 = arith.cmpi ne, %1191, %1161 : i64
        scf.if %1192 {
          func.call @stack_push_pointer(%1191) : (i64) -> ()
        } else {
          %1193 = func.call @cc_nil_value() : () -> i64
          %1194 = func.call @cc_cons(%1160, %1193) : (i64, i64) -> i64
          %1195 = func.call @cc_cons(%1158, %1194) : (i64, i64) -> i64
          %1196 = func.call @cc_cons(%1147, %1195) : (i64, i64) -> i64
          %1197 = func.call @cc_cons(%1145, %1196) : (i64, i64) -> i64
          %1198 = func.call @cc_cons(%1134, %1197) : (i64, i64) -> i64
          %1199 = func.call @cc_cons(%1133, %1198) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1199) : (i64) -> ()
          func.call @cc_read_sequence_stack() : () -> ()
        }
        %1200 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1200 : i64
      }
      %1201 = func.call @cc_nil_value() : () -> i64
      %1202 = func.call @cc_errorp(%1132) : (i64) -> i64
      %1203 = arith.cmpi ne, %1202, %1201 : i64
      %1204 = scf.if %1203 -> (i64) {
        scf.yield %1132 : i64
      } else {
        func.call @stack_push_pointer(%838) : (i64) -> ()
        %1205 = func.call @stack_pop_pointer() : () -> i64
        %1206 = func.call @cc_nil_value() : () -> i64
        %1207 = func.call @cc_errorp(%1205) : (i64) -> i64
        %1208 = arith.cmpi ne, %1207, %1206 : i64
        %1209 = arith.cmpi eq, %1206, %1206 : i64
        %1210 = arith.andi %1208, %1209 : i1
        %1211 = scf.if %1210 -> (i64) {
          scf.yield %1205 : i64
        } else {
          scf.yield %1206 : i64
        }
        %1212 = arith.cmpi ne, %1211, %1206 : i64
        scf.if %1212 {
          func.call @stack_push_pointer(%1211) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1205) : (i64) -> ()
          %1213 = llvm.mlir.addressof @str139 : !llvm.ptr
          %1214 = func.call @cc_make_function_ref_const(%1213) : (!llvm.ptr) -> i64
          %1215 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1214, %1215) : (i64, i64) -> ()
        }
        %1216 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1216 : i64
      }
      %1217 = func.call @cc_nil_value() : () -> i64
      %1218 = func.call @cc_errorp(%1204) : (i64) -> i64
      %1219 = arith.cmpi ne, %1218, %1217 : i64
      %1220 = scf.if %1219 -> (i64) {
        scf.yield %1204 : i64
      } else {
        func.call @stack_push_pointer(%762) : (i64) -> ()
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
          %1229 = llvm.mlir.addressof @str140 : !llvm.ptr
          %1230 = func.call @cc_make_function_ref_const(%1229) : (!llvm.ptr) -> i64
          %1231 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1230, %1231) : (i64, i64) -> ()
        }
        %1232 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1232 : i64
      }
      %1233 = func.call @cc_nil_value() : () -> i64
      %1234 = func.call @cc_errorp(%1220) : (i64) -> i64
      %1235 = arith.cmpi ne, %1234, %1233 : i64
      %1236 = scf.if %1235 -> (i64) {
        scf.yield %1220 : i64
      } else {
        func.call @stack_push_pointer(%883) : (i64) -> ()
        %1237 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1237 : i64
      }
      func.call @stack_push_pointer(%1236) : (i64) -> ()
      %1238 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1238 : i64
    }
    func.call @stack_push_pointer(%747) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str2("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str3("CLOSE-ABORT-EXACT\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str4("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str5("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str6("MKSTEMP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str7("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str8("close-abort\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str9("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str10("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str12("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str13("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str14("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str17("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str19("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str20("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str21("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str22("BUFFER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str23("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str24("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str25("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str26("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str30("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("foo\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str33("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str34("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str36("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str42("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str46("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str47("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str48("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str49("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str50("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str51("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str52("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str57("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str58("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str59("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str60("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str61("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str62("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str63("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str66("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str68("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str70("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str74("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str75("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str76("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str77("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str78("READ-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str79("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str80("BUFFER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str81("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str82("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str83("START\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str84("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str85("END\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str86("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str87("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str88("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str89("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str90("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str91("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str92("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str94("BUFFER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str95("close-abort\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str96("CORE:MKSTEMP\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str97("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str98("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str99("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str100("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str101("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str102("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str103("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str104("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str105("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str106("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str107("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str108("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str109("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str110("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str111("foo\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str112("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str113("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str114("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str115("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str116("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str117("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str118("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str119("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str120("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str121("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str122("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str123("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str124("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str125("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str126("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str127("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str128("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str129("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str130("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str131("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str132("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str133("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str134("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str135("START\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str136("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str137("END\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str138("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str140("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str141("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str142("DESCRIPTION\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str143("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str144("TEST\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str145("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str146("EQUALP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str147("CLASP-TESTS::%TEST\00") : !llvm.array<19 x i8>
}
