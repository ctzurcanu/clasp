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
      %14 = arith.constant 45 : i64
      %15 = func.call @cc_make_string(%13, %14) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%15) : (i64) -> ()
      %16 = func.call @stack_pop_pointer() : () -> i64
      %17 = func.call @cc_nil_value() : () -> i64
      %18 = func.call @cc_cons(%16, %17) : (i64, i64) -> i64
      %19 = func.call @cc_load_stack(%18) : (i64) -> i64
      func.call @stack_push_pointer(%19) : (i64) -> ()
      %20 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %20 : i64
    }
    %21 = func.call @cc_nil_value() : () -> i64
    %22 = func.call @cc_errorp(%12) : (i64) -> i64
    %23 = arith.cmpi ne, %22, %21 : i64
    %24 = scf.if %23 -> (i64) {
      scf.yield %12 : i64
    } else {
      %25 = llvm.mlir.addressof @str2 : !llvm.ptr
      %26 = arith.constant 11 : i64
      %27 = func.call @cc_make_string(%25, %26) : (!llvm.ptr, i64) -> i64
      %28 = func.call @cc_nil_value() : () -> i64
      %29 = func.call @cc_intern(%27, %28) : (i64, i64) -> i64
      %30 = func.call @cc_nil_value() : () -> i64
      %31 = func.call @cc_cons(%29, %30) : (i64, i64) -> i64
      %32 = func.call @cc_values_pack(%31) : (i64) -> i64
      func.call @stack_push_pointer(%29) : (i64) -> ()
      %33 = func.call @stack_pop_pointer() : () -> i64
      %34 = func.call @cc_in_package(%33) : (i64) -> i64
      func.call @stack_push_pointer(%34) : (i64) -> ()
      %35 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %35 : i64
    }
    %36 = func.call @cc_nil_value() : () -> i64
    %37 = func.call @cc_errorp(%24) : (i64) -> i64
    %38 = arith.cmpi ne, %37, %36 : i64
    %39 = scf.if %38 -> (i64) {
      scf.yield %24 : i64
    } else {
      %536 = arith.constant 71668911308800 : i64
      %537 = arith.constant 0 : i64
      %538 = func.call @cc_make_closure(%536, %537) : (i64, i64) -> i64
      func.call @stack_push_pointer(%538) : (i64) -> ()
      %539 = func.call @stack_pop_pointer() : () -> i64
      %540 = func.call @cc_nil_value() : () -> i64
      %541 = func.call @cc_nil_value() : () -> i64
      %542 = func.call @cc_errorp(%540) : (i64) -> i64
      %543 = arith.cmpi ne, %542, %541 : i64
      %544 = scf.if %543 -> (i64) {
        scf.yield %540 : i64
      } else {
        %545 = func.call @cc_push_ignore_errors_trap() : () -> i64
        %546 = func.call @cc_nil_value() : () -> i64
        %547 = func.call @cc_nil_value() : () -> i64
        %548 = func.call @cc_errorp(%546) : (i64) -> i64
        %549 = arith.cmpi ne, %548, %547 : i64
        %550 = scf.if %549 -> (i64) {
          scf.yield %546 : i64
        } else {
          func.call @stack_push_pointer(%539) : (i64) -> ()
          %551 = func.call @stack_pop_pointer() : () -> i64
          %552 = arith.constant 0 : i64
          func.call @cc_funcall_stack(%551, %552) : (i64, i64) -> ()
          %553 = func.call @stack_pop_pointer() : () -> i64
          %554 = func.call @cc_errorp(%553) : (i64) -> i64
          %555 = func.call @cc_nil_value() : () -> i64
          %556 = arith.cmpi ne, %554, %555 : i64
          scf.if %556 {
            func.call @stack_push_pointer(%553) : (i64) -> ()
          } else {
            %557 = func.call @cc_multiple_value_list(%553) : (i64) -> i64
            func.call @stack_push_pointer(%557) : (i64) -> ()
          }
          %558 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %559 = func.call @stack_pop_pointer() : () -> i64
          %560 = func.call @cc_nil_value() : () -> i64
          %561 = func.call @cc_errorp(%558) : (i64) -> i64
          %562 = arith.cmpi ne, %561, %560 : i64
          %563 = arith.cmpi eq, %560, %560 : i64
          %564 = arith.andi %562, %563 : i1
          %565 = scf.if %564 -> (i64) {
            scf.yield %558 : i64
          } else {
            scf.yield %560 : i64
          }
          %566 = arith.cmpi ne, %565, %560 : i64
          scf.if %566 {
            func.call @stack_push_pointer(%565) : (i64) -> ()
          } else {
            func.call @stack_push_nil() : () -> ()
            %567 = func.call @stack_pop_pointer() : () -> i64
            %568 = func.call @cc_cons(%559, %567) : (i64, i64) -> i64
            func.call @stack_push_pointer(%568) : (i64) -> ()
            %569 = func.call @stack_pop_pointer() : () -> i64
            %570 = func.call @cc_cons(%558, %569) : (i64, i64) -> i64
            func.call @stack_push_pointer(%570) : (i64) -> ()
            %571 = func.call @stack_pop_pointer() : () -> i64
            %572 = func.call @cc_values_pack(%571) : (i64) -> i64
            func.call @stack_push_pointer(%572) : (i64) -> ()
          }
          %573 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %573 : i64
        }
        func.call @stack_push_pointer(%550) : (i64) -> ()
        %574 = func.call @stack_pop_pointer() : () -> i64
        %575 = func.call @cc_pop_ignore_errors_trap() : () -> i64
        %576 = func.call @cc_errorp(%574) : (i64) -> i64
        %577 = func.call @cc_nil_value() : () -> i64
        %578 = arith.cmpi ne, %576, %577 : i64
        scf.if %578 {
          %579 = func.call @cc_condition_value(%574) : (i64) -> i64
          %580 = func.call @cc_values2(%577, %579) : (i64, i64) -> i64
          func.call @stack_push_pointer(%580) : (i64) -> ()
        } else {
          %581 = func.call @cc_multiple_value_list(%574) : (i64) -> i64
          %582 = func.call @cc_values_pack(%581) : (i64) -> i64
          func.call @stack_push_pointer(%582) : (i64) -> ()
        }
        %583 = func.call @stack_pop_pointer() : () -> i64
        %584 = func.call @cc_multiple_value_list(%583) : (i64) -> i64
        %585 = arith.constant 0 : i64
        %586 = func.call @cc_box_fixnum(%585) : (i64) -> i64
        %587 = func.call @cc_nth(%586, %584) : (i64, i64) -> i64
        %588 = arith.constant 1 : i64
        %589 = func.call @cc_box_fixnum(%588) : (i64) -> i64
        %590 = func.call @cc_nth(%589, %584) : (i64, i64) -> i64
        %591 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%591) : (i64) -> ()
        %592 = func.call @stack_pop_pointer() : () -> i64
        %593 = llvm.mlir.addressof @str49 : !llvm.ptr
        %594 = arith.constant 30 : i64
        %595 = func.call @cc_make_string(%593, %594) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%595) : (i64) -> ()
        %596 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%587) : (i64) -> ()
        %597 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%590) : (i64) -> ()
        %598 = func.call @stack_pop_pointer() : () -> i64
        %599 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%590) : (i64) -> ()
        %600 = func.call @stack_pop_pointer() : () -> i64
        %601 = func.call @cc_nil_value() : () -> i64
        %602 = arith.cmpi eq, %600, %601 : i64
        %604 = func.call @cc_t_value() : () -> i64
        %603 = arith.select %602, %604, %601 : i64
        func.call @stack_push_pointer(%603) : (i64) -> ()
        %605 = func.call @stack_pop_pointer() : () -> i64
        %606 = llvm.mlir.addressof @str50 : !llvm.ptr
        %607 = arith.constant 3 : i64
        %608 = func.call @cc_make_string(%606, %607) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%608) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %609 = func.call @stack_pop_pointer() : () -> i64
        %610 = func.call @stack_pop_pointer() : () -> i64
        %611 = func.call @cc_cons(%610, %609) : (i64, i64) -> i64
        func.call @stack_push_pointer(%611) : (i64) -> ()
        %612 = func.call @stack_pop_pointer() : () -> i64
        %613 = func.call @cc_length(%612) : (i64) -> i64
        func.call @stack_push_pointer(%613) : (i64) -> ()
        %614 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%587) : (i64) -> ()
        %615 = func.call @stack_pop_pointer() : () -> i64
        %616 = func.call @cc_length(%615) : (i64) -> i64
        func.call @stack_push_pointer(%616) : (i64) -> ()
        %617 = func.call @stack_pop_pointer() : () -> i64
        %618 = arith.constant 1 : i1
        %620 = arith.constant 3 : i64
        %619 = arith.andi %614, %620 : i64
        %621 = arith.constant 0 : i64
        %622 = arith.cmpi eq, %619, %621 : i64
        %624 = arith.constant 3 : i64
        %623 = arith.andi %617, %624 : i64
        %625 = arith.constant 0 : i64
        %626 = arith.cmpi eq, %623, %625 : i64
        %627 = arith.andi %622, %626 : i1
        %628 = scf.if %627 -> (i1) {
          %629 = arith.constant 2 : i64
          %630 = arith.shrsi %614, %629 : i64
          %631 = arith.constant 2 : i64
          %632 = arith.shrsi %617, %631 : i64
          %633 = arith.cmpi eq, %630, %632 : i64
          scf.yield %633 : i1
        } else {
          %634 = func.call @cc_eq(%614, %617) : (i64, i64) -> i64
          %635 = func.call @cc_nil_value() : () -> i64
          %636 = arith.cmpi ne, %634, %635 : i64
          scf.yield %636 : i1
        }
        %637 = arith.andi %618, %628 : i1
        %638 = func.call @cc_nil_value() : () -> i64
        %639 = func.call @cc_t_value() : () -> i64
        %640 = scf.if %637 -> (i64) {
          scf.yield %639 : i64
        } else {
          scf.yield %638 : i64
        }
        func.call @stack_push_pointer(%640) : (i64) -> ()
        %641 = func.call @stack_pop_pointer() : () -> i64
        %642 = llvm.mlir.addressof @str51 : !llvm.ptr
        %643 = func.call @cc_make_function_ref_const(%642) : (!llvm.ptr) -> i64
        func.call @stack_push_pointer(%643) : (i64) -> ()
        func.call @stack_push_pointer(%587) : (i64) -> ()
        %644 = llvm.mlir.addressof @str52 : !llvm.ptr
        %645 = arith.constant 3 : i64
        %646 = func.call @cc_make_string(%644, %645) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%646) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %647 = func.call @stack_pop_pointer() : () -> i64
        %648 = func.call @stack_pop_pointer() : () -> i64
        %649 = func.call @cc_cons(%648, %647) : (i64, i64) -> i64
        func.call @stack_push_pointer(%649) : (i64) -> ()
        %650 = func.call @stack_pop_pointer() : () -> i64
        %651 = func.call @stack_pop_pointer() : () -> i64
        %652 = func.call @stack_pop_pointer() : () -> i64
        %653 = func.call @cc_every2(%652, %651, %650) : (i64, i64, i64) -> i64
        func.call @stack_push_pointer(%653) : (i64) -> ()
        %654 = func.call @stack_pop_pointer() : () -> i64
        %655 = func.call @cc_cons(%654, %599) : (i64, i64) -> i64
        %656 = func.call @cc_cons(%641, %655) : (i64, i64) -> i64
        %657 = func.call @cc_cons(%605, %656) : (i64, i64) -> i64
        %658 = func.call @cc_and(%657) : (i64) -> i64
        func.call @stack_push_pointer(%658) : (i64) -> ()
        %659 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%592) : (i64) -> ()
        func.call @stack_push_pointer(%596) : (i64) -> ()
        func.call @stack_push_pointer(%597) : (i64) -> ()
        func.call @stack_push_pointer(%598) : (i64) -> ()
        func.call @stack_push_pointer(%659) : (i64) -> ()
        %660 = llvm.mlir.addressof @str53 : !llvm.ptr
        %661 = func.call @cc_make_function_ref_const(%660) : (!llvm.ptr) -> i64
        %662 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%661, %662) : (i64, i64) -> ()
        %663 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %663 : i64
      }
      func.call @stack_push_pointer(%544) : (i64) -> ()
      %664 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %664 : i64
    }
    func.call @stack_push_pointer(%39) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_71668911308800"() {
    %40 = func.call @cc_nil_value() : () -> i64
    %41 = func.call @cc_nil_value() : () -> i64
    %42 = func.call @cc_errorp(%40) : (i64) -> i64
    %43 = arith.cmpi ne, %42, %41 : i64
    %44 = scf.if %43 -> (i64) {
      scf.yield %40 : i64
    } else {
      %45 = llvm.mlir.addressof @str3 : !llvm.ptr
      %46 = arith.constant 11 : i64
      %47 = func.call @cc_make_string(%45, %46) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%47) : (i64) -> ()
      %48 = func.call @stack_pop_pointer() : () -> i64
      %49 = func.call @cc_nil_value() : () -> i64
      %50 = func.call @cc_errorp(%48) : (i64) -> i64
      %51 = arith.cmpi ne, %50, %49 : i64
      %52 = arith.cmpi eq, %49, %49 : i64
      %53 = arith.andi %51, %52 : i1
      %54 = scf.if %53 -> (i64) {
        scf.yield %48 : i64
      } else {
        scf.yield %49 : i64
      }
      %55 = arith.cmpi ne, %54, %49 : i64
      scf.if %55 {
        func.call @stack_push_pointer(%54) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%48) : (i64) -> ()
        %56 = llvm.mlir.addressof @str4 : !llvm.ptr
        %57 = func.call @cc_make_function_ref_const(%56) : (!llvm.ptr) -> i64
        %58 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%57, %58) : (i64, i64) -> ()
      }
      %59 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%59) : (i64) -> ()
      %60 = func.call @stack_pop_pointer() : () -> i64
      %61 = llvm.mlir.addressof @str5 : !llvm.ptr
      %62 = arith.constant 17 : i64
      %63 = func.call @cc_make_string(%61, %62) : (!llvm.ptr, i64) -> i64
      %64 = llvm.mlir.addressof @str6 : !llvm.ptr
      %65 = arith.constant 7 : i64
      %66 = func.call @cc_make_string(%64, %65) : (!llvm.ptr, i64) -> i64
      %67 = func.call @cc_intern(%63, %66) : (i64, i64) -> i64
      %68 = func.call @cc_nil_value() : () -> i64
      %69 = func.call @cc_cons(%67, %68) : (i64, i64) -> i64
      %70 = func.call @cc_values_pack(%69) : (i64) -> i64
      func.call @stack_push_pointer(%67) : (i64) -> ()
      %71 = func.call @stack_pop_pointer() : () -> i64
      %72 = llvm.mlir.addressof @str7 : !llvm.ptr
      %73 = arith.constant 6 : i64
      %74 = func.call @cc_make_string(%72, %73) : (!llvm.ptr, i64) -> i64
      %75 = llvm.mlir.addressof @str8 : !llvm.ptr
      %76 = arith.constant 7 : i64
      %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
      %78 = func.call @cc_intern(%74, %77) : (i64, i64) -> i64
      %79 = func.call @cc_nil_value() : () -> i64
      %80 = func.call @cc_cons(%78, %79) : (i64, i64) -> i64
      %81 = func.call @cc_values_pack(%80) : (i64) -> i64
      func.call @stack_push_pointer(%78) : (i64) -> ()
      %82 = func.call @stack_pop_pointer() : () -> i64
      %83 = llvm.mlir.addressof @str9 : !llvm.ptr
      %84 = arith.constant 9 : i64
      %85 = func.call @cc_make_string(%83, %84) : (!llvm.ptr, i64) -> i64
      %86 = llvm.mlir.addressof @str10 : !llvm.ptr
      %87 = arith.constant 7 : i64
      %88 = func.call @cc_make_string(%86, %87) : (!llvm.ptr, i64) -> i64
      %89 = func.call @cc_intern(%85, %88) : (i64, i64) -> i64
      %90 = func.call @cc_nil_value() : () -> i64
      %91 = func.call @cc_cons(%89, %90) : (i64, i64) -> i64
      %92 = func.call @cc_values_pack(%91) : (i64) -> i64
      func.call @stack_push_pointer(%89) : (i64) -> ()
      %93 = func.call @stack_pop_pointer() : () -> i64
      %94 = llvm.mlir.addressof @str11 : !llvm.ptr
      %95 = arith.constant 6 : i64
      %96 = func.call @cc_make_string(%94, %95) : (!llvm.ptr, i64) -> i64
      %97 = llvm.mlir.addressof @str12 : !llvm.ptr
      %98 = arith.constant 7 : i64
      %99 = func.call @cc_make_string(%97, %98) : (!llvm.ptr, i64) -> i64
      %100 = func.call @cc_intern(%96, %99) : (i64, i64) -> i64
      %101 = func.call @cc_nil_value() : () -> i64
      %102 = func.call @cc_cons(%100, %101) : (i64, i64) -> i64
      %103 = func.call @cc_values_pack(%102) : (i64) -> i64
      func.call @stack_push_pointer(%100) : (i64) -> ()
      %104 = func.call @stack_pop_pointer() : () -> i64
      %105 = func.call @cc_nil_value() : () -> i64
      %106 = func.call @cc_errorp(%60) : (i64) -> i64
      %107 = arith.cmpi ne, %106, %105 : i64
      %108 = arith.cmpi eq, %105, %105 : i64
      %109 = arith.andi %107, %108 : i1
      %110 = scf.if %109 -> (i64) {
        scf.yield %60 : i64
      } else {
        scf.yield %105 : i64
      }
      %111 = func.call @cc_errorp(%71) : (i64) -> i64
      %112 = arith.cmpi ne, %111, %105 : i64
      %113 = arith.cmpi eq, %110, %105 : i64
      %114 = arith.andi %112, %113 : i1
      %115 = scf.if %114 -> (i64) {
        scf.yield %71 : i64
      } else {
        scf.yield %110 : i64
      }
      %116 = func.call @cc_errorp(%82) : (i64) -> i64
      %117 = arith.cmpi ne, %116, %105 : i64
      %118 = arith.cmpi eq, %115, %105 : i64
      %119 = arith.andi %117, %118 : i1
      %120 = scf.if %119 -> (i64) {
        scf.yield %82 : i64
      } else {
        scf.yield %115 : i64
      }
      %121 = func.call @cc_errorp(%93) : (i64) -> i64
      %122 = arith.cmpi ne, %121, %105 : i64
      %123 = arith.cmpi eq, %120, %105 : i64
      %124 = arith.andi %122, %123 : i1
      %125 = scf.if %124 -> (i64) {
        scf.yield %93 : i64
      } else {
        scf.yield %120 : i64
      }
      %126 = func.call @cc_errorp(%104) : (i64) -> i64
      %127 = arith.cmpi ne, %126, %105 : i64
      %128 = arith.cmpi eq, %125, %105 : i64
      %129 = arith.andi %127, %128 : i1
      %130 = scf.if %129 -> (i64) {
        scf.yield %104 : i64
      } else {
        scf.yield %125 : i64
      }
      %131 = arith.cmpi ne, %130, %105 : i64
      scf.if %131 {
        func.call @stack_push_pointer(%130) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%60) : (i64) -> ()
        func.call @stack_push_pointer(%71) : (i64) -> ()
        func.call @stack_push_pointer(%82) : (i64) -> ()
        func.call @stack_push_pointer(%93) : (i64) -> ()
        func.call @stack_push_pointer(%104) : (i64) -> ()
        %132 = llvm.mlir.addressof @str13 : !llvm.ptr
        %133 = func.call @cc_make_function_ref_const(%132) : (!llvm.ptr) -> i64
        %134 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%133, %134) : (i64, i64) -> ()
      }
      %135 = func.call @stack_pop_pointer() : () -> i64
      %136 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%136) : (i64) -> ()
      %137 = func.call @stack_pop_pointer() : () -> i64
      %138 = llvm.mlir.addressof @str14 : !llvm.ptr
      %139 = arith.constant 12 : i64
      %140 = func.call @cc_make_string(%138, %139) : (!llvm.ptr, i64) -> i64
      %141 = llvm.mlir.addressof @str15 : !llvm.ptr
      %142 = arith.constant 7 : i64
      %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
      %144 = func.call @cc_intern(%140, %143) : (i64, i64) -> i64
      %145 = func.call @cc_nil_value() : () -> i64
      %146 = func.call @cc_cons(%144, %145) : (i64, i64) -> i64
      %147 = func.call @cc_values_pack(%146) : (i64) -> i64
      func.call @stack_push_pointer(%144) : (i64) -> ()
      %148 = func.call @stack_pop_pointer() : () -> i64
      %149 = llvm.mlir.addressof @str16 : !llvm.ptr
      %150 = arith.constant 9 : i64
      %151 = func.call @cc_make_string(%149, %150) : (!llvm.ptr, i64) -> i64
      %152 = llvm.mlir.addressof @str17 : !llvm.ptr
      %153 = arith.constant 11 : i64
      %154 = func.call @cc_make_string(%152, %153) : (!llvm.ptr, i64) -> i64
      %155 = func.call @cc_intern(%151, %154) : (i64, i64) -> i64
      %156 = func.call @cc_nil_value() : () -> i64
      %157 = func.call @cc_cons(%155, %156) : (i64, i64) -> i64
      %158 = func.call @cc_values_pack(%157) : (i64) -> i64
      func.call @stack_push_pointer(%155) : (i64) -> ()
      %159 = func.call @stack_pop_pointer() : () -> i64
      %160 = func.call @cc_nil_value() : () -> i64
      %161 = func.call @cc_errorp(%137) : (i64) -> i64
      %162 = arith.cmpi ne, %161, %160 : i64
      %163 = arith.cmpi eq, %160, %160 : i64
      %164 = arith.andi %162, %163 : i1
      %165 = scf.if %164 -> (i64) {
        scf.yield %137 : i64
      } else {
        scf.yield %160 : i64
      }
      %166 = func.call @cc_errorp(%148) : (i64) -> i64
      %167 = arith.cmpi ne, %166, %160 : i64
      %168 = arith.cmpi eq, %165, %160 : i64
      %169 = arith.andi %167, %168 : i1
      %170 = scf.if %169 -> (i64) {
        scf.yield %148 : i64
      } else {
        scf.yield %165 : i64
      }
      %171 = func.call @cc_errorp(%159) : (i64) -> i64
      %172 = arith.cmpi ne, %171, %160 : i64
      %173 = arith.cmpi eq, %170, %160 : i64
      %174 = arith.andi %172, %173 : i1
      %175 = scf.if %174 -> (i64) {
        scf.yield %159 : i64
      } else {
        scf.yield %170 : i64
      }
      %176 = arith.cmpi ne, %175, %160 : i64
      scf.if %176 {
        func.call @stack_push_pointer(%175) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%137) : (i64) -> ()
        func.call @stack_push_pointer(%148) : (i64) -> ()
        func.call @stack_push_pointer(%159) : (i64) -> ()
        %177 = llvm.mlir.addressof @str18 : !llvm.ptr
        %178 = func.call @cc_make_function_ref_const(%177) : (!llvm.ptr) -> i64
        %179 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%178, %179) : (i64, i64) -> ()
      }
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = func.call @cc_nil_value() : () -> i64
      %182 = func.call @cc_nil_value() : () -> i64
      %183 = func.call @cc_errorp(%181) : (i64) -> i64
      %184 = arith.cmpi ne, %183, %182 : i64
      %185:2 = scf.if %184 -> (i64, i64) {
        scf.yield %181, %135 : i64, i64
      } else {
        %186 = llvm.mlir.addressof @str19 : !llvm.ptr
        %187 = arith.constant 3 : i64
        %188 = func.call @cc_make_string(%186, %187) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%188) : (i64) -> ()
        %189 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%135) : (i64) -> ()
        %190 = func.call @stack_pop_pointer() : () -> i64
        %191 = func.call @cc_nil_value() : () -> i64
        %192 = func.call @cc_errorp(%189) : (i64) -> i64
        %193 = arith.cmpi ne, %192, %191 : i64
        %194 = arith.cmpi eq, %191, %191 : i64
        %195 = arith.andi %193, %194 : i1
        %196 = scf.if %195 -> (i64) {
          scf.yield %189 : i64
        } else {
          scf.yield %191 : i64
        }
        %197 = func.call @cc_errorp(%190) : (i64) -> i64
        %198 = arith.cmpi ne, %197, %191 : i64
        %199 = arith.cmpi eq, %196, %191 : i64
        %200 = arith.andi %198, %199 : i1
        %201 = scf.if %200 -> (i64) {
          scf.yield %190 : i64
        } else {
          scf.yield %196 : i64
        }
        %202 = arith.cmpi ne, %201, %191 : i64
        scf.if %202 {
          func.call @stack_push_pointer(%201) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%189) : (i64) -> ()
          func.call @stack_push_pointer(%190) : (i64) -> ()
          %203 = llvm.mlir.addressof @str20 : !llvm.ptr
          %204 = func.call @cc_make_function_ref_const(%203) : (!llvm.ptr) -> i64
          %205 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%204, %205) : (i64, i64) -> ()
        }
        %206 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %206, %135 : i64, i64
      }
      %207 = func.call @cc_nil_value() : () -> i64
      %208 = func.call @cc_errorp(%185#0) : (i64) -> i64
      %209 = arith.cmpi ne, %208, %207 : i64
      %210:2 = scf.if %209 -> (i64, i64) {
        scf.yield %185#0, %185#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%185#1) : (i64) -> ()
        %211 = func.call @stack_pop_pointer() : () -> i64
        %212 = func.call @cc_nil_value() : () -> i64
        %213 = func.call @cc_errorp(%211) : (i64) -> i64
        %214 = arith.cmpi ne, %213, %212 : i64
        %215 = arith.cmpi eq, %212, %212 : i64
        %216 = arith.andi %214, %215 : i1
        %217 = scf.if %216 -> (i64) {
          scf.yield %211 : i64
        } else {
          scf.yield %212 : i64
        }
        %218 = arith.cmpi ne, %217, %212 : i64
        scf.if %218 {
          func.call @stack_push_pointer(%217) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%211) : (i64) -> ()
          %219 = llvm.mlir.addressof @str21 : !llvm.ptr
          %220 = func.call @cc_make_function_ref_const(%219) : (!llvm.ptr) -> i64
          %221 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%220, %221) : (i64, i64) -> ()
        }
        %222 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %222, %185#1 : i64, i64
      }
      %223 = func.call @cc_nil_value() : () -> i64
      %224 = func.call @cc_errorp(%210#0) : (i64) -> i64
      %225 = arith.cmpi ne, %224, %223 : i64
      %226:2 = scf.if %225 -> (i64, i64) {
        scf.yield %210#0, %210#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%59) : (i64) -> ()
        %227 = func.call @stack_pop_pointer() : () -> i64
        %228 = llvm.mlir.addressof @str22 : !llvm.ptr
        %229 = arith.constant 17 : i64
        %230 = func.call @cc_make_string(%228, %229) : (!llvm.ptr, i64) -> i64
        %231 = llvm.mlir.addressof @str23 : !llvm.ptr
        %232 = arith.constant 7 : i64
        %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
        %234 = func.call @cc_intern(%230, %233) : (i64, i64) -> i64
        %235 = func.call @cc_nil_value() : () -> i64
        %236 = func.call @cc_cons(%234, %235) : (i64, i64) -> i64
        %237 = func.call @cc_values_pack(%236) : (i64) -> i64
        func.call @stack_push_pointer(%234) : (i64) -> ()
        %238 = func.call @stack_pop_pointer() : () -> i64
        %239 = llvm.mlir.addressof @str24 : !llvm.ptr
        %240 = arith.constant 6 : i64
        %241 = func.call @cc_make_string(%239, %240) : (!llvm.ptr, i64) -> i64
        %242 = llvm.mlir.addressof @str25 : !llvm.ptr
        %243 = arith.constant 7 : i64
        %244 = func.call @cc_make_string(%242, %243) : (!llvm.ptr, i64) -> i64
        %245 = func.call @cc_intern(%241, %244) : (i64, i64) -> i64
        %246 = func.call @cc_nil_value() : () -> i64
        %247 = func.call @cc_cons(%245, %246) : (i64, i64) -> i64
        %248 = func.call @cc_values_pack(%247) : (i64) -> i64
        func.call @stack_push_pointer(%245) : (i64) -> ()
        %249 = func.call @stack_pop_pointer() : () -> i64
        %250 = llvm.mlir.addressof @str26 : !llvm.ptr
        %251 = arith.constant 9 : i64
        %252 = func.call @cc_make_string(%250, %251) : (!llvm.ptr, i64) -> i64
        %253 = llvm.mlir.addressof @str27 : !llvm.ptr
        %254 = arith.constant 7 : i64
        %255 = func.call @cc_make_string(%253, %254) : (!llvm.ptr, i64) -> i64
        %256 = func.call @cc_intern(%252, %255) : (i64, i64) -> i64
        %257 = func.call @cc_nil_value() : () -> i64
        %258 = func.call @cc_cons(%256, %257) : (i64, i64) -> i64
        %259 = func.call @cc_values_pack(%258) : (i64) -> i64
        func.call @stack_push_pointer(%256) : (i64) -> ()
        %260 = func.call @stack_pop_pointer() : () -> i64
        %261 = llvm.mlir.addressof @str28 : !llvm.ptr
        %262 = arith.constant 9 : i64
        %263 = func.call @cc_make_string(%261, %262) : (!llvm.ptr, i64) -> i64
        %264 = llvm.mlir.addressof @str29 : !llvm.ptr
        %265 = arith.constant 7 : i64
        %266 = func.call @cc_make_string(%264, %265) : (!llvm.ptr, i64) -> i64
        %267 = func.call @cc_intern(%263, %266) : (i64, i64) -> i64
        %268 = func.call @cc_nil_value() : () -> i64
        %269 = func.call @cc_cons(%267, %268) : (i64, i64) -> i64
        %270 = func.call @cc_values_pack(%269) : (i64) -> i64
        func.call @stack_push_pointer(%267) : (i64) -> ()
        %271 = func.call @stack_pop_pointer() : () -> i64
        %272 = llvm.mlir.addressof @str30 : !llvm.ptr
        %273 = arith.constant 9 : i64
        %274 = func.call @cc_make_string(%272, %273) : (!llvm.ptr, i64) -> i64
        %275 = llvm.mlir.addressof @str31 : !llvm.ptr
        %276 = arith.constant 7 : i64
        %277 = func.call @cc_make_string(%275, %276) : (!llvm.ptr, i64) -> i64
        %278 = func.call @cc_intern(%274, %277) : (i64, i64) -> i64
        %279 = func.call @cc_nil_value() : () -> i64
        %280 = func.call @cc_cons(%278, %279) : (i64, i64) -> i64
        %281 = func.call @cc_values_pack(%280) : (i64) -> i64
        func.call @stack_push_pointer(%278) : (i64) -> ()
        %282 = func.call @stack_pop_pointer() : () -> i64
        %283 = llvm.mlir.addressof @str32 : !llvm.ptr
        %284 = arith.constant 6 : i64
        %285 = func.call @cc_make_string(%283, %284) : (!llvm.ptr, i64) -> i64
        %286 = llvm.mlir.addressof @str33 : !llvm.ptr
        %287 = arith.constant 7 : i64
        %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
        %289 = func.call @cc_intern(%285, %288) : (i64, i64) -> i64
        %290 = func.call @cc_nil_value() : () -> i64
        %291 = func.call @cc_cons(%289, %290) : (i64, i64) -> i64
        %292 = func.call @cc_values_pack(%291) : (i64) -> i64
        func.call @stack_push_pointer(%289) : (i64) -> ()
        %293 = func.call @stack_pop_pointer() : () -> i64
        %294 = func.call @cc_nil_value() : () -> i64
        %295 = func.call @cc_errorp(%227) : (i64) -> i64
        %296 = arith.cmpi ne, %295, %294 : i64
        %297 = arith.cmpi eq, %294, %294 : i64
        %298 = arith.andi %296, %297 : i1
        %299 = scf.if %298 -> (i64) {
          scf.yield %227 : i64
        } else {
          scf.yield %294 : i64
        }
        %300 = func.call @cc_errorp(%238) : (i64) -> i64
        %301 = arith.cmpi ne, %300, %294 : i64
        %302 = arith.cmpi eq, %299, %294 : i64
        %303 = arith.andi %301, %302 : i1
        %304 = scf.if %303 -> (i64) {
          scf.yield %238 : i64
        } else {
          scf.yield %299 : i64
        }
        %305 = func.call @cc_errorp(%249) : (i64) -> i64
        %306 = arith.cmpi ne, %305, %294 : i64
        %307 = arith.cmpi eq, %304, %294 : i64
        %308 = arith.andi %306, %307 : i1
        %309 = scf.if %308 -> (i64) {
          scf.yield %249 : i64
        } else {
          scf.yield %304 : i64
        }
        %310 = func.call @cc_errorp(%260) : (i64) -> i64
        %311 = arith.cmpi ne, %310, %294 : i64
        %312 = arith.cmpi eq, %309, %294 : i64
        %313 = arith.andi %311, %312 : i1
        %314 = scf.if %313 -> (i64) {
          scf.yield %260 : i64
        } else {
          scf.yield %309 : i64
        }
        %315 = func.call @cc_errorp(%271) : (i64) -> i64
        %316 = arith.cmpi ne, %315, %294 : i64
        %317 = arith.cmpi eq, %314, %294 : i64
        %318 = arith.andi %316, %317 : i1
        %319 = scf.if %318 -> (i64) {
          scf.yield %271 : i64
        } else {
          scf.yield %314 : i64
        }
        %320 = func.call @cc_errorp(%282) : (i64) -> i64
        %321 = arith.cmpi ne, %320, %294 : i64
        %322 = arith.cmpi eq, %319, %294 : i64
        %323 = arith.andi %321, %322 : i1
        %324 = scf.if %323 -> (i64) {
          scf.yield %282 : i64
        } else {
          scf.yield %319 : i64
        }
        %325 = func.call @cc_errorp(%293) : (i64) -> i64
        %326 = arith.cmpi ne, %325, %294 : i64
        %327 = arith.cmpi eq, %324, %294 : i64
        %328 = arith.andi %326, %327 : i1
        %329 = scf.if %328 -> (i64) {
          scf.yield %293 : i64
        } else {
          scf.yield %324 : i64
        }
        %330 = arith.cmpi ne, %329, %294 : i64
        scf.if %330 {
          func.call @stack_push_pointer(%329) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%227) : (i64) -> ()
          func.call @stack_push_pointer(%238) : (i64) -> ()
          func.call @stack_push_pointer(%249) : (i64) -> ()
          func.call @stack_push_pointer(%260) : (i64) -> ()
          func.call @stack_push_pointer(%271) : (i64) -> ()
          func.call @stack_push_pointer(%282) : (i64) -> ()
          func.call @stack_push_pointer(%293) : (i64) -> ()
          %331 = llvm.mlir.addressof @str34 : !llvm.ptr
          %332 = func.call @cc_make_function_ref_const(%331) : (!llvm.ptr) -> i64
          %333 = arith.constant 7 : i64
          func.call @cc_funcall_stack(%332, %333) : (i64, i64) -> ()
        }
        %334 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%334) : (i64) -> ()
        %335 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %335, %334 : i64, i64
      }
      %336 = func.call @cc_nil_value() : () -> i64
      %337 = func.call @cc_errorp(%226#0) : (i64) -> i64
      %338 = arith.cmpi ne, %337, %336 : i64
      %339:2 = scf.if %338 -> (i64, i64) {
        scf.yield %226#0, %226#1 : i64, i64
      } else {
        %340 = llvm.mlir.addressof @str35 : !llvm.ptr
        %341 = arith.constant 3 : i64
        %342 = func.call @cc_make_string(%340, %341) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%342) : (i64) -> ()
        %343 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%226#1) : (i64) -> ()
        %344 = func.call @stack_pop_pointer() : () -> i64
        %345 = func.call @cc_nil_value() : () -> i64
        %346 = func.call @cc_errorp(%343) : (i64) -> i64
        %347 = arith.cmpi ne, %346, %345 : i64
        %348 = arith.cmpi eq, %345, %345 : i64
        %349 = arith.andi %347, %348 : i1
        %350 = scf.if %349 -> (i64) {
          scf.yield %343 : i64
        } else {
          scf.yield %345 : i64
        }
        %351 = func.call @cc_errorp(%344) : (i64) -> i64
        %352 = arith.cmpi ne, %351, %345 : i64
        %353 = arith.cmpi eq, %350, %345 : i64
        %354 = arith.andi %352, %353 : i1
        %355 = scf.if %354 -> (i64) {
          scf.yield %344 : i64
        } else {
          scf.yield %350 : i64
        }
        %356 = arith.cmpi ne, %355, %345 : i64
        scf.if %356 {
          func.call @stack_push_pointer(%355) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%343) : (i64) -> ()
          func.call @stack_push_pointer(%344) : (i64) -> ()
          %357 = llvm.mlir.addressof @str36 : !llvm.ptr
          %358 = func.call @cc_make_function_ref_const(%357) : (!llvm.ptr) -> i64
          %359 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%358, %359) : (i64, i64) -> ()
        }
        %360 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %360, %226#1 : i64, i64
      }
      %361 = func.call @cc_nil_value() : () -> i64
      %362 = func.call @cc_errorp(%339#0) : (i64) -> i64
      %363 = arith.cmpi ne, %362, %361 : i64
      %364:2 = scf.if %363 -> (i64, i64) {
        scf.yield %339#0, %339#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%339#1) : (i64) -> ()
        %365 = func.call @stack_pop_pointer() : () -> i64
        %366 = func.call @cc_nil_value() : () -> i64
        %367 = func.call @cc_errorp(%365) : (i64) -> i64
        %368 = arith.cmpi ne, %367, %366 : i64
        %369 = arith.cmpi eq, %366, %366 : i64
        %370 = arith.andi %368, %369 : i1
        %371 = scf.if %370 -> (i64) {
          scf.yield %365 : i64
        } else {
          scf.yield %366 : i64
        }
        %372 = arith.cmpi ne, %371, %366 : i64
        scf.if %372 {
          func.call @stack_push_pointer(%371) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%365) : (i64) -> ()
          %373 = llvm.mlir.addressof @str37 : !llvm.ptr
          %374 = func.call @cc_make_function_ref_const(%373) : (!llvm.ptr) -> i64
          %375 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%374, %375) : (i64, i64) -> ()
        }
        %376 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %376, %339#1 : i64, i64
      }
      %377 = func.call @cc_nil_value() : () -> i64
      %378 = func.call @cc_errorp(%364#0) : (i64) -> i64
      %379 = arith.cmpi ne, %378, %377 : i64
      %380:2 = scf.if %379 -> (i64, i64) {
        scf.yield %364#0, %364#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%59) : (i64) -> ()
        %381 = func.call @stack_pop_pointer() : () -> i64
        %382 = llvm.mlir.addressof @str38 : !llvm.ptr
        %383 = arith.constant 9 : i64
        %384 = func.call @cc_make_string(%382, %383) : (!llvm.ptr, i64) -> i64
        %385 = llvm.mlir.addressof @str39 : !llvm.ptr
        %386 = arith.constant 7 : i64
        %387 = func.call @cc_make_string(%385, %386) : (!llvm.ptr, i64) -> i64
        %388 = func.call @cc_intern(%384, %387) : (i64, i64) -> i64
        %389 = func.call @cc_nil_value() : () -> i64
        %390 = func.call @cc_cons(%388, %389) : (i64, i64) -> i64
        %391 = func.call @cc_values_pack(%390) : (i64) -> i64
        func.call @stack_push_pointer(%388) : (i64) -> ()
        %392 = func.call @stack_pop_pointer() : () -> i64
        %393 = llvm.mlir.addressof @str40 : !llvm.ptr
        %394 = arith.constant 5 : i64
        %395 = func.call @cc_make_string(%393, %394) : (!llvm.ptr, i64) -> i64
        %396 = llvm.mlir.addressof @str41 : !llvm.ptr
        %397 = arith.constant 7 : i64
        %398 = func.call @cc_make_string(%396, %397) : (!llvm.ptr, i64) -> i64
        %399 = func.call @cc_intern(%395, %398) : (i64, i64) -> i64
        %400 = func.call @cc_nil_value() : () -> i64
        %401 = func.call @cc_cons(%399, %400) : (i64, i64) -> i64
        %402 = func.call @cc_values_pack(%401) : (i64) -> i64
        func.call @stack_push_pointer(%399) : (i64) -> ()
        %403 = func.call @stack_pop_pointer() : () -> i64
        %404 = func.call @cc_nil_value() : () -> i64
        %405 = func.call @cc_errorp(%381) : (i64) -> i64
        %406 = arith.cmpi ne, %405, %404 : i64
        %407 = arith.cmpi eq, %404, %404 : i64
        %408 = arith.andi %406, %407 : i1
        %409 = scf.if %408 -> (i64) {
          scf.yield %381 : i64
        } else {
          scf.yield %404 : i64
        }
        %410 = func.call @cc_errorp(%392) : (i64) -> i64
        %411 = arith.cmpi ne, %410, %404 : i64
        %412 = arith.cmpi eq, %409, %404 : i64
        %413 = arith.andi %411, %412 : i1
        %414 = scf.if %413 -> (i64) {
          scf.yield %392 : i64
        } else {
          scf.yield %409 : i64
        }
        %415 = func.call @cc_errorp(%403) : (i64) -> i64
        %416 = arith.cmpi ne, %415, %404 : i64
        %417 = arith.cmpi eq, %414, %404 : i64
        %418 = arith.andi %416, %417 : i1
        %419 = scf.if %418 -> (i64) {
          scf.yield %403 : i64
        } else {
          scf.yield %414 : i64
        }
        %420 = arith.cmpi ne, %419, %404 : i64
        scf.if %420 {
          func.call @stack_push_pointer(%419) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%381) : (i64) -> ()
          func.call @stack_push_pointer(%392) : (i64) -> ()
          func.call @stack_push_pointer(%403) : (i64) -> ()
          %421 = llvm.mlir.addressof @str42 : !llvm.ptr
          %422 = func.call @cc_make_function_ref_const(%421) : (!llvm.ptr) -> i64
          %423 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%422, %423) : (i64, i64) -> ()
        }
        %424 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%424) : (i64) -> ()
        %425 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %425, %424 : i64, i64
      }
      %426 = func.call @cc_nil_value() : () -> i64
      %427 = func.call @cc_errorp(%380#0) : (i64) -> i64
      %428 = arith.cmpi ne, %427, %426 : i64
      %429:2 = scf.if %428 -> (i64, i64) {
        scf.yield %380#0, %380#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%180) : (i64) -> ()
        %430 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%380#1) : (i64) -> ()
        %431 = func.call @stack_pop_pointer() : () -> i64
        %432 = llvm.mlir.addressof @str43 : !llvm.ptr
        %433 = arith.constant 5 : i64
        %434 = func.call @cc_make_string(%432, %433) : (!llvm.ptr, i64) -> i64
        %435 = llvm.mlir.addressof @str44 : !llvm.ptr
        %436 = arith.constant 7 : i64
        %437 = func.call @cc_make_string(%435, %436) : (!llvm.ptr, i64) -> i64
        %438 = func.call @cc_intern(%434, %437) : (i64, i64) -> i64
        %439 = func.call @cc_nil_value() : () -> i64
        %440 = func.call @cc_cons(%438, %439) : (i64, i64) -> i64
        %441 = func.call @cc_values_pack(%440) : (i64) -> i64
        func.call @stack_push_pointer(%438) : (i64) -> ()
        %442 = func.call @stack_pop_pointer() : () -> i64
        %443 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%443) : (i64) -> ()
        %444 = func.call @stack_pop_pointer() : () -> i64
        %445 = llvm.mlir.addressof @str45 : !llvm.ptr
        %446 = arith.constant 3 : i64
        %447 = func.call @cc_make_string(%445, %446) : (!llvm.ptr, i64) -> i64
        %448 = llvm.mlir.addressof @str46 : !llvm.ptr
        %449 = arith.constant 7 : i64
        %450 = func.call @cc_make_string(%448, %449) : (!llvm.ptr, i64) -> i64
        %451 = func.call @cc_intern(%447, %450) : (i64, i64) -> i64
        %452 = func.call @cc_nil_value() : () -> i64
        %453 = func.call @cc_cons(%451, %452) : (i64, i64) -> i64
        %454 = func.call @cc_values_pack(%453) : (i64) -> i64
        func.call @stack_push_pointer(%451) : (i64) -> ()
        %455 = func.call @stack_pop_pointer() : () -> i64
        %456 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%456) : (i64) -> ()
        %457 = func.call @stack_pop_pointer() : () -> i64
        %458 = func.call @cc_nil_value() : () -> i64
        %459 = func.call @cc_errorp(%430) : (i64) -> i64
        %460 = arith.cmpi ne, %459, %458 : i64
        %461 = arith.cmpi eq, %458, %458 : i64
        %462 = arith.andi %460, %461 : i1
        %463 = scf.if %462 -> (i64) {
          scf.yield %430 : i64
        } else {
          scf.yield %458 : i64
        }
        %464 = func.call @cc_errorp(%431) : (i64) -> i64
        %465 = arith.cmpi ne, %464, %458 : i64
        %466 = arith.cmpi eq, %463, %458 : i64
        %467 = arith.andi %465, %466 : i1
        %468 = scf.if %467 -> (i64) {
          scf.yield %431 : i64
        } else {
          scf.yield %463 : i64
        }
        %469 = func.call @cc_errorp(%442) : (i64) -> i64
        %470 = arith.cmpi ne, %469, %458 : i64
        %471 = arith.cmpi eq, %468, %458 : i64
        %472 = arith.andi %470, %471 : i1
        %473 = scf.if %472 -> (i64) {
          scf.yield %442 : i64
        } else {
          scf.yield %468 : i64
        }
        %474 = func.call @cc_errorp(%444) : (i64) -> i64
        %475 = arith.cmpi ne, %474, %458 : i64
        %476 = arith.cmpi eq, %473, %458 : i64
        %477 = arith.andi %475, %476 : i1
        %478 = scf.if %477 -> (i64) {
          scf.yield %444 : i64
        } else {
          scf.yield %473 : i64
        }
        %479 = func.call @cc_errorp(%455) : (i64) -> i64
        %480 = arith.cmpi ne, %479, %458 : i64
        %481 = arith.cmpi eq, %478, %458 : i64
        %482 = arith.andi %480, %481 : i1
        %483 = scf.if %482 -> (i64) {
          scf.yield %455 : i64
        } else {
          scf.yield %478 : i64
        }
        %484 = func.call @cc_errorp(%457) : (i64) -> i64
        %485 = arith.cmpi ne, %484, %458 : i64
        %486 = arith.cmpi eq, %483, %458 : i64
        %487 = arith.andi %485, %486 : i1
        %488 = scf.if %487 -> (i64) {
          scf.yield %457 : i64
        } else {
          scf.yield %483 : i64
        }
        %489 = arith.cmpi ne, %488, %458 : i64
        scf.if %489 {
          func.call @stack_push_pointer(%488) : (i64) -> ()
        } else {
          %490 = func.call @cc_nil_value() : () -> i64
          %491 = func.call @cc_cons(%457, %490) : (i64, i64) -> i64
          %492 = func.call @cc_cons(%455, %491) : (i64, i64) -> i64
          %493 = func.call @cc_cons(%444, %492) : (i64, i64) -> i64
          %494 = func.call @cc_cons(%442, %493) : (i64, i64) -> i64
          %495 = func.call @cc_cons(%431, %494) : (i64, i64) -> i64
          %496 = func.call @cc_cons(%430, %495) : (i64, i64) -> i64
          func.call @stack_push_pointer(%496) : (i64) -> ()
          func.call @cc_read_sequence_stack() : () -> ()
        }
        %497 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %497, %380#1 : i64, i64
      }
      %498 = func.call @cc_nil_value() : () -> i64
      %499 = func.call @cc_errorp(%429#0) : (i64) -> i64
      %500 = arith.cmpi ne, %499, %498 : i64
      %501:2 = scf.if %500 -> (i64, i64) {
        scf.yield %429#0, %429#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%429#1) : (i64) -> ()
        %502 = func.call @stack_pop_pointer() : () -> i64
        %503 = func.call @cc_nil_value() : () -> i64
        %504 = func.call @cc_errorp(%502) : (i64) -> i64
        %505 = arith.cmpi ne, %504, %503 : i64
        %506 = arith.cmpi eq, %503, %503 : i64
        %507 = arith.andi %505, %506 : i1
        %508 = scf.if %507 -> (i64) {
          scf.yield %502 : i64
        } else {
          scf.yield %503 : i64
        }
        %509 = arith.cmpi ne, %508, %503 : i64
        scf.if %509 {
          func.call @stack_push_pointer(%508) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%502) : (i64) -> ()
          %510 = llvm.mlir.addressof @str47 : !llvm.ptr
          %511 = func.call @cc_make_function_ref_const(%510) : (!llvm.ptr) -> i64
          %512 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%511, %512) : (i64, i64) -> ()
        }
        %513 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %513, %429#1 : i64, i64
      }
      %514 = func.call @cc_nil_value() : () -> i64
      %515 = func.call @cc_errorp(%501#0) : (i64) -> i64
      %516 = arith.cmpi ne, %515, %514 : i64
      %517:2 = scf.if %516 -> (i64, i64) {
        scf.yield %501#0, %501#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%59) : (i64) -> ()
        %518 = func.call @stack_pop_pointer() : () -> i64
        %519 = func.call @cc_nil_value() : () -> i64
        %520 = func.call @cc_errorp(%518) : (i64) -> i64
        %521 = arith.cmpi ne, %520, %519 : i64
        %522 = arith.cmpi eq, %519, %519 : i64
        %523 = arith.andi %521, %522 : i1
        %524 = scf.if %523 -> (i64) {
          scf.yield %518 : i64
        } else {
          scf.yield %519 : i64
        }
        %525 = arith.cmpi ne, %524, %519 : i64
        scf.if %525 {
          func.call @stack_push_pointer(%524) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%518) : (i64) -> ()
          %526 = llvm.mlir.addressof @str48 : !llvm.ptr
          %527 = func.call @cc_make_function_ref_const(%526) : (!llvm.ptr) -> i64
          %528 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%527, %528) : (i64, i64) -> ()
        }
        %529 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %529, %501#1 : i64, i64
      }
      %530 = func.call @cc_nil_value() : () -> i64
      %531 = func.call @cc_errorp(%517#0) : (i64) -> i64
      %532 = arith.cmpi ne, %531, %530 : i64
      %533:2 = scf.if %532 -> (i64, i64) {
        scf.yield %517#0, %517#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%180) : (i64) -> ()
        %534 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %534, %517#1 : i64, i64
      }
      func.call @stack_push_pointer(%533#0) : (i64) -> ()
      %535 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %535 : i64
    }
    func.call @stack_push_pointer(%44) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("clisp/in_work/regression-tests/framework.lisp\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str2("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str3("close-abort\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str4("core:mkstemp\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str5("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str6("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str7("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str8("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str9("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str10("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str11("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str14("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str19("foo\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str20("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str21("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str22("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str23("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str24("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str26("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str27("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str29("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str30("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str31("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str35("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str36("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str37("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str38("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str39("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str40("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str41("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str42("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str43("START\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str44("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("END\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str46("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str48("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("results=~s error=~s equal=~s~%\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str50("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str51("COMMON-LISP:EQUALP\00") : !llvm.array<19 x i8>
  llvm.mlir.global private constant @str52("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str53("FORMAT\00") : !llvm.array<7 x i8>
}
