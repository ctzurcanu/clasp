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
      %40 = llvm.mlir.addressof @str3 : !llvm.ptr
      %41 = arith.constant 20 : i64
      %42 = func.call @cc_make_string(%40, %41) : (!llvm.ptr, i64) -> i64
      %43 = func.call @cc_nil_value() : () -> i64
      %44 = func.call @cc_intern(%42, %43) : (i64, i64) -> i64
      %45 = func.call @cc_nil_value() : () -> i64
      %46 = func.call @cc_cons(%44, %45) : (i64, i64) -> i64
      %47 = func.call @cc_values_pack(%46) : (i64) -> i64
      func.call @stack_push_pointer(%44) : (i64) -> ()
      %48 = func.call @stack_pop_pointer() : () -> i64
      %49 = llvm.mlir.addressof @str4 : !llvm.ptr
      %50 = arith.constant 4 : i64
      %51 = func.call @cc_make_string(%49, %50) : (!llvm.ptr, i64) -> i64
      %52 = llvm.mlir.addressof @str5 : !llvm.ptr
      %53 = arith.constant 11 : i64
      %54 = func.call @cc_make_string(%52, %53) : (!llvm.ptr, i64) -> i64
      %55 = func.call @cc_intern(%51, %54) : (i64, i64) -> i64
      %56 = func.call @cc_nil_value() : () -> i64
      %57 = func.call @cc_cons(%55, %56) : (i64, i64) -> i64
      %58 = func.call @cc_values_pack(%57) : (i64) -> i64
      func.call @stack_push_pointer(%55) : (i64) -> ()
      %59 = llvm.mlir.addressof @str6 : !llvm.ptr
      %60 = arith.constant 4 : i64
      %61 = func.call @cc_make_string(%59, %60) : (!llvm.ptr, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_intern(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_nil_value() : () -> i64
      %65 = func.call @cc_cons(%63, %64) : (i64, i64) -> i64
      %66 = func.call @cc_values_pack(%65) : (i64) -> i64
      func.call @stack_push_pointer(%63) : (i64) -> ()
      %67 = llvm.mlir.addressof @str7 : !llvm.ptr
      %68 = arith.constant 7 : i64
      %69 = func.call @cc_make_string(%67, %68) : (!llvm.ptr, i64) -> i64
      %70 = llvm.mlir.addressof @str8 : !llvm.ptr
      %71 = arith.constant 4 : i64
      %72 = func.call @cc_make_string(%70, %71) : (!llvm.ptr, i64) -> i64
      %73 = func.call @cc_intern(%69, %72) : (i64, i64) -> i64
      %74 = func.call @cc_nil_value() : () -> i64
      %75 = func.call @cc_cons(%73, %74) : (i64, i64) -> i64
      %76 = func.call @cc_values_pack(%75) : (i64) -> i64
      func.call @stack_push_pointer(%73) : (i64) -> ()
      %77 = llvm.mlir.addressof @str9 : !llvm.ptr
      %78 = arith.constant 11 : i64
      %79 = func.call @cc_make_string(%77, %78) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%79) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %80 = func.call @stack_pop_pointer() : () -> i64
      %81 = func.call @stack_pop_pointer() : () -> i64
      %82 = func.call @cc_cons(%81, %80) : (i64, i64) -> i64
      func.call @stack_push_pointer(%82) : (i64) -> ()
      %83 = func.call @stack_pop_pointer() : () -> i64
      %84 = func.call @stack_pop_pointer() : () -> i64
      %85 = func.call @cc_cons(%84, %83) : (i64, i64) -> i64
      func.call @stack_push_pointer(%85) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %86 = func.call @stack_pop_pointer() : () -> i64
      %87 = func.call @stack_pop_pointer() : () -> i64
      %88 = func.call @cc_cons(%87, %86) : (i64, i64) -> i64
      func.call @stack_push_pointer(%88) : (i64) -> ()
      %89 = func.call @stack_pop_pointer() : () -> i64
      %90 = func.call @stack_pop_pointer() : () -> i64
      %91 = func.call @cc_cons(%90, %89) : (i64, i64) -> i64
      func.call @stack_push_pointer(%91) : (i64) -> ()
      %92 = llvm.mlir.addressof @str10 : !llvm.ptr
      %93 = arith.constant 6 : i64
      %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
      %95 = llvm.mlir.addressof @str11 : !llvm.ptr
      %96 = arith.constant 11 : i64
      %97 = func.call @cc_make_string(%95, %96) : (!llvm.ptr, i64) -> i64
      %98 = func.call @cc_intern(%94, %97) : (i64, i64) -> i64
      %99 = func.call @cc_nil_value() : () -> i64
      %100 = func.call @cc_cons(%98, %99) : (i64, i64) -> i64
      %101 = func.call @cc_values_pack(%100) : (i64) -> i64
      func.call @stack_push_pointer(%98) : (i64) -> ()
      %102 = llvm.mlir.addressof @str12 : !llvm.ptr
      %103 = arith.constant 4 : i64
      %104 = func.call @cc_make_string(%102, %103) : (!llvm.ptr, i64) -> i64
      %105 = llvm.mlir.addressof @str13 : !llvm.ptr
      %106 = arith.constant 11 : i64
      %107 = func.call @cc_make_string(%105, %106) : (!llvm.ptr, i64) -> i64
      %108 = func.call @cc_intern(%104, %107) : (i64, i64) -> i64
      %109 = func.call @cc_nil_value() : () -> i64
      %110 = func.call @cc_cons(%108, %109) : (i64, i64) -> i64
      %111 = func.call @cc_values_pack(%110) : (i64) -> i64
      func.call @stack_push_pointer(%108) : (i64) -> ()
      %112 = llvm.mlir.addressof @str14 : !llvm.ptr
      %113 = arith.constant 4 : i64
      %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
      %115 = func.call @cc_nil_value() : () -> i64
      %116 = func.call @cc_intern(%114, %115) : (i64, i64) -> i64
      %117 = func.call @cc_nil_value() : () -> i64
      %118 = func.call @cc_cons(%116, %117) : (i64, i64) -> i64
      %119 = func.call @cc_values_pack(%118) : (i64) -> i64
      func.call @stack_push_pointer(%116) : (i64) -> ()
      %120 = llvm.mlir.addressof @str15 : !llvm.ptr
      %121 = arith.constant 17 : i64
      %122 = func.call @cc_make_string(%120, %121) : (!llvm.ptr, i64) -> i64
      %123 = llvm.mlir.addressof @str16 : !llvm.ptr
      %124 = arith.constant 7 : i64
      %125 = func.call @cc_make_string(%123, %124) : (!llvm.ptr, i64) -> i64
      %126 = func.call @cc_intern(%122, %125) : (i64, i64) -> i64
      %127 = func.call @cc_nil_value() : () -> i64
      %128 = func.call @cc_cons(%126, %127) : (i64, i64) -> i64
      %129 = func.call @cc_values_pack(%128) : (i64) -> i64
      func.call @stack_push_pointer(%126) : (i64) -> ()
      %130 = llvm.mlir.addressof @str17 : !llvm.ptr
      %131 = arith.constant 6 : i64
      %132 = func.call @cc_make_string(%130, %131) : (!llvm.ptr, i64) -> i64
      %133 = llvm.mlir.addressof @str18 : !llvm.ptr
      %134 = arith.constant 7 : i64
      %135 = func.call @cc_make_string(%133, %134) : (!llvm.ptr, i64) -> i64
      %136 = func.call @cc_intern(%132, %135) : (i64, i64) -> i64
      %137 = func.call @cc_nil_value() : () -> i64
      %138 = func.call @cc_cons(%136, %137) : (i64, i64) -> i64
      %139 = func.call @cc_values_pack(%138) : (i64) -> i64
      func.call @stack_push_pointer(%136) : (i64) -> ()
      %140 = llvm.mlir.addressof @str19 : !llvm.ptr
      %141 = arith.constant 9 : i64
      %142 = func.call @cc_make_string(%140, %141) : (!llvm.ptr, i64) -> i64
      %143 = llvm.mlir.addressof @str20 : !llvm.ptr
      %144 = arith.constant 7 : i64
      %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
      %146 = func.call @cc_intern(%142, %145) : (i64, i64) -> i64
      %147 = func.call @cc_nil_value() : () -> i64
      %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
      %149 = func.call @cc_values_pack(%148) : (i64) -> i64
      func.call @stack_push_pointer(%146) : (i64) -> ()
      %150 = llvm.mlir.addressof @str21 : !llvm.ptr
      %151 = arith.constant 6 : i64
      %152 = func.call @cc_make_string(%150, %151) : (!llvm.ptr, i64) -> i64
      %153 = llvm.mlir.addressof @str22 : !llvm.ptr
      %154 = arith.constant 7 : i64
      %155 = func.call @cc_make_string(%153, %154) : (!llvm.ptr, i64) -> i64
      %156 = func.call @cc_intern(%152, %155) : (i64, i64) -> i64
      %157 = func.call @cc_nil_value() : () -> i64
      %158 = func.call @cc_cons(%156, %157) : (i64, i64) -> i64
      %159 = func.call @cc_values_pack(%158) : (i64) -> i64
      func.call @stack_push_pointer(%156) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %174 = func.call @cc_cons(%173, %172) : (i64, i64) -> i64
      func.call @stack_push_pointer(%174) : (i64) -> ()
      %175 = func.call @stack_pop_pointer() : () -> i64
      %176 = func.call @stack_pop_pointer() : () -> i64
      %177 = func.call @cc_cons(%176, %175) : (i64, i64) -> i64
      func.call @stack_push_pointer(%177) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %178 = func.call @stack_pop_pointer() : () -> i64
      %179 = func.call @stack_pop_pointer() : () -> i64
      %180 = func.call @cc_cons(%179, %178) : (i64, i64) -> i64
      func.call @stack_push_pointer(%180) : (i64) -> ()
      %181 = func.call @stack_pop_pointer() : () -> i64
      %182 = func.call @stack_pop_pointer() : () -> i64
      %183 = func.call @cc_cons(%182, %181) : (i64, i64) -> i64
      func.call @stack_push_pointer(%183) : (i64) -> ()
      %184 = llvm.mlir.addressof @str23 : !llvm.ptr
      %185 = arith.constant 6 : i64
      %186 = func.call @cc_make_string(%184, %185) : (!llvm.ptr, i64) -> i64
      %187 = func.call @cc_nil_value() : () -> i64
      %188 = func.call @cc_intern(%186, %187) : (i64, i64) -> i64
      %189 = func.call @cc_nil_value() : () -> i64
      %190 = func.call @cc_cons(%188, %189) : (i64, i64) -> i64
      %191 = func.call @cc_values_pack(%190) : (i64) -> i64
      func.call @stack_push_pointer(%188) : (i64) -> ()
      %192 = llvm.mlir.addressof @str24 : !llvm.ptr
      %193 = arith.constant 10 : i64
      %194 = func.call @cc_make_string(%192, %193) : (!llvm.ptr, i64) -> i64
      %195 = llvm.mlir.addressof @str25 : !llvm.ptr
      %196 = arith.constant 11 : i64
      %197 = func.call @cc_make_string(%195, %196) : (!llvm.ptr, i64) -> i64
      %198 = func.call @cc_intern(%194, %197) : (i64, i64) -> i64
      %199 = func.call @cc_nil_value() : () -> i64
      %200 = func.call @cc_cons(%198, %199) : (i64, i64) -> i64
      %201 = func.call @cc_values_pack(%200) : (i64) -> i64
      func.call @stack_push_pointer(%198) : (i64) -> ()
      %202 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%202) : (i64) -> ()
      %203 = llvm.mlir.addressof @str26 : !llvm.ptr
      %204 = arith.constant 12 : i64
      %205 = func.call @cc_make_string(%203, %204) : (!llvm.ptr, i64) -> i64
      %206 = llvm.mlir.addressof @str27 : !llvm.ptr
      %207 = arith.constant 7 : i64
      %208 = func.call @cc_make_string(%206, %207) : (!llvm.ptr, i64) -> i64
      %209 = func.call @cc_intern(%205, %208) : (i64, i64) -> i64
      %210 = func.call @cc_nil_value() : () -> i64
      %211 = func.call @cc_cons(%209, %210) : (i64, i64) -> i64
      %212 = func.call @cc_values_pack(%211) : (i64) -> i64
      func.call @stack_push_pointer(%209) : (i64) -> ()
      %213 = llvm.mlir.addressof @str28 : !llvm.ptr
      %214 = arith.constant 5 : i64
      %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
      %216 = llvm.mlir.addressof @str29 : !llvm.ptr
      %217 = arith.constant 11 : i64
      %218 = func.call @cc_make_string(%216, %217) : (!llvm.ptr, i64) -> i64
      %219 = func.call @cc_intern(%215, %218) : (i64, i64) -> i64
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_cons(%219, %220) : (i64, i64) -> i64
      %222 = func.call @cc_values_pack(%221) : (i64) -> i64
      func.call @stack_push_pointer(%219) : (i64) -> ()
      %223 = llvm.mlir.addressof @str30 : !llvm.ptr
      %224 = arith.constant 9 : i64
      %225 = func.call @cc_make_string(%223, %224) : (!llvm.ptr, i64) -> i64
      %226 = llvm.mlir.addressof @str31 : !llvm.ptr
      %227 = arith.constant 11 : i64
      %228 = func.call @cc_make_string(%226, %227) : (!llvm.ptr, i64) -> i64
      %229 = func.call @cc_intern(%225, %228) : (i64, i64) -> i64
      %230 = func.call @cc_nil_value() : () -> i64
      %231 = func.call @cc_cons(%229, %230) : (i64, i64) -> i64
      %232 = func.call @cc_values_pack(%231) : (i64) -> i64
      func.call @stack_push_pointer(%229) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %233 = func.call @stack_pop_pointer() : () -> i64
      %234 = func.call @stack_pop_pointer() : () -> i64
      %235 = func.call @cc_cons(%234, %233) : (i64, i64) -> i64
      func.call @stack_push_pointer(%235) : (i64) -> ()
      %236 = func.call @stack_pop_pointer() : () -> i64
      %237 = func.call @stack_pop_pointer() : () -> i64
      %238 = func.call @cc_cons(%237, %236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%238) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %239 = func.call @stack_pop_pointer() : () -> i64
      %240 = func.call @stack_pop_pointer() : () -> i64
      %241 = func.call @cc_cons(%240, %239) : (i64, i64) -> i64
      func.call @stack_push_pointer(%241) : (i64) -> ()
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
      func.call @stack_push_nil() : () -> ()
      %251 = func.call @stack_pop_pointer() : () -> i64
      %252 = func.call @stack_pop_pointer() : () -> i64
      %253 = func.call @cc_cons(%252, %251) : (i64, i64) -> i64
      func.call @stack_push_pointer(%253) : (i64) -> ()
      %254 = func.call @stack_pop_pointer() : () -> i64
      %255 = func.call @stack_pop_pointer() : () -> i64
      %256 = func.call @cc_cons(%255, %254) : (i64, i64) -> i64
      func.call @stack_push_pointer(%256) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %257 = func.call @stack_pop_pointer() : () -> i64
      %258 = func.call @stack_pop_pointer() : () -> i64
      %259 = func.call @cc_cons(%258, %257) : (i64, i64) -> i64
      func.call @stack_push_pointer(%259) : (i64) -> ()
      %260 = func.call @stack_pop_pointer() : () -> i64
      %261 = func.call @stack_pop_pointer() : () -> i64
      %262 = func.call @cc_cons(%261, %260) : (i64, i64) -> i64
      func.call @stack_push_pointer(%262) : (i64) -> ()
      %263 = func.call @stack_pop_pointer() : () -> i64
      %264 = func.call @stack_pop_pointer() : () -> i64
      %265 = func.call @cc_cons(%264, %263) : (i64, i64) -> i64
      func.call @stack_push_pointer(%265) : (i64) -> ()
      %266 = llvm.mlir.addressof @str32 : !llvm.ptr
      %267 = arith.constant 12 : i64
      %268 = func.call @cc_make_string(%266, %267) : (!llvm.ptr, i64) -> i64
      %269 = llvm.mlir.addressof @str33 : !llvm.ptr
      %270 = arith.constant 11 : i64
      %271 = func.call @cc_make_string(%269, %270) : (!llvm.ptr, i64) -> i64
      %272 = func.call @cc_intern(%268, %271) : (i64, i64) -> i64
      %273 = func.call @cc_nil_value() : () -> i64
      %274 = func.call @cc_cons(%272, %273) : (i64, i64) -> i64
      %275 = func.call @cc_values_pack(%274) : (i64) -> i64
      func.call @stack_push_pointer(%272) : (i64) -> ()
      %276 = llvm.mlir.addressof @str34 : !llvm.ptr
      %277 = arith.constant 3 : i64
      %278 = func.call @cc_make_string(%276, %277) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%278) : (i64) -> ()
      %279 = llvm.mlir.addressof @str35 : !llvm.ptr
      %280 = arith.constant 6 : i64
      %281 = func.call @cc_make_string(%279, %280) : (!llvm.ptr, i64) -> i64
      %282 = llvm.mlir.addressof @str36 : !llvm.ptr
      %283 = arith.constant 11 : i64
      %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
      %285 = func.call @cc_intern(%281, %284) : (i64, i64) -> i64
      %286 = func.call @cc_nil_value() : () -> i64
      %287 = func.call @cc_cons(%285, %286) : (i64, i64) -> i64
      %288 = func.call @cc_values_pack(%287) : (i64) -> i64
      func.call @stack_push_pointer(%285) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %289 = func.call @stack_pop_pointer() : () -> i64
      %290 = func.call @stack_pop_pointer() : () -> i64
      %291 = func.call @cc_cons(%290, %289) : (i64, i64) -> i64
      func.call @stack_push_pointer(%291) : (i64) -> ()
      %292 = func.call @stack_pop_pointer() : () -> i64
      %293 = func.call @stack_pop_pointer() : () -> i64
      %294 = func.call @cc_cons(%293, %292) : (i64, i64) -> i64
      func.call @stack_push_pointer(%294) : (i64) -> ()
      %295 = func.call @stack_pop_pointer() : () -> i64
      %296 = func.call @stack_pop_pointer() : () -> i64
      %297 = func.call @cc_cons(%296, %295) : (i64, i64) -> i64
      func.call @stack_push_pointer(%297) : (i64) -> ()
      %298 = llvm.mlir.addressof @str37 : !llvm.ptr
      %299 = arith.constant 5 : i64
      %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
      %301 = llvm.mlir.addressof @str38 : !llvm.ptr
      %302 = arith.constant 11 : i64
      %303 = func.call @cc_make_string(%301, %302) : (!llvm.ptr, i64) -> i64
      %304 = func.call @cc_intern(%300, %303) : (i64, i64) -> i64
      %305 = func.call @cc_nil_value() : () -> i64
      %306 = func.call @cc_cons(%304, %305) : (i64, i64) -> i64
      %307 = func.call @cc_values_pack(%306) : (i64) -> i64
      func.call @stack_push_pointer(%304) : (i64) -> ()
      %308 = llvm.mlir.addressof @str39 : !llvm.ptr
      %309 = arith.constant 6 : i64
      %310 = func.call @cc_make_string(%308, %309) : (!llvm.ptr, i64) -> i64
      %311 = llvm.mlir.addressof @str40 : !llvm.ptr
      %312 = arith.constant 11 : i64
      %313 = func.call @cc_make_string(%311, %312) : (!llvm.ptr, i64) -> i64
      %314 = func.call @cc_intern(%310, %313) : (i64, i64) -> i64
      %315 = func.call @cc_nil_value() : () -> i64
      %316 = func.call @cc_cons(%314, %315) : (i64, i64) -> i64
      %317 = func.call @cc_values_pack(%316) : (i64) -> i64
      func.call @stack_push_pointer(%314) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %318 = func.call @stack_pop_pointer() : () -> i64
      %319 = func.call @stack_pop_pointer() : () -> i64
      %320 = func.call @cc_cons(%319, %318) : (i64, i64) -> i64
      func.call @stack_push_pointer(%320) : (i64) -> ()
      %321 = func.call @stack_pop_pointer() : () -> i64
      %322 = func.call @stack_pop_pointer() : () -> i64
      %323 = func.call @cc_cons(%322, %321) : (i64, i64) -> i64
      func.call @stack_push_pointer(%323) : (i64) -> ()
      %324 = llvm.mlir.addressof @str41 : !llvm.ptr
      %325 = arith.constant 4 : i64
      %326 = func.call @cc_make_string(%324, %325) : (!llvm.ptr, i64) -> i64
      %327 = llvm.mlir.addressof @str42 : !llvm.ptr
      %328 = arith.constant 11 : i64
      %329 = func.call @cc_make_string(%327, %328) : (!llvm.ptr, i64) -> i64
      %330 = func.call @cc_intern(%326, %329) : (i64, i64) -> i64
      %331 = func.call @cc_nil_value() : () -> i64
      %332 = func.call @cc_cons(%330, %331) : (i64, i64) -> i64
      %333 = func.call @cc_values_pack(%332) : (i64) -> i64
      func.call @stack_push_pointer(%330) : (i64) -> ()
      %334 = llvm.mlir.addressof @str43 : !llvm.ptr
      %335 = arith.constant 6 : i64
      %336 = func.call @cc_make_string(%334, %335) : (!llvm.ptr, i64) -> i64
      %337 = llvm.mlir.addressof @str44 : !llvm.ptr
      %338 = arith.constant 11 : i64
      %339 = func.call @cc_make_string(%337, %338) : (!llvm.ptr, i64) -> i64
      %340 = func.call @cc_intern(%336, %339) : (i64, i64) -> i64
      %341 = func.call @cc_nil_value() : () -> i64
      %342 = func.call @cc_cons(%340, %341) : (i64, i64) -> i64
      %343 = func.call @cc_values_pack(%342) : (i64) -> i64
      func.call @stack_push_pointer(%340) : (i64) -> ()
      %344 = llvm.mlir.addressof @str45 : !llvm.ptr
      %345 = arith.constant 4 : i64
      %346 = func.call @cc_make_string(%344, %345) : (!llvm.ptr, i64) -> i64
      %347 = llvm.mlir.addressof @str46 : !llvm.ptr
      %348 = arith.constant 11 : i64
      %349 = func.call @cc_make_string(%347, %348) : (!llvm.ptr, i64) -> i64
      %350 = func.call @cc_intern(%346, %349) : (i64, i64) -> i64
      %351 = func.call @cc_nil_value() : () -> i64
      %352 = func.call @cc_cons(%350, %351) : (i64, i64) -> i64
      %353 = func.call @cc_values_pack(%352) : (i64) -> i64
      func.call @stack_push_pointer(%350) : (i64) -> ()
      %354 = llvm.mlir.addressof @str47 : !llvm.ptr
      %355 = arith.constant 4 : i64
      %356 = func.call @cc_make_string(%354, %355) : (!llvm.ptr, i64) -> i64
      %357 = func.call @cc_nil_value() : () -> i64
      %358 = func.call @cc_intern(%356, %357) : (i64, i64) -> i64
      %359 = func.call @cc_nil_value() : () -> i64
      %360 = func.call @cc_cons(%358, %359) : (i64, i64) -> i64
      %361 = func.call @cc_values_pack(%360) : (i64) -> i64
      func.call @stack_push_pointer(%358) : (i64) -> ()
      %362 = llvm.mlir.addressof @str48 : !llvm.ptr
      %363 = arith.constant 17 : i64
      %364 = func.call @cc_make_string(%362, %363) : (!llvm.ptr, i64) -> i64
      %365 = llvm.mlir.addressof @str49 : !llvm.ptr
      %366 = arith.constant 7 : i64
      %367 = func.call @cc_make_string(%365, %366) : (!llvm.ptr, i64) -> i64
      %368 = func.call @cc_intern(%364, %367) : (i64, i64) -> i64
      %369 = func.call @cc_nil_value() : () -> i64
      %370 = func.call @cc_cons(%368, %369) : (i64, i64) -> i64
      %371 = func.call @cc_values_pack(%370) : (i64) -> i64
      func.call @stack_push_pointer(%368) : (i64) -> ()
      %372 = llvm.mlir.addressof @str50 : !llvm.ptr
      %373 = arith.constant 6 : i64
      %374 = func.call @cc_make_string(%372, %373) : (!llvm.ptr, i64) -> i64
      %375 = llvm.mlir.addressof @str51 : !llvm.ptr
      %376 = arith.constant 7 : i64
      %377 = func.call @cc_make_string(%375, %376) : (!llvm.ptr, i64) -> i64
      %378 = func.call @cc_intern(%374, %377) : (i64, i64) -> i64
      %379 = func.call @cc_nil_value() : () -> i64
      %380 = func.call @cc_cons(%378, %379) : (i64, i64) -> i64
      %381 = func.call @cc_values_pack(%380) : (i64) -> i64
      func.call @stack_push_pointer(%378) : (i64) -> ()
      %382 = llvm.mlir.addressof @str52 : !llvm.ptr
      %383 = arith.constant 9 : i64
      %384 = func.call @cc_make_string(%382, %383) : (!llvm.ptr, i64) -> i64
      %385 = llvm.mlir.addressof @str53 : !llvm.ptr
      %386 = arith.constant 7 : i64
      %387 = func.call @cc_make_string(%385, %386) : (!llvm.ptr, i64) -> i64
      %388 = func.call @cc_intern(%384, %387) : (i64, i64) -> i64
      %389 = func.call @cc_nil_value() : () -> i64
      %390 = func.call @cc_cons(%388, %389) : (i64, i64) -> i64
      %391 = func.call @cc_values_pack(%390) : (i64) -> i64
      func.call @stack_push_pointer(%388) : (i64) -> ()
      %392 = llvm.mlir.addressof @str54 : !llvm.ptr
      %393 = arith.constant 9 : i64
      %394 = func.call @cc_make_string(%392, %393) : (!llvm.ptr, i64) -> i64
      %395 = llvm.mlir.addressof @str55 : !llvm.ptr
      %396 = arith.constant 7 : i64
      %397 = func.call @cc_make_string(%395, %396) : (!llvm.ptr, i64) -> i64
      %398 = func.call @cc_intern(%394, %397) : (i64, i64) -> i64
      %399 = func.call @cc_nil_value() : () -> i64
      %400 = func.call @cc_cons(%398, %399) : (i64, i64) -> i64
      %401 = func.call @cc_values_pack(%400) : (i64) -> i64
      func.call @stack_push_pointer(%398) : (i64) -> ()
      %402 = llvm.mlir.addressof @str56 : !llvm.ptr
      %403 = arith.constant 9 : i64
      %404 = func.call @cc_make_string(%402, %403) : (!llvm.ptr, i64) -> i64
      %405 = llvm.mlir.addressof @str57 : !llvm.ptr
      %406 = arith.constant 7 : i64
      %407 = func.call @cc_make_string(%405, %406) : (!llvm.ptr, i64) -> i64
      %408 = func.call @cc_intern(%404, %407) : (i64, i64) -> i64
      %409 = func.call @cc_nil_value() : () -> i64
      %410 = func.call @cc_cons(%408, %409) : (i64, i64) -> i64
      %411 = func.call @cc_values_pack(%410) : (i64) -> i64
      func.call @stack_push_pointer(%408) : (i64) -> ()
      %412 = llvm.mlir.addressof @str58 : !llvm.ptr
      %413 = arith.constant 6 : i64
      %414 = func.call @cc_make_string(%412, %413) : (!llvm.ptr, i64) -> i64
      %415 = llvm.mlir.addressof @str59 : !llvm.ptr
      %416 = arith.constant 7 : i64
      %417 = func.call @cc_make_string(%415, %416) : (!llvm.ptr, i64) -> i64
      %418 = func.call @cc_intern(%414, %417) : (i64, i64) -> i64
      %419 = func.call @cc_nil_value() : () -> i64
      %420 = func.call @cc_cons(%418, %419) : (i64, i64) -> i64
      %421 = func.call @cc_values_pack(%420) : (i64) -> i64
      func.call @stack_push_pointer(%418) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %455 = llvm.mlir.addressof @str60 : !llvm.ptr
      %456 = arith.constant 12 : i64
      %457 = func.call @cc_make_string(%455, %456) : (!llvm.ptr, i64) -> i64
      %458 = llvm.mlir.addressof @str61 : !llvm.ptr
      %459 = arith.constant 11 : i64
      %460 = func.call @cc_make_string(%458, %459) : (!llvm.ptr, i64) -> i64
      %461 = func.call @cc_intern(%457, %460) : (i64, i64) -> i64
      %462 = func.call @cc_nil_value() : () -> i64
      %463 = func.call @cc_cons(%461, %462) : (i64, i64) -> i64
      %464 = func.call @cc_values_pack(%463) : (i64) -> i64
      func.call @stack_push_pointer(%461) : (i64) -> ()
      %465 = llvm.mlir.addressof @str62 : !llvm.ptr
      %466 = arith.constant 3 : i64
      %467 = func.call @cc_make_string(%465, %466) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%467) : (i64) -> ()
      %468 = llvm.mlir.addressof @str63 : !llvm.ptr
      %469 = arith.constant 6 : i64
      %470 = func.call @cc_make_string(%468, %469) : (!llvm.ptr, i64) -> i64
      %471 = llvm.mlir.addressof @str64 : !llvm.ptr
      %472 = arith.constant 11 : i64
      %473 = func.call @cc_make_string(%471, %472) : (!llvm.ptr, i64) -> i64
      %474 = func.call @cc_intern(%470, %473) : (i64, i64) -> i64
      %475 = func.call @cc_nil_value() : () -> i64
      %476 = func.call @cc_cons(%474, %475) : (i64, i64) -> i64
      %477 = func.call @cc_values_pack(%476) : (i64) -> i64
      func.call @stack_push_pointer(%474) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %478 = func.call @stack_pop_pointer() : () -> i64
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @cc_cons(%479, %478) : (i64, i64) -> i64
      func.call @stack_push_pointer(%480) : (i64) -> ()
      %481 = func.call @stack_pop_pointer() : () -> i64
      %482 = func.call @stack_pop_pointer() : () -> i64
      %483 = func.call @cc_cons(%482, %481) : (i64, i64) -> i64
      func.call @stack_push_pointer(%483) : (i64) -> ()
      %484 = func.call @stack_pop_pointer() : () -> i64
      %485 = func.call @stack_pop_pointer() : () -> i64
      %486 = func.call @cc_cons(%485, %484) : (i64, i64) -> i64
      func.call @stack_push_pointer(%486) : (i64) -> ()
      %487 = llvm.mlir.addressof @str65 : !llvm.ptr
      %488 = arith.constant 5 : i64
      %489 = func.call @cc_make_string(%487, %488) : (!llvm.ptr, i64) -> i64
      %490 = llvm.mlir.addressof @str66 : !llvm.ptr
      %491 = arith.constant 11 : i64
      %492 = func.call @cc_make_string(%490, %491) : (!llvm.ptr, i64) -> i64
      %493 = func.call @cc_intern(%489, %492) : (i64, i64) -> i64
      %494 = func.call @cc_nil_value() : () -> i64
      %495 = func.call @cc_cons(%493, %494) : (i64, i64) -> i64
      %496 = func.call @cc_values_pack(%495) : (i64) -> i64
      func.call @stack_push_pointer(%493) : (i64) -> ()
      %497 = llvm.mlir.addressof @str67 : !llvm.ptr
      %498 = arith.constant 6 : i64
      %499 = func.call @cc_make_string(%497, %498) : (!llvm.ptr, i64) -> i64
      %500 = llvm.mlir.addressof @str68 : !llvm.ptr
      %501 = arith.constant 11 : i64
      %502 = func.call @cc_make_string(%500, %501) : (!llvm.ptr, i64) -> i64
      %503 = func.call @cc_intern(%499, %502) : (i64, i64) -> i64
      %504 = func.call @cc_nil_value() : () -> i64
      %505 = func.call @cc_cons(%503, %504) : (i64, i64) -> i64
      %506 = func.call @cc_values_pack(%505) : (i64) -> i64
      func.call @stack_push_pointer(%503) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %507 = func.call @stack_pop_pointer() : () -> i64
      %508 = func.call @stack_pop_pointer() : () -> i64
      %509 = func.call @cc_cons(%508, %507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      %510 = func.call @stack_pop_pointer() : () -> i64
      %511 = func.call @stack_pop_pointer() : () -> i64
      %512 = func.call @cc_cons(%511, %510) : (i64, i64) -> i64
      func.call @stack_push_pointer(%512) : (i64) -> ()
      %513 = llvm.mlir.addressof @str69 : !llvm.ptr
      %514 = arith.constant 4 : i64
      %515 = func.call @cc_make_string(%513, %514) : (!llvm.ptr, i64) -> i64
      %516 = llvm.mlir.addressof @str70 : !llvm.ptr
      %517 = arith.constant 11 : i64
      %518 = func.call @cc_make_string(%516, %517) : (!llvm.ptr, i64) -> i64
      %519 = func.call @cc_intern(%515, %518) : (i64, i64) -> i64
      %520 = func.call @cc_nil_value() : () -> i64
      %521 = func.call @cc_cons(%519, %520) : (i64, i64) -> i64
      %522 = func.call @cc_values_pack(%521) : (i64) -> i64
      func.call @stack_push_pointer(%519) : (i64) -> ()
      %523 = llvm.mlir.addressof @str71 : !llvm.ptr
      %524 = arith.constant 6 : i64
      %525 = func.call @cc_make_string(%523, %524) : (!llvm.ptr, i64) -> i64
      %526 = llvm.mlir.addressof @str72 : !llvm.ptr
      %527 = arith.constant 11 : i64
      %528 = func.call @cc_make_string(%526, %527) : (!llvm.ptr, i64) -> i64
      %529 = func.call @cc_intern(%525, %528) : (i64, i64) -> i64
      %530 = func.call @cc_nil_value() : () -> i64
      %531 = func.call @cc_cons(%529, %530) : (i64, i64) -> i64
      %532 = func.call @cc_values_pack(%531) : (i64) -> i64
      func.call @stack_push_pointer(%529) : (i64) -> ()
      %533 = llvm.mlir.addressof @str73 : !llvm.ptr
      %534 = arith.constant 4 : i64
      %535 = func.call @cc_make_string(%533, %534) : (!llvm.ptr, i64) -> i64
      %536 = llvm.mlir.addressof @str74 : !llvm.ptr
      %537 = arith.constant 11 : i64
      %538 = func.call @cc_make_string(%536, %537) : (!llvm.ptr, i64) -> i64
      %539 = func.call @cc_intern(%535, %538) : (i64, i64) -> i64
      %540 = func.call @cc_nil_value() : () -> i64
      %541 = func.call @cc_cons(%539, %540) : (i64, i64) -> i64
      %542 = func.call @cc_values_pack(%541) : (i64) -> i64
      func.call @stack_push_pointer(%539) : (i64) -> ()
      %543 = llvm.mlir.addressof @str75 : !llvm.ptr
      %544 = arith.constant 4 : i64
      %545 = func.call @cc_make_string(%543, %544) : (!llvm.ptr, i64) -> i64
      %546 = func.call @cc_nil_value() : () -> i64
      %547 = func.call @cc_intern(%545, %546) : (i64, i64) -> i64
      %548 = func.call @cc_nil_value() : () -> i64
      %549 = func.call @cc_cons(%547, %548) : (i64, i64) -> i64
      %550 = func.call @cc_values_pack(%549) : (i64) -> i64
      func.call @stack_push_pointer(%547) : (i64) -> ()
      %551 = llvm.mlir.addressof @str76 : !llvm.ptr
      %552 = arith.constant 9 : i64
      %553 = func.call @cc_make_string(%551, %552) : (!llvm.ptr, i64) -> i64
      %554 = llvm.mlir.addressof @str77 : !llvm.ptr
      %555 = arith.constant 7 : i64
      %556 = func.call @cc_make_string(%554, %555) : (!llvm.ptr, i64) -> i64
      %557 = func.call @cc_intern(%553, %556) : (i64, i64) -> i64
      %558 = func.call @cc_nil_value() : () -> i64
      %559 = func.call @cc_cons(%557, %558) : (i64, i64) -> i64
      %560 = func.call @cc_values_pack(%559) : (i64) -> i64
      func.call @stack_push_pointer(%557) : (i64) -> ()
      %561 = llvm.mlir.addressof @str78 : !llvm.ptr
      %562 = arith.constant 5 : i64
      %563 = func.call @cc_make_string(%561, %562) : (!llvm.ptr, i64) -> i64
      %564 = llvm.mlir.addressof @str79 : !llvm.ptr
      %565 = arith.constant 7 : i64
      %566 = func.call @cc_make_string(%564, %565) : (!llvm.ptr, i64) -> i64
      %567 = func.call @cc_intern(%563, %566) : (i64, i64) -> i64
      %568 = func.call @cc_nil_value() : () -> i64
      %569 = func.call @cc_cons(%567, %568) : (i64, i64) -> i64
      %570 = func.call @cc_values_pack(%569) : (i64) -> i64
      func.call @stack_push_pointer(%567) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %571 = func.call @stack_pop_pointer() : () -> i64
      %572 = func.call @stack_pop_pointer() : () -> i64
      %573 = func.call @cc_cons(%572, %571) : (i64, i64) -> i64
      func.call @stack_push_pointer(%573) : (i64) -> ()
      %574 = func.call @stack_pop_pointer() : () -> i64
      %575 = func.call @stack_pop_pointer() : () -> i64
      %576 = func.call @cc_cons(%575, %574) : (i64, i64) -> i64
      func.call @stack_push_pointer(%576) : (i64) -> ()
      %577 = func.call @stack_pop_pointer() : () -> i64
      %578 = func.call @stack_pop_pointer() : () -> i64
      %579 = func.call @cc_cons(%578, %577) : (i64, i64) -> i64
      func.call @stack_push_pointer(%579) : (i64) -> ()
      %580 = func.call @stack_pop_pointer() : () -> i64
      %581 = func.call @stack_pop_pointer() : () -> i64
      %582 = func.call @cc_cons(%581, %580) : (i64, i64) -> i64
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
      %592 = llvm.mlir.addressof @str80 : !llvm.ptr
      %593 = arith.constant 13 : i64
      %594 = func.call @cc_make_string(%592, %593) : (!llvm.ptr, i64) -> i64
      %595 = llvm.mlir.addressof @str81 : !llvm.ptr
      %596 = arith.constant 11 : i64
      %597 = func.call @cc_make_string(%595, %596) : (!llvm.ptr, i64) -> i64
      %598 = func.call @cc_intern(%594, %597) : (i64, i64) -> i64
      %599 = func.call @cc_nil_value() : () -> i64
      %600 = func.call @cc_cons(%598, %599) : (i64, i64) -> i64
      %601 = func.call @cc_values_pack(%600) : (i64) -> i64
      func.call @stack_push_pointer(%598) : (i64) -> ()
      %602 = llvm.mlir.addressof @str82 : !llvm.ptr
      %603 = arith.constant 6 : i64
      %604 = func.call @cc_make_string(%602, %603) : (!llvm.ptr, i64) -> i64
      %605 = func.call @cc_nil_value() : () -> i64
      %606 = func.call @cc_intern(%604, %605) : (i64, i64) -> i64
      %607 = func.call @cc_nil_value() : () -> i64
      %608 = func.call @cc_cons(%606, %607) : (i64, i64) -> i64
      %609 = func.call @cc_values_pack(%608) : (i64) -> i64
      func.call @stack_push_pointer(%606) : (i64) -> ()
      %610 = llvm.mlir.addressof @str83 : !llvm.ptr
      %611 = arith.constant 6 : i64
      %612 = func.call @cc_make_string(%610, %611) : (!llvm.ptr, i64) -> i64
      %613 = llvm.mlir.addressof @str84 : !llvm.ptr
      %614 = arith.constant 11 : i64
      %615 = func.call @cc_make_string(%613, %614) : (!llvm.ptr, i64) -> i64
      %616 = func.call @cc_intern(%612, %615) : (i64, i64) -> i64
      %617 = func.call @cc_nil_value() : () -> i64
      %618 = func.call @cc_cons(%616, %617) : (i64, i64) -> i64
      %619 = func.call @cc_values_pack(%618) : (i64) -> i64
      func.call @stack_push_pointer(%616) : (i64) -> ()
      %620 = llvm.mlir.addressof @str85 : !llvm.ptr
      %621 = arith.constant 5 : i64
      %622 = func.call @cc_make_string(%620, %621) : (!llvm.ptr, i64) -> i64
      %623 = llvm.mlir.addressof @str86 : !llvm.ptr
      %624 = arith.constant 7 : i64
      %625 = func.call @cc_make_string(%623, %624) : (!llvm.ptr, i64) -> i64
      %626 = func.call @cc_intern(%622, %625) : (i64, i64) -> i64
      %627 = func.call @cc_nil_value() : () -> i64
      %628 = func.call @cc_cons(%626, %627) : (i64, i64) -> i64
      %629 = func.call @cc_values_pack(%628) : (i64) -> i64
      func.call @stack_push_pointer(%626) : (i64) -> ()
      %630 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%630) : (i64) -> ()
      %631 = llvm.mlir.addressof @str87 : !llvm.ptr
      %632 = arith.constant 3 : i64
      %633 = func.call @cc_make_string(%631, %632) : (!llvm.ptr, i64) -> i64
      %634 = llvm.mlir.addressof @str88 : !llvm.ptr
      %635 = arith.constant 7 : i64
      %636 = func.call @cc_make_string(%634, %635) : (!llvm.ptr, i64) -> i64
      %637 = func.call @cc_intern(%633, %636) : (i64, i64) -> i64
      %638 = func.call @cc_nil_value() : () -> i64
      %639 = func.call @cc_cons(%637, %638) : (i64, i64) -> i64
      %640 = func.call @cc_values_pack(%639) : (i64) -> i64
      func.call @stack_push_pointer(%637) : (i64) -> ()
      %641 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%641) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %642 = func.call @stack_pop_pointer() : () -> i64
      %643 = func.call @stack_pop_pointer() : () -> i64
      %644 = func.call @cc_cons(%643, %642) : (i64, i64) -> i64
      func.call @stack_push_pointer(%644) : (i64) -> ()
      %645 = func.call @stack_pop_pointer() : () -> i64
      %646 = func.call @stack_pop_pointer() : () -> i64
      %647 = func.call @cc_cons(%646, %645) : (i64, i64) -> i64
      func.call @stack_push_pointer(%647) : (i64) -> ()
      %648 = func.call @stack_pop_pointer() : () -> i64
      %649 = func.call @stack_pop_pointer() : () -> i64
      %650 = func.call @cc_cons(%649, %648) : (i64, i64) -> i64
      func.call @stack_push_pointer(%650) : (i64) -> ()
      %651 = func.call @stack_pop_pointer() : () -> i64
      %652 = func.call @stack_pop_pointer() : () -> i64
      %653 = func.call @cc_cons(%652, %651) : (i64, i64) -> i64
      func.call @stack_push_pointer(%653) : (i64) -> ()
      %654 = func.call @stack_pop_pointer() : () -> i64
      %655 = func.call @stack_pop_pointer() : () -> i64
      %656 = func.call @cc_cons(%655, %654) : (i64, i64) -> i64
      func.call @stack_push_pointer(%656) : (i64) -> ()
      %657 = func.call @stack_pop_pointer() : () -> i64
      %658 = func.call @stack_pop_pointer() : () -> i64
      %659 = func.call @cc_cons(%658, %657) : (i64, i64) -> i64
      func.call @stack_push_pointer(%659) : (i64) -> ()
      %660 = func.call @stack_pop_pointer() : () -> i64
      %661 = func.call @stack_pop_pointer() : () -> i64
      %662 = func.call @cc_cons(%661, %660) : (i64, i64) -> i64
      func.call @stack_push_pointer(%662) : (i64) -> ()
      %663 = llvm.mlir.addressof @str89 : !llvm.ptr
      %664 = arith.constant 5 : i64
      %665 = func.call @cc_make_string(%663, %664) : (!llvm.ptr, i64) -> i64
      %666 = llvm.mlir.addressof @str90 : !llvm.ptr
      %667 = arith.constant 11 : i64
      %668 = func.call @cc_make_string(%666, %667) : (!llvm.ptr, i64) -> i64
      %669 = func.call @cc_intern(%665, %668) : (i64, i64) -> i64
      %670 = func.call @cc_nil_value() : () -> i64
      %671 = func.call @cc_cons(%669, %670) : (i64, i64) -> i64
      %672 = func.call @cc_values_pack(%671) : (i64) -> i64
      func.call @stack_push_pointer(%669) : (i64) -> ()
      %673 = llvm.mlir.addressof @str91 : !llvm.ptr
      %674 = arith.constant 6 : i64
      %675 = func.call @cc_make_string(%673, %674) : (!llvm.ptr, i64) -> i64
      %676 = llvm.mlir.addressof @str92 : !llvm.ptr
      %677 = arith.constant 11 : i64
      %678 = func.call @cc_make_string(%676, %677) : (!llvm.ptr, i64) -> i64
      %679 = func.call @cc_intern(%675, %678) : (i64, i64) -> i64
      %680 = func.call @cc_nil_value() : () -> i64
      %681 = func.call @cc_cons(%679, %680) : (i64, i64) -> i64
      %682 = func.call @cc_values_pack(%681) : (i64) -> i64
      func.call @stack_push_pointer(%679) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %683 = func.call @stack_pop_pointer() : () -> i64
      %684 = func.call @stack_pop_pointer() : () -> i64
      %685 = func.call @cc_cons(%684, %683) : (i64, i64) -> i64
      func.call @stack_push_pointer(%685) : (i64) -> ()
      %686 = func.call @stack_pop_pointer() : () -> i64
      %687 = func.call @stack_pop_pointer() : () -> i64
      %688 = func.call @cc_cons(%687, %686) : (i64, i64) -> i64
      func.call @stack_push_pointer(%688) : (i64) -> ()
      %689 = llvm.mlir.addressof @str93 : !llvm.ptr
      %690 = arith.constant 11 : i64
      %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
      %692 = llvm.mlir.addressof @str94 : !llvm.ptr
      %693 = arith.constant 11 : i64
      %694 = func.call @cc_make_string(%692, %693) : (!llvm.ptr, i64) -> i64
      %695 = func.call @cc_intern(%691, %694) : (i64, i64) -> i64
      %696 = func.call @cc_nil_value() : () -> i64
      %697 = func.call @cc_cons(%695, %696) : (i64, i64) -> i64
      %698 = func.call @cc_values_pack(%697) : (i64) -> i64
      func.call @stack_push_pointer(%695) : (i64) -> ()
      %699 = llvm.mlir.addressof @str95 : !llvm.ptr
      %700 = arith.constant 4 : i64
      %701 = func.call @cc_make_string(%699, %700) : (!llvm.ptr, i64) -> i64
      %702 = func.call @cc_nil_value() : () -> i64
      %703 = func.call @cc_intern(%701, %702) : (i64, i64) -> i64
      %704 = func.call @cc_nil_value() : () -> i64
      %705 = func.call @cc_cons(%703, %704) : (i64, i64) -> i64
      %706 = func.call @cc_values_pack(%705) : (i64) -> i64
      func.call @stack_push_pointer(%703) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %707 = func.call @stack_pop_pointer() : () -> i64
      %708 = func.call @stack_pop_pointer() : () -> i64
      %709 = func.call @cc_cons(%708, %707) : (i64, i64) -> i64
      func.call @stack_push_pointer(%709) : (i64) -> ()
      %710 = func.call @stack_pop_pointer() : () -> i64
      %711 = func.call @stack_pop_pointer() : () -> i64
      %712 = func.call @cc_cons(%711, %710) : (i64, i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      %713 = llvm.mlir.addressof @str96 : !llvm.ptr
      %714 = arith.constant 6 : i64
      %715 = func.call @cc_make_string(%713, %714) : (!llvm.ptr, i64) -> i64
      %716 = func.call @cc_nil_value() : () -> i64
      %717 = func.call @cc_intern(%715, %716) : (i64, i64) -> i64
      %718 = func.call @cc_nil_value() : () -> i64
      %719 = func.call @cc_cons(%717, %718) : (i64, i64) -> i64
      %720 = func.call @cc_values_pack(%719) : (i64) -> i64
      func.call @stack_push_pointer(%717) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %743 = func.call @stack_pop_pointer() : () -> i64
      %744 = func.call @cc_cons(%743, %742) : (i64, i64) -> i64
      func.call @stack_push_pointer(%744) : (i64) -> ()
      %745 = func.call @stack_pop_pointer() : () -> i64
      %746 = func.call @stack_pop_pointer() : () -> i64
      %747 = func.call @cc_cons(%746, %745) : (i64, i64) -> i64
      func.call @stack_push_pointer(%747) : (i64) -> ()
      %748 = func.call @stack_pop_pointer() : () -> i64
      %749 = func.call @stack_pop_pointer() : () -> i64
      %750 = func.call @cc_cons(%749, %748) : (i64, i64) -> i64
      func.call @stack_push_pointer(%750) : (i64) -> ()
      %751 = func.call @stack_pop_pointer() : () -> i64
      %752 = func.call @stack_pop_pointer() : () -> i64
      %753 = func.call @cc_cons(%752, %751) : (i64, i64) -> i64
      func.call @stack_push_pointer(%753) : (i64) -> ()
      %754 = func.call @stack_pop_pointer() : () -> i64
      %755 = func.call @stack_pop_pointer() : () -> i64
      %756 = func.call @cc_cons(%755, %754) : (i64, i64) -> i64
      func.call @stack_push_pointer(%756) : (i64) -> ()
      %757 = func.call @stack_pop_pointer() : () -> i64
      %1254 = arith.constant 280030257086464 : i64
      %1255 = arith.constant 0 : i64
      %1256 = func.call @cc_make_closure(%1254, %1255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1256) : (i64) -> ()
      %1257 = func.call @stack_pop_pointer() : () -> i64
      %1258 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1259 = arith.constant 3 : i64
      %1260 = func.call @cc_make_string(%1258, %1259) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1260) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1261 = func.call @stack_pop_pointer() : () -> i64
      %1262 = func.call @stack_pop_pointer() : () -> i64
      %1263 = func.call @cc_cons(%1262, %1261) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1263) : (i64) -> ()
      %1264 = func.call @stack_pop_pointer() : () -> i64
      %1265 = func.call @cc_nil_value() : () -> i64
      %1266 = func.call @cc_errorp(%48) : (i64) -> i64
      %1267 = arith.cmpi ne, %1266, %1265 : i64
      %1268 = arith.cmpi eq, %1265, %1265 : i64
      %1269 = arith.andi %1267, %1268 : i1
      %1270 = scf.if %1269 -> (i64) {
        scf.yield %48 : i64
      } else {
        scf.yield %1265 : i64
      }
      %1271 = func.call @cc_errorp(%757) : (i64) -> i64
      %1272 = arith.cmpi ne, %1271, %1265 : i64
      %1273 = arith.cmpi eq, %1270, %1265 : i64
      %1274 = arith.andi %1272, %1273 : i1
      %1275 = scf.if %1274 -> (i64) {
        scf.yield %757 : i64
      } else {
        scf.yield %1270 : i64
      }
      %1276 = func.call @cc_errorp(%1257) : (i64) -> i64
      %1277 = arith.cmpi ne, %1276, %1265 : i64
      %1278 = arith.cmpi eq, %1275, %1265 : i64
      %1279 = arith.andi %1277, %1278 : i1
      %1280 = scf.if %1279 -> (i64) {
        scf.yield %1257 : i64
      } else {
        scf.yield %1275 : i64
      }
      %1281 = func.call @cc_errorp(%1264) : (i64) -> i64
      %1282 = arith.cmpi ne, %1281, %1265 : i64
      %1283 = arith.cmpi eq, %1280, %1265 : i64
      %1284 = arith.andi %1282, %1283 : i1
      %1285 = scf.if %1284 -> (i64) {
        scf.yield %1264 : i64
      } else {
        scf.yield %1280 : i64
      }
      %1286 = arith.cmpi ne, %1285, %1265 : i64
      scf.if %1286 {
        func.call @stack_push_pointer(%1285) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%48) : (i64) -> ()
        func.call @stack_push_pointer(%757) : (i64) -> ()
        func.call @stack_push_pointer(%1257) : (i64) -> ()
        func.call @stack_push_pointer(%1264) : (i64) -> ()
        %1287 = llvm.mlir.addressof @str144 : !llvm.ptr
        %1288 = func.call @cc_make_function_ref_const(%1287) : (!llvm.ptr) -> i64
        %1289 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%1288, %1289) : (i64, i64) -> ()
      }
      %1290 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1290 : i64
    }
    %1291 = func.call @cc_nil_value() : () -> i64
    %1292 = func.call @cc_errorp(%39) : (i64) -> i64
    %1293 = arith.cmpi ne, %1292, %1291 : i64
    %1294 = scf.if %1293 -> (i64) {
      scf.yield %39 : i64
    } else {
      %1295 = func.call @cc_nil_value() : () -> i64
      %1296 = arith.cmpi ne, %1295, %1295 : i64
      scf.if %1296 {
        func.call @stack_push_pointer(%1295) : (i64) -> ()
      } else {
        %1297 = llvm.mlir.addressof @str145 : !llvm.ptr
        %1298 = func.call @cc_make_function_ref_const(%1297) : (!llvm.ptr) -> i64
        %1299 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1298, %1299) : (i64, i64) -> ()
      }
      %1300 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1300 : i64
    }
    func.call @stack_push_pointer(%1294) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_280030257086464"() {
    %758 = func.call @cc_nil_value() : () -> i64
    %759 = func.call @cc_nil_value() : () -> i64
    %760 = func.call @cc_errorp(%758) : (i64) -> i64
    %761 = arith.cmpi ne, %760, %759 : i64
    %762 = scf.if %761 -> (i64) {
      scf.yield %758 : i64
    } else {
      %763 = llvm.mlir.addressof @str97 : !llvm.ptr
      %764 = arith.constant 11 : i64
      %765 = func.call @cc_make_string(%763, %764) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%765) : (i64) -> ()
      %766 = func.call @stack_pop_pointer() : () -> i64
      %767 = func.call @cc_nil_value() : () -> i64
      %768 = func.call @cc_errorp(%766) : (i64) -> i64
      %769 = arith.cmpi ne, %768, %767 : i64
      %770 = arith.cmpi eq, %767, %767 : i64
      %771 = arith.andi %769, %770 : i1
      %772 = scf.if %771 -> (i64) {
        scf.yield %766 : i64
      } else {
        scf.yield %767 : i64
      }
      %773 = arith.cmpi ne, %772, %767 : i64
      scf.if %773 {
        func.call @stack_push_pointer(%772) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%766) : (i64) -> ()
        %774 = llvm.mlir.addressof @str98 : !llvm.ptr
        %775 = func.call @cc_make_function_ref_const(%774) : (!llvm.ptr) -> i64
        %776 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%775, %776) : (i64, i64) -> ()
      }
      %777 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%777) : (i64) -> ()
      %778 = func.call @stack_pop_pointer() : () -> i64
      %779 = llvm.mlir.addressof @str99 : !llvm.ptr
      %780 = arith.constant 17 : i64
      %781 = func.call @cc_make_string(%779, %780) : (!llvm.ptr, i64) -> i64
      %782 = llvm.mlir.addressof @str100 : !llvm.ptr
      %783 = arith.constant 7 : i64
      %784 = func.call @cc_make_string(%782, %783) : (!llvm.ptr, i64) -> i64
      %785 = func.call @cc_intern(%781, %784) : (i64, i64) -> i64
      %786 = func.call @cc_nil_value() : () -> i64
      %787 = func.call @cc_cons(%785, %786) : (i64, i64) -> i64
      %788 = func.call @cc_values_pack(%787) : (i64) -> i64
      func.call @stack_push_pointer(%785) : (i64) -> ()
      %789 = func.call @stack_pop_pointer() : () -> i64
      %790 = llvm.mlir.addressof @str101 : !llvm.ptr
      %791 = arith.constant 6 : i64
      %792 = func.call @cc_make_string(%790, %791) : (!llvm.ptr, i64) -> i64
      %793 = llvm.mlir.addressof @str102 : !llvm.ptr
      %794 = arith.constant 7 : i64
      %795 = func.call @cc_make_string(%793, %794) : (!llvm.ptr, i64) -> i64
      %796 = func.call @cc_intern(%792, %795) : (i64, i64) -> i64
      %797 = func.call @cc_nil_value() : () -> i64
      %798 = func.call @cc_cons(%796, %797) : (i64, i64) -> i64
      %799 = func.call @cc_values_pack(%798) : (i64) -> i64
      func.call @stack_push_pointer(%796) : (i64) -> ()
      %800 = func.call @stack_pop_pointer() : () -> i64
      %801 = llvm.mlir.addressof @str103 : !llvm.ptr
      %802 = arith.constant 9 : i64
      %803 = func.call @cc_make_string(%801, %802) : (!llvm.ptr, i64) -> i64
      %804 = llvm.mlir.addressof @str104 : !llvm.ptr
      %805 = arith.constant 7 : i64
      %806 = func.call @cc_make_string(%804, %805) : (!llvm.ptr, i64) -> i64
      %807 = func.call @cc_intern(%803, %806) : (i64, i64) -> i64
      %808 = func.call @cc_nil_value() : () -> i64
      %809 = func.call @cc_cons(%807, %808) : (i64, i64) -> i64
      %810 = func.call @cc_values_pack(%809) : (i64) -> i64
      func.call @stack_push_pointer(%807) : (i64) -> ()
      %811 = func.call @stack_pop_pointer() : () -> i64
      %812 = llvm.mlir.addressof @str105 : !llvm.ptr
      %813 = arith.constant 6 : i64
      %814 = func.call @cc_make_string(%812, %813) : (!llvm.ptr, i64) -> i64
      %815 = llvm.mlir.addressof @str106 : !llvm.ptr
      %816 = arith.constant 7 : i64
      %817 = func.call @cc_make_string(%815, %816) : (!llvm.ptr, i64) -> i64
      %818 = func.call @cc_intern(%814, %817) : (i64, i64) -> i64
      %819 = func.call @cc_nil_value() : () -> i64
      %820 = func.call @cc_cons(%818, %819) : (i64, i64) -> i64
      %821 = func.call @cc_values_pack(%820) : (i64) -> i64
      func.call @stack_push_pointer(%818) : (i64) -> ()
      %822 = func.call @stack_pop_pointer() : () -> i64
      %823 = func.call @cc_nil_value() : () -> i64
      %824 = func.call @cc_errorp(%778) : (i64) -> i64
      %825 = arith.cmpi ne, %824, %823 : i64
      %826 = arith.cmpi eq, %823, %823 : i64
      %827 = arith.andi %825, %826 : i1
      %828 = scf.if %827 -> (i64) {
        scf.yield %778 : i64
      } else {
        scf.yield %823 : i64
      }
      %829 = func.call @cc_errorp(%789) : (i64) -> i64
      %830 = arith.cmpi ne, %829, %823 : i64
      %831 = arith.cmpi eq, %828, %823 : i64
      %832 = arith.andi %830, %831 : i1
      %833 = scf.if %832 -> (i64) {
        scf.yield %789 : i64
      } else {
        scf.yield %828 : i64
      }
      %834 = func.call @cc_errorp(%800) : (i64) -> i64
      %835 = arith.cmpi ne, %834, %823 : i64
      %836 = arith.cmpi eq, %833, %823 : i64
      %837 = arith.andi %835, %836 : i1
      %838 = scf.if %837 -> (i64) {
        scf.yield %800 : i64
      } else {
        scf.yield %833 : i64
      }
      %839 = func.call @cc_errorp(%811) : (i64) -> i64
      %840 = arith.cmpi ne, %839, %823 : i64
      %841 = arith.cmpi eq, %838, %823 : i64
      %842 = arith.andi %840, %841 : i1
      %843 = scf.if %842 -> (i64) {
        scf.yield %811 : i64
      } else {
        scf.yield %838 : i64
      }
      %844 = func.call @cc_errorp(%822) : (i64) -> i64
      %845 = arith.cmpi ne, %844, %823 : i64
      %846 = arith.cmpi eq, %843, %823 : i64
      %847 = arith.andi %845, %846 : i1
      %848 = scf.if %847 -> (i64) {
        scf.yield %822 : i64
      } else {
        scf.yield %843 : i64
      }
      %849 = arith.cmpi ne, %848, %823 : i64
      scf.if %849 {
        func.call @stack_push_pointer(%848) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%778) : (i64) -> ()
        func.call @stack_push_pointer(%789) : (i64) -> ()
        func.call @stack_push_pointer(%800) : (i64) -> ()
        func.call @stack_push_pointer(%811) : (i64) -> ()
        func.call @stack_push_pointer(%822) : (i64) -> ()
        %850 = llvm.mlir.addressof @str107 : !llvm.ptr
        %851 = func.call @cc_make_function_ref_const(%850) : (!llvm.ptr) -> i64
        %852 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%851, %852) : (i64, i64) -> ()
      }
      %853 = func.call @stack_pop_pointer() : () -> i64
      %854 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%854) : (i64) -> ()
      %855 = func.call @stack_pop_pointer() : () -> i64
      %856 = llvm.mlir.addressof @str108 : !llvm.ptr
      %857 = arith.constant 12 : i64
      %858 = func.call @cc_make_string(%856, %857) : (!llvm.ptr, i64) -> i64
      %859 = llvm.mlir.addressof @str109 : !llvm.ptr
      %860 = arith.constant 7 : i64
      %861 = func.call @cc_make_string(%859, %860) : (!llvm.ptr, i64) -> i64
      %862 = func.call @cc_intern(%858, %861) : (i64, i64) -> i64
      %863 = func.call @cc_nil_value() : () -> i64
      %864 = func.call @cc_cons(%862, %863) : (i64, i64) -> i64
      %865 = func.call @cc_values_pack(%864) : (i64) -> i64
      func.call @stack_push_pointer(%862) : (i64) -> ()
      %866 = func.call @stack_pop_pointer() : () -> i64
      %867 = llvm.mlir.addressof @str110 : !llvm.ptr
      %868 = arith.constant 9 : i64
      %869 = func.call @cc_make_string(%867, %868) : (!llvm.ptr, i64) -> i64
      %870 = llvm.mlir.addressof @str111 : !llvm.ptr
      %871 = arith.constant 11 : i64
      %872 = func.call @cc_make_string(%870, %871) : (!llvm.ptr, i64) -> i64
      %873 = func.call @cc_intern(%869, %872) : (i64, i64) -> i64
      %874 = func.call @cc_nil_value() : () -> i64
      %875 = func.call @cc_cons(%873, %874) : (i64, i64) -> i64
      %876 = func.call @cc_values_pack(%875) : (i64) -> i64
      func.call @stack_push_pointer(%873) : (i64) -> ()
      %877 = func.call @stack_pop_pointer() : () -> i64
      %878 = func.call @cc_nil_value() : () -> i64
      %879 = func.call @cc_errorp(%855) : (i64) -> i64
      %880 = arith.cmpi ne, %879, %878 : i64
      %881 = arith.cmpi eq, %878, %878 : i64
      %882 = arith.andi %880, %881 : i1
      %883 = scf.if %882 -> (i64) {
        scf.yield %855 : i64
      } else {
        scf.yield %878 : i64
      }
      %884 = func.call @cc_errorp(%866) : (i64) -> i64
      %885 = arith.cmpi ne, %884, %878 : i64
      %886 = arith.cmpi eq, %883, %878 : i64
      %887 = arith.andi %885, %886 : i1
      %888 = scf.if %887 -> (i64) {
        scf.yield %866 : i64
      } else {
        scf.yield %883 : i64
      }
      %889 = func.call @cc_errorp(%877) : (i64) -> i64
      %890 = arith.cmpi ne, %889, %878 : i64
      %891 = arith.cmpi eq, %888, %878 : i64
      %892 = arith.andi %890, %891 : i1
      %893 = scf.if %892 -> (i64) {
        scf.yield %877 : i64
      } else {
        scf.yield %888 : i64
      }
      %894 = arith.cmpi ne, %893, %878 : i64
      scf.if %894 {
        func.call @stack_push_pointer(%893) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%855) : (i64) -> ()
        func.call @stack_push_pointer(%866) : (i64) -> ()
        func.call @stack_push_pointer(%877) : (i64) -> ()
        %895 = llvm.mlir.addressof @str112 : !llvm.ptr
        %896 = func.call @cc_make_function_ref_const(%895) : (!llvm.ptr) -> i64
        %897 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%896, %897) : (i64, i64) -> ()
      }
      %898 = func.call @stack_pop_pointer() : () -> i64
      %899 = func.call @cc_nil_value() : () -> i64
      %900 = func.call @cc_nil_value() : () -> i64
      %901 = func.call @cc_errorp(%899) : (i64) -> i64
      %902 = arith.cmpi ne, %901, %900 : i64
      %903:2 = scf.if %902 -> (i64, i64) {
        scf.yield %899, %853 : i64, i64
      } else {
        %904 = llvm.mlir.addressof @str113 : !llvm.ptr
        %905 = arith.constant 3 : i64
        %906 = func.call @cc_make_string(%904, %905) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%906) : (i64) -> ()
        %907 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%853) : (i64) -> ()
        %908 = func.call @stack_pop_pointer() : () -> i64
        %909 = func.call @cc_nil_value() : () -> i64
        %910 = func.call @cc_errorp(%907) : (i64) -> i64
        %911 = arith.cmpi ne, %910, %909 : i64
        %912 = arith.cmpi eq, %909, %909 : i64
        %913 = arith.andi %911, %912 : i1
        %914 = scf.if %913 -> (i64) {
          scf.yield %907 : i64
        } else {
          scf.yield %909 : i64
        }
        %915 = func.call @cc_errorp(%908) : (i64) -> i64
        %916 = arith.cmpi ne, %915, %909 : i64
        %917 = arith.cmpi eq, %914, %909 : i64
        %918 = arith.andi %916, %917 : i1
        %919 = scf.if %918 -> (i64) {
          scf.yield %908 : i64
        } else {
          scf.yield %914 : i64
        }
        %920 = arith.cmpi ne, %919, %909 : i64
        scf.if %920 {
          func.call @stack_push_pointer(%919) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%907) : (i64) -> ()
          func.call @stack_push_pointer(%908) : (i64) -> ()
          %921 = llvm.mlir.addressof @str114 : !llvm.ptr
          %922 = func.call @cc_make_function_ref_const(%921) : (!llvm.ptr) -> i64
          %923 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%922, %923) : (i64, i64) -> ()
        }
        %924 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %924, %853 : i64, i64
      }
      %925 = func.call @cc_nil_value() : () -> i64
      %926 = func.call @cc_errorp(%903#0) : (i64) -> i64
      %927 = arith.cmpi ne, %926, %925 : i64
      %928:2 = scf.if %927 -> (i64, i64) {
        scf.yield %903#0, %903#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%903#1) : (i64) -> ()
        %929 = func.call @stack_pop_pointer() : () -> i64
        %930 = func.call @cc_nil_value() : () -> i64
        %931 = func.call @cc_errorp(%929) : (i64) -> i64
        %932 = arith.cmpi ne, %931, %930 : i64
        %933 = arith.cmpi eq, %930, %930 : i64
        %934 = arith.andi %932, %933 : i1
        %935 = scf.if %934 -> (i64) {
          scf.yield %929 : i64
        } else {
          scf.yield %930 : i64
        }
        %936 = arith.cmpi ne, %935, %930 : i64
        scf.if %936 {
          func.call @stack_push_pointer(%935) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%929) : (i64) -> ()
          %937 = llvm.mlir.addressof @str115 : !llvm.ptr
          %938 = func.call @cc_make_function_ref_const(%937) : (!llvm.ptr) -> i64
          %939 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%938, %939) : (i64, i64) -> ()
        }
        %940 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %940, %903#1 : i64, i64
      }
      %941 = func.call @cc_nil_value() : () -> i64
      %942 = func.call @cc_errorp(%928#0) : (i64) -> i64
      %943 = arith.cmpi ne, %942, %941 : i64
      %944:2 = scf.if %943 -> (i64, i64) {
        scf.yield %928#0, %928#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%777) : (i64) -> ()
        %945 = func.call @stack_pop_pointer() : () -> i64
        %946 = llvm.mlir.addressof @str116 : !llvm.ptr
        %947 = arith.constant 17 : i64
        %948 = func.call @cc_make_string(%946, %947) : (!llvm.ptr, i64) -> i64
        %949 = llvm.mlir.addressof @str117 : !llvm.ptr
        %950 = arith.constant 7 : i64
        %951 = func.call @cc_make_string(%949, %950) : (!llvm.ptr, i64) -> i64
        %952 = func.call @cc_intern(%948, %951) : (i64, i64) -> i64
        %953 = func.call @cc_nil_value() : () -> i64
        %954 = func.call @cc_cons(%952, %953) : (i64, i64) -> i64
        %955 = func.call @cc_values_pack(%954) : (i64) -> i64
        func.call @stack_push_pointer(%952) : (i64) -> ()
        %956 = func.call @stack_pop_pointer() : () -> i64
        %957 = llvm.mlir.addressof @str118 : !llvm.ptr
        %958 = arith.constant 6 : i64
        %959 = func.call @cc_make_string(%957, %958) : (!llvm.ptr, i64) -> i64
        %960 = llvm.mlir.addressof @str119 : !llvm.ptr
        %961 = arith.constant 7 : i64
        %962 = func.call @cc_make_string(%960, %961) : (!llvm.ptr, i64) -> i64
        %963 = func.call @cc_intern(%959, %962) : (i64, i64) -> i64
        %964 = func.call @cc_nil_value() : () -> i64
        %965 = func.call @cc_cons(%963, %964) : (i64, i64) -> i64
        %966 = func.call @cc_values_pack(%965) : (i64) -> i64
        func.call @stack_push_pointer(%963) : (i64) -> ()
        %967 = func.call @stack_pop_pointer() : () -> i64
        %968 = llvm.mlir.addressof @str120 : !llvm.ptr
        %969 = arith.constant 9 : i64
        %970 = func.call @cc_make_string(%968, %969) : (!llvm.ptr, i64) -> i64
        %971 = llvm.mlir.addressof @str121 : !llvm.ptr
        %972 = arith.constant 7 : i64
        %973 = func.call @cc_make_string(%971, %972) : (!llvm.ptr, i64) -> i64
        %974 = func.call @cc_intern(%970, %973) : (i64, i64) -> i64
        %975 = func.call @cc_nil_value() : () -> i64
        %976 = func.call @cc_cons(%974, %975) : (i64, i64) -> i64
        %977 = func.call @cc_values_pack(%976) : (i64) -> i64
        func.call @stack_push_pointer(%974) : (i64) -> ()
        %978 = func.call @stack_pop_pointer() : () -> i64
        %979 = llvm.mlir.addressof @str122 : !llvm.ptr
        %980 = arith.constant 9 : i64
        %981 = func.call @cc_make_string(%979, %980) : (!llvm.ptr, i64) -> i64
        %982 = llvm.mlir.addressof @str123 : !llvm.ptr
        %983 = arith.constant 7 : i64
        %984 = func.call @cc_make_string(%982, %983) : (!llvm.ptr, i64) -> i64
        %985 = func.call @cc_intern(%981, %984) : (i64, i64) -> i64
        %986 = func.call @cc_nil_value() : () -> i64
        %987 = func.call @cc_cons(%985, %986) : (i64, i64) -> i64
        %988 = func.call @cc_values_pack(%987) : (i64) -> i64
        func.call @stack_push_pointer(%985) : (i64) -> ()
        %989 = func.call @stack_pop_pointer() : () -> i64
        %990 = llvm.mlir.addressof @str124 : !llvm.ptr
        %991 = arith.constant 9 : i64
        %992 = func.call @cc_make_string(%990, %991) : (!llvm.ptr, i64) -> i64
        %993 = llvm.mlir.addressof @str125 : !llvm.ptr
        %994 = arith.constant 7 : i64
        %995 = func.call @cc_make_string(%993, %994) : (!llvm.ptr, i64) -> i64
        %996 = func.call @cc_intern(%992, %995) : (i64, i64) -> i64
        %997 = func.call @cc_nil_value() : () -> i64
        %998 = func.call @cc_cons(%996, %997) : (i64, i64) -> i64
        %999 = func.call @cc_values_pack(%998) : (i64) -> i64
        func.call @stack_push_pointer(%996) : (i64) -> ()
        %1000 = func.call @stack_pop_pointer() : () -> i64
        %1001 = llvm.mlir.addressof @str126 : !llvm.ptr
        %1002 = arith.constant 6 : i64
        %1003 = func.call @cc_make_string(%1001, %1002) : (!llvm.ptr, i64) -> i64
        %1004 = llvm.mlir.addressof @str127 : !llvm.ptr
        %1005 = arith.constant 7 : i64
        %1006 = func.call @cc_make_string(%1004, %1005) : (!llvm.ptr, i64) -> i64
        %1007 = func.call @cc_intern(%1003, %1006) : (i64, i64) -> i64
        %1008 = func.call @cc_nil_value() : () -> i64
        %1009 = func.call @cc_cons(%1007, %1008) : (i64, i64) -> i64
        %1010 = func.call @cc_values_pack(%1009) : (i64) -> i64
        func.call @stack_push_pointer(%1007) : (i64) -> ()
        %1011 = func.call @stack_pop_pointer() : () -> i64
        %1012 = func.call @cc_nil_value() : () -> i64
        %1013 = func.call @cc_errorp(%945) : (i64) -> i64
        %1014 = arith.cmpi ne, %1013, %1012 : i64
        %1015 = arith.cmpi eq, %1012, %1012 : i64
        %1016 = arith.andi %1014, %1015 : i1
        %1017 = scf.if %1016 -> (i64) {
          scf.yield %945 : i64
        } else {
          scf.yield %1012 : i64
        }
        %1018 = func.call @cc_errorp(%956) : (i64) -> i64
        %1019 = arith.cmpi ne, %1018, %1012 : i64
        %1020 = arith.cmpi eq, %1017, %1012 : i64
        %1021 = arith.andi %1019, %1020 : i1
        %1022 = scf.if %1021 -> (i64) {
          scf.yield %956 : i64
        } else {
          scf.yield %1017 : i64
        }
        %1023 = func.call @cc_errorp(%967) : (i64) -> i64
        %1024 = arith.cmpi ne, %1023, %1012 : i64
        %1025 = arith.cmpi eq, %1022, %1012 : i64
        %1026 = arith.andi %1024, %1025 : i1
        %1027 = scf.if %1026 -> (i64) {
          scf.yield %967 : i64
        } else {
          scf.yield %1022 : i64
        }
        %1028 = func.call @cc_errorp(%978) : (i64) -> i64
        %1029 = arith.cmpi ne, %1028, %1012 : i64
        %1030 = arith.cmpi eq, %1027, %1012 : i64
        %1031 = arith.andi %1029, %1030 : i1
        %1032 = scf.if %1031 -> (i64) {
          scf.yield %978 : i64
        } else {
          scf.yield %1027 : i64
        }
        %1033 = func.call @cc_errorp(%989) : (i64) -> i64
        %1034 = arith.cmpi ne, %1033, %1012 : i64
        %1035 = arith.cmpi eq, %1032, %1012 : i64
        %1036 = arith.andi %1034, %1035 : i1
        %1037 = scf.if %1036 -> (i64) {
          scf.yield %989 : i64
        } else {
          scf.yield %1032 : i64
        }
        %1038 = func.call @cc_errorp(%1000) : (i64) -> i64
        %1039 = arith.cmpi ne, %1038, %1012 : i64
        %1040 = arith.cmpi eq, %1037, %1012 : i64
        %1041 = arith.andi %1039, %1040 : i1
        %1042 = scf.if %1041 -> (i64) {
          scf.yield %1000 : i64
        } else {
          scf.yield %1037 : i64
        }
        %1043 = func.call @cc_errorp(%1011) : (i64) -> i64
        %1044 = arith.cmpi ne, %1043, %1012 : i64
        %1045 = arith.cmpi eq, %1042, %1012 : i64
        %1046 = arith.andi %1044, %1045 : i1
        %1047 = scf.if %1046 -> (i64) {
          scf.yield %1011 : i64
        } else {
          scf.yield %1042 : i64
        }
        %1048 = arith.cmpi ne, %1047, %1012 : i64
        scf.if %1048 {
          func.call @stack_push_pointer(%1047) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%945) : (i64) -> ()
          func.call @stack_push_pointer(%956) : (i64) -> ()
          func.call @stack_push_pointer(%967) : (i64) -> ()
          func.call @stack_push_pointer(%978) : (i64) -> ()
          func.call @stack_push_pointer(%989) : (i64) -> ()
          func.call @stack_push_pointer(%1000) : (i64) -> ()
          func.call @stack_push_pointer(%1011) : (i64) -> ()
          %1049 = llvm.mlir.addressof @str128 : !llvm.ptr
          %1050 = func.call @cc_make_function_ref_const(%1049) : (!llvm.ptr) -> i64
          %1051 = arith.constant 7 : i64
          func.call @cc_funcall_stack(%1050, %1051) : (i64, i64) -> ()
        }
        %1052 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1052) : (i64) -> ()
        %1053 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1053, %1052 : i64, i64
      }
      %1054 = func.call @cc_nil_value() : () -> i64
      %1055 = func.call @cc_errorp(%944#0) : (i64) -> i64
      %1056 = arith.cmpi ne, %1055, %1054 : i64
      %1057:2 = scf.if %1056 -> (i64, i64) {
        scf.yield %944#0, %944#1 : i64, i64
      } else {
        %1058 = llvm.mlir.addressof @str129 : !llvm.ptr
        %1059 = arith.constant 3 : i64
        %1060 = func.call @cc_make_string(%1058, %1059) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1060) : (i64) -> ()
        %1061 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%944#1) : (i64) -> ()
        %1062 = func.call @stack_pop_pointer() : () -> i64
        %1063 = func.call @cc_nil_value() : () -> i64
        %1064 = func.call @cc_errorp(%1061) : (i64) -> i64
        %1065 = arith.cmpi ne, %1064, %1063 : i64
        %1066 = arith.cmpi eq, %1063, %1063 : i64
        %1067 = arith.andi %1065, %1066 : i1
        %1068 = scf.if %1067 -> (i64) {
          scf.yield %1061 : i64
        } else {
          scf.yield %1063 : i64
        }
        %1069 = func.call @cc_errorp(%1062) : (i64) -> i64
        %1070 = arith.cmpi ne, %1069, %1063 : i64
        %1071 = arith.cmpi eq, %1068, %1063 : i64
        %1072 = arith.andi %1070, %1071 : i1
        %1073 = scf.if %1072 -> (i64) {
          scf.yield %1062 : i64
        } else {
          scf.yield %1068 : i64
        }
        %1074 = arith.cmpi ne, %1073, %1063 : i64
        scf.if %1074 {
          func.call @stack_push_pointer(%1073) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1061) : (i64) -> ()
          func.call @stack_push_pointer(%1062) : (i64) -> ()
          %1075 = llvm.mlir.addressof @str130 : !llvm.ptr
          %1076 = func.call @cc_make_function_ref_const(%1075) : (!llvm.ptr) -> i64
          %1077 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1076, %1077) : (i64, i64) -> ()
        }
        %1078 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1078, %944#1 : i64, i64
      }
      %1079 = func.call @cc_nil_value() : () -> i64
      %1080 = func.call @cc_errorp(%1057#0) : (i64) -> i64
      %1081 = arith.cmpi ne, %1080, %1079 : i64
      %1082:2 = scf.if %1081 -> (i64, i64) {
        scf.yield %1057#0, %1057#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%1057#1) : (i64) -> ()
        %1083 = func.call @stack_pop_pointer() : () -> i64
        %1084 = func.call @cc_nil_value() : () -> i64
        %1085 = func.call @cc_errorp(%1083) : (i64) -> i64
        %1086 = arith.cmpi ne, %1085, %1084 : i64
        %1087 = arith.cmpi eq, %1084, %1084 : i64
        %1088 = arith.andi %1086, %1087 : i1
        %1089 = scf.if %1088 -> (i64) {
          scf.yield %1083 : i64
        } else {
          scf.yield %1084 : i64
        }
        %1090 = arith.cmpi ne, %1089, %1084 : i64
        scf.if %1090 {
          func.call @stack_push_pointer(%1089) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1083) : (i64) -> ()
          %1091 = llvm.mlir.addressof @str131 : !llvm.ptr
          %1092 = func.call @cc_make_function_ref_const(%1091) : (!llvm.ptr) -> i64
          %1093 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1092, %1093) : (i64, i64) -> ()
        }
        %1094 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1094, %1057#1 : i64, i64
      }
      %1095 = func.call @cc_nil_value() : () -> i64
      %1096 = func.call @cc_errorp(%1082#0) : (i64) -> i64
      %1097 = arith.cmpi ne, %1096, %1095 : i64
      %1098:2 = scf.if %1097 -> (i64, i64) {
        scf.yield %1082#0, %1082#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%777) : (i64) -> ()
        %1099 = func.call @stack_pop_pointer() : () -> i64
        %1100 = llvm.mlir.addressof @str132 : !llvm.ptr
        %1101 = arith.constant 9 : i64
        %1102 = func.call @cc_make_string(%1100, %1101) : (!llvm.ptr, i64) -> i64
        %1103 = llvm.mlir.addressof @str133 : !llvm.ptr
        %1104 = arith.constant 7 : i64
        %1105 = func.call @cc_make_string(%1103, %1104) : (!llvm.ptr, i64) -> i64
        %1106 = func.call @cc_intern(%1102, %1105) : (i64, i64) -> i64
        %1107 = func.call @cc_nil_value() : () -> i64
        %1108 = func.call @cc_cons(%1106, %1107) : (i64, i64) -> i64
        %1109 = func.call @cc_values_pack(%1108) : (i64) -> i64
        func.call @stack_push_pointer(%1106) : (i64) -> ()
        %1110 = func.call @stack_pop_pointer() : () -> i64
        %1111 = llvm.mlir.addressof @str134 : !llvm.ptr
        %1112 = arith.constant 5 : i64
        %1113 = func.call @cc_make_string(%1111, %1112) : (!llvm.ptr, i64) -> i64
        %1114 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1115 = arith.constant 7 : i64
        %1116 = func.call @cc_make_string(%1114, %1115) : (!llvm.ptr, i64) -> i64
        %1117 = func.call @cc_intern(%1113, %1116) : (i64, i64) -> i64
        %1118 = func.call @cc_nil_value() : () -> i64
        %1119 = func.call @cc_cons(%1117, %1118) : (i64, i64) -> i64
        %1120 = func.call @cc_values_pack(%1119) : (i64) -> i64
        func.call @stack_push_pointer(%1117) : (i64) -> ()
        %1121 = func.call @stack_pop_pointer() : () -> i64
        %1122 = func.call @cc_nil_value() : () -> i64
        %1123 = func.call @cc_errorp(%1099) : (i64) -> i64
        %1124 = arith.cmpi ne, %1123, %1122 : i64
        %1125 = arith.cmpi eq, %1122, %1122 : i64
        %1126 = arith.andi %1124, %1125 : i1
        %1127 = scf.if %1126 -> (i64) {
          scf.yield %1099 : i64
        } else {
          scf.yield %1122 : i64
        }
        %1128 = func.call @cc_errorp(%1110) : (i64) -> i64
        %1129 = arith.cmpi ne, %1128, %1122 : i64
        %1130 = arith.cmpi eq, %1127, %1122 : i64
        %1131 = arith.andi %1129, %1130 : i1
        %1132 = scf.if %1131 -> (i64) {
          scf.yield %1110 : i64
        } else {
          scf.yield %1127 : i64
        }
        %1133 = func.call @cc_errorp(%1121) : (i64) -> i64
        %1134 = arith.cmpi ne, %1133, %1122 : i64
        %1135 = arith.cmpi eq, %1132, %1122 : i64
        %1136 = arith.andi %1134, %1135 : i1
        %1137 = scf.if %1136 -> (i64) {
          scf.yield %1121 : i64
        } else {
          scf.yield %1132 : i64
        }
        %1138 = arith.cmpi ne, %1137, %1122 : i64
        scf.if %1138 {
          func.call @stack_push_pointer(%1137) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1099) : (i64) -> ()
          func.call @stack_push_pointer(%1110) : (i64) -> ()
          func.call @stack_push_pointer(%1121) : (i64) -> ()
          %1139 = llvm.mlir.addressof @str136 : !llvm.ptr
          %1140 = func.call @cc_make_function_ref_const(%1139) : (!llvm.ptr) -> i64
          %1141 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1140, %1141) : (i64, i64) -> ()
        }
        %1142 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1142) : (i64) -> ()
        %1143 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1143, %1142 : i64, i64
      }
      %1144 = func.call @cc_nil_value() : () -> i64
      %1145 = func.call @cc_errorp(%1098#0) : (i64) -> i64
      %1146 = arith.cmpi ne, %1145, %1144 : i64
      %1147:2 = scf.if %1146 -> (i64, i64) {
        scf.yield %1098#0, %1098#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%898) : (i64) -> ()
        %1148 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1098#1) : (i64) -> ()
        %1149 = func.call @stack_pop_pointer() : () -> i64
        %1150 = llvm.mlir.addressof @str137 : !llvm.ptr
        %1151 = arith.constant 5 : i64
        %1152 = func.call @cc_make_string(%1150, %1151) : (!llvm.ptr, i64) -> i64
        %1153 = llvm.mlir.addressof @str138 : !llvm.ptr
        %1154 = arith.constant 7 : i64
        %1155 = func.call @cc_make_string(%1153, %1154) : (!llvm.ptr, i64) -> i64
        %1156 = func.call @cc_intern(%1152, %1155) : (i64, i64) -> i64
        %1157 = func.call @cc_nil_value() : () -> i64
        %1158 = func.call @cc_cons(%1156, %1157) : (i64, i64) -> i64
        %1159 = func.call @cc_values_pack(%1158) : (i64) -> i64
        func.call @stack_push_pointer(%1156) : (i64) -> ()
        %1160 = func.call @stack_pop_pointer() : () -> i64
        %1161 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%1161) : (i64) -> ()
        %1162 = func.call @stack_pop_pointer() : () -> i64
        %1163 = llvm.mlir.addressof @str139 : !llvm.ptr
        %1164 = arith.constant 3 : i64
        %1165 = func.call @cc_make_string(%1163, %1164) : (!llvm.ptr, i64) -> i64
        %1166 = llvm.mlir.addressof @str140 : !llvm.ptr
        %1167 = arith.constant 7 : i64
        %1168 = func.call @cc_make_string(%1166, %1167) : (!llvm.ptr, i64) -> i64
        %1169 = func.call @cc_intern(%1165, %1168) : (i64, i64) -> i64
        %1170 = func.call @cc_nil_value() : () -> i64
        %1171 = func.call @cc_cons(%1169, %1170) : (i64, i64) -> i64
        %1172 = func.call @cc_values_pack(%1171) : (i64) -> i64
        func.call @stack_push_pointer(%1169) : (i64) -> ()
        %1173 = func.call @stack_pop_pointer() : () -> i64
        %1174 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%1174) : (i64) -> ()
        %1175 = func.call @stack_pop_pointer() : () -> i64
        %1176 = func.call @cc_nil_value() : () -> i64
        %1177 = func.call @cc_errorp(%1148) : (i64) -> i64
        %1178 = arith.cmpi ne, %1177, %1176 : i64
        %1179 = arith.cmpi eq, %1176, %1176 : i64
        %1180 = arith.andi %1178, %1179 : i1
        %1181 = scf.if %1180 -> (i64) {
          scf.yield %1148 : i64
        } else {
          scf.yield %1176 : i64
        }
        %1182 = func.call @cc_errorp(%1149) : (i64) -> i64
        %1183 = arith.cmpi ne, %1182, %1176 : i64
        %1184 = arith.cmpi eq, %1181, %1176 : i64
        %1185 = arith.andi %1183, %1184 : i1
        %1186 = scf.if %1185 -> (i64) {
          scf.yield %1149 : i64
        } else {
          scf.yield %1181 : i64
        }
        %1187 = func.call @cc_errorp(%1160) : (i64) -> i64
        %1188 = arith.cmpi ne, %1187, %1176 : i64
        %1189 = arith.cmpi eq, %1186, %1176 : i64
        %1190 = arith.andi %1188, %1189 : i1
        %1191 = scf.if %1190 -> (i64) {
          scf.yield %1160 : i64
        } else {
          scf.yield %1186 : i64
        }
        %1192 = func.call @cc_errorp(%1162) : (i64) -> i64
        %1193 = arith.cmpi ne, %1192, %1176 : i64
        %1194 = arith.cmpi eq, %1191, %1176 : i64
        %1195 = arith.andi %1193, %1194 : i1
        %1196 = scf.if %1195 -> (i64) {
          scf.yield %1162 : i64
        } else {
          scf.yield %1191 : i64
        }
        %1197 = func.call @cc_errorp(%1173) : (i64) -> i64
        %1198 = arith.cmpi ne, %1197, %1176 : i64
        %1199 = arith.cmpi eq, %1196, %1176 : i64
        %1200 = arith.andi %1198, %1199 : i1
        %1201 = scf.if %1200 -> (i64) {
          scf.yield %1173 : i64
        } else {
          scf.yield %1196 : i64
        }
        %1202 = func.call @cc_errorp(%1175) : (i64) -> i64
        %1203 = arith.cmpi ne, %1202, %1176 : i64
        %1204 = arith.cmpi eq, %1201, %1176 : i64
        %1205 = arith.andi %1203, %1204 : i1
        %1206 = scf.if %1205 -> (i64) {
          scf.yield %1175 : i64
        } else {
          scf.yield %1201 : i64
        }
        %1207 = arith.cmpi ne, %1206, %1176 : i64
        scf.if %1207 {
          func.call @stack_push_pointer(%1206) : (i64) -> ()
        } else {
          %1208 = func.call @cc_nil_value() : () -> i64
          %1209 = func.call @cc_cons(%1175, %1208) : (i64, i64) -> i64
          %1210 = func.call @cc_cons(%1173, %1209) : (i64, i64) -> i64
          %1211 = func.call @cc_cons(%1162, %1210) : (i64, i64) -> i64
          %1212 = func.call @cc_cons(%1160, %1211) : (i64, i64) -> i64
          %1213 = func.call @cc_cons(%1149, %1212) : (i64, i64) -> i64
          %1214 = func.call @cc_cons(%1148, %1213) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1214) : (i64) -> ()
          func.call @cc_read_sequence_stack() : () -> ()
        }
        %1215 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1215, %1098#1 : i64, i64
      }
      %1216 = func.call @cc_nil_value() : () -> i64
      %1217 = func.call @cc_errorp(%1147#0) : (i64) -> i64
      %1218 = arith.cmpi ne, %1217, %1216 : i64
      %1219:2 = scf.if %1218 -> (i64, i64) {
        scf.yield %1147#0, %1147#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%1147#1) : (i64) -> ()
        %1220 = func.call @stack_pop_pointer() : () -> i64
        %1221 = func.call @cc_nil_value() : () -> i64
        %1222 = func.call @cc_errorp(%1220) : (i64) -> i64
        %1223 = arith.cmpi ne, %1222, %1221 : i64
        %1224 = arith.cmpi eq, %1221, %1221 : i64
        %1225 = arith.andi %1223, %1224 : i1
        %1226 = scf.if %1225 -> (i64) {
          scf.yield %1220 : i64
        } else {
          scf.yield %1221 : i64
        }
        %1227 = arith.cmpi ne, %1226, %1221 : i64
        scf.if %1227 {
          func.call @stack_push_pointer(%1226) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1220) : (i64) -> ()
          %1228 = llvm.mlir.addressof @str141 : !llvm.ptr
          %1229 = func.call @cc_make_function_ref_const(%1228) : (!llvm.ptr) -> i64
          %1230 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1229, %1230) : (i64, i64) -> ()
        }
        %1231 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1231, %1147#1 : i64, i64
      }
      %1232 = func.call @cc_nil_value() : () -> i64
      %1233 = func.call @cc_errorp(%1219#0) : (i64) -> i64
      %1234 = arith.cmpi ne, %1233, %1232 : i64
      %1235:2 = scf.if %1234 -> (i64, i64) {
        scf.yield %1219#0, %1219#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%777) : (i64) -> ()
        %1236 = func.call @stack_pop_pointer() : () -> i64
        %1237 = func.call @cc_nil_value() : () -> i64
        %1238 = func.call @cc_errorp(%1236) : (i64) -> i64
        %1239 = arith.cmpi ne, %1238, %1237 : i64
        %1240 = arith.cmpi eq, %1237, %1237 : i64
        %1241 = arith.andi %1239, %1240 : i1
        %1242 = scf.if %1241 -> (i64) {
          scf.yield %1236 : i64
        } else {
          scf.yield %1237 : i64
        }
        %1243 = arith.cmpi ne, %1242, %1237 : i64
        scf.if %1243 {
          func.call @stack_push_pointer(%1242) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1236) : (i64) -> ()
          %1244 = llvm.mlir.addressof @str142 : !llvm.ptr
          %1245 = func.call @cc_make_function_ref_const(%1244) : (!llvm.ptr) -> i64
          %1246 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1245, %1246) : (i64, i64) -> ()
        }
        %1247 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1247, %1219#1 : i64, i64
      }
      %1248 = func.call @cc_nil_value() : () -> i64
      %1249 = func.call @cc_errorp(%1235#0) : (i64) -> i64
      %1250 = arith.cmpi ne, %1249, %1248 : i64
      %1251:2 = scf.if %1250 -> (i64, i64) {
        scf.yield %1235#0, %1235#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%898) : (i64) -> ()
        %1252 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1252, %1235#1 : i64, i64
      }
      func.call @stack_push_pointer(%1251#0) : (i64) -> ()
      %1253 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1253 : i64
    }
    func.call @stack_push_pointer(%762) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("clisp/in_work/regression-tests/framework.lisp\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str2("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str3("CLOSE.ABORT.03.PROBE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str4("LET*\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str5("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str6("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str7("MKSTEMP\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("CORE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str9("close-abort\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str10("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str15("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str16("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str17("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str18("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str19("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str20("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str21("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str23("BUFFER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str24("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str25("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str26("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str27("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("QUOTE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str29("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str30("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str33("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("foo\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str35("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str36("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str38("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str44("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str46("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str48("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str49("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str50("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str51("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str52("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str57("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str58("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str59("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str60("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str61("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str62("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str63("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str66("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str68("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("SETF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str70("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str74("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str75("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str76("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str77("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str78("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str79("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("READ-SEQUENCE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str81("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("BUFFER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str83("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str84("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("START\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str86("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str87("END\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str88("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str89("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str90("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str91("STREAM\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str92("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str94("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str95("NAME\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str96("BUFFER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str97("close-abort\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("core:mkstemp\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str99("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str100("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str101("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str102("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str103("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str104("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str105("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str106("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str107("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str108("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str109("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str110("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str111("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str112("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str113("foo\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str114("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str115("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str116("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str117("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str118("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str119("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str120("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str121("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str122("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str123("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str124("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str125("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str126("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str127("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str128("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str129("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str130("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str131("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str132("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str133("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str134("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str135("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str136("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str137("START\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str138("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str139("END\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str140("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str141("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str142("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str143("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str144("%test\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str145("show-test-summary\00") : !llvm.array<18 x i8>
}
