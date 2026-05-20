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
      %52 = func.call @cc_nil_value() : () -> i64
      %53 = func.call @cc_intern(%51, %52) : (i64, i64) -> i64
      %54 = func.call @cc_nil_value() : () -> i64
      %55 = func.call @cc_cons(%53, %54) : (i64, i64) -> i64
      %56 = func.call @cc_values_pack(%55) : (i64) -> i64
      func.call @stack_push_pointer(%53) : (i64) -> ()
      %57 = llvm.mlir.addressof @str5 : !llvm.ptr
      %58 = arith.constant 4 : i64
      %59 = func.call @cc_make_string(%57, %58) : (!llvm.ptr, i64) -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_intern(%59, %60) : (i64, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_cons(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_values_pack(%63) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %65 = llvm.mlir.addressof @str6 : !llvm.ptr
      %66 = arith.constant 7 : i64
      %67 = func.call @cc_make_string(%65, %66) : (!llvm.ptr, i64) -> i64
      %68 = llvm.mlir.addressof @str7 : !llvm.ptr
      %69 = arith.constant 4 : i64
      %70 = func.call @cc_make_string(%68, %69) : (!llvm.ptr, i64) -> i64
      %71 = func.call @cc_intern(%67, %70) : (i64, i64) -> i64
      %72 = func.call @cc_nil_value() : () -> i64
      %73 = func.call @cc_cons(%71, %72) : (i64, i64) -> i64
      %74 = func.call @cc_values_pack(%73) : (i64) -> i64
      func.call @stack_push_pointer(%71) : (i64) -> ()
      %75 = llvm.mlir.addressof @str8 : !llvm.ptr
      %76 = arith.constant 11 : i64
      %77 = func.call @cc_make_string(%75, %76) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%77) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %78 = func.call @stack_pop_pointer() : () -> i64
      %79 = func.call @stack_pop_pointer() : () -> i64
      %80 = func.call @cc_cons(%79, %78) : (i64, i64) -> i64
      func.call @stack_push_pointer(%80) : (i64) -> ()
      %81 = func.call @stack_pop_pointer() : () -> i64
      %82 = func.call @stack_pop_pointer() : () -> i64
      %83 = func.call @cc_cons(%82, %81) : (i64, i64) -> i64
      func.call @stack_push_pointer(%83) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %84 = func.call @stack_pop_pointer() : () -> i64
      %85 = func.call @stack_pop_pointer() : () -> i64
      %86 = func.call @cc_cons(%85, %84) : (i64, i64) -> i64
      func.call @stack_push_pointer(%86) : (i64) -> ()
      %87 = func.call @stack_pop_pointer() : () -> i64
      %88 = func.call @stack_pop_pointer() : () -> i64
      %89 = func.call @cc_cons(%88, %87) : (i64, i64) -> i64
      func.call @stack_push_pointer(%89) : (i64) -> ()
      %90 = llvm.mlir.addressof @str9 : !llvm.ptr
      %91 = arith.constant 6 : i64
      %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
      %93 = llvm.mlir.addressof @str10 : !llvm.ptr
      %94 = arith.constant 11 : i64
      %95 = func.call @cc_make_string(%93, %94) : (!llvm.ptr, i64) -> i64
      %96 = func.call @cc_intern(%92, %95) : (i64, i64) -> i64
      %97 = func.call @cc_nil_value() : () -> i64
      %98 = func.call @cc_cons(%96, %97) : (i64, i64) -> i64
      %99 = func.call @cc_values_pack(%98) : (i64) -> i64
      func.call @stack_push_pointer(%96) : (i64) -> ()
      %100 = llvm.mlir.addressof @str11 : !llvm.ptr
      %101 = arith.constant 4 : i64
      %102 = func.call @cc_make_string(%100, %101) : (!llvm.ptr, i64) -> i64
      %103 = llvm.mlir.addressof @str12 : !llvm.ptr
      %104 = arith.constant 11 : i64
      %105 = func.call @cc_make_string(%103, %104) : (!llvm.ptr, i64) -> i64
      %106 = func.call @cc_intern(%102, %105) : (i64, i64) -> i64
      %107 = func.call @cc_nil_value() : () -> i64
      %108 = func.call @cc_cons(%106, %107) : (i64, i64) -> i64
      %109 = func.call @cc_values_pack(%108) : (i64) -> i64
      func.call @stack_push_pointer(%106) : (i64) -> ()
      %110 = llvm.mlir.addressof @str13 : !llvm.ptr
      %111 = arith.constant 4 : i64
      %112 = func.call @cc_make_string(%110, %111) : (!llvm.ptr, i64) -> i64
      %113 = func.call @cc_nil_value() : () -> i64
      %114 = func.call @cc_intern(%112, %113) : (i64, i64) -> i64
      %115 = func.call @cc_nil_value() : () -> i64
      %116 = func.call @cc_cons(%114, %115) : (i64, i64) -> i64
      %117 = func.call @cc_values_pack(%116) : (i64) -> i64
      func.call @stack_push_pointer(%114) : (i64) -> ()
      %118 = llvm.mlir.addressof @str14 : !llvm.ptr
      %119 = arith.constant 17 : i64
      %120 = func.call @cc_make_string(%118, %119) : (!llvm.ptr, i64) -> i64
      %121 = llvm.mlir.addressof @str15 : !llvm.ptr
      %122 = arith.constant 7 : i64
      %123 = func.call @cc_make_string(%121, %122) : (!llvm.ptr, i64) -> i64
      %124 = func.call @cc_intern(%120, %123) : (i64, i64) -> i64
      %125 = func.call @cc_nil_value() : () -> i64
      %126 = func.call @cc_cons(%124, %125) : (i64, i64) -> i64
      %127 = func.call @cc_values_pack(%126) : (i64) -> i64
      func.call @stack_push_pointer(%124) : (i64) -> ()
      %128 = llvm.mlir.addressof @str16 : !llvm.ptr
      %129 = arith.constant 6 : i64
      %130 = func.call @cc_make_string(%128, %129) : (!llvm.ptr, i64) -> i64
      %131 = llvm.mlir.addressof @str17 : !llvm.ptr
      %132 = arith.constant 7 : i64
      %133 = func.call @cc_make_string(%131, %132) : (!llvm.ptr, i64) -> i64
      %134 = func.call @cc_intern(%130, %133) : (i64, i64) -> i64
      %135 = func.call @cc_nil_value() : () -> i64
      %136 = func.call @cc_cons(%134, %135) : (i64, i64) -> i64
      %137 = func.call @cc_values_pack(%136) : (i64) -> i64
      func.call @stack_push_pointer(%134) : (i64) -> ()
      %138 = llvm.mlir.addressof @str18 : !llvm.ptr
      %139 = arith.constant 9 : i64
      %140 = func.call @cc_make_string(%138, %139) : (!llvm.ptr, i64) -> i64
      %141 = llvm.mlir.addressof @str19 : !llvm.ptr
      %142 = arith.constant 7 : i64
      %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
      %144 = func.call @cc_intern(%140, %143) : (i64, i64) -> i64
      %145 = func.call @cc_nil_value() : () -> i64
      %146 = func.call @cc_cons(%144, %145) : (i64, i64) -> i64
      %147 = func.call @cc_values_pack(%146) : (i64) -> i64
      func.call @stack_push_pointer(%144) : (i64) -> ()
      %148 = llvm.mlir.addressof @str20 : !llvm.ptr
      %149 = arith.constant 6 : i64
      %150 = func.call @cc_make_string(%148, %149) : (!llvm.ptr, i64) -> i64
      %151 = llvm.mlir.addressof @str21 : !llvm.ptr
      %152 = arith.constant 7 : i64
      %153 = func.call @cc_make_string(%151, %152) : (!llvm.ptr, i64) -> i64
      %154 = func.call @cc_intern(%150, %153) : (i64, i64) -> i64
      %155 = func.call @cc_nil_value() : () -> i64
      %156 = func.call @cc_cons(%154, %155) : (i64, i64) -> i64
      %157 = func.call @cc_values_pack(%156) : (i64) -> i64
      func.call @stack_push_pointer(%154) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
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
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @stack_pop_pointer() : () -> i64
      %169 = func.call @cc_cons(%168, %167) : (i64, i64) -> i64
      func.call @stack_push_pointer(%169) : (i64) -> ()
      %170 = func.call @stack_pop_pointer() : () -> i64
      %171 = func.call @stack_pop_pointer() : () -> i64
      %172 = func.call @cc_cons(%171, %170) : (i64, i64) -> i64
      func.call @stack_push_pointer(%172) : (i64) -> ()
      %173 = func.call @stack_pop_pointer() : () -> i64
      %174 = func.call @stack_pop_pointer() : () -> i64
      %175 = func.call @cc_cons(%174, %173) : (i64, i64) -> i64
      func.call @stack_push_pointer(%175) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %176 = func.call @stack_pop_pointer() : () -> i64
      %177 = func.call @stack_pop_pointer() : () -> i64
      %178 = func.call @cc_cons(%177, %176) : (i64, i64) -> i64
      func.call @stack_push_pointer(%178) : (i64) -> ()
      %179 = func.call @stack_pop_pointer() : () -> i64
      %180 = func.call @stack_pop_pointer() : () -> i64
      %181 = func.call @cc_cons(%180, %179) : (i64, i64) -> i64
      func.call @stack_push_pointer(%181) : (i64) -> ()
      %182 = llvm.mlir.addressof @str22 : !llvm.ptr
      %183 = arith.constant 6 : i64
      %184 = func.call @cc_make_string(%182, %183) : (!llvm.ptr, i64) -> i64
      %185 = func.call @cc_nil_value() : () -> i64
      %186 = func.call @cc_intern(%184, %185) : (i64, i64) -> i64
      %187 = func.call @cc_nil_value() : () -> i64
      %188 = func.call @cc_cons(%186, %187) : (i64, i64) -> i64
      %189 = func.call @cc_values_pack(%188) : (i64) -> i64
      func.call @stack_push_pointer(%186) : (i64) -> ()
      %190 = llvm.mlir.addressof @str23 : !llvm.ptr
      %191 = arith.constant 10 : i64
      %192 = func.call @cc_make_string(%190, %191) : (!llvm.ptr, i64) -> i64
      %193 = llvm.mlir.addressof @str24 : !llvm.ptr
      %194 = arith.constant 11 : i64
      %195 = func.call @cc_make_string(%193, %194) : (!llvm.ptr, i64) -> i64
      %196 = func.call @cc_intern(%192, %195) : (i64, i64) -> i64
      %197 = func.call @cc_nil_value() : () -> i64
      %198 = func.call @cc_cons(%196, %197) : (i64, i64) -> i64
      %199 = func.call @cc_values_pack(%198) : (i64) -> i64
      func.call @stack_push_pointer(%196) : (i64) -> ()
      %200 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%200) : (i64) -> ()
      %201 = llvm.mlir.addressof @str25 : !llvm.ptr
      %202 = arith.constant 12 : i64
      %203 = func.call @cc_make_string(%201, %202) : (!llvm.ptr, i64) -> i64
      %204 = llvm.mlir.addressof @str26 : !llvm.ptr
      %205 = arith.constant 7 : i64
      %206 = func.call @cc_make_string(%204, %205) : (!llvm.ptr, i64) -> i64
      %207 = func.call @cc_intern(%203, %206) : (i64, i64) -> i64
      %208 = func.call @cc_nil_value() : () -> i64
      %209 = func.call @cc_cons(%207, %208) : (i64, i64) -> i64
      %210 = func.call @cc_values_pack(%209) : (i64) -> i64
      func.call @stack_push_pointer(%207) : (i64) -> ()
      %211 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%211) : (i64) -> ()
      %212 = llvm.mlir.addressof @str27 : !llvm.ptr
      %213 = arith.constant 9 : i64
      %214 = func.call @cc_make_string(%212, %213) : (!llvm.ptr, i64) -> i64
      %215 = llvm.mlir.addressof @str28 : !llvm.ptr
      %216 = arith.constant 11 : i64
      %217 = func.call @cc_make_string(%215, %216) : (!llvm.ptr, i64) -> i64
      %218 = func.call @cc_intern(%214, %217) : (i64, i64) -> i64
      %219 = func.call @cc_nil_value() : () -> i64
      %220 = func.call @cc_cons(%218, %219) : (i64, i64) -> i64
      %221 = func.call @cc_values_pack(%220) : (i64) -> i64
      func.call @stack_push_pointer(%218) : (i64) -> ()
      %222 = func.call @stack_pop_pointer() : () -> i64
      %223 = func.call @stack_pop_pointer() : () -> i64
      %224 = func.call @cc_cons(%222, %223) : (i64, i64) -> i64
      %225 = llvm.mlir.addressof @str29 : !llvm.ptr
      %226 = arith.constant 5 : i64
      %227 = func.call @cc_make_string(%225, %226) : (!llvm.ptr, i64) -> i64
      %228 = func.call @cc_nil_value() : () -> i64
      %229 = func.call @cc_intern(%227, %228) : (i64, i64) -> i64
      %230 = func.call @cc_nil_value() : () -> i64
      %231 = func.call @cc_cons(%229, %230) : (i64, i64) -> i64
      %232 = func.call @cc_values_pack(%231) : (i64) -> i64
      %233 = func.call @cc_cons(%229, %224) : (i64, i64) -> i64
      func.call @stack_push_pointer(%233) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %234 = func.call @stack_pop_pointer() : () -> i64
      %235 = func.call @stack_pop_pointer() : () -> i64
      %236 = func.call @cc_cons(%235, %234) : (i64, i64) -> i64
      func.call @stack_push_pointer(%236) : (i64) -> ()
      %237 = func.call @stack_pop_pointer() : () -> i64
      %238 = func.call @stack_pop_pointer() : () -> i64
      %239 = func.call @cc_cons(%238, %237) : (i64, i64) -> i64
      func.call @stack_push_pointer(%239) : (i64) -> ()
      %240 = func.call @stack_pop_pointer() : () -> i64
      %241 = func.call @stack_pop_pointer() : () -> i64
      %242 = func.call @cc_cons(%241, %240) : (i64, i64) -> i64
      func.call @stack_push_pointer(%242) : (i64) -> ()
      %243 = func.call @stack_pop_pointer() : () -> i64
      %244 = func.call @stack_pop_pointer() : () -> i64
      %245 = func.call @cc_cons(%244, %243) : (i64, i64) -> i64
      func.call @stack_push_pointer(%245) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %246 = func.call @stack_pop_pointer() : () -> i64
      %247 = func.call @stack_pop_pointer() : () -> i64
      %248 = func.call @cc_cons(%247, %246) : (i64, i64) -> i64
      func.call @stack_push_pointer(%248) : (i64) -> ()
      %249 = func.call @stack_pop_pointer() : () -> i64
      %250 = func.call @stack_pop_pointer() : () -> i64
      %251 = func.call @cc_cons(%250, %249) : (i64, i64) -> i64
      func.call @stack_push_pointer(%251) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %252 = func.call @stack_pop_pointer() : () -> i64
      %253 = func.call @stack_pop_pointer() : () -> i64
      %254 = func.call @cc_cons(%253, %252) : (i64, i64) -> i64
      func.call @stack_push_pointer(%254) : (i64) -> ()
      %255 = func.call @stack_pop_pointer() : () -> i64
      %256 = func.call @stack_pop_pointer() : () -> i64
      %257 = func.call @cc_cons(%256, %255) : (i64, i64) -> i64
      func.call @stack_push_pointer(%257) : (i64) -> ()
      %258 = func.call @stack_pop_pointer() : () -> i64
      %259 = func.call @stack_pop_pointer() : () -> i64
      %260 = func.call @cc_cons(%259, %258) : (i64, i64) -> i64
      func.call @stack_push_pointer(%260) : (i64) -> ()
      %261 = llvm.mlir.addressof @str30 : !llvm.ptr
      %262 = arith.constant 12 : i64
      %263 = func.call @cc_make_string(%261, %262) : (!llvm.ptr, i64) -> i64
      %264 = llvm.mlir.addressof @str31 : !llvm.ptr
      %265 = arith.constant 11 : i64
      %266 = func.call @cc_make_string(%264, %265) : (!llvm.ptr, i64) -> i64
      %267 = func.call @cc_intern(%263, %266) : (i64, i64) -> i64
      %268 = func.call @cc_nil_value() : () -> i64
      %269 = func.call @cc_cons(%267, %268) : (i64, i64) -> i64
      %270 = func.call @cc_values_pack(%269) : (i64) -> i64
      func.call @stack_push_pointer(%267) : (i64) -> ()
      %271 = llvm.mlir.addressof @str32 : !llvm.ptr
      %272 = arith.constant 3 : i64
      %273 = func.call @cc_make_string(%271, %272) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%273) : (i64) -> ()
      %274 = llvm.mlir.addressof @str33 : !llvm.ptr
      %275 = arith.constant 6 : i64
      %276 = func.call @cc_make_string(%274, %275) : (!llvm.ptr, i64) -> i64
      %277 = llvm.mlir.addressof @str34 : !llvm.ptr
      %278 = arith.constant 11 : i64
      %279 = func.call @cc_make_string(%277, %278) : (!llvm.ptr, i64) -> i64
      %280 = func.call @cc_intern(%276, %279) : (i64, i64) -> i64
      %281 = func.call @cc_nil_value() : () -> i64
      %282 = func.call @cc_cons(%280, %281) : (i64, i64) -> i64
      %283 = func.call @cc_values_pack(%282) : (i64) -> i64
      func.call @stack_push_pointer(%280) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %284 = func.call @stack_pop_pointer() : () -> i64
      %285 = func.call @stack_pop_pointer() : () -> i64
      %286 = func.call @cc_cons(%285, %284) : (i64, i64) -> i64
      func.call @stack_push_pointer(%286) : (i64) -> ()
      %287 = func.call @stack_pop_pointer() : () -> i64
      %288 = func.call @stack_pop_pointer() : () -> i64
      %289 = func.call @cc_cons(%288, %287) : (i64, i64) -> i64
      func.call @stack_push_pointer(%289) : (i64) -> ()
      %290 = func.call @stack_pop_pointer() : () -> i64
      %291 = func.call @stack_pop_pointer() : () -> i64
      %292 = func.call @cc_cons(%291, %290) : (i64, i64) -> i64
      func.call @stack_push_pointer(%292) : (i64) -> ()
      %293 = llvm.mlir.addressof @str35 : !llvm.ptr
      %294 = arith.constant 5 : i64
      %295 = func.call @cc_make_string(%293, %294) : (!llvm.ptr, i64) -> i64
      %296 = llvm.mlir.addressof @str36 : !llvm.ptr
      %297 = arith.constant 11 : i64
      %298 = func.call @cc_make_string(%296, %297) : (!llvm.ptr, i64) -> i64
      %299 = func.call @cc_intern(%295, %298) : (i64, i64) -> i64
      %300 = func.call @cc_nil_value() : () -> i64
      %301 = func.call @cc_cons(%299, %300) : (i64, i64) -> i64
      %302 = func.call @cc_values_pack(%301) : (i64) -> i64
      func.call @stack_push_pointer(%299) : (i64) -> ()
      %303 = llvm.mlir.addressof @str37 : !llvm.ptr
      %304 = arith.constant 6 : i64
      %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
      %306 = llvm.mlir.addressof @str38 : !llvm.ptr
      %307 = arith.constant 11 : i64
      %308 = func.call @cc_make_string(%306, %307) : (!llvm.ptr, i64) -> i64
      %309 = func.call @cc_intern(%305, %308) : (i64, i64) -> i64
      %310 = func.call @cc_nil_value() : () -> i64
      %311 = func.call @cc_cons(%309, %310) : (i64, i64) -> i64
      %312 = func.call @cc_values_pack(%311) : (i64) -> i64
      func.call @stack_push_pointer(%309) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %313 = func.call @stack_pop_pointer() : () -> i64
      %314 = func.call @stack_pop_pointer() : () -> i64
      %315 = func.call @cc_cons(%314, %313) : (i64, i64) -> i64
      func.call @stack_push_pointer(%315) : (i64) -> ()
      %316 = func.call @stack_pop_pointer() : () -> i64
      %317 = func.call @stack_pop_pointer() : () -> i64
      %318 = func.call @cc_cons(%317, %316) : (i64, i64) -> i64
      func.call @stack_push_pointer(%318) : (i64) -> ()
      %319 = llvm.mlir.addressof @str39 : !llvm.ptr
      %320 = arith.constant 4 : i64
      %321 = func.call @cc_make_string(%319, %320) : (!llvm.ptr, i64) -> i64
      %322 = llvm.mlir.addressof @str40 : !llvm.ptr
      %323 = arith.constant 11 : i64
      %324 = func.call @cc_make_string(%322, %323) : (!llvm.ptr, i64) -> i64
      %325 = func.call @cc_intern(%321, %324) : (i64, i64) -> i64
      %326 = func.call @cc_nil_value() : () -> i64
      %327 = func.call @cc_cons(%325, %326) : (i64, i64) -> i64
      %328 = func.call @cc_values_pack(%327) : (i64) -> i64
      func.call @stack_push_pointer(%325) : (i64) -> ()
      %329 = llvm.mlir.addressof @str41 : !llvm.ptr
      %330 = arith.constant 6 : i64
      %331 = func.call @cc_make_string(%329, %330) : (!llvm.ptr, i64) -> i64
      %332 = llvm.mlir.addressof @str42 : !llvm.ptr
      %333 = arith.constant 11 : i64
      %334 = func.call @cc_make_string(%332, %333) : (!llvm.ptr, i64) -> i64
      %335 = func.call @cc_intern(%331, %334) : (i64, i64) -> i64
      %336 = func.call @cc_nil_value() : () -> i64
      %337 = func.call @cc_cons(%335, %336) : (i64, i64) -> i64
      %338 = func.call @cc_values_pack(%337) : (i64) -> i64
      func.call @stack_push_pointer(%335) : (i64) -> ()
      %339 = llvm.mlir.addressof @str43 : !llvm.ptr
      %340 = arith.constant 4 : i64
      %341 = func.call @cc_make_string(%339, %340) : (!llvm.ptr, i64) -> i64
      %342 = llvm.mlir.addressof @str44 : !llvm.ptr
      %343 = arith.constant 11 : i64
      %344 = func.call @cc_make_string(%342, %343) : (!llvm.ptr, i64) -> i64
      %345 = func.call @cc_intern(%341, %344) : (i64, i64) -> i64
      %346 = func.call @cc_nil_value() : () -> i64
      %347 = func.call @cc_cons(%345, %346) : (i64, i64) -> i64
      %348 = func.call @cc_values_pack(%347) : (i64) -> i64
      func.call @stack_push_pointer(%345) : (i64) -> ()
      %349 = llvm.mlir.addressof @str45 : !llvm.ptr
      %350 = arith.constant 4 : i64
      %351 = func.call @cc_make_string(%349, %350) : (!llvm.ptr, i64) -> i64
      %352 = func.call @cc_nil_value() : () -> i64
      %353 = func.call @cc_intern(%351, %352) : (i64, i64) -> i64
      %354 = func.call @cc_nil_value() : () -> i64
      %355 = func.call @cc_cons(%353, %354) : (i64, i64) -> i64
      %356 = func.call @cc_values_pack(%355) : (i64) -> i64
      func.call @stack_push_pointer(%353) : (i64) -> ()
      %357 = llvm.mlir.addressof @str46 : !llvm.ptr
      %358 = arith.constant 17 : i64
      %359 = func.call @cc_make_string(%357, %358) : (!llvm.ptr, i64) -> i64
      %360 = llvm.mlir.addressof @str47 : !llvm.ptr
      %361 = arith.constant 7 : i64
      %362 = func.call @cc_make_string(%360, %361) : (!llvm.ptr, i64) -> i64
      %363 = func.call @cc_intern(%359, %362) : (i64, i64) -> i64
      %364 = func.call @cc_nil_value() : () -> i64
      %365 = func.call @cc_cons(%363, %364) : (i64, i64) -> i64
      %366 = func.call @cc_values_pack(%365) : (i64) -> i64
      func.call @stack_push_pointer(%363) : (i64) -> ()
      %367 = llvm.mlir.addressof @str48 : !llvm.ptr
      %368 = arith.constant 6 : i64
      %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
      %370 = llvm.mlir.addressof @str49 : !llvm.ptr
      %371 = arith.constant 7 : i64
      %372 = func.call @cc_make_string(%370, %371) : (!llvm.ptr, i64) -> i64
      %373 = func.call @cc_intern(%369, %372) : (i64, i64) -> i64
      %374 = func.call @cc_nil_value() : () -> i64
      %375 = func.call @cc_cons(%373, %374) : (i64, i64) -> i64
      %376 = func.call @cc_values_pack(%375) : (i64) -> i64
      func.call @stack_push_pointer(%373) : (i64) -> ()
      %377 = llvm.mlir.addressof @str50 : !llvm.ptr
      %378 = arith.constant 9 : i64
      %379 = func.call @cc_make_string(%377, %378) : (!llvm.ptr, i64) -> i64
      %380 = llvm.mlir.addressof @str51 : !llvm.ptr
      %381 = arith.constant 7 : i64
      %382 = func.call @cc_make_string(%380, %381) : (!llvm.ptr, i64) -> i64
      %383 = func.call @cc_intern(%379, %382) : (i64, i64) -> i64
      %384 = func.call @cc_nil_value() : () -> i64
      %385 = func.call @cc_cons(%383, %384) : (i64, i64) -> i64
      %386 = func.call @cc_values_pack(%385) : (i64) -> i64
      func.call @stack_push_pointer(%383) : (i64) -> ()
      %387 = llvm.mlir.addressof @str52 : !llvm.ptr
      %388 = arith.constant 9 : i64
      %389 = func.call @cc_make_string(%387, %388) : (!llvm.ptr, i64) -> i64
      %390 = llvm.mlir.addressof @str53 : !llvm.ptr
      %391 = arith.constant 7 : i64
      %392 = func.call @cc_make_string(%390, %391) : (!llvm.ptr, i64) -> i64
      %393 = func.call @cc_intern(%389, %392) : (i64, i64) -> i64
      %394 = func.call @cc_nil_value() : () -> i64
      %395 = func.call @cc_cons(%393, %394) : (i64, i64) -> i64
      %396 = func.call @cc_values_pack(%395) : (i64) -> i64
      func.call @stack_push_pointer(%393) : (i64) -> ()
      %397 = llvm.mlir.addressof @str54 : !llvm.ptr
      %398 = arith.constant 9 : i64
      %399 = func.call @cc_make_string(%397, %398) : (!llvm.ptr, i64) -> i64
      %400 = llvm.mlir.addressof @str55 : !llvm.ptr
      %401 = arith.constant 7 : i64
      %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
      %403 = func.call @cc_intern(%399, %402) : (i64, i64) -> i64
      %404 = func.call @cc_nil_value() : () -> i64
      %405 = func.call @cc_cons(%403, %404) : (i64, i64) -> i64
      %406 = func.call @cc_values_pack(%405) : (i64) -> i64
      func.call @stack_push_pointer(%403) : (i64) -> ()
      %407 = llvm.mlir.addressof @str56 : !llvm.ptr
      %408 = arith.constant 6 : i64
      %409 = func.call @cc_make_string(%407, %408) : (!llvm.ptr, i64) -> i64
      %410 = llvm.mlir.addressof @str57 : !llvm.ptr
      %411 = arith.constant 7 : i64
      %412 = func.call @cc_make_string(%410, %411) : (!llvm.ptr, i64) -> i64
      %413 = func.call @cc_intern(%409, %412) : (i64, i64) -> i64
      %414 = func.call @cc_nil_value() : () -> i64
      %415 = func.call @cc_cons(%413, %414) : (i64, i64) -> i64
      %416 = func.call @cc_values_pack(%415) : (i64) -> i64
      func.call @stack_push_pointer(%413) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %417 = func.call @stack_pop_pointer() : () -> i64
      %418 = func.call @stack_pop_pointer() : () -> i64
      %419 = func.call @cc_cons(%418, %417) : (i64, i64) -> i64
      func.call @stack_push_pointer(%419) : (i64) -> ()
      %420 = func.call @stack_pop_pointer() : () -> i64
      %421 = func.call @stack_pop_pointer() : () -> i64
      %422 = func.call @cc_cons(%421, %420) : (i64, i64) -> i64
      func.call @stack_push_pointer(%422) : (i64) -> ()
      %423 = func.call @stack_pop_pointer() : () -> i64
      %424 = func.call @stack_pop_pointer() : () -> i64
      %425 = func.call @cc_cons(%424, %423) : (i64, i64) -> i64
      func.call @stack_push_pointer(%425) : (i64) -> ()
      %426 = func.call @stack_pop_pointer() : () -> i64
      %427 = func.call @stack_pop_pointer() : () -> i64
      %428 = func.call @cc_cons(%427, %426) : (i64, i64) -> i64
      func.call @stack_push_pointer(%428) : (i64) -> ()
      %429 = func.call @stack_pop_pointer() : () -> i64
      %430 = func.call @stack_pop_pointer() : () -> i64
      %431 = func.call @cc_cons(%430, %429) : (i64, i64) -> i64
      func.call @stack_push_pointer(%431) : (i64) -> ()
      %432 = func.call @stack_pop_pointer() : () -> i64
      %433 = func.call @stack_pop_pointer() : () -> i64
      %434 = func.call @cc_cons(%433, %432) : (i64, i64) -> i64
      func.call @stack_push_pointer(%434) : (i64) -> ()
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @stack_pop_pointer() : () -> i64
      %437 = func.call @cc_cons(%436, %435) : (i64, i64) -> i64
      func.call @stack_push_pointer(%437) : (i64) -> ()
      %438 = func.call @stack_pop_pointer() : () -> i64
      %439 = func.call @stack_pop_pointer() : () -> i64
      %440 = func.call @cc_cons(%439, %438) : (i64, i64) -> i64
      func.call @stack_push_pointer(%440) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %441 = func.call @stack_pop_pointer() : () -> i64
      %442 = func.call @stack_pop_pointer() : () -> i64
      %443 = func.call @cc_cons(%442, %441) : (i64, i64) -> i64
      func.call @stack_push_pointer(%443) : (i64) -> ()
      %444 = func.call @stack_pop_pointer() : () -> i64
      %445 = func.call @stack_pop_pointer() : () -> i64
      %446 = func.call @cc_cons(%445, %444) : (i64, i64) -> i64
      func.call @stack_push_pointer(%446) : (i64) -> ()
      %447 = func.call @stack_pop_pointer() : () -> i64
      %448 = func.call @stack_pop_pointer() : () -> i64
      %449 = func.call @cc_cons(%448, %447) : (i64, i64) -> i64
      func.call @stack_push_pointer(%449) : (i64) -> ()
      %450 = llvm.mlir.addressof @str58 : !llvm.ptr
      %451 = arith.constant 12 : i64
      %452 = func.call @cc_make_string(%450, %451) : (!llvm.ptr, i64) -> i64
      %453 = llvm.mlir.addressof @str59 : !llvm.ptr
      %454 = arith.constant 11 : i64
      %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
      %456 = func.call @cc_intern(%452, %455) : (i64, i64) -> i64
      %457 = func.call @cc_nil_value() : () -> i64
      %458 = func.call @cc_cons(%456, %457) : (i64, i64) -> i64
      %459 = func.call @cc_values_pack(%458) : (i64) -> i64
      func.call @stack_push_pointer(%456) : (i64) -> ()
      %460 = llvm.mlir.addressof @str60 : !llvm.ptr
      %461 = arith.constant 3 : i64
      %462 = func.call @cc_make_string(%460, %461) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%462) : (i64) -> ()
      %463 = llvm.mlir.addressof @str61 : !llvm.ptr
      %464 = arith.constant 6 : i64
      %465 = func.call @cc_make_string(%463, %464) : (!llvm.ptr, i64) -> i64
      %466 = llvm.mlir.addressof @str62 : !llvm.ptr
      %467 = arith.constant 11 : i64
      %468 = func.call @cc_make_string(%466, %467) : (!llvm.ptr, i64) -> i64
      %469 = func.call @cc_intern(%465, %468) : (i64, i64) -> i64
      %470 = func.call @cc_nil_value() : () -> i64
      %471 = func.call @cc_cons(%469, %470) : (i64, i64) -> i64
      %472 = func.call @cc_values_pack(%471) : (i64) -> i64
      func.call @stack_push_pointer(%469) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %473 = func.call @stack_pop_pointer() : () -> i64
      %474 = func.call @stack_pop_pointer() : () -> i64
      %475 = func.call @cc_cons(%474, %473) : (i64, i64) -> i64
      func.call @stack_push_pointer(%475) : (i64) -> ()
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @stack_pop_pointer() : () -> i64
      %478 = func.call @cc_cons(%477, %476) : (i64, i64) -> i64
      func.call @stack_push_pointer(%478) : (i64) -> ()
      %479 = func.call @stack_pop_pointer() : () -> i64
      %480 = func.call @stack_pop_pointer() : () -> i64
      %481 = func.call @cc_cons(%480, %479) : (i64, i64) -> i64
      func.call @stack_push_pointer(%481) : (i64) -> ()
      %482 = llvm.mlir.addressof @str63 : !llvm.ptr
      %483 = arith.constant 5 : i64
      %484 = func.call @cc_make_string(%482, %483) : (!llvm.ptr, i64) -> i64
      %485 = llvm.mlir.addressof @str64 : !llvm.ptr
      %486 = arith.constant 11 : i64
      %487 = func.call @cc_make_string(%485, %486) : (!llvm.ptr, i64) -> i64
      %488 = func.call @cc_intern(%484, %487) : (i64, i64) -> i64
      %489 = func.call @cc_nil_value() : () -> i64
      %490 = func.call @cc_cons(%488, %489) : (i64, i64) -> i64
      %491 = func.call @cc_values_pack(%490) : (i64) -> i64
      func.call @stack_push_pointer(%488) : (i64) -> ()
      %492 = llvm.mlir.addressof @str65 : !llvm.ptr
      %493 = arith.constant 6 : i64
      %494 = func.call @cc_make_string(%492, %493) : (!llvm.ptr, i64) -> i64
      %495 = llvm.mlir.addressof @str66 : !llvm.ptr
      %496 = arith.constant 11 : i64
      %497 = func.call @cc_make_string(%495, %496) : (!llvm.ptr, i64) -> i64
      %498 = func.call @cc_intern(%494, %497) : (i64, i64) -> i64
      %499 = func.call @cc_nil_value() : () -> i64
      %500 = func.call @cc_cons(%498, %499) : (i64, i64) -> i64
      %501 = func.call @cc_values_pack(%500) : (i64) -> i64
      func.call @stack_push_pointer(%498) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %502 = func.call @stack_pop_pointer() : () -> i64
      %503 = func.call @stack_pop_pointer() : () -> i64
      %504 = func.call @cc_cons(%503, %502) : (i64, i64) -> i64
      func.call @stack_push_pointer(%504) : (i64) -> ()
      %505 = func.call @stack_pop_pointer() : () -> i64
      %506 = func.call @stack_pop_pointer() : () -> i64
      %507 = func.call @cc_cons(%506, %505) : (i64, i64) -> i64
      func.call @stack_push_pointer(%507) : (i64) -> ()
      %508 = llvm.mlir.addressof @str67 : !llvm.ptr
      %509 = arith.constant 4 : i64
      %510 = func.call @cc_make_string(%508, %509) : (!llvm.ptr, i64) -> i64
      %511 = llvm.mlir.addressof @str68 : !llvm.ptr
      %512 = arith.constant 11 : i64
      %513 = func.call @cc_make_string(%511, %512) : (!llvm.ptr, i64) -> i64
      %514 = func.call @cc_intern(%510, %513) : (i64, i64) -> i64
      %515 = func.call @cc_nil_value() : () -> i64
      %516 = func.call @cc_cons(%514, %515) : (i64, i64) -> i64
      %517 = func.call @cc_values_pack(%516) : (i64) -> i64
      func.call @stack_push_pointer(%514) : (i64) -> ()
      %518 = llvm.mlir.addressof @str69 : !llvm.ptr
      %519 = arith.constant 6 : i64
      %520 = func.call @cc_make_string(%518, %519) : (!llvm.ptr, i64) -> i64
      %521 = llvm.mlir.addressof @str70 : !llvm.ptr
      %522 = arith.constant 11 : i64
      %523 = func.call @cc_make_string(%521, %522) : (!llvm.ptr, i64) -> i64
      %524 = func.call @cc_intern(%520, %523) : (i64, i64) -> i64
      %525 = func.call @cc_nil_value() : () -> i64
      %526 = func.call @cc_cons(%524, %525) : (i64, i64) -> i64
      %527 = func.call @cc_values_pack(%526) : (i64) -> i64
      func.call @stack_push_pointer(%524) : (i64) -> ()
      %528 = llvm.mlir.addressof @str71 : !llvm.ptr
      %529 = arith.constant 4 : i64
      %530 = func.call @cc_make_string(%528, %529) : (!llvm.ptr, i64) -> i64
      %531 = llvm.mlir.addressof @str72 : !llvm.ptr
      %532 = arith.constant 11 : i64
      %533 = func.call @cc_make_string(%531, %532) : (!llvm.ptr, i64) -> i64
      %534 = func.call @cc_intern(%530, %533) : (i64, i64) -> i64
      %535 = func.call @cc_nil_value() : () -> i64
      %536 = func.call @cc_cons(%534, %535) : (i64, i64) -> i64
      %537 = func.call @cc_values_pack(%536) : (i64) -> i64
      func.call @stack_push_pointer(%534) : (i64) -> ()
      %538 = llvm.mlir.addressof @str73 : !llvm.ptr
      %539 = arith.constant 4 : i64
      %540 = func.call @cc_make_string(%538, %539) : (!llvm.ptr, i64) -> i64
      %541 = func.call @cc_nil_value() : () -> i64
      %542 = func.call @cc_intern(%540, %541) : (i64, i64) -> i64
      %543 = func.call @cc_nil_value() : () -> i64
      %544 = func.call @cc_cons(%542, %543) : (i64, i64) -> i64
      %545 = func.call @cc_values_pack(%544) : (i64) -> i64
      func.call @stack_push_pointer(%542) : (i64) -> ()
      %546 = llvm.mlir.addressof @str74 : !llvm.ptr
      %547 = arith.constant 9 : i64
      %548 = func.call @cc_make_string(%546, %547) : (!llvm.ptr, i64) -> i64
      %549 = llvm.mlir.addressof @str75 : !llvm.ptr
      %550 = arith.constant 7 : i64
      %551 = func.call @cc_make_string(%549, %550) : (!llvm.ptr, i64) -> i64
      %552 = func.call @cc_intern(%548, %551) : (i64, i64) -> i64
      %553 = func.call @cc_nil_value() : () -> i64
      %554 = func.call @cc_cons(%552, %553) : (i64, i64) -> i64
      %555 = func.call @cc_values_pack(%554) : (i64) -> i64
      func.call @stack_push_pointer(%552) : (i64) -> ()
      %556 = llvm.mlir.addressof @str76 : !llvm.ptr
      %557 = arith.constant 5 : i64
      %558 = func.call @cc_make_string(%556, %557) : (!llvm.ptr, i64) -> i64
      %559 = llvm.mlir.addressof @str77 : !llvm.ptr
      %560 = arith.constant 7 : i64
      %561 = func.call @cc_make_string(%559, %560) : (!llvm.ptr, i64) -> i64
      %562 = func.call @cc_intern(%558, %561) : (i64, i64) -> i64
      %563 = func.call @cc_nil_value() : () -> i64
      %564 = func.call @cc_cons(%562, %563) : (i64, i64) -> i64
      %565 = func.call @cc_values_pack(%564) : (i64) -> i64
      func.call @stack_push_pointer(%562) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %566 = func.call @stack_pop_pointer() : () -> i64
      %567 = func.call @stack_pop_pointer() : () -> i64
      %568 = func.call @cc_cons(%567, %566) : (i64, i64) -> i64
      func.call @stack_push_pointer(%568) : (i64) -> ()
      %569 = func.call @stack_pop_pointer() : () -> i64
      %570 = func.call @stack_pop_pointer() : () -> i64
      %571 = func.call @cc_cons(%570, %569) : (i64, i64) -> i64
      func.call @stack_push_pointer(%571) : (i64) -> ()
      %572 = func.call @stack_pop_pointer() : () -> i64
      %573 = func.call @stack_pop_pointer() : () -> i64
      %574 = func.call @cc_cons(%573, %572) : (i64, i64) -> i64
      func.call @stack_push_pointer(%574) : (i64) -> ()
      %575 = func.call @stack_pop_pointer() : () -> i64
      %576 = func.call @stack_pop_pointer() : () -> i64
      %577 = func.call @cc_cons(%576, %575) : (i64, i64) -> i64
      func.call @stack_push_pointer(%577) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %578 = func.call @stack_pop_pointer() : () -> i64
      %579 = func.call @stack_pop_pointer() : () -> i64
      %580 = func.call @cc_cons(%579, %578) : (i64, i64) -> i64
      func.call @stack_push_pointer(%580) : (i64) -> ()
      %581 = func.call @stack_pop_pointer() : () -> i64
      %582 = func.call @stack_pop_pointer() : () -> i64
      %583 = func.call @cc_cons(%582, %581) : (i64, i64) -> i64
      func.call @stack_push_pointer(%583) : (i64) -> ()
      %584 = func.call @stack_pop_pointer() : () -> i64
      %585 = func.call @stack_pop_pointer() : () -> i64
      %586 = func.call @cc_cons(%585, %584) : (i64, i64) -> i64
      func.call @stack_push_pointer(%586) : (i64) -> ()
      %587 = llvm.mlir.addressof @str78 : !llvm.ptr
      %588 = arith.constant 13 : i64
      %589 = func.call @cc_make_string(%587, %588) : (!llvm.ptr, i64) -> i64
      %590 = llvm.mlir.addressof @str79 : !llvm.ptr
      %591 = arith.constant 11 : i64
      %592 = func.call @cc_make_string(%590, %591) : (!llvm.ptr, i64) -> i64
      %593 = func.call @cc_intern(%589, %592) : (i64, i64) -> i64
      %594 = func.call @cc_nil_value() : () -> i64
      %595 = func.call @cc_cons(%593, %594) : (i64, i64) -> i64
      %596 = func.call @cc_values_pack(%595) : (i64) -> i64
      func.call @stack_push_pointer(%593) : (i64) -> ()
      %597 = llvm.mlir.addressof @str80 : !llvm.ptr
      %598 = arith.constant 6 : i64
      %599 = func.call @cc_make_string(%597, %598) : (!llvm.ptr, i64) -> i64
      %600 = func.call @cc_nil_value() : () -> i64
      %601 = func.call @cc_intern(%599, %600) : (i64, i64) -> i64
      %602 = func.call @cc_nil_value() : () -> i64
      %603 = func.call @cc_cons(%601, %602) : (i64, i64) -> i64
      %604 = func.call @cc_values_pack(%603) : (i64) -> i64
      func.call @stack_push_pointer(%601) : (i64) -> ()
      %605 = llvm.mlir.addressof @str81 : !llvm.ptr
      %606 = arith.constant 6 : i64
      %607 = func.call @cc_make_string(%605, %606) : (!llvm.ptr, i64) -> i64
      %608 = llvm.mlir.addressof @str82 : !llvm.ptr
      %609 = arith.constant 11 : i64
      %610 = func.call @cc_make_string(%608, %609) : (!llvm.ptr, i64) -> i64
      %611 = func.call @cc_intern(%607, %610) : (i64, i64) -> i64
      %612 = func.call @cc_nil_value() : () -> i64
      %613 = func.call @cc_cons(%611, %612) : (i64, i64) -> i64
      %614 = func.call @cc_values_pack(%613) : (i64) -> i64
      func.call @stack_push_pointer(%611) : (i64) -> ()
      %615 = llvm.mlir.addressof @str83 : !llvm.ptr
      %616 = arith.constant 5 : i64
      %617 = func.call @cc_make_string(%615, %616) : (!llvm.ptr, i64) -> i64
      %618 = llvm.mlir.addressof @str84 : !llvm.ptr
      %619 = arith.constant 7 : i64
      %620 = func.call @cc_make_string(%618, %619) : (!llvm.ptr, i64) -> i64
      %621 = func.call @cc_intern(%617, %620) : (i64, i64) -> i64
      %622 = func.call @cc_nil_value() : () -> i64
      %623 = func.call @cc_cons(%621, %622) : (i64, i64) -> i64
      %624 = func.call @cc_values_pack(%623) : (i64) -> i64
      func.call @stack_push_pointer(%621) : (i64) -> ()
      %625 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%625) : (i64) -> ()
      %626 = llvm.mlir.addressof @str85 : !llvm.ptr
      %627 = arith.constant 3 : i64
      %628 = func.call @cc_make_string(%626, %627) : (!llvm.ptr, i64) -> i64
      %629 = llvm.mlir.addressof @str86 : !llvm.ptr
      %630 = arith.constant 7 : i64
      %631 = func.call @cc_make_string(%629, %630) : (!llvm.ptr, i64) -> i64
      %632 = func.call @cc_intern(%628, %631) : (i64, i64) -> i64
      %633 = func.call @cc_nil_value() : () -> i64
      %634 = func.call @cc_cons(%632, %633) : (i64, i64) -> i64
      %635 = func.call @cc_values_pack(%634) : (i64) -> i64
      func.call @stack_push_pointer(%632) : (i64) -> ()
      %636 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%636) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %637 = func.call @stack_pop_pointer() : () -> i64
      %638 = func.call @stack_pop_pointer() : () -> i64
      %639 = func.call @cc_cons(%638, %637) : (i64, i64) -> i64
      func.call @stack_push_pointer(%639) : (i64) -> ()
      %640 = func.call @stack_pop_pointer() : () -> i64
      %641 = func.call @stack_pop_pointer() : () -> i64
      %642 = func.call @cc_cons(%641, %640) : (i64, i64) -> i64
      func.call @stack_push_pointer(%642) : (i64) -> ()
      %643 = func.call @stack_pop_pointer() : () -> i64
      %644 = func.call @stack_pop_pointer() : () -> i64
      %645 = func.call @cc_cons(%644, %643) : (i64, i64) -> i64
      func.call @stack_push_pointer(%645) : (i64) -> ()
      %646 = func.call @stack_pop_pointer() : () -> i64
      %647 = func.call @stack_pop_pointer() : () -> i64
      %648 = func.call @cc_cons(%647, %646) : (i64, i64) -> i64
      func.call @stack_push_pointer(%648) : (i64) -> ()
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
      %658 = llvm.mlir.addressof @str87 : !llvm.ptr
      %659 = arith.constant 5 : i64
      %660 = func.call @cc_make_string(%658, %659) : (!llvm.ptr, i64) -> i64
      %661 = llvm.mlir.addressof @str88 : !llvm.ptr
      %662 = arith.constant 11 : i64
      %663 = func.call @cc_make_string(%661, %662) : (!llvm.ptr, i64) -> i64
      %664 = func.call @cc_intern(%660, %663) : (i64, i64) -> i64
      %665 = func.call @cc_nil_value() : () -> i64
      %666 = func.call @cc_cons(%664, %665) : (i64, i64) -> i64
      %667 = func.call @cc_values_pack(%666) : (i64) -> i64
      func.call @stack_push_pointer(%664) : (i64) -> ()
      %668 = llvm.mlir.addressof @str89 : !llvm.ptr
      %669 = arith.constant 6 : i64
      %670 = func.call @cc_make_string(%668, %669) : (!llvm.ptr, i64) -> i64
      %671 = llvm.mlir.addressof @str90 : !llvm.ptr
      %672 = arith.constant 11 : i64
      %673 = func.call @cc_make_string(%671, %672) : (!llvm.ptr, i64) -> i64
      %674 = func.call @cc_intern(%670, %673) : (i64, i64) -> i64
      %675 = func.call @cc_nil_value() : () -> i64
      %676 = func.call @cc_cons(%674, %675) : (i64, i64) -> i64
      %677 = func.call @cc_values_pack(%676) : (i64) -> i64
      func.call @stack_push_pointer(%674) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %678 = func.call @stack_pop_pointer() : () -> i64
      %679 = func.call @stack_pop_pointer() : () -> i64
      %680 = func.call @cc_cons(%679, %678) : (i64, i64) -> i64
      func.call @stack_push_pointer(%680) : (i64) -> ()
      %681 = func.call @stack_pop_pointer() : () -> i64
      %682 = func.call @stack_pop_pointer() : () -> i64
      %683 = func.call @cc_cons(%682, %681) : (i64, i64) -> i64
      func.call @stack_push_pointer(%683) : (i64) -> ()
      %684 = llvm.mlir.addressof @str91 : !llvm.ptr
      %685 = arith.constant 11 : i64
      %686 = func.call @cc_make_string(%684, %685) : (!llvm.ptr, i64) -> i64
      %687 = llvm.mlir.addressof @str92 : !llvm.ptr
      %688 = arith.constant 11 : i64
      %689 = func.call @cc_make_string(%687, %688) : (!llvm.ptr, i64) -> i64
      %690 = func.call @cc_intern(%686, %689) : (i64, i64) -> i64
      %691 = func.call @cc_nil_value() : () -> i64
      %692 = func.call @cc_cons(%690, %691) : (i64, i64) -> i64
      %693 = func.call @cc_values_pack(%692) : (i64) -> i64
      func.call @stack_push_pointer(%690) : (i64) -> ()
      %694 = llvm.mlir.addressof @str93 : !llvm.ptr
      %695 = arith.constant 4 : i64
      %696 = func.call @cc_make_string(%694, %695) : (!llvm.ptr, i64) -> i64
      %697 = func.call @cc_nil_value() : () -> i64
      %698 = func.call @cc_intern(%696, %697) : (i64, i64) -> i64
      %699 = func.call @cc_nil_value() : () -> i64
      %700 = func.call @cc_cons(%698, %699) : (i64, i64) -> i64
      %701 = func.call @cc_values_pack(%700) : (i64) -> i64
      func.call @stack_push_pointer(%698) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %702 = func.call @stack_pop_pointer() : () -> i64
      %703 = func.call @stack_pop_pointer() : () -> i64
      %704 = func.call @cc_cons(%703, %702) : (i64, i64) -> i64
      func.call @stack_push_pointer(%704) : (i64) -> ()
      %705 = func.call @stack_pop_pointer() : () -> i64
      %706 = func.call @stack_pop_pointer() : () -> i64
      %707 = func.call @cc_cons(%706, %705) : (i64, i64) -> i64
      func.call @stack_push_pointer(%707) : (i64) -> ()
      %708 = llvm.mlir.addressof @str94 : !llvm.ptr
      %709 = arith.constant 6 : i64
      %710 = func.call @cc_make_string(%708, %709) : (!llvm.ptr, i64) -> i64
      %711 = func.call @cc_nil_value() : () -> i64
      %712 = func.call @cc_intern(%710, %711) : (i64, i64) -> i64
      %713 = func.call @cc_nil_value() : () -> i64
      %714 = func.call @cc_cons(%712, %713) : (i64, i64) -> i64
      %715 = func.call @cc_values_pack(%714) : (i64) -> i64
      func.call @stack_push_pointer(%712) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %716 = func.call @stack_pop_pointer() : () -> i64
      %717 = func.call @stack_pop_pointer() : () -> i64
      %718 = func.call @cc_cons(%717, %716) : (i64, i64) -> i64
      func.call @stack_push_pointer(%718) : (i64) -> ()
      %719 = func.call @stack_pop_pointer() : () -> i64
      %720 = func.call @stack_pop_pointer() : () -> i64
      %721 = func.call @cc_cons(%720, %719) : (i64, i64) -> i64
      func.call @stack_push_pointer(%721) : (i64) -> ()
      %722 = func.call @stack_pop_pointer() : () -> i64
      %723 = func.call @stack_pop_pointer() : () -> i64
      %724 = func.call @cc_cons(%723, %722) : (i64, i64) -> i64
      func.call @stack_push_pointer(%724) : (i64) -> ()
      %725 = func.call @stack_pop_pointer() : () -> i64
      %726 = func.call @stack_pop_pointer() : () -> i64
      %727 = func.call @cc_cons(%726, %725) : (i64, i64) -> i64
      func.call @stack_push_pointer(%727) : (i64) -> ()
      %728 = func.call @stack_pop_pointer() : () -> i64
      %729 = func.call @stack_pop_pointer() : () -> i64
      %730 = func.call @cc_cons(%729, %728) : (i64, i64) -> i64
      func.call @stack_push_pointer(%730) : (i64) -> ()
      %731 = func.call @stack_pop_pointer() : () -> i64
      %732 = func.call @stack_pop_pointer() : () -> i64
      %733 = func.call @cc_cons(%732, %731) : (i64, i64) -> i64
      func.call @stack_push_pointer(%733) : (i64) -> ()
      %734 = func.call @stack_pop_pointer() : () -> i64
      %735 = func.call @stack_pop_pointer() : () -> i64
      %736 = func.call @cc_cons(%735, %734) : (i64, i64) -> i64
      func.call @stack_push_pointer(%736) : (i64) -> ()
      %737 = func.call @stack_pop_pointer() : () -> i64
      %738 = func.call @stack_pop_pointer() : () -> i64
      %739 = func.call @cc_cons(%738, %737) : (i64, i64) -> i64
      func.call @stack_push_pointer(%739) : (i64) -> ()
      %740 = func.call @stack_pop_pointer() : () -> i64
      %741 = func.call @stack_pop_pointer() : () -> i64
      %742 = func.call @cc_cons(%741, %740) : (i64, i64) -> i64
      func.call @stack_push_pointer(%742) : (i64) -> ()
      %743 = func.call @stack_pop_pointer() : () -> i64
      %744 = func.call @stack_pop_pointer() : () -> i64
      %745 = func.call @cc_cons(%744, %743) : (i64, i64) -> i64
      func.call @stack_push_pointer(%745) : (i64) -> ()
      %746 = func.call @stack_pop_pointer() : () -> i64
      %747 = func.call @stack_pop_pointer() : () -> i64
      %748 = func.call @cc_cons(%747, %746) : (i64, i64) -> i64
      func.call @stack_push_pointer(%748) : (i64) -> ()
      %749 = func.call @stack_pop_pointer() : () -> i64
      %750 = func.call @stack_pop_pointer() : () -> i64
      %751 = func.call @cc_cons(%750, %749) : (i64, i64) -> i64
      func.call @stack_push_pointer(%751) : (i64) -> ()
      %752 = func.call @stack_pop_pointer() : () -> i64
      %1249 = arith.constant 224441132908544 : i64
      %1250 = arith.constant 0 : i64
      %1251 = func.call @cc_make_closure(%1249, %1250) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1251) : (i64) -> ()
      %1252 = func.call @stack_pop_pointer() : () -> i64
      %1253 = llvm.mlir.addressof @str141 : !llvm.ptr
      %1254 = arith.constant 3 : i64
      %1255 = func.call @cc_make_string(%1253, %1254) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%1255) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1256 = func.call @stack_pop_pointer() : () -> i64
      %1257 = func.call @stack_pop_pointer() : () -> i64
      %1258 = func.call @cc_cons(%1257, %1256) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1258) : (i64) -> ()
      %1259 = func.call @stack_pop_pointer() : () -> i64
      %1260 = llvm.mlir.addressof @str142 : !llvm.ptr
      %1261 = arith.constant 11 : i64
      %1262 = func.call @cc_make_string(%1260, %1261) : (!llvm.ptr, i64) -> i64
      %1263 = llvm.mlir.addressof @str143 : !llvm.ptr
      %1264 = arith.constant 7 : i64
      %1265 = func.call @cc_make_string(%1263, %1264) : (!llvm.ptr, i64) -> i64
      %1266 = func.call @cc_intern(%1262, %1265) : (i64, i64) -> i64
      %1267 = func.call @cc_nil_value() : () -> i64
      %1268 = func.call @cc_cons(%1266, %1267) : (i64, i64) -> i64
      %1269 = func.call @cc_values_pack(%1268) : (i64) -> i64
      func.call @stack_push_pointer(%1266) : (i64) -> ()
      %1270 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %1271 = func.call @stack_pop_pointer() : () -> i64
      %1272 = llvm.mlir.addressof @str144 : !llvm.ptr
      %1273 = arith.constant 4 : i64
      %1274 = func.call @cc_make_string(%1272, %1273) : (!llvm.ptr, i64) -> i64
      %1275 = llvm.mlir.addressof @str145 : !llvm.ptr
      %1276 = arith.constant 7 : i64
      %1277 = func.call @cc_make_string(%1275, %1276) : (!llvm.ptr, i64) -> i64
      %1278 = func.call @cc_intern(%1274, %1277) : (i64, i64) -> i64
      %1279 = func.call @cc_nil_value() : () -> i64
      %1280 = func.call @cc_cons(%1278, %1279) : (i64, i64) -> i64
      %1281 = func.call @cc_values_pack(%1280) : (i64) -> i64
      func.call @stack_push_pointer(%1278) : (i64) -> ()
      %1282 = func.call @stack_pop_pointer() : () -> i64
      %1283 = llvm.mlir.addressof @str146 : !llvm.ptr
      %1284 = arith.constant 6 : i64
      %1285 = func.call @cc_make_string(%1283, %1284) : (!llvm.ptr, i64) -> i64
      %1286 = func.call @cc_nil_value() : () -> i64
      %1287 = func.call @cc_intern(%1285, %1286) : (i64, i64) -> i64
      %1288 = func.call @cc_nil_value() : () -> i64
      %1289 = func.call @cc_cons(%1287, %1288) : (i64, i64) -> i64
      %1290 = func.call @cc_values_pack(%1289) : (i64) -> i64
      func.call @stack_push_pointer(%1287) : (i64) -> ()
      %1291 = func.call @stack_pop_pointer() : () -> i64
      %1292 = func.call @cc_nil_value() : () -> i64
      %1293 = func.call @cc_errorp(%48) : (i64) -> i64
      %1294 = arith.cmpi ne, %1293, %1292 : i64
      %1295 = arith.cmpi eq, %1292, %1292 : i64
      %1296 = arith.andi %1294, %1295 : i1
      %1297 = scf.if %1296 -> (i64) {
        scf.yield %48 : i64
      } else {
        scf.yield %1292 : i64
      }
      %1298 = func.call @cc_errorp(%752) : (i64) -> i64
      %1299 = arith.cmpi ne, %1298, %1292 : i64
      %1300 = arith.cmpi eq, %1297, %1292 : i64
      %1301 = arith.andi %1299, %1300 : i1
      %1302 = scf.if %1301 -> (i64) {
        scf.yield %752 : i64
      } else {
        scf.yield %1297 : i64
      }
      %1303 = func.call @cc_errorp(%1252) : (i64) -> i64
      %1304 = arith.cmpi ne, %1303, %1292 : i64
      %1305 = arith.cmpi eq, %1302, %1292 : i64
      %1306 = arith.andi %1304, %1305 : i1
      %1307 = scf.if %1306 -> (i64) {
        scf.yield %1252 : i64
      } else {
        scf.yield %1302 : i64
      }
      %1308 = func.call @cc_errorp(%1259) : (i64) -> i64
      %1309 = arith.cmpi ne, %1308, %1292 : i64
      %1310 = arith.cmpi eq, %1307, %1292 : i64
      %1311 = arith.andi %1309, %1310 : i1
      %1312 = scf.if %1311 -> (i64) {
        scf.yield %1259 : i64
      } else {
        scf.yield %1307 : i64
      }
      %1313 = func.call @cc_errorp(%1270) : (i64) -> i64
      %1314 = arith.cmpi ne, %1313, %1292 : i64
      %1315 = arith.cmpi eq, %1312, %1292 : i64
      %1316 = arith.andi %1314, %1315 : i1
      %1317 = scf.if %1316 -> (i64) {
        scf.yield %1270 : i64
      } else {
        scf.yield %1312 : i64
      }
      %1318 = func.call @cc_errorp(%1271) : (i64) -> i64
      %1319 = arith.cmpi ne, %1318, %1292 : i64
      %1320 = arith.cmpi eq, %1317, %1292 : i64
      %1321 = arith.andi %1319, %1320 : i1
      %1322 = scf.if %1321 -> (i64) {
        scf.yield %1271 : i64
      } else {
        scf.yield %1317 : i64
      }
      %1323 = func.call @cc_errorp(%1282) : (i64) -> i64
      %1324 = arith.cmpi ne, %1323, %1292 : i64
      %1325 = arith.cmpi eq, %1322, %1292 : i64
      %1326 = arith.andi %1324, %1325 : i1
      %1327 = scf.if %1326 -> (i64) {
        scf.yield %1282 : i64
      } else {
        scf.yield %1322 : i64
      }
      %1328 = func.call @cc_errorp(%1291) : (i64) -> i64
      %1329 = arith.cmpi ne, %1328, %1292 : i64
      %1330 = arith.cmpi eq, %1327, %1292 : i64
      %1331 = arith.andi %1329, %1330 : i1
      %1332 = scf.if %1331 -> (i64) {
        scf.yield %1291 : i64
      } else {
        scf.yield %1327 : i64
      }
      %1333 = arith.cmpi ne, %1332, %1292 : i64
      scf.if %1333 {
        func.call @stack_push_pointer(%1332) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%48) : (i64) -> ()
        func.call @stack_push_pointer(%752) : (i64) -> ()
        func.call @stack_push_pointer(%1252) : (i64) -> ()
        func.call @stack_push_pointer(%1259) : (i64) -> ()
        func.call @stack_push_pointer(%1270) : (i64) -> ()
        func.call @stack_push_pointer(%1271) : (i64) -> ()
        func.call @stack_push_pointer(%1282) : (i64) -> ()
        func.call @stack_push_pointer(%1291) : (i64) -> ()
        %1334 = llvm.mlir.addressof @str147 : !llvm.ptr
        %1335 = func.call @cc_make_function_ref_const(%1334) : (!llvm.ptr) -> i64
        %1336 = arith.constant 8 : i64
        func.call @cc_funcall_stack(%1335, %1336) : (i64, i64) -> ()
      }
      %1337 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1337 : i64
    }
    %1338 = func.call @cc_nil_value() : () -> i64
    %1339 = func.call @cc_errorp(%39) : (i64) -> i64
    %1340 = arith.cmpi ne, %1339, %1338 : i64
    %1341 = scf.if %1340 -> (i64) {
      scf.yield %39 : i64
    } else {
      %1342 = func.call @cc_nil_value() : () -> i64
      %1343 = arith.cmpi ne, %1342, %1342 : i64
      scf.if %1343 {
        func.call @stack_push_pointer(%1342) : (i64) -> ()
      } else {
        %1344 = llvm.mlir.addressof @str148 : !llvm.ptr
        %1345 = func.call @cc_make_function_ref_const(%1344) : (!llvm.ptr) -> i64
        %1346 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1345, %1346) : (i64, i64) -> ()
      }
      %1347 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1347 : i64
    }
    func.call @stack_push_pointer(%1341) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_224441132908544"() {
    %753 = func.call @cc_nil_value() : () -> i64
    %754 = func.call @cc_nil_value() : () -> i64
    %755 = func.call @cc_errorp(%753) : (i64) -> i64
    %756 = arith.cmpi ne, %755, %754 : i64
    %757 = scf.if %756 -> (i64) {
      scf.yield %753 : i64
    } else {
      %758 = llvm.mlir.addressof @str95 : !llvm.ptr
      %759 = arith.constant 11 : i64
      %760 = func.call @cc_make_string(%758, %759) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%760) : (i64) -> ()
      %761 = func.call @stack_pop_pointer() : () -> i64
      %762 = func.call @cc_nil_value() : () -> i64
      %763 = func.call @cc_errorp(%761) : (i64) -> i64
      %764 = arith.cmpi ne, %763, %762 : i64
      %765 = arith.cmpi eq, %762, %762 : i64
      %766 = arith.andi %764, %765 : i1
      %767 = scf.if %766 -> (i64) {
        scf.yield %761 : i64
      } else {
        scf.yield %762 : i64
      }
      %768 = arith.cmpi ne, %767, %762 : i64
      scf.if %768 {
        func.call @stack_push_pointer(%767) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%761) : (i64) -> ()
        %769 = llvm.mlir.addressof @str96 : !llvm.ptr
        %770 = func.call @cc_make_function_ref_const(%769) : (!llvm.ptr) -> i64
        %771 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%770, %771) : (i64, i64) -> ()
      }
      %772 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%772) : (i64) -> ()
      %773 = func.call @stack_pop_pointer() : () -> i64
      %774 = llvm.mlir.addressof @str97 : !llvm.ptr
      %775 = arith.constant 17 : i64
      %776 = func.call @cc_make_string(%774, %775) : (!llvm.ptr, i64) -> i64
      %777 = llvm.mlir.addressof @str98 : !llvm.ptr
      %778 = arith.constant 7 : i64
      %779 = func.call @cc_make_string(%777, %778) : (!llvm.ptr, i64) -> i64
      %780 = func.call @cc_intern(%776, %779) : (i64, i64) -> i64
      %781 = func.call @cc_nil_value() : () -> i64
      %782 = func.call @cc_cons(%780, %781) : (i64, i64) -> i64
      %783 = func.call @cc_values_pack(%782) : (i64) -> i64
      func.call @stack_push_pointer(%780) : (i64) -> ()
      %784 = func.call @stack_pop_pointer() : () -> i64
      %785 = llvm.mlir.addressof @str99 : !llvm.ptr
      %786 = arith.constant 6 : i64
      %787 = func.call @cc_make_string(%785, %786) : (!llvm.ptr, i64) -> i64
      %788 = llvm.mlir.addressof @str100 : !llvm.ptr
      %789 = arith.constant 7 : i64
      %790 = func.call @cc_make_string(%788, %789) : (!llvm.ptr, i64) -> i64
      %791 = func.call @cc_intern(%787, %790) : (i64, i64) -> i64
      %792 = func.call @cc_nil_value() : () -> i64
      %793 = func.call @cc_cons(%791, %792) : (i64, i64) -> i64
      %794 = func.call @cc_values_pack(%793) : (i64) -> i64
      func.call @stack_push_pointer(%791) : (i64) -> ()
      %795 = func.call @stack_pop_pointer() : () -> i64
      %796 = llvm.mlir.addressof @str101 : !llvm.ptr
      %797 = arith.constant 9 : i64
      %798 = func.call @cc_make_string(%796, %797) : (!llvm.ptr, i64) -> i64
      %799 = llvm.mlir.addressof @str102 : !llvm.ptr
      %800 = arith.constant 7 : i64
      %801 = func.call @cc_make_string(%799, %800) : (!llvm.ptr, i64) -> i64
      %802 = func.call @cc_intern(%798, %801) : (i64, i64) -> i64
      %803 = func.call @cc_nil_value() : () -> i64
      %804 = func.call @cc_cons(%802, %803) : (i64, i64) -> i64
      %805 = func.call @cc_values_pack(%804) : (i64) -> i64
      func.call @stack_push_pointer(%802) : (i64) -> ()
      %806 = func.call @stack_pop_pointer() : () -> i64
      %807 = llvm.mlir.addressof @str103 : !llvm.ptr
      %808 = arith.constant 6 : i64
      %809 = func.call @cc_make_string(%807, %808) : (!llvm.ptr, i64) -> i64
      %810 = llvm.mlir.addressof @str104 : !llvm.ptr
      %811 = arith.constant 7 : i64
      %812 = func.call @cc_make_string(%810, %811) : (!llvm.ptr, i64) -> i64
      %813 = func.call @cc_intern(%809, %812) : (i64, i64) -> i64
      %814 = func.call @cc_nil_value() : () -> i64
      %815 = func.call @cc_cons(%813, %814) : (i64, i64) -> i64
      %816 = func.call @cc_values_pack(%815) : (i64) -> i64
      func.call @stack_push_pointer(%813) : (i64) -> ()
      %817 = func.call @stack_pop_pointer() : () -> i64
      %818 = func.call @cc_nil_value() : () -> i64
      %819 = func.call @cc_errorp(%773) : (i64) -> i64
      %820 = arith.cmpi ne, %819, %818 : i64
      %821 = arith.cmpi eq, %818, %818 : i64
      %822 = arith.andi %820, %821 : i1
      %823 = scf.if %822 -> (i64) {
        scf.yield %773 : i64
      } else {
        scf.yield %818 : i64
      }
      %824 = func.call @cc_errorp(%784) : (i64) -> i64
      %825 = arith.cmpi ne, %824, %818 : i64
      %826 = arith.cmpi eq, %823, %818 : i64
      %827 = arith.andi %825, %826 : i1
      %828 = scf.if %827 -> (i64) {
        scf.yield %784 : i64
      } else {
        scf.yield %823 : i64
      }
      %829 = func.call @cc_errorp(%795) : (i64) -> i64
      %830 = arith.cmpi ne, %829, %818 : i64
      %831 = arith.cmpi eq, %828, %818 : i64
      %832 = arith.andi %830, %831 : i1
      %833 = scf.if %832 -> (i64) {
        scf.yield %795 : i64
      } else {
        scf.yield %828 : i64
      }
      %834 = func.call @cc_errorp(%806) : (i64) -> i64
      %835 = arith.cmpi ne, %834, %818 : i64
      %836 = arith.cmpi eq, %833, %818 : i64
      %837 = arith.andi %835, %836 : i1
      %838 = scf.if %837 -> (i64) {
        scf.yield %806 : i64
      } else {
        scf.yield %833 : i64
      }
      %839 = func.call @cc_errorp(%817) : (i64) -> i64
      %840 = arith.cmpi ne, %839, %818 : i64
      %841 = arith.cmpi eq, %838, %818 : i64
      %842 = arith.andi %840, %841 : i1
      %843 = scf.if %842 -> (i64) {
        scf.yield %817 : i64
      } else {
        scf.yield %838 : i64
      }
      %844 = arith.cmpi ne, %843, %818 : i64
      scf.if %844 {
        func.call @stack_push_pointer(%843) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%773) : (i64) -> ()
        func.call @stack_push_pointer(%784) : (i64) -> ()
        func.call @stack_push_pointer(%795) : (i64) -> ()
        func.call @stack_push_pointer(%806) : (i64) -> ()
        func.call @stack_push_pointer(%817) : (i64) -> ()
        %845 = llvm.mlir.addressof @str105 : !llvm.ptr
        %846 = func.call @cc_make_function_ref_const(%845) : (!llvm.ptr) -> i64
        %847 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%846, %847) : (i64, i64) -> ()
      }
      %848 = func.call @stack_pop_pointer() : () -> i64
      %849 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%849) : (i64) -> ()
      %850 = func.call @stack_pop_pointer() : () -> i64
      %851 = llvm.mlir.addressof @str106 : !llvm.ptr
      %852 = arith.constant 12 : i64
      %853 = func.call @cc_make_string(%851, %852) : (!llvm.ptr, i64) -> i64
      %854 = llvm.mlir.addressof @str107 : !llvm.ptr
      %855 = arith.constant 7 : i64
      %856 = func.call @cc_make_string(%854, %855) : (!llvm.ptr, i64) -> i64
      %857 = func.call @cc_intern(%853, %856) : (i64, i64) -> i64
      %858 = func.call @cc_nil_value() : () -> i64
      %859 = func.call @cc_cons(%857, %858) : (i64, i64) -> i64
      %860 = func.call @cc_values_pack(%859) : (i64) -> i64
      func.call @stack_push_pointer(%857) : (i64) -> ()
      %861 = func.call @stack_pop_pointer() : () -> i64
      %862 = llvm.mlir.addressof @str108 : !llvm.ptr
      %863 = arith.constant 9 : i64
      %864 = func.call @cc_make_string(%862, %863) : (!llvm.ptr, i64) -> i64
      %865 = llvm.mlir.addressof @str109 : !llvm.ptr
      %866 = arith.constant 11 : i64
      %867 = func.call @cc_make_string(%865, %866) : (!llvm.ptr, i64) -> i64
      %868 = func.call @cc_intern(%864, %867) : (i64, i64) -> i64
      %869 = func.call @cc_nil_value() : () -> i64
      %870 = func.call @cc_cons(%868, %869) : (i64, i64) -> i64
      %871 = func.call @cc_values_pack(%870) : (i64) -> i64
      func.call @stack_push_pointer(%868) : (i64) -> ()
      %872 = func.call @stack_pop_pointer() : () -> i64
      %873 = func.call @cc_nil_value() : () -> i64
      %874 = func.call @cc_errorp(%850) : (i64) -> i64
      %875 = arith.cmpi ne, %874, %873 : i64
      %876 = arith.cmpi eq, %873, %873 : i64
      %877 = arith.andi %875, %876 : i1
      %878 = scf.if %877 -> (i64) {
        scf.yield %850 : i64
      } else {
        scf.yield %873 : i64
      }
      %879 = func.call @cc_errorp(%861) : (i64) -> i64
      %880 = arith.cmpi ne, %879, %873 : i64
      %881 = arith.cmpi eq, %878, %873 : i64
      %882 = arith.andi %880, %881 : i1
      %883 = scf.if %882 -> (i64) {
        scf.yield %861 : i64
      } else {
        scf.yield %878 : i64
      }
      %884 = func.call @cc_errorp(%872) : (i64) -> i64
      %885 = arith.cmpi ne, %884, %873 : i64
      %886 = arith.cmpi eq, %883, %873 : i64
      %887 = arith.andi %885, %886 : i1
      %888 = scf.if %887 -> (i64) {
        scf.yield %872 : i64
      } else {
        scf.yield %883 : i64
      }
      %889 = arith.cmpi ne, %888, %873 : i64
      scf.if %889 {
        func.call @stack_push_pointer(%888) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%850) : (i64) -> ()
        func.call @stack_push_pointer(%861) : (i64) -> ()
        func.call @stack_push_pointer(%872) : (i64) -> ()
        %890 = llvm.mlir.addressof @str110 : !llvm.ptr
        %891 = func.call @cc_make_function_ref_const(%890) : (!llvm.ptr) -> i64
        %892 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%891, %892) : (i64, i64) -> ()
      }
      %893 = func.call @stack_pop_pointer() : () -> i64
      %894 = func.call @cc_nil_value() : () -> i64
      %895 = func.call @cc_nil_value() : () -> i64
      %896 = func.call @cc_errorp(%894) : (i64) -> i64
      %897 = arith.cmpi ne, %896, %895 : i64
      %898:2 = scf.if %897 -> (i64, i64) {
        scf.yield %894, %848 : i64, i64
      } else {
        %899 = llvm.mlir.addressof @str111 : !llvm.ptr
        %900 = arith.constant 3 : i64
        %901 = func.call @cc_make_string(%899, %900) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%901) : (i64) -> ()
        %902 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%848) : (i64) -> ()
        %903 = func.call @stack_pop_pointer() : () -> i64
        %904 = func.call @cc_nil_value() : () -> i64
        %905 = func.call @cc_errorp(%902) : (i64) -> i64
        %906 = arith.cmpi ne, %905, %904 : i64
        %907 = arith.cmpi eq, %904, %904 : i64
        %908 = arith.andi %906, %907 : i1
        %909 = scf.if %908 -> (i64) {
          scf.yield %902 : i64
        } else {
          scf.yield %904 : i64
        }
        %910 = func.call @cc_errorp(%903) : (i64) -> i64
        %911 = arith.cmpi ne, %910, %904 : i64
        %912 = arith.cmpi eq, %909, %904 : i64
        %913 = arith.andi %911, %912 : i1
        %914 = scf.if %913 -> (i64) {
          scf.yield %903 : i64
        } else {
          scf.yield %909 : i64
        }
        %915 = arith.cmpi ne, %914, %904 : i64
        scf.if %915 {
          func.call @stack_push_pointer(%914) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%902) : (i64) -> ()
          func.call @stack_push_pointer(%903) : (i64) -> ()
          %916 = llvm.mlir.addressof @str112 : !llvm.ptr
          %917 = func.call @cc_make_function_ref_const(%916) : (!llvm.ptr) -> i64
          %918 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%917, %918) : (i64, i64) -> ()
        }
        %919 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %919, %848 : i64, i64
      }
      %920 = func.call @cc_nil_value() : () -> i64
      %921 = func.call @cc_errorp(%898#0) : (i64) -> i64
      %922 = arith.cmpi ne, %921, %920 : i64
      %923:2 = scf.if %922 -> (i64, i64) {
        scf.yield %898#0, %898#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%898#1) : (i64) -> ()
        %924 = func.call @stack_pop_pointer() : () -> i64
        %925 = func.call @cc_nil_value() : () -> i64
        %926 = func.call @cc_errorp(%924) : (i64) -> i64
        %927 = arith.cmpi ne, %926, %925 : i64
        %928 = arith.cmpi eq, %925, %925 : i64
        %929 = arith.andi %927, %928 : i1
        %930 = scf.if %929 -> (i64) {
          scf.yield %924 : i64
        } else {
          scf.yield %925 : i64
        }
        %931 = arith.cmpi ne, %930, %925 : i64
        scf.if %931 {
          func.call @stack_push_pointer(%930) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%924) : (i64) -> ()
          %932 = llvm.mlir.addressof @str113 : !llvm.ptr
          %933 = func.call @cc_make_function_ref_const(%932) : (!llvm.ptr) -> i64
          %934 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%933, %934) : (i64, i64) -> ()
        }
        %935 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %935, %898#1 : i64, i64
      }
      %936 = func.call @cc_nil_value() : () -> i64
      %937 = func.call @cc_errorp(%923#0) : (i64) -> i64
      %938 = arith.cmpi ne, %937, %936 : i64
      %939:2 = scf.if %938 -> (i64, i64) {
        scf.yield %923#0, %923#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%772) : (i64) -> ()
        %940 = func.call @stack_pop_pointer() : () -> i64
        %941 = llvm.mlir.addressof @str114 : !llvm.ptr
        %942 = arith.constant 17 : i64
        %943 = func.call @cc_make_string(%941, %942) : (!llvm.ptr, i64) -> i64
        %944 = llvm.mlir.addressof @str115 : !llvm.ptr
        %945 = arith.constant 7 : i64
        %946 = func.call @cc_make_string(%944, %945) : (!llvm.ptr, i64) -> i64
        %947 = func.call @cc_intern(%943, %946) : (i64, i64) -> i64
        %948 = func.call @cc_nil_value() : () -> i64
        %949 = func.call @cc_cons(%947, %948) : (i64, i64) -> i64
        %950 = func.call @cc_values_pack(%949) : (i64) -> i64
        func.call @stack_push_pointer(%947) : (i64) -> ()
        %951 = func.call @stack_pop_pointer() : () -> i64
        %952 = llvm.mlir.addressof @str116 : !llvm.ptr
        %953 = arith.constant 6 : i64
        %954 = func.call @cc_make_string(%952, %953) : (!llvm.ptr, i64) -> i64
        %955 = llvm.mlir.addressof @str117 : !llvm.ptr
        %956 = arith.constant 7 : i64
        %957 = func.call @cc_make_string(%955, %956) : (!llvm.ptr, i64) -> i64
        %958 = func.call @cc_intern(%954, %957) : (i64, i64) -> i64
        %959 = func.call @cc_nil_value() : () -> i64
        %960 = func.call @cc_cons(%958, %959) : (i64, i64) -> i64
        %961 = func.call @cc_values_pack(%960) : (i64) -> i64
        func.call @stack_push_pointer(%958) : (i64) -> ()
        %962 = func.call @stack_pop_pointer() : () -> i64
        %963 = llvm.mlir.addressof @str118 : !llvm.ptr
        %964 = arith.constant 9 : i64
        %965 = func.call @cc_make_string(%963, %964) : (!llvm.ptr, i64) -> i64
        %966 = llvm.mlir.addressof @str119 : !llvm.ptr
        %967 = arith.constant 7 : i64
        %968 = func.call @cc_make_string(%966, %967) : (!llvm.ptr, i64) -> i64
        %969 = func.call @cc_intern(%965, %968) : (i64, i64) -> i64
        %970 = func.call @cc_nil_value() : () -> i64
        %971 = func.call @cc_cons(%969, %970) : (i64, i64) -> i64
        %972 = func.call @cc_values_pack(%971) : (i64) -> i64
        func.call @stack_push_pointer(%969) : (i64) -> ()
        %973 = func.call @stack_pop_pointer() : () -> i64
        %974 = llvm.mlir.addressof @str120 : !llvm.ptr
        %975 = arith.constant 9 : i64
        %976 = func.call @cc_make_string(%974, %975) : (!llvm.ptr, i64) -> i64
        %977 = llvm.mlir.addressof @str121 : !llvm.ptr
        %978 = arith.constant 7 : i64
        %979 = func.call @cc_make_string(%977, %978) : (!llvm.ptr, i64) -> i64
        %980 = func.call @cc_intern(%976, %979) : (i64, i64) -> i64
        %981 = func.call @cc_nil_value() : () -> i64
        %982 = func.call @cc_cons(%980, %981) : (i64, i64) -> i64
        %983 = func.call @cc_values_pack(%982) : (i64) -> i64
        func.call @stack_push_pointer(%980) : (i64) -> ()
        %984 = func.call @stack_pop_pointer() : () -> i64
        %985 = llvm.mlir.addressof @str122 : !llvm.ptr
        %986 = arith.constant 9 : i64
        %987 = func.call @cc_make_string(%985, %986) : (!llvm.ptr, i64) -> i64
        %988 = llvm.mlir.addressof @str123 : !llvm.ptr
        %989 = arith.constant 7 : i64
        %990 = func.call @cc_make_string(%988, %989) : (!llvm.ptr, i64) -> i64
        %991 = func.call @cc_intern(%987, %990) : (i64, i64) -> i64
        %992 = func.call @cc_nil_value() : () -> i64
        %993 = func.call @cc_cons(%991, %992) : (i64, i64) -> i64
        %994 = func.call @cc_values_pack(%993) : (i64) -> i64
        func.call @stack_push_pointer(%991) : (i64) -> ()
        %995 = func.call @stack_pop_pointer() : () -> i64
        %996 = llvm.mlir.addressof @str124 : !llvm.ptr
        %997 = arith.constant 6 : i64
        %998 = func.call @cc_make_string(%996, %997) : (!llvm.ptr, i64) -> i64
        %999 = llvm.mlir.addressof @str125 : !llvm.ptr
        %1000 = arith.constant 7 : i64
        %1001 = func.call @cc_make_string(%999, %1000) : (!llvm.ptr, i64) -> i64
        %1002 = func.call @cc_intern(%998, %1001) : (i64, i64) -> i64
        %1003 = func.call @cc_nil_value() : () -> i64
        %1004 = func.call @cc_cons(%1002, %1003) : (i64, i64) -> i64
        %1005 = func.call @cc_values_pack(%1004) : (i64) -> i64
        func.call @stack_push_pointer(%1002) : (i64) -> ()
        %1006 = func.call @stack_pop_pointer() : () -> i64
        %1007 = func.call @cc_nil_value() : () -> i64
        %1008 = func.call @cc_errorp(%940) : (i64) -> i64
        %1009 = arith.cmpi ne, %1008, %1007 : i64
        %1010 = arith.cmpi eq, %1007, %1007 : i64
        %1011 = arith.andi %1009, %1010 : i1
        %1012 = scf.if %1011 -> (i64) {
          scf.yield %940 : i64
        } else {
          scf.yield %1007 : i64
        }
        %1013 = func.call @cc_errorp(%951) : (i64) -> i64
        %1014 = arith.cmpi ne, %1013, %1007 : i64
        %1015 = arith.cmpi eq, %1012, %1007 : i64
        %1016 = arith.andi %1014, %1015 : i1
        %1017 = scf.if %1016 -> (i64) {
          scf.yield %951 : i64
        } else {
          scf.yield %1012 : i64
        }
        %1018 = func.call @cc_errorp(%962) : (i64) -> i64
        %1019 = arith.cmpi ne, %1018, %1007 : i64
        %1020 = arith.cmpi eq, %1017, %1007 : i64
        %1021 = arith.andi %1019, %1020 : i1
        %1022 = scf.if %1021 -> (i64) {
          scf.yield %962 : i64
        } else {
          scf.yield %1017 : i64
        }
        %1023 = func.call @cc_errorp(%973) : (i64) -> i64
        %1024 = arith.cmpi ne, %1023, %1007 : i64
        %1025 = arith.cmpi eq, %1022, %1007 : i64
        %1026 = arith.andi %1024, %1025 : i1
        %1027 = scf.if %1026 -> (i64) {
          scf.yield %973 : i64
        } else {
          scf.yield %1022 : i64
        }
        %1028 = func.call @cc_errorp(%984) : (i64) -> i64
        %1029 = arith.cmpi ne, %1028, %1007 : i64
        %1030 = arith.cmpi eq, %1027, %1007 : i64
        %1031 = arith.andi %1029, %1030 : i1
        %1032 = scf.if %1031 -> (i64) {
          scf.yield %984 : i64
        } else {
          scf.yield %1027 : i64
        }
        %1033 = func.call @cc_errorp(%995) : (i64) -> i64
        %1034 = arith.cmpi ne, %1033, %1007 : i64
        %1035 = arith.cmpi eq, %1032, %1007 : i64
        %1036 = arith.andi %1034, %1035 : i1
        %1037 = scf.if %1036 -> (i64) {
          scf.yield %995 : i64
        } else {
          scf.yield %1032 : i64
        }
        %1038 = func.call @cc_errorp(%1006) : (i64) -> i64
        %1039 = arith.cmpi ne, %1038, %1007 : i64
        %1040 = arith.cmpi eq, %1037, %1007 : i64
        %1041 = arith.andi %1039, %1040 : i1
        %1042 = scf.if %1041 -> (i64) {
          scf.yield %1006 : i64
        } else {
          scf.yield %1037 : i64
        }
        %1043 = arith.cmpi ne, %1042, %1007 : i64
        scf.if %1043 {
          func.call @stack_push_pointer(%1042) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%940) : (i64) -> ()
          func.call @stack_push_pointer(%951) : (i64) -> ()
          func.call @stack_push_pointer(%962) : (i64) -> ()
          func.call @stack_push_pointer(%973) : (i64) -> ()
          func.call @stack_push_pointer(%984) : (i64) -> ()
          func.call @stack_push_pointer(%995) : (i64) -> ()
          func.call @stack_push_pointer(%1006) : (i64) -> ()
          %1044 = llvm.mlir.addressof @str126 : !llvm.ptr
          %1045 = func.call @cc_make_function_ref_const(%1044) : (!llvm.ptr) -> i64
          %1046 = arith.constant 7 : i64
          func.call @cc_funcall_stack(%1045, %1046) : (i64, i64) -> ()
        }
        %1047 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1047) : (i64) -> ()
        %1048 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1048, %1047 : i64, i64
      }
      %1049 = func.call @cc_nil_value() : () -> i64
      %1050 = func.call @cc_errorp(%939#0) : (i64) -> i64
      %1051 = arith.cmpi ne, %1050, %1049 : i64
      %1052:2 = scf.if %1051 -> (i64, i64) {
        scf.yield %939#0, %939#1 : i64, i64
      } else {
        %1053 = llvm.mlir.addressof @str127 : !llvm.ptr
        %1054 = arith.constant 3 : i64
        %1055 = func.call @cc_make_string(%1053, %1054) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%1055) : (i64) -> ()
        %1056 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%939#1) : (i64) -> ()
        %1057 = func.call @stack_pop_pointer() : () -> i64
        %1058 = func.call @cc_nil_value() : () -> i64
        %1059 = func.call @cc_errorp(%1056) : (i64) -> i64
        %1060 = arith.cmpi ne, %1059, %1058 : i64
        %1061 = arith.cmpi eq, %1058, %1058 : i64
        %1062 = arith.andi %1060, %1061 : i1
        %1063 = scf.if %1062 -> (i64) {
          scf.yield %1056 : i64
        } else {
          scf.yield %1058 : i64
        }
        %1064 = func.call @cc_errorp(%1057) : (i64) -> i64
        %1065 = arith.cmpi ne, %1064, %1058 : i64
        %1066 = arith.cmpi eq, %1063, %1058 : i64
        %1067 = arith.andi %1065, %1066 : i1
        %1068 = scf.if %1067 -> (i64) {
          scf.yield %1057 : i64
        } else {
          scf.yield %1063 : i64
        }
        %1069 = arith.cmpi ne, %1068, %1058 : i64
        scf.if %1069 {
          func.call @stack_push_pointer(%1068) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1056) : (i64) -> ()
          func.call @stack_push_pointer(%1057) : (i64) -> ()
          %1070 = llvm.mlir.addressof @str128 : !llvm.ptr
          %1071 = func.call @cc_make_function_ref_const(%1070) : (!llvm.ptr) -> i64
          %1072 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%1071, %1072) : (i64, i64) -> ()
        }
        %1073 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1073, %939#1 : i64, i64
      }
      %1074 = func.call @cc_nil_value() : () -> i64
      %1075 = func.call @cc_errorp(%1052#0) : (i64) -> i64
      %1076 = arith.cmpi ne, %1075, %1074 : i64
      %1077:2 = scf.if %1076 -> (i64, i64) {
        scf.yield %1052#0, %1052#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%1052#1) : (i64) -> ()
        %1078 = func.call @stack_pop_pointer() : () -> i64
        %1079 = func.call @cc_nil_value() : () -> i64
        %1080 = func.call @cc_errorp(%1078) : (i64) -> i64
        %1081 = arith.cmpi ne, %1080, %1079 : i64
        %1082 = arith.cmpi eq, %1079, %1079 : i64
        %1083 = arith.andi %1081, %1082 : i1
        %1084 = scf.if %1083 -> (i64) {
          scf.yield %1078 : i64
        } else {
          scf.yield %1079 : i64
        }
        %1085 = arith.cmpi ne, %1084, %1079 : i64
        scf.if %1085 {
          func.call @stack_push_pointer(%1084) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1078) : (i64) -> ()
          %1086 = llvm.mlir.addressof @str129 : !llvm.ptr
          %1087 = func.call @cc_make_function_ref_const(%1086) : (!llvm.ptr) -> i64
          %1088 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1087, %1088) : (i64, i64) -> ()
        }
        %1089 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1089, %1052#1 : i64, i64
      }
      %1090 = func.call @cc_nil_value() : () -> i64
      %1091 = func.call @cc_errorp(%1077#0) : (i64) -> i64
      %1092 = arith.cmpi ne, %1091, %1090 : i64
      %1093:2 = scf.if %1092 -> (i64, i64) {
        scf.yield %1077#0, %1077#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%772) : (i64) -> ()
        %1094 = func.call @stack_pop_pointer() : () -> i64
        %1095 = llvm.mlir.addressof @str130 : !llvm.ptr
        %1096 = arith.constant 9 : i64
        %1097 = func.call @cc_make_string(%1095, %1096) : (!llvm.ptr, i64) -> i64
        %1098 = llvm.mlir.addressof @str131 : !llvm.ptr
        %1099 = arith.constant 7 : i64
        %1100 = func.call @cc_make_string(%1098, %1099) : (!llvm.ptr, i64) -> i64
        %1101 = func.call @cc_intern(%1097, %1100) : (i64, i64) -> i64
        %1102 = func.call @cc_nil_value() : () -> i64
        %1103 = func.call @cc_cons(%1101, %1102) : (i64, i64) -> i64
        %1104 = func.call @cc_values_pack(%1103) : (i64) -> i64
        func.call @stack_push_pointer(%1101) : (i64) -> ()
        %1105 = func.call @stack_pop_pointer() : () -> i64
        %1106 = llvm.mlir.addressof @str132 : !llvm.ptr
        %1107 = arith.constant 5 : i64
        %1108 = func.call @cc_make_string(%1106, %1107) : (!llvm.ptr, i64) -> i64
        %1109 = llvm.mlir.addressof @str133 : !llvm.ptr
        %1110 = arith.constant 7 : i64
        %1111 = func.call @cc_make_string(%1109, %1110) : (!llvm.ptr, i64) -> i64
        %1112 = func.call @cc_intern(%1108, %1111) : (i64, i64) -> i64
        %1113 = func.call @cc_nil_value() : () -> i64
        %1114 = func.call @cc_cons(%1112, %1113) : (i64, i64) -> i64
        %1115 = func.call @cc_values_pack(%1114) : (i64) -> i64
        func.call @stack_push_pointer(%1112) : (i64) -> ()
        %1116 = func.call @stack_pop_pointer() : () -> i64
        %1117 = func.call @cc_nil_value() : () -> i64
        %1118 = func.call @cc_errorp(%1094) : (i64) -> i64
        %1119 = arith.cmpi ne, %1118, %1117 : i64
        %1120 = arith.cmpi eq, %1117, %1117 : i64
        %1121 = arith.andi %1119, %1120 : i1
        %1122 = scf.if %1121 -> (i64) {
          scf.yield %1094 : i64
        } else {
          scf.yield %1117 : i64
        }
        %1123 = func.call @cc_errorp(%1105) : (i64) -> i64
        %1124 = arith.cmpi ne, %1123, %1117 : i64
        %1125 = arith.cmpi eq, %1122, %1117 : i64
        %1126 = arith.andi %1124, %1125 : i1
        %1127 = scf.if %1126 -> (i64) {
          scf.yield %1105 : i64
        } else {
          scf.yield %1122 : i64
        }
        %1128 = func.call @cc_errorp(%1116) : (i64) -> i64
        %1129 = arith.cmpi ne, %1128, %1117 : i64
        %1130 = arith.cmpi eq, %1127, %1117 : i64
        %1131 = arith.andi %1129, %1130 : i1
        %1132 = scf.if %1131 -> (i64) {
          scf.yield %1116 : i64
        } else {
          scf.yield %1127 : i64
        }
        %1133 = arith.cmpi ne, %1132, %1117 : i64
        scf.if %1133 {
          func.call @stack_push_pointer(%1132) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1094) : (i64) -> ()
          func.call @stack_push_pointer(%1105) : (i64) -> ()
          func.call @stack_push_pointer(%1116) : (i64) -> ()
          %1134 = llvm.mlir.addressof @str134 : !llvm.ptr
          %1135 = func.call @cc_make_function_ref_const(%1134) : (!llvm.ptr) -> i64
          %1136 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%1135, %1136) : (i64, i64) -> ()
        }
        %1137 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1137) : (i64) -> ()
        %1138 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1138, %1137 : i64, i64
      }
      %1139 = func.call @cc_nil_value() : () -> i64
      %1140 = func.call @cc_errorp(%1093#0) : (i64) -> i64
      %1141 = arith.cmpi ne, %1140, %1139 : i64
      %1142:2 = scf.if %1141 -> (i64, i64) {
        scf.yield %1093#0, %1093#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%893) : (i64) -> ()
        %1143 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%1093#1) : (i64) -> ()
        %1144 = func.call @stack_pop_pointer() : () -> i64
        %1145 = llvm.mlir.addressof @str135 : !llvm.ptr
        %1146 = arith.constant 5 : i64
        %1147 = func.call @cc_make_string(%1145, %1146) : (!llvm.ptr, i64) -> i64
        %1148 = llvm.mlir.addressof @str136 : !llvm.ptr
        %1149 = arith.constant 7 : i64
        %1150 = func.call @cc_make_string(%1148, %1149) : (!llvm.ptr, i64) -> i64
        %1151 = func.call @cc_intern(%1147, %1150) : (i64, i64) -> i64
        %1152 = func.call @cc_nil_value() : () -> i64
        %1153 = func.call @cc_cons(%1151, %1152) : (i64, i64) -> i64
        %1154 = func.call @cc_values_pack(%1153) : (i64) -> i64
        func.call @stack_push_pointer(%1151) : (i64) -> ()
        %1155 = func.call @stack_pop_pointer() : () -> i64
        %1156 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%1156) : (i64) -> ()
        %1157 = func.call @stack_pop_pointer() : () -> i64
        %1158 = llvm.mlir.addressof @str137 : !llvm.ptr
        %1159 = arith.constant 3 : i64
        %1160 = func.call @cc_make_string(%1158, %1159) : (!llvm.ptr, i64) -> i64
        %1161 = llvm.mlir.addressof @str138 : !llvm.ptr
        %1162 = arith.constant 7 : i64
        %1163 = func.call @cc_make_string(%1161, %1162) : (!llvm.ptr, i64) -> i64
        %1164 = func.call @cc_intern(%1160, %1163) : (i64, i64) -> i64
        %1165 = func.call @cc_nil_value() : () -> i64
        %1166 = func.call @cc_cons(%1164, %1165) : (i64, i64) -> i64
        %1167 = func.call @cc_values_pack(%1166) : (i64) -> i64
        func.call @stack_push_pointer(%1164) : (i64) -> ()
        %1168 = func.call @stack_pop_pointer() : () -> i64
        %1169 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%1169) : (i64) -> ()
        %1170 = func.call @stack_pop_pointer() : () -> i64
        %1171 = func.call @cc_nil_value() : () -> i64
        %1172 = func.call @cc_errorp(%1143) : (i64) -> i64
        %1173 = arith.cmpi ne, %1172, %1171 : i64
        %1174 = arith.cmpi eq, %1171, %1171 : i64
        %1175 = arith.andi %1173, %1174 : i1
        %1176 = scf.if %1175 -> (i64) {
          scf.yield %1143 : i64
        } else {
          scf.yield %1171 : i64
        }
        %1177 = func.call @cc_errorp(%1144) : (i64) -> i64
        %1178 = arith.cmpi ne, %1177, %1171 : i64
        %1179 = arith.cmpi eq, %1176, %1171 : i64
        %1180 = arith.andi %1178, %1179 : i1
        %1181 = scf.if %1180 -> (i64) {
          scf.yield %1144 : i64
        } else {
          scf.yield %1176 : i64
        }
        %1182 = func.call @cc_errorp(%1155) : (i64) -> i64
        %1183 = arith.cmpi ne, %1182, %1171 : i64
        %1184 = arith.cmpi eq, %1181, %1171 : i64
        %1185 = arith.andi %1183, %1184 : i1
        %1186 = scf.if %1185 -> (i64) {
          scf.yield %1155 : i64
        } else {
          scf.yield %1181 : i64
        }
        %1187 = func.call @cc_errorp(%1157) : (i64) -> i64
        %1188 = arith.cmpi ne, %1187, %1171 : i64
        %1189 = arith.cmpi eq, %1186, %1171 : i64
        %1190 = arith.andi %1188, %1189 : i1
        %1191 = scf.if %1190 -> (i64) {
          scf.yield %1157 : i64
        } else {
          scf.yield %1186 : i64
        }
        %1192 = func.call @cc_errorp(%1168) : (i64) -> i64
        %1193 = arith.cmpi ne, %1192, %1171 : i64
        %1194 = arith.cmpi eq, %1191, %1171 : i64
        %1195 = arith.andi %1193, %1194 : i1
        %1196 = scf.if %1195 -> (i64) {
          scf.yield %1168 : i64
        } else {
          scf.yield %1191 : i64
        }
        %1197 = func.call @cc_errorp(%1170) : (i64) -> i64
        %1198 = arith.cmpi ne, %1197, %1171 : i64
        %1199 = arith.cmpi eq, %1196, %1171 : i64
        %1200 = arith.andi %1198, %1199 : i1
        %1201 = scf.if %1200 -> (i64) {
          scf.yield %1170 : i64
        } else {
          scf.yield %1196 : i64
        }
        %1202 = arith.cmpi ne, %1201, %1171 : i64
        scf.if %1202 {
          func.call @stack_push_pointer(%1201) : (i64) -> ()
        } else {
          %1203 = func.call @cc_nil_value() : () -> i64
          %1204 = func.call @cc_cons(%1170, %1203) : (i64, i64) -> i64
          %1205 = func.call @cc_cons(%1168, %1204) : (i64, i64) -> i64
          %1206 = func.call @cc_cons(%1157, %1205) : (i64, i64) -> i64
          %1207 = func.call @cc_cons(%1155, %1206) : (i64, i64) -> i64
          %1208 = func.call @cc_cons(%1144, %1207) : (i64, i64) -> i64
          %1209 = func.call @cc_cons(%1143, %1208) : (i64, i64) -> i64
          func.call @stack_push_pointer(%1209) : (i64) -> ()
          func.call @cc_read_sequence_stack() : () -> ()
        }
        %1210 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1210, %1093#1 : i64, i64
      }
      %1211 = func.call @cc_nil_value() : () -> i64
      %1212 = func.call @cc_errorp(%1142#0) : (i64) -> i64
      %1213 = arith.cmpi ne, %1212, %1211 : i64
      %1214:2 = scf.if %1213 -> (i64, i64) {
        scf.yield %1142#0, %1142#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%1142#1) : (i64) -> ()
        %1215 = func.call @stack_pop_pointer() : () -> i64
        %1216 = func.call @cc_nil_value() : () -> i64
        %1217 = func.call @cc_errorp(%1215) : (i64) -> i64
        %1218 = arith.cmpi ne, %1217, %1216 : i64
        %1219 = arith.cmpi eq, %1216, %1216 : i64
        %1220 = arith.andi %1218, %1219 : i1
        %1221 = scf.if %1220 -> (i64) {
          scf.yield %1215 : i64
        } else {
          scf.yield %1216 : i64
        }
        %1222 = arith.cmpi ne, %1221, %1216 : i64
        scf.if %1222 {
          func.call @stack_push_pointer(%1221) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%1215) : (i64) -> ()
          %1223 = llvm.mlir.addressof @str139 : !llvm.ptr
          %1224 = func.call @cc_make_function_ref_const(%1223) : (!llvm.ptr) -> i64
          %1225 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1224, %1225) : (i64, i64) -> ()
        }
        %1226 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1226, %1142#1 : i64, i64
      }
      %1227 = func.call @cc_nil_value() : () -> i64
      %1228 = func.call @cc_errorp(%1214#0) : (i64) -> i64
      %1229 = arith.cmpi ne, %1228, %1227 : i64
      %1230:2 = scf.if %1229 -> (i64, i64) {
        scf.yield %1214#0, %1214#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%772) : (i64) -> ()
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
          %1239 = llvm.mlir.addressof @str140 : !llvm.ptr
          %1240 = func.call @cc_make_function_ref_const(%1239) : (!llvm.ptr) -> i64
          %1241 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%1240, %1241) : (i64, i64) -> ()
        }
        %1242 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1242, %1214#1 : i64, i64
      }
      %1243 = func.call @cc_nil_value() : () -> i64
      %1244 = func.call @cc_errorp(%1230#0) : (i64) -> i64
      %1245 = arith.cmpi ne, %1244, %1243 : i64
      %1246:2 = scf.if %1245 -> (i64, i64) {
        scf.yield %1230#0, %1230#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%893) : (i64) -> ()
        %1247 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1247, %1230#1 : i64, i64
      }
      func.call @stack_push_pointer(%1246#0) : (i64) -> ()
      %1248 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1248 : i64
    }
    func.call @stack_push_pointer(%757) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("clisp/in_work/regression-tests/framework.lisp\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str2("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str3("CLOSE.ABORT.03.PROBE\00") : !llvm.array<21 x i8>
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
  llvm.mlir.global private constant @str148("show-test-summary\00") : !llvm.array<18 x i8>
}
