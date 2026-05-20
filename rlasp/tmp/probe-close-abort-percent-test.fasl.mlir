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
      %50 = arith.constant 16 : i64
      %51 = func.call @cc_make_string(%49, %50) : (!llvm.ptr, i64) -> i64
      %52 = func.call @cc_nil_value() : () -> i64
      %53 = func.call @cc_intern(%51, %52) : (i64, i64) -> i64
      %54 = func.call @cc_nil_value() : () -> i64
      %55 = func.call @cc_cons(%53, %54) : (i64, i64) -> i64
      %56 = func.call @cc_values_pack(%55) : (i64) -> i64
      func.call @stack_push_pointer(%53) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %57 = func.call @stack_pop_pointer() : () -> i64
      %58 = func.call @stack_pop_pointer() : () -> i64
      %59 = func.call @cc_cons(%58, %57) : (i64, i64) -> i64
      func.call @stack_push_pointer(%59) : (i64) -> ()
      %60 = func.call @stack_pop_pointer() : () -> i64
      %557 = arith.constant 190263829987328 : i64
      %558 = arith.constant 0 : i64
      %559 = func.call @cc_make_closure(%557, %558) : (i64, i64) -> i64
      func.call @stack_push_pointer(%559) : (i64) -> ()
      %560 = func.call @stack_pop_pointer() : () -> i64
      %561 = llvm.mlir.addressof @str51 : !llvm.ptr
      %562 = arith.constant 3 : i64
      %563 = func.call @cc_make_string(%561, %562) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%563) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %564 = func.call @stack_pop_pointer() : () -> i64
      %565 = func.call @stack_pop_pointer() : () -> i64
      %566 = func.call @cc_cons(%565, %564) : (i64, i64) -> i64
      func.call @stack_push_pointer(%566) : (i64) -> ()
      %567 = func.call @stack_pop_pointer() : () -> i64
      %568 = func.call @cc_nil_value() : () -> i64
      %569 = func.call @cc_errorp(%48) : (i64) -> i64
      %570 = arith.cmpi ne, %569, %568 : i64
      %571 = arith.cmpi eq, %568, %568 : i64
      %572 = arith.andi %570, %571 : i1
      %573 = scf.if %572 -> (i64) {
        scf.yield %48 : i64
      } else {
        scf.yield %568 : i64
      }
      %574 = func.call @cc_errorp(%60) : (i64) -> i64
      %575 = arith.cmpi ne, %574, %568 : i64
      %576 = arith.cmpi eq, %573, %568 : i64
      %577 = arith.andi %575, %576 : i1
      %578 = scf.if %577 -> (i64) {
        scf.yield %60 : i64
      } else {
        scf.yield %573 : i64
      }
      %579 = func.call @cc_errorp(%560) : (i64) -> i64
      %580 = arith.cmpi ne, %579, %568 : i64
      %581 = arith.cmpi eq, %578, %568 : i64
      %582 = arith.andi %580, %581 : i1
      %583 = scf.if %582 -> (i64) {
        scf.yield %560 : i64
      } else {
        scf.yield %578 : i64
      }
      %584 = func.call @cc_errorp(%567) : (i64) -> i64
      %585 = arith.cmpi ne, %584, %568 : i64
      %586 = arith.cmpi eq, %583, %568 : i64
      %587 = arith.andi %585, %586 : i1
      %588 = scf.if %587 -> (i64) {
        scf.yield %567 : i64
      } else {
        scf.yield %583 : i64
      }
      %589 = arith.cmpi ne, %588, %568 : i64
      scf.if %589 {
        func.call @stack_push_pointer(%588) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%48) : (i64) -> ()
        func.call @stack_push_pointer(%60) : (i64) -> ()
        func.call @stack_push_pointer(%560) : (i64) -> ()
        func.call @stack_push_pointer(%567) : (i64) -> ()
        %590 = llvm.mlir.addressof @str52 : !llvm.ptr
        %591 = func.call @cc_make_function_ref_const(%590) : (!llvm.ptr) -> i64
        %592 = arith.constant 4 : i64
        func.call @cc_funcall_stack(%591, %592) : (i64, i64) -> ()
      }
      %593 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %593 : i64
    }
    %594 = func.call @cc_nil_value() : () -> i64
    %595 = func.call @cc_errorp(%39) : (i64) -> i64
    %596 = arith.cmpi ne, %595, %594 : i64
    %597 = scf.if %596 -> (i64) {
      scf.yield %39 : i64
    } else {
      %598 = func.call @cc_nil_value() : () -> i64
      %599 = arith.cmpi ne, %598, %598 : i64
      scf.if %599 {
        func.call @stack_push_pointer(%598) : (i64) -> ()
      } else {
        %600 = llvm.mlir.addressof @str53 : !llvm.ptr
        %601 = func.call @cc_make_function_ref_const(%600) : (!llvm.ptr) -> i64
        %602 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%601, %602) : (i64, i64) -> ()
      }
      %603 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %603 : i64
    }
    func.call @stack_push_pointer(%597) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_190263829987328"() {
    %61 = func.call @cc_nil_value() : () -> i64
    %62 = func.call @cc_nil_value() : () -> i64
    %63 = func.call @cc_errorp(%61) : (i64) -> i64
    %64 = arith.cmpi ne, %63, %62 : i64
    %65 = scf.if %64 -> (i64) {
      scf.yield %61 : i64
    } else {
      %66 = llvm.mlir.addressof @str5 : !llvm.ptr
      %67 = arith.constant 11 : i64
      %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%68) : (i64) -> ()
      %69 = func.call @stack_pop_pointer() : () -> i64
      %70 = func.call @cc_nil_value() : () -> i64
      %71 = func.call @cc_errorp(%69) : (i64) -> i64
      %72 = arith.cmpi ne, %71, %70 : i64
      %73 = arith.cmpi eq, %70, %70 : i64
      %74 = arith.andi %72, %73 : i1
      %75 = scf.if %74 -> (i64) {
        scf.yield %69 : i64
      } else {
        scf.yield %70 : i64
      }
      %76 = arith.cmpi ne, %75, %70 : i64
      scf.if %76 {
        func.call @stack_push_pointer(%75) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%69) : (i64) -> ()
        %77 = llvm.mlir.addressof @str6 : !llvm.ptr
        %78 = func.call @cc_make_function_ref_const(%77) : (!llvm.ptr) -> i64
        %79 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%78, %79) : (i64, i64) -> ()
      }
      %80 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%80) : (i64) -> ()
      %81 = func.call @stack_pop_pointer() : () -> i64
      %82 = llvm.mlir.addressof @str7 : !llvm.ptr
      %83 = arith.constant 17 : i64
      %84 = func.call @cc_make_string(%82, %83) : (!llvm.ptr, i64) -> i64
      %85 = llvm.mlir.addressof @str8 : !llvm.ptr
      %86 = arith.constant 7 : i64
      %87 = func.call @cc_make_string(%85, %86) : (!llvm.ptr, i64) -> i64
      %88 = func.call @cc_intern(%84, %87) : (i64, i64) -> i64
      %89 = func.call @cc_nil_value() : () -> i64
      %90 = func.call @cc_cons(%88, %89) : (i64, i64) -> i64
      %91 = func.call @cc_values_pack(%90) : (i64) -> i64
      func.call @stack_push_pointer(%88) : (i64) -> ()
      %92 = func.call @stack_pop_pointer() : () -> i64
      %93 = llvm.mlir.addressof @str9 : !llvm.ptr
      %94 = arith.constant 6 : i64
      %95 = func.call @cc_make_string(%93, %94) : (!llvm.ptr, i64) -> i64
      %96 = llvm.mlir.addressof @str10 : !llvm.ptr
      %97 = arith.constant 7 : i64
      %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
      %99 = func.call @cc_intern(%95, %98) : (i64, i64) -> i64
      %100 = func.call @cc_nil_value() : () -> i64
      %101 = func.call @cc_cons(%99, %100) : (i64, i64) -> i64
      %102 = func.call @cc_values_pack(%101) : (i64) -> i64
      func.call @stack_push_pointer(%99) : (i64) -> ()
      %103 = func.call @stack_pop_pointer() : () -> i64
      %104 = llvm.mlir.addressof @str11 : !llvm.ptr
      %105 = arith.constant 9 : i64
      %106 = func.call @cc_make_string(%104, %105) : (!llvm.ptr, i64) -> i64
      %107 = llvm.mlir.addressof @str12 : !llvm.ptr
      %108 = arith.constant 7 : i64
      %109 = func.call @cc_make_string(%107, %108) : (!llvm.ptr, i64) -> i64
      %110 = func.call @cc_intern(%106, %109) : (i64, i64) -> i64
      %111 = func.call @cc_nil_value() : () -> i64
      %112 = func.call @cc_cons(%110, %111) : (i64, i64) -> i64
      %113 = func.call @cc_values_pack(%112) : (i64) -> i64
      func.call @stack_push_pointer(%110) : (i64) -> ()
      %114 = func.call @stack_pop_pointer() : () -> i64
      %115 = llvm.mlir.addressof @str13 : !llvm.ptr
      %116 = arith.constant 6 : i64
      %117 = func.call @cc_make_string(%115, %116) : (!llvm.ptr, i64) -> i64
      %118 = llvm.mlir.addressof @str14 : !llvm.ptr
      %119 = arith.constant 7 : i64
      %120 = func.call @cc_make_string(%118, %119) : (!llvm.ptr, i64) -> i64
      %121 = func.call @cc_intern(%117, %120) : (i64, i64) -> i64
      %122 = func.call @cc_nil_value() : () -> i64
      %123 = func.call @cc_cons(%121, %122) : (i64, i64) -> i64
      %124 = func.call @cc_values_pack(%123) : (i64) -> i64
      func.call @stack_push_pointer(%121) : (i64) -> ()
      %125 = func.call @stack_pop_pointer() : () -> i64
      %126 = func.call @cc_nil_value() : () -> i64
      %127 = func.call @cc_errorp(%81) : (i64) -> i64
      %128 = arith.cmpi ne, %127, %126 : i64
      %129 = arith.cmpi eq, %126, %126 : i64
      %130 = arith.andi %128, %129 : i1
      %131 = scf.if %130 -> (i64) {
        scf.yield %81 : i64
      } else {
        scf.yield %126 : i64
      }
      %132 = func.call @cc_errorp(%92) : (i64) -> i64
      %133 = arith.cmpi ne, %132, %126 : i64
      %134 = arith.cmpi eq, %131, %126 : i64
      %135 = arith.andi %133, %134 : i1
      %136 = scf.if %135 -> (i64) {
        scf.yield %92 : i64
      } else {
        scf.yield %131 : i64
      }
      %137 = func.call @cc_errorp(%103) : (i64) -> i64
      %138 = arith.cmpi ne, %137, %126 : i64
      %139 = arith.cmpi eq, %136, %126 : i64
      %140 = arith.andi %138, %139 : i1
      %141 = scf.if %140 -> (i64) {
        scf.yield %103 : i64
      } else {
        scf.yield %136 : i64
      }
      %142 = func.call @cc_errorp(%114) : (i64) -> i64
      %143 = arith.cmpi ne, %142, %126 : i64
      %144 = arith.cmpi eq, %141, %126 : i64
      %145 = arith.andi %143, %144 : i1
      %146 = scf.if %145 -> (i64) {
        scf.yield %114 : i64
      } else {
        scf.yield %141 : i64
      }
      %147 = func.call @cc_errorp(%125) : (i64) -> i64
      %148 = arith.cmpi ne, %147, %126 : i64
      %149 = arith.cmpi eq, %146, %126 : i64
      %150 = arith.andi %148, %149 : i1
      %151 = scf.if %150 -> (i64) {
        scf.yield %125 : i64
      } else {
        scf.yield %146 : i64
      }
      %152 = arith.cmpi ne, %151, %126 : i64
      scf.if %152 {
        func.call @stack_push_pointer(%151) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%81) : (i64) -> ()
        func.call @stack_push_pointer(%92) : (i64) -> ()
        func.call @stack_push_pointer(%103) : (i64) -> ()
        func.call @stack_push_pointer(%114) : (i64) -> ()
        func.call @stack_push_pointer(%125) : (i64) -> ()
        %153 = llvm.mlir.addressof @str15 : !llvm.ptr
        %154 = func.call @cc_make_function_ref_const(%153) : (!llvm.ptr) -> i64
        %155 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%154, %155) : (i64, i64) -> ()
      }
      %156 = func.call @stack_pop_pointer() : () -> i64
      %157 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%157) : (i64) -> ()
      %158 = func.call @stack_pop_pointer() : () -> i64
      %159 = llvm.mlir.addressof @str16 : !llvm.ptr
      %160 = arith.constant 12 : i64
      %161 = func.call @cc_make_string(%159, %160) : (!llvm.ptr, i64) -> i64
      %162 = llvm.mlir.addressof @str17 : !llvm.ptr
      %163 = arith.constant 7 : i64
      %164 = func.call @cc_make_string(%162, %163) : (!llvm.ptr, i64) -> i64
      %165 = func.call @cc_intern(%161, %164) : (i64, i64) -> i64
      %166 = func.call @cc_nil_value() : () -> i64
      %167 = func.call @cc_cons(%165, %166) : (i64, i64) -> i64
      %168 = func.call @cc_values_pack(%167) : (i64) -> i64
      func.call @stack_push_pointer(%165) : (i64) -> ()
      %169 = func.call @stack_pop_pointer() : () -> i64
      %170 = llvm.mlir.addressof @str18 : !llvm.ptr
      %171 = arith.constant 9 : i64
      %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
      %173 = llvm.mlir.addressof @str19 : !llvm.ptr
      %174 = arith.constant 11 : i64
      %175 = func.call @cc_make_string(%173, %174) : (!llvm.ptr, i64) -> i64
      %176 = func.call @cc_intern(%172, %175) : (i64, i64) -> i64
      %177 = func.call @cc_nil_value() : () -> i64
      %178 = func.call @cc_cons(%176, %177) : (i64, i64) -> i64
      %179 = func.call @cc_values_pack(%178) : (i64) -> i64
      func.call @stack_push_pointer(%176) : (i64) -> ()
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = func.call @cc_nil_value() : () -> i64
      %182 = func.call @cc_errorp(%158) : (i64) -> i64
      %183 = arith.cmpi ne, %182, %181 : i64
      %184 = arith.cmpi eq, %181, %181 : i64
      %185 = arith.andi %183, %184 : i1
      %186 = scf.if %185 -> (i64) {
        scf.yield %158 : i64
      } else {
        scf.yield %181 : i64
      }
      %187 = func.call @cc_errorp(%169) : (i64) -> i64
      %188 = arith.cmpi ne, %187, %181 : i64
      %189 = arith.cmpi eq, %186, %181 : i64
      %190 = arith.andi %188, %189 : i1
      %191 = scf.if %190 -> (i64) {
        scf.yield %169 : i64
      } else {
        scf.yield %186 : i64
      }
      %192 = func.call @cc_errorp(%180) : (i64) -> i64
      %193 = arith.cmpi ne, %192, %181 : i64
      %194 = arith.cmpi eq, %191, %181 : i64
      %195 = arith.andi %193, %194 : i1
      %196 = scf.if %195 -> (i64) {
        scf.yield %180 : i64
      } else {
        scf.yield %191 : i64
      }
      %197 = arith.cmpi ne, %196, %181 : i64
      scf.if %197 {
        func.call @stack_push_pointer(%196) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%158) : (i64) -> ()
        func.call @stack_push_pointer(%169) : (i64) -> ()
        func.call @stack_push_pointer(%180) : (i64) -> ()
        %198 = llvm.mlir.addressof @str20 : !llvm.ptr
        %199 = func.call @cc_make_function_ref_const(%198) : (!llvm.ptr) -> i64
        %200 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%199, %200) : (i64, i64) -> ()
      }
      %201 = func.call @stack_pop_pointer() : () -> i64
      %202 = func.call @cc_nil_value() : () -> i64
      %203 = func.call @cc_nil_value() : () -> i64
      %204 = func.call @cc_errorp(%202) : (i64) -> i64
      %205 = arith.cmpi ne, %204, %203 : i64
      %206:2 = scf.if %205 -> (i64, i64) {
        scf.yield %202, %156 : i64, i64
      } else {
        %207 = llvm.mlir.addressof @str21 : !llvm.ptr
        %208 = arith.constant 3 : i64
        %209 = func.call @cc_make_string(%207, %208) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%209) : (i64) -> ()
        %210 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%156) : (i64) -> ()
        %211 = func.call @stack_pop_pointer() : () -> i64
        %212 = func.call @cc_nil_value() : () -> i64
        %213 = func.call @cc_errorp(%210) : (i64) -> i64
        %214 = arith.cmpi ne, %213, %212 : i64
        %215 = arith.cmpi eq, %212, %212 : i64
        %216 = arith.andi %214, %215 : i1
        %217 = scf.if %216 -> (i64) {
          scf.yield %210 : i64
        } else {
          scf.yield %212 : i64
        }
        %218 = func.call @cc_errorp(%211) : (i64) -> i64
        %219 = arith.cmpi ne, %218, %212 : i64
        %220 = arith.cmpi eq, %217, %212 : i64
        %221 = arith.andi %219, %220 : i1
        %222 = scf.if %221 -> (i64) {
          scf.yield %211 : i64
        } else {
          scf.yield %217 : i64
        }
        %223 = arith.cmpi ne, %222, %212 : i64
        scf.if %223 {
          func.call @stack_push_pointer(%222) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%210) : (i64) -> ()
          func.call @stack_push_pointer(%211) : (i64) -> ()
          %224 = llvm.mlir.addressof @str22 : !llvm.ptr
          %225 = func.call @cc_make_function_ref_const(%224) : (!llvm.ptr) -> i64
          %226 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%225, %226) : (i64, i64) -> ()
        }
        %227 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %227, %156 : i64, i64
      }
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_errorp(%206#0) : (i64) -> i64
      %230 = arith.cmpi ne, %229, %228 : i64
      %231:2 = scf.if %230 -> (i64, i64) {
        scf.yield %206#0, %206#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%206#1) : (i64) -> ()
        %232 = func.call @stack_pop_pointer() : () -> i64
        %233 = func.call @cc_nil_value() : () -> i64
        %234 = func.call @cc_errorp(%232) : (i64) -> i64
        %235 = arith.cmpi ne, %234, %233 : i64
        %236 = arith.cmpi eq, %233, %233 : i64
        %237 = arith.andi %235, %236 : i1
        %238 = scf.if %237 -> (i64) {
          scf.yield %232 : i64
        } else {
          scf.yield %233 : i64
        }
        %239 = arith.cmpi ne, %238, %233 : i64
        scf.if %239 {
          func.call @stack_push_pointer(%238) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%232) : (i64) -> ()
          %240 = llvm.mlir.addressof @str23 : !llvm.ptr
          %241 = func.call @cc_make_function_ref_const(%240) : (!llvm.ptr) -> i64
          %242 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%241, %242) : (i64, i64) -> ()
        }
        %243 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %243, %206#1 : i64, i64
      }
      %244 = func.call @cc_nil_value() : () -> i64
      %245 = func.call @cc_errorp(%231#0) : (i64) -> i64
      %246 = arith.cmpi ne, %245, %244 : i64
      %247:2 = scf.if %246 -> (i64, i64) {
        scf.yield %231#0, %231#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%80) : (i64) -> ()
        %248 = func.call @stack_pop_pointer() : () -> i64
        %249 = llvm.mlir.addressof @str24 : !llvm.ptr
        %250 = arith.constant 17 : i64
        %251 = func.call @cc_make_string(%249, %250) : (!llvm.ptr, i64) -> i64
        %252 = llvm.mlir.addressof @str25 : !llvm.ptr
        %253 = arith.constant 7 : i64
        %254 = func.call @cc_make_string(%252, %253) : (!llvm.ptr, i64) -> i64
        %255 = func.call @cc_intern(%251, %254) : (i64, i64) -> i64
        %256 = func.call @cc_nil_value() : () -> i64
        %257 = func.call @cc_cons(%255, %256) : (i64, i64) -> i64
        %258 = func.call @cc_values_pack(%257) : (i64) -> i64
        func.call @stack_push_pointer(%255) : (i64) -> ()
        %259 = func.call @stack_pop_pointer() : () -> i64
        %260 = llvm.mlir.addressof @str26 : !llvm.ptr
        %261 = arith.constant 6 : i64
        %262 = func.call @cc_make_string(%260, %261) : (!llvm.ptr, i64) -> i64
        %263 = llvm.mlir.addressof @str27 : !llvm.ptr
        %264 = arith.constant 7 : i64
        %265 = func.call @cc_make_string(%263, %264) : (!llvm.ptr, i64) -> i64
        %266 = func.call @cc_intern(%262, %265) : (i64, i64) -> i64
        %267 = func.call @cc_nil_value() : () -> i64
        %268 = func.call @cc_cons(%266, %267) : (i64, i64) -> i64
        %269 = func.call @cc_values_pack(%268) : (i64) -> i64
        func.call @stack_push_pointer(%266) : (i64) -> ()
        %270 = func.call @stack_pop_pointer() : () -> i64
        %271 = llvm.mlir.addressof @str28 : !llvm.ptr
        %272 = arith.constant 9 : i64
        %273 = func.call @cc_make_string(%271, %272) : (!llvm.ptr, i64) -> i64
        %274 = llvm.mlir.addressof @str29 : !llvm.ptr
        %275 = arith.constant 7 : i64
        %276 = func.call @cc_make_string(%274, %275) : (!llvm.ptr, i64) -> i64
        %277 = func.call @cc_intern(%273, %276) : (i64, i64) -> i64
        %278 = func.call @cc_nil_value() : () -> i64
        %279 = func.call @cc_cons(%277, %278) : (i64, i64) -> i64
        %280 = func.call @cc_values_pack(%279) : (i64) -> i64
        func.call @stack_push_pointer(%277) : (i64) -> ()
        %281 = func.call @stack_pop_pointer() : () -> i64
        %282 = llvm.mlir.addressof @str30 : !llvm.ptr
        %283 = arith.constant 9 : i64
        %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
        %285 = llvm.mlir.addressof @str31 : !llvm.ptr
        %286 = arith.constant 7 : i64
        %287 = func.call @cc_make_string(%285, %286) : (!llvm.ptr, i64) -> i64
        %288 = func.call @cc_intern(%284, %287) : (i64, i64) -> i64
        %289 = func.call @cc_nil_value() : () -> i64
        %290 = func.call @cc_cons(%288, %289) : (i64, i64) -> i64
        %291 = func.call @cc_values_pack(%290) : (i64) -> i64
        func.call @stack_push_pointer(%288) : (i64) -> ()
        %292 = func.call @stack_pop_pointer() : () -> i64
        %293 = llvm.mlir.addressof @str32 : !llvm.ptr
        %294 = arith.constant 9 : i64
        %295 = func.call @cc_make_string(%293, %294) : (!llvm.ptr, i64) -> i64
        %296 = llvm.mlir.addressof @str33 : !llvm.ptr
        %297 = arith.constant 7 : i64
        %298 = func.call @cc_make_string(%296, %297) : (!llvm.ptr, i64) -> i64
        %299 = func.call @cc_intern(%295, %298) : (i64, i64) -> i64
        %300 = func.call @cc_nil_value() : () -> i64
        %301 = func.call @cc_cons(%299, %300) : (i64, i64) -> i64
        %302 = func.call @cc_values_pack(%301) : (i64) -> i64
        func.call @stack_push_pointer(%299) : (i64) -> ()
        %303 = func.call @stack_pop_pointer() : () -> i64
        %304 = llvm.mlir.addressof @str34 : !llvm.ptr
        %305 = arith.constant 6 : i64
        %306 = func.call @cc_make_string(%304, %305) : (!llvm.ptr, i64) -> i64
        %307 = llvm.mlir.addressof @str35 : !llvm.ptr
        %308 = arith.constant 7 : i64
        %309 = func.call @cc_make_string(%307, %308) : (!llvm.ptr, i64) -> i64
        %310 = func.call @cc_intern(%306, %309) : (i64, i64) -> i64
        %311 = func.call @cc_nil_value() : () -> i64
        %312 = func.call @cc_cons(%310, %311) : (i64, i64) -> i64
        %313 = func.call @cc_values_pack(%312) : (i64) -> i64
        func.call @stack_push_pointer(%310) : (i64) -> ()
        %314 = func.call @stack_pop_pointer() : () -> i64
        %315 = func.call @cc_nil_value() : () -> i64
        %316 = func.call @cc_errorp(%248) : (i64) -> i64
        %317 = arith.cmpi ne, %316, %315 : i64
        %318 = arith.cmpi eq, %315, %315 : i64
        %319 = arith.andi %317, %318 : i1
        %320 = scf.if %319 -> (i64) {
          scf.yield %248 : i64
        } else {
          scf.yield %315 : i64
        }
        %321 = func.call @cc_errorp(%259) : (i64) -> i64
        %322 = arith.cmpi ne, %321, %315 : i64
        %323 = arith.cmpi eq, %320, %315 : i64
        %324 = arith.andi %322, %323 : i1
        %325 = scf.if %324 -> (i64) {
          scf.yield %259 : i64
        } else {
          scf.yield %320 : i64
        }
        %326 = func.call @cc_errorp(%270) : (i64) -> i64
        %327 = arith.cmpi ne, %326, %315 : i64
        %328 = arith.cmpi eq, %325, %315 : i64
        %329 = arith.andi %327, %328 : i1
        %330 = scf.if %329 -> (i64) {
          scf.yield %270 : i64
        } else {
          scf.yield %325 : i64
        }
        %331 = func.call @cc_errorp(%281) : (i64) -> i64
        %332 = arith.cmpi ne, %331, %315 : i64
        %333 = arith.cmpi eq, %330, %315 : i64
        %334 = arith.andi %332, %333 : i1
        %335 = scf.if %334 -> (i64) {
          scf.yield %281 : i64
        } else {
          scf.yield %330 : i64
        }
        %336 = func.call @cc_errorp(%292) : (i64) -> i64
        %337 = arith.cmpi ne, %336, %315 : i64
        %338 = arith.cmpi eq, %335, %315 : i64
        %339 = arith.andi %337, %338 : i1
        %340 = scf.if %339 -> (i64) {
          scf.yield %292 : i64
        } else {
          scf.yield %335 : i64
        }
        %341 = func.call @cc_errorp(%303) : (i64) -> i64
        %342 = arith.cmpi ne, %341, %315 : i64
        %343 = arith.cmpi eq, %340, %315 : i64
        %344 = arith.andi %342, %343 : i1
        %345 = scf.if %344 -> (i64) {
          scf.yield %303 : i64
        } else {
          scf.yield %340 : i64
        }
        %346 = func.call @cc_errorp(%314) : (i64) -> i64
        %347 = arith.cmpi ne, %346, %315 : i64
        %348 = arith.cmpi eq, %345, %315 : i64
        %349 = arith.andi %347, %348 : i1
        %350 = scf.if %349 -> (i64) {
          scf.yield %314 : i64
        } else {
          scf.yield %345 : i64
        }
        %351 = arith.cmpi ne, %350, %315 : i64
        scf.if %351 {
          func.call @stack_push_pointer(%350) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%248) : (i64) -> ()
          func.call @stack_push_pointer(%259) : (i64) -> ()
          func.call @stack_push_pointer(%270) : (i64) -> ()
          func.call @stack_push_pointer(%281) : (i64) -> ()
          func.call @stack_push_pointer(%292) : (i64) -> ()
          func.call @stack_push_pointer(%303) : (i64) -> ()
          func.call @stack_push_pointer(%314) : (i64) -> ()
          %352 = llvm.mlir.addressof @str36 : !llvm.ptr
          %353 = func.call @cc_make_function_ref_const(%352) : (!llvm.ptr) -> i64
          %354 = arith.constant 7 : i64
          func.call @cc_funcall_stack(%353, %354) : (i64, i64) -> ()
        }
        %355 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%355) : (i64) -> ()
        %356 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %356, %355 : i64, i64
      }
      %357 = func.call @cc_nil_value() : () -> i64
      %358 = func.call @cc_errorp(%247#0) : (i64) -> i64
      %359 = arith.cmpi ne, %358, %357 : i64
      %360:2 = scf.if %359 -> (i64, i64) {
        scf.yield %247#0, %247#1 : i64, i64
      } else {
        %361 = llvm.mlir.addressof @str37 : !llvm.ptr
        %362 = arith.constant 3 : i64
        %363 = func.call @cc_make_string(%361, %362) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%363) : (i64) -> ()
        %364 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%247#1) : (i64) -> ()
        %365 = func.call @stack_pop_pointer() : () -> i64
        %366 = func.call @cc_nil_value() : () -> i64
        %367 = func.call @cc_errorp(%364) : (i64) -> i64
        %368 = arith.cmpi ne, %367, %366 : i64
        %369 = arith.cmpi eq, %366, %366 : i64
        %370 = arith.andi %368, %369 : i1
        %371 = scf.if %370 -> (i64) {
          scf.yield %364 : i64
        } else {
          scf.yield %366 : i64
        }
        %372 = func.call @cc_errorp(%365) : (i64) -> i64
        %373 = arith.cmpi ne, %372, %366 : i64
        %374 = arith.cmpi eq, %371, %366 : i64
        %375 = arith.andi %373, %374 : i1
        %376 = scf.if %375 -> (i64) {
          scf.yield %365 : i64
        } else {
          scf.yield %371 : i64
        }
        %377 = arith.cmpi ne, %376, %366 : i64
        scf.if %377 {
          func.call @stack_push_pointer(%376) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%364) : (i64) -> ()
          func.call @stack_push_pointer(%365) : (i64) -> ()
          %378 = llvm.mlir.addressof @str38 : !llvm.ptr
          %379 = func.call @cc_make_function_ref_const(%378) : (!llvm.ptr) -> i64
          %380 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%379, %380) : (i64, i64) -> ()
        }
        %381 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %381, %247#1 : i64, i64
      }
      %382 = func.call @cc_nil_value() : () -> i64
      %383 = func.call @cc_errorp(%360#0) : (i64) -> i64
      %384 = arith.cmpi ne, %383, %382 : i64
      %385:2 = scf.if %384 -> (i64, i64) {
        scf.yield %360#0, %360#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%360#1) : (i64) -> ()
        %386 = func.call @stack_pop_pointer() : () -> i64
        %387 = func.call @cc_nil_value() : () -> i64
        %388 = func.call @cc_errorp(%386) : (i64) -> i64
        %389 = arith.cmpi ne, %388, %387 : i64
        %390 = arith.cmpi eq, %387, %387 : i64
        %391 = arith.andi %389, %390 : i1
        %392 = scf.if %391 -> (i64) {
          scf.yield %386 : i64
        } else {
          scf.yield %387 : i64
        }
        %393 = arith.cmpi ne, %392, %387 : i64
        scf.if %393 {
          func.call @stack_push_pointer(%392) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%386) : (i64) -> ()
          %394 = llvm.mlir.addressof @str39 : !llvm.ptr
          %395 = func.call @cc_make_function_ref_const(%394) : (!llvm.ptr) -> i64
          %396 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%395, %396) : (i64, i64) -> ()
        }
        %397 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %397, %360#1 : i64, i64
      }
      %398 = func.call @cc_nil_value() : () -> i64
      %399 = func.call @cc_errorp(%385#0) : (i64) -> i64
      %400 = arith.cmpi ne, %399, %398 : i64
      %401:2 = scf.if %400 -> (i64, i64) {
        scf.yield %385#0, %385#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%80) : (i64) -> ()
        %402 = func.call @stack_pop_pointer() : () -> i64
        %403 = llvm.mlir.addressof @str40 : !llvm.ptr
        %404 = arith.constant 9 : i64
        %405 = func.call @cc_make_string(%403, %404) : (!llvm.ptr, i64) -> i64
        %406 = llvm.mlir.addressof @str41 : !llvm.ptr
        %407 = arith.constant 7 : i64
        %408 = func.call @cc_make_string(%406, %407) : (!llvm.ptr, i64) -> i64
        %409 = func.call @cc_intern(%405, %408) : (i64, i64) -> i64
        %410 = func.call @cc_nil_value() : () -> i64
        %411 = func.call @cc_cons(%409, %410) : (i64, i64) -> i64
        %412 = func.call @cc_values_pack(%411) : (i64) -> i64
        func.call @stack_push_pointer(%409) : (i64) -> ()
        %413 = func.call @stack_pop_pointer() : () -> i64
        %414 = llvm.mlir.addressof @str42 : !llvm.ptr
        %415 = arith.constant 5 : i64
        %416 = func.call @cc_make_string(%414, %415) : (!llvm.ptr, i64) -> i64
        %417 = llvm.mlir.addressof @str43 : !llvm.ptr
        %418 = arith.constant 7 : i64
        %419 = func.call @cc_make_string(%417, %418) : (!llvm.ptr, i64) -> i64
        %420 = func.call @cc_intern(%416, %419) : (i64, i64) -> i64
        %421 = func.call @cc_nil_value() : () -> i64
        %422 = func.call @cc_cons(%420, %421) : (i64, i64) -> i64
        %423 = func.call @cc_values_pack(%422) : (i64) -> i64
        func.call @stack_push_pointer(%420) : (i64) -> ()
        %424 = func.call @stack_pop_pointer() : () -> i64
        %425 = func.call @cc_nil_value() : () -> i64
        %426 = func.call @cc_errorp(%402) : (i64) -> i64
        %427 = arith.cmpi ne, %426, %425 : i64
        %428 = arith.cmpi eq, %425, %425 : i64
        %429 = arith.andi %427, %428 : i1
        %430 = scf.if %429 -> (i64) {
          scf.yield %402 : i64
        } else {
          scf.yield %425 : i64
        }
        %431 = func.call @cc_errorp(%413) : (i64) -> i64
        %432 = arith.cmpi ne, %431, %425 : i64
        %433 = arith.cmpi eq, %430, %425 : i64
        %434 = arith.andi %432, %433 : i1
        %435 = scf.if %434 -> (i64) {
          scf.yield %413 : i64
        } else {
          scf.yield %430 : i64
        }
        %436 = func.call @cc_errorp(%424) : (i64) -> i64
        %437 = arith.cmpi ne, %436, %425 : i64
        %438 = arith.cmpi eq, %435, %425 : i64
        %439 = arith.andi %437, %438 : i1
        %440 = scf.if %439 -> (i64) {
          scf.yield %424 : i64
        } else {
          scf.yield %435 : i64
        }
        %441 = arith.cmpi ne, %440, %425 : i64
        scf.if %441 {
          func.call @stack_push_pointer(%440) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%402) : (i64) -> ()
          func.call @stack_push_pointer(%413) : (i64) -> ()
          func.call @stack_push_pointer(%424) : (i64) -> ()
          %442 = llvm.mlir.addressof @str44 : !llvm.ptr
          %443 = func.call @cc_make_function_ref_const(%442) : (!llvm.ptr) -> i64
          %444 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%443, %444) : (i64, i64) -> ()
        }
        %445 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%445) : (i64) -> ()
        %446 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %446, %445 : i64, i64
      }
      %447 = func.call @cc_nil_value() : () -> i64
      %448 = func.call @cc_errorp(%401#0) : (i64) -> i64
      %449 = arith.cmpi ne, %448, %447 : i64
      %450:2 = scf.if %449 -> (i64, i64) {
        scf.yield %401#0, %401#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%201) : (i64) -> ()
        %451 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%401#1) : (i64) -> ()
        %452 = func.call @stack_pop_pointer() : () -> i64
        %453 = llvm.mlir.addressof @str45 : !llvm.ptr
        %454 = arith.constant 5 : i64
        %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
        %456 = llvm.mlir.addressof @str46 : !llvm.ptr
        %457 = arith.constant 7 : i64
        %458 = func.call @cc_make_string(%456, %457) : (!llvm.ptr, i64) -> i64
        %459 = func.call @cc_intern(%455, %458) : (i64, i64) -> i64
        %460 = func.call @cc_nil_value() : () -> i64
        %461 = func.call @cc_cons(%459, %460) : (i64, i64) -> i64
        %462 = func.call @cc_values_pack(%461) : (i64) -> i64
        func.call @stack_push_pointer(%459) : (i64) -> ()
        %463 = func.call @stack_pop_pointer() : () -> i64
        %464 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%464) : (i64) -> ()
        %465 = func.call @stack_pop_pointer() : () -> i64
        %466 = llvm.mlir.addressof @str47 : !llvm.ptr
        %467 = arith.constant 3 : i64
        %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
        %469 = llvm.mlir.addressof @str48 : !llvm.ptr
        %470 = arith.constant 7 : i64
        %471 = func.call @cc_make_string(%469, %470) : (!llvm.ptr, i64) -> i64
        %472 = func.call @cc_intern(%468, %471) : (i64, i64) -> i64
        %473 = func.call @cc_nil_value() : () -> i64
        %474 = func.call @cc_cons(%472, %473) : (i64, i64) -> i64
        %475 = func.call @cc_values_pack(%474) : (i64) -> i64
        func.call @stack_push_pointer(%472) : (i64) -> ()
        %476 = func.call @stack_pop_pointer() : () -> i64
        %477 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%477) : (i64) -> ()
        %478 = func.call @stack_pop_pointer() : () -> i64
        %479 = func.call @cc_nil_value() : () -> i64
        %480 = func.call @cc_errorp(%451) : (i64) -> i64
        %481 = arith.cmpi ne, %480, %479 : i64
        %482 = arith.cmpi eq, %479, %479 : i64
        %483 = arith.andi %481, %482 : i1
        %484 = scf.if %483 -> (i64) {
          scf.yield %451 : i64
        } else {
          scf.yield %479 : i64
        }
        %485 = func.call @cc_errorp(%452) : (i64) -> i64
        %486 = arith.cmpi ne, %485, %479 : i64
        %487 = arith.cmpi eq, %484, %479 : i64
        %488 = arith.andi %486, %487 : i1
        %489 = scf.if %488 -> (i64) {
          scf.yield %452 : i64
        } else {
          scf.yield %484 : i64
        }
        %490 = func.call @cc_errorp(%463) : (i64) -> i64
        %491 = arith.cmpi ne, %490, %479 : i64
        %492 = arith.cmpi eq, %489, %479 : i64
        %493 = arith.andi %491, %492 : i1
        %494 = scf.if %493 -> (i64) {
          scf.yield %463 : i64
        } else {
          scf.yield %489 : i64
        }
        %495 = func.call @cc_errorp(%465) : (i64) -> i64
        %496 = arith.cmpi ne, %495, %479 : i64
        %497 = arith.cmpi eq, %494, %479 : i64
        %498 = arith.andi %496, %497 : i1
        %499 = scf.if %498 -> (i64) {
          scf.yield %465 : i64
        } else {
          scf.yield %494 : i64
        }
        %500 = func.call @cc_errorp(%476) : (i64) -> i64
        %501 = arith.cmpi ne, %500, %479 : i64
        %502 = arith.cmpi eq, %499, %479 : i64
        %503 = arith.andi %501, %502 : i1
        %504 = scf.if %503 -> (i64) {
          scf.yield %476 : i64
        } else {
          scf.yield %499 : i64
        }
        %505 = func.call @cc_errorp(%478) : (i64) -> i64
        %506 = arith.cmpi ne, %505, %479 : i64
        %507 = arith.cmpi eq, %504, %479 : i64
        %508 = arith.andi %506, %507 : i1
        %509 = scf.if %508 -> (i64) {
          scf.yield %478 : i64
        } else {
          scf.yield %504 : i64
        }
        %510 = arith.cmpi ne, %509, %479 : i64
        scf.if %510 {
          func.call @stack_push_pointer(%509) : (i64) -> ()
        } else {
          %511 = func.call @cc_nil_value() : () -> i64
          %512 = func.call @cc_cons(%478, %511) : (i64, i64) -> i64
          %513 = func.call @cc_cons(%476, %512) : (i64, i64) -> i64
          %514 = func.call @cc_cons(%465, %513) : (i64, i64) -> i64
          %515 = func.call @cc_cons(%463, %514) : (i64, i64) -> i64
          %516 = func.call @cc_cons(%452, %515) : (i64, i64) -> i64
          %517 = func.call @cc_cons(%451, %516) : (i64, i64) -> i64
          func.call @stack_push_pointer(%517) : (i64) -> ()
          func.call @cc_read_sequence_stack() : () -> ()
        }
        %518 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %518, %401#1 : i64, i64
      }
      %519 = func.call @cc_nil_value() : () -> i64
      %520 = func.call @cc_errorp(%450#0) : (i64) -> i64
      %521 = arith.cmpi ne, %520, %519 : i64
      %522:2 = scf.if %521 -> (i64, i64) {
        scf.yield %450#0, %450#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%450#1) : (i64) -> ()
        %523 = func.call @stack_pop_pointer() : () -> i64
        %524 = func.call @cc_nil_value() : () -> i64
        %525 = func.call @cc_errorp(%523) : (i64) -> i64
        %526 = arith.cmpi ne, %525, %524 : i64
        %527 = arith.cmpi eq, %524, %524 : i64
        %528 = arith.andi %526, %527 : i1
        %529 = scf.if %528 -> (i64) {
          scf.yield %523 : i64
        } else {
          scf.yield %524 : i64
        }
        %530 = arith.cmpi ne, %529, %524 : i64
        scf.if %530 {
          func.call @stack_push_pointer(%529) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%523) : (i64) -> ()
          %531 = llvm.mlir.addressof @str49 : !llvm.ptr
          %532 = func.call @cc_make_function_ref_const(%531) : (!llvm.ptr) -> i64
          %533 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%532, %533) : (i64, i64) -> ()
        }
        %534 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %534, %450#1 : i64, i64
      }
      %535 = func.call @cc_nil_value() : () -> i64
      %536 = func.call @cc_errorp(%522#0) : (i64) -> i64
      %537 = arith.cmpi ne, %536, %535 : i64
      %538:2 = scf.if %537 -> (i64, i64) {
        scf.yield %522#0, %522#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%80) : (i64) -> ()
        %539 = func.call @stack_pop_pointer() : () -> i64
        %540 = func.call @cc_nil_value() : () -> i64
        %541 = func.call @cc_errorp(%539) : (i64) -> i64
        %542 = arith.cmpi ne, %541, %540 : i64
        %543 = arith.cmpi eq, %540, %540 : i64
        %544 = arith.andi %542, %543 : i1
        %545 = scf.if %544 -> (i64) {
          scf.yield %539 : i64
        } else {
          scf.yield %540 : i64
        }
        %546 = arith.cmpi ne, %545, %540 : i64
        scf.if %546 {
          func.call @stack_push_pointer(%545) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%539) : (i64) -> ()
          %547 = llvm.mlir.addressof @str50 : !llvm.ptr
          %548 = func.call @cc_make_function_ref_const(%547) : (!llvm.ptr) -> i64
          %549 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%548, %549) : (i64, i64) -> ()
        }
        %550 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %550, %522#1 : i64, i64
      }
      %551 = func.call @cc_nil_value() : () -> i64
      %552 = func.call @cc_errorp(%538#0) : (i64) -> i64
      %553 = arith.cmpi ne, %552, %551 : i64
      %554:2 = scf.if %553 -> (i64, i64) {
        scf.yield %538#0, %538#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%201) : (i64) -> ()
        %555 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %555, %538#1 : i64, i64
      }
      func.call @stack_push_pointer(%554#0) : (i64) -> ()
      %556 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %556 : i64
    }
    func.call @stack_push_pointer(%65) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("clisp/in_work/regression-tests/framework.lisp\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str2("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str3("CLOSE.ABORT.03.PROBE\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str4("CLOSE-ABORT-FORM\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str5("close-abort\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str6("core:mkstemp\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str7("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str8("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str9("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str10("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str11("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str14("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str15("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str16("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str17("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str19("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str21("foo\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str22("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str23("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str24("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str25("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str26("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str27("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str29("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str30("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str31("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str35("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str37("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str38("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str39("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str40("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str41("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str42("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str43("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str44("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str45("START\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str46("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("END\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str48("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str49("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str50("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str51("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str52("%test\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str53("show-test-summary\00") : !llvm.array<18 x i8>
}
