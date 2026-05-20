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
      %41 = arith.constant 28 : i64
      %42 = func.call @cc_make_string(%40, %41) : (!llvm.ptr, i64) -> i64
      %43 = func.call @cc_nil_value() : () -> i64
      %44 = func.call @cc_intern(%42, %43) : (i64, i64) -> i64
      %45 = func.call @cc_nil_value() : () -> i64
      %46 = func.call @cc_cons(%44, %45) : (i64, i64) -> i64
      %47 = func.call @cc_values_pack(%46) : (i64) -> i64
      %48 = func.call @cc_symbol_value(%44) : (i64) -> i64
      func.call @stack_push_pointer(%48) : (i64) -> ()
      %49 = func.call @stack_pop_pointer() : () -> i64
      %50 = llvm.mlir.addressof @str4 : !llvm.ptr
      %51 = arith.constant 19 : i64
      %52 = func.call @cc_make_string(%50, %51) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%52) : (i64) -> ()
      %53 = func.call @stack_pop_pointer() : () -> i64
      %54 = func.call @cc_nil_value() : () -> i64
      %55 = func.call @cc_errorp(%53) : (i64) -> i64
      %56 = arith.cmpi ne, %55, %54 : i64
      %57 = arith.cmpi eq, %54, %54 : i64
      %58 = arith.andi %56, %57 : i1
      %59 = scf.if %58 -> (i64) {
        scf.yield %53 : i64
      } else {
        scf.yield %54 : i64
      }
      %60 = arith.cmpi ne, %59, %54 : i64
      scf.if %60 {
        func.call @stack_push_pointer(%59) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%53) : (i64) -> ()
        %61 = llvm.mlir.addressof @str5 : !llvm.ptr
        %62 = func.call @cc_make_function_ref_const(%61) : (!llvm.ptr) -> i64
        %63 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%62, %63) : (i64, i64) -> ()
      }
      %64 = func.call @stack_pop_pointer() : () -> i64
      %65 = func.call @cc_nil_value() : () -> i64
      %66 = func.call @cc_nil_value() : () -> i64
      %67 = func.call @cc_errorp(%65) : (i64) -> i64
      %68 = arith.cmpi ne, %67, %66 : i64
      %69 = scf.if %68 -> (i64) {
        scf.yield %65 : i64
      } else {
        %70 = func.call @cc_nil_value() : () -> i64
        %71 = func.call @cc_nil_value() : () -> i64
        %72 = func.call @cc_errorp(%70) : (i64) -> i64
        %73 = arith.cmpi ne, %72, %71 : i64
        %74 = scf.if %73 -> (i64) {
          scf.yield %70 : i64
        } else {
          func.call @stack_push_pointer(%64) : (i64) -> ()
          %75 = func.call @stack_pop_pointer() : () -> i64
          %76 = llvm.mlir.addressof @str6 : !llvm.ptr
          %77 = arith.constant 17 : i64
          %78 = func.call @cc_make_string(%76, %77) : (!llvm.ptr, i64) -> i64
          %79 = llvm.mlir.addressof @str7 : !llvm.ptr
          %80 = arith.constant 7 : i64
          %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
          %82 = func.call @cc_intern(%78, %81) : (i64, i64) -> i64
          %83 = func.call @cc_nil_value() : () -> i64
          %84 = func.call @cc_cons(%82, %83) : (i64, i64) -> i64
          %85 = func.call @cc_values_pack(%84) : (i64) -> i64
          func.call @stack_push_pointer(%82) : (i64) -> ()
          %86 = func.call @stack_pop_pointer() : () -> i64
          %87 = llvm.mlir.addressof @str8 : !llvm.ptr
          %88 = arith.constant 6 : i64
          %89 = func.call @cc_make_string(%87, %88) : (!llvm.ptr, i64) -> i64
          %90 = llvm.mlir.addressof @str9 : !llvm.ptr
          %91 = arith.constant 7 : i64
          %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
          %93 = func.call @cc_intern(%89, %92) : (i64, i64) -> i64
          %94 = func.call @cc_nil_value() : () -> i64
          %95 = func.call @cc_cons(%93, %94) : (i64, i64) -> i64
          %96 = func.call @cc_values_pack(%95) : (i64) -> i64
          func.call @stack_push_pointer(%93) : (i64) -> ()
          %97 = func.call @stack_pop_pointer() : () -> i64
          %98 = llvm.mlir.addressof @str10 : !llvm.ptr
          %99 = arith.constant 9 : i64
          %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
          %101 = llvm.mlir.addressof @str11 : !llvm.ptr
          %102 = arith.constant 7 : i64
          %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
          %104 = func.call @cc_intern(%100, %103) : (i64, i64) -> i64
          %105 = func.call @cc_nil_value() : () -> i64
          %106 = func.call @cc_cons(%104, %105) : (i64, i64) -> i64
          %107 = func.call @cc_values_pack(%106) : (i64) -> i64
          func.call @stack_push_pointer(%104) : (i64) -> ()
          %108 = func.call @stack_pop_pointer() : () -> i64
          %109 = llvm.mlir.addressof @str12 : !llvm.ptr
          %110 = arith.constant 9 : i64
          %111 = func.call @cc_make_string(%109, %110) : (!llvm.ptr, i64) -> i64
          %112 = llvm.mlir.addressof @str13 : !llvm.ptr
          %113 = arith.constant 7 : i64
          %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
          %115 = func.call @cc_intern(%111, %114) : (i64, i64) -> i64
          %116 = func.call @cc_nil_value() : () -> i64
          %117 = func.call @cc_cons(%115, %116) : (i64, i64) -> i64
          %118 = func.call @cc_values_pack(%117) : (i64) -> i64
          func.call @stack_push_pointer(%115) : (i64) -> ()
          %119 = func.call @stack_pop_pointer() : () -> i64
          %120 = llvm.mlir.addressof @str14 : !llvm.ptr
          %121 = arith.constant 9 : i64
          %122 = func.call @cc_make_string(%120, %121) : (!llvm.ptr, i64) -> i64
          %123 = llvm.mlir.addressof @str15 : !llvm.ptr
          %124 = arith.constant 7 : i64
          %125 = func.call @cc_make_string(%123, %124) : (!llvm.ptr, i64) -> i64
          %126 = func.call @cc_intern(%122, %125) : (i64, i64) -> i64
          %127 = func.call @cc_nil_value() : () -> i64
          %128 = func.call @cc_cons(%126, %127) : (i64, i64) -> i64
          %129 = func.call @cc_values_pack(%128) : (i64) -> i64
          func.call @stack_push_pointer(%126) : (i64) -> ()
          %130 = func.call @stack_pop_pointer() : () -> i64
          %131 = llvm.mlir.addressof @str16 : !llvm.ptr
          %132 = arith.constant 6 : i64
          %133 = func.call @cc_make_string(%131, %132) : (!llvm.ptr, i64) -> i64
          %134 = llvm.mlir.addressof @str17 : !llvm.ptr
          %135 = arith.constant 7 : i64
          %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
          %137 = func.call @cc_intern(%133, %136) : (i64, i64) -> i64
          %138 = func.call @cc_nil_value() : () -> i64
          %139 = func.call @cc_cons(%137, %138) : (i64, i64) -> i64
          %140 = func.call @cc_values_pack(%139) : (i64) -> i64
          func.call @stack_push_pointer(%137) : (i64) -> ()
          %141 = func.call @stack_pop_pointer() : () -> i64
          %142 = llvm.mlir.addressof @str18 : !llvm.ptr
          %143 = arith.constant 12 : i64
          %144 = func.call @cc_make_string(%142, %143) : (!llvm.ptr, i64) -> i64
          %145 = llvm.mlir.addressof @str19 : !llvm.ptr
          %146 = arith.constant 7 : i64
          %147 = func.call @cc_make_string(%145, %146) : (!llvm.ptr, i64) -> i64
          %148 = func.call @cc_intern(%144, %147) : (i64, i64) -> i64
          %149 = func.call @cc_nil_value() : () -> i64
          %150 = func.call @cc_cons(%148, %149) : (i64, i64) -> i64
          %151 = func.call @cc_values_pack(%150) : (i64) -> i64
          func.call @stack_push_pointer(%148) : (i64) -> ()
          %152 = func.call @stack_pop_pointer() : () -> i64
          %153 = llvm.mlir.addressof @str20 : !llvm.ptr
          %154 = arith.constant 13 : i64
          %155 = func.call @cc_make_string(%153, %154) : (!llvm.ptr, i64) -> i64
          %156 = llvm.mlir.addressof @str21 : !llvm.ptr
          %157 = arith.constant 11 : i64
          %158 = func.call @cc_make_string(%156, %157) : (!llvm.ptr, i64) -> i64
          %159 = func.call @cc_intern(%155, %158) : (i64, i64) -> i64
          %160 = func.call @cc_nil_value() : () -> i64
          %161 = func.call @cc_cons(%159, %160) : (i64, i64) -> i64
          %162 = func.call @cc_values_pack(%161) : (i64) -> i64
          func.call @stack_push_pointer(%159) : (i64) -> ()
          %163 = arith.constant 8 : i64
          func.call @stack_push_fixnum(%163) : (i64) -> ()
          func.call @stack_push_nil() : () -> ()
          %164 = func.call @stack_pop_pointer() : () -> i64
          %165 = func.call @stack_pop_pointer() : () -> i64
          %166 = func.call @cc_cons(%165, %164) : (i64, i64) -> i64
          func.call @stack_push_pointer(%166) : (i64) -> ()
          %167 = func.call @stack_pop_pointer() : () -> i64
          %168 = func.call @stack_pop_pointer() : () -> i64
          %169 = func.call @cc_cons(%168, %167) : (i64, i64) -> i64
          func.call @stack_push_pointer(%169) : (i64) -> ()
          %170 = func.call @stack_pop_pointer() : () -> i64
          %171 = func.call @cc_nil_value() : () -> i64
          %172 = func.call @cc_errorp(%75) : (i64) -> i64
          %173 = arith.cmpi ne, %172, %171 : i64
          %174 = arith.cmpi eq, %171, %171 : i64
          %175 = arith.andi %173, %174 : i1
          %176 = scf.if %175 -> (i64) {
            scf.yield %75 : i64
          } else {
            scf.yield %171 : i64
          }
          %177 = func.call @cc_errorp(%86) : (i64) -> i64
          %178 = arith.cmpi ne, %177, %171 : i64
          %179 = arith.cmpi eq, %176, %171 : i64
          %180 = arith.andi %178, %179 : i1
          %181 = scf.if %180 -> (i64) {
            scf.yield %86 : i64
          } else {
            scf.yield %176 : i64
          }
          %182 = func.call @cc_errorp(%97) : (i64) -> i64
          %183 = arith.cmpi ne, %182, %171 : i64
          %184 = arith.cmpi eq, %181, %171 : i64
          %185 = arith.andi %183, %184 : i1
          %186 = scf.if %185 -> (i64) {
            scf.yield %97 : i64
          } else {
            scf.yield %181 : i64
          }
          %187 = func.call @cc_errorp(%108) : (i64) -> i64
          %188 = arith.cmpi ne, %187, %171 : i64
          %189 = arith.cmpi eq, %186, %171 : i64
          %190 = arith.andi %188, %189 : i1
          %191 = scf.if %190 -> (i64) {
            scf.yield %108 : i64
          } else {
            scf.yield %186 : i64
          }
          %192 = func.call @cc_errorp(%119) : (i64) -> i64
          %193 = arith.cmpi ne, %192, %171 : i64
          %194 = arith.cmpi eq, %191, %171 : i64
          %195 = arith.andi %193, %194 : i1
          %196 = scf.if %195 -> (i64) {
            scf.yield %119 : i64
          } else {
            scf.yield %191 : i64
          }
          %197 = func.call @cc_errorp(%130) : (i64) -> i64
          %198 = arith.cmpi ne, %197, %171 : i64
          %199 = arith.cmpi eq, %196, %171 : i64
          %200 = arith.andi %198, %199 : i1
          %201 = scf.if %200 -> (i64) {
            scf.yield %130 : i64
          } else {
            scf.yield %196 : i64
          }
          %202 = func.call @cc_errorp(%141) : (i64) -> i64
          %203 = arith.cmpi ne, %202, %171 : i64
          %204 = arith.cmpi eq, %201, %171 : i64
          %205 = arith.andi %203, %204 : i1
          %206 = scf.if %205 -> (i64) {
            scf.yield %141 : i64
          } else {
            scf.yield %201 : i64
          }
          %207 = func.call @cc_errorp(%152) : (i64) -> i64
          %208 = arith.cmpi ne, %207, %171 : i64
          %209 = arith.cmpi eq, %206, %171 : i64
          %210 = arith.andi %208, %209 : i1
          %211 = scf.if %210 -> (i64) {
            scf.yield %152 : i64
          } else {
            scf.yield %206 : i64
          }
          %212 = func.call @cc_errorp(%170) : (i64) -> i64
          %213 = arith.cmpi ne, %212, %171 : i64
          %214 = arith.cmpi eq, %211, %171 : i64
          %215 = arith.andi %213, %214 : i1
          %216 = scf.if %215 -> (i64) {
            scf.yield %170 : i64
          } else {
            scf.yield %211 : i64
          }
          %217 = arith.cmpi ne, %216, %171 : i64
          scf.if %217 {
            func.call @stack_push_pointer(%216) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%75) : (i64) -> ()
            func.call @stack_push_pointer(%86) : (i64) -> ()
            func.call @stack_push_pointer(%97) : (i64) -> ()
            func.call @stack_push_pointer(%108) : (i64) -> ()
            func.call @stack_push_pointer(%119) : (i64) -> ()
            func.call @stack_push_pointer(%130) : (i64) -> ()
            func.call @stack_push_pointer(%141) : (i64) -> ()
            func.call @stack_push_pointer(%152) : (i64) -> ()
            func.call @stack_push_pointer(%170) : (i64) -> ()
            %218 = llvm.mlir.addressof @str22 : !llvm.ptr
            %219 = func.call @cc_make_function_ref_const(%218) : (!llvm.ptr) -> i64
            %220 = arith.constant 9 : i64
            func.call @cc_funcall_stack(%219, %220) : (i64, i64) -> ()
          }
          %221 = func.call @stack_pop_pointer() : () -> i64
          %222 = llvm.mlir.addressof @str23 : !llvm.ptr
          %223 = arith.constant 6 : i64
          %224 = func.call @cc_make_symbol(%222, %223) : (!llvm.ptr, i64) -> i64
          %225 = func.call @cc_symbol_value(%224) : (i64) -> i64
          %226 = func.call @cc_set_symbol_value(%224, %221) : (i64, i64) -> i64
          %227 = func.call @cc_nil_value() : () -> i64
          %228 = func.call @cc_nil_value() : () -> i64
          %229 = func.call @cc_errorp(%227) : (i64) -> i64
          %230 = arith.cmpi ne, %229, %228 : i64
          %231 = scf.if %230 -> (i64) {
            scf.yield %227 : i64
          } else {
            %232 = llvm.mlir.addressof @str24 : !llvm.ptr
            %233 = arith.constant 6 : i64
            %234 = func.call @cc_make_string(%232, %233) : (!llvm.ptr, i64) -> i64
            %235 = func.call @cc_nil_value() : () -> i64
            %236 = func.call @cc_intern(%234, %235) : (i64, i64) -> i64
            %237 = func.call @cc_nil_value() : () -> i64
            %238 = func.call @cc_cons(%236, %237) : (i64, i64) -> i64
            %239 = func.call @cc_values_pack(%238) : (i64) -> i64
            func.call @stack_push_pointer(%236) : (i64) -> ()
            %240 = func.call @stack_pop_pointer() : () -> i64
            %241 = func.call @cc_nil_value() : () -> i64
            %242 = func.call @cc_errorp(%240) : (i64) -> i64
            %243 = arith.cmpi ne, %242, %241 : i64
            %244 = arith.cmpi eq, %241, %241 : i64
            %245 = arith.andi %243, %244 : i1
            %246 = scf.if %245 -> (i64) {
              scf.yield %240 : i64
            } else {
              scf.yield %241 : i64
            }
            %247 = arith.cmpi ne, %246, %241 : i64
            scf.if %247 {
              func.call @stack_push_pointer(%246) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%240) : (i64) -> ()
              %248 = llvm.mlir.addressof @str25 : !llvm.ptr
              %249 = func.call @cc_make_function_ref_const(%248) : (!llvm.ptr) -> i64
              %250 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%249, %250) : (i64, i64) -> ()
            }
            %251 = func.call @stack_pop_pointer() : () -> i64
            %252 = func.call @cc_nil_value() : () -> i64
            %253 = func.call @cc_nil_value() : () -> i64
            %254 = func.call @cc_errorp(%252) : (i64) -> i64
            %255 = arith.cmpi ne, %254, %253 : i64
            %256 = scf.if %255 -> (i64) {
              scf.yield %252 : i64
            } else {
              %257 = arith.constant 33 : i64
              func.call @stack_push_fixnum(%257) : (i64) -> ()
              %258 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%251) : (i64) -> ()
              %259 = func.call @stack_pop_pointer() : () -> i64
              %260 = func.call @cc_nil_value() : () -> i64
              %261 = func.call @cc_errorp(%258) : (i64) -> i64
              %262 = arith.cmpi ne, %261, %260 : i64
              %263 = arith.cmpi eq, %260, %260 : i64
              %264 = arith.andi %262, %263 : i1
              %265 = scf.if %264 -> (i64) {
                scf.yield %258 : i64
              } else {
                scf.yield %260 : i64
              }
              %266 = func.call @cc_errorp(%259) : (i64) -> i64
              %267 = arith.cmpi ne, %266, %260 : i64
              %268 = arith.cmpi eq, %265, %260 : i64
              %269 = arith.andi %267, %268 : i1
              %270 = scf.if %269 -> (i64) {
                scf.yield %259 : i64
              } else {
                scf.yield %265 : i64
              }
              %271 = arith.cmpi ne, %270, %260 : i64
              scf.if %271 {
                func.call @stack_push_pointer(%270) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%258) : (i64) -> ()
                func.call @stack_push_pointer(%259) : (i64) -> ()
                %272 = llvm.mlir.addressof @str26 : !llvm.ptr
                %273 = func.call @cc_make_function_ref_const(%272) : (!llvm.ptr) -> i64
                %274 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%273, %274) : (i64, i64) -> ()
              }
              %275 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %275 : i64
            }
            %276 = func.call @cc_nil_value() : () -> i64
            %277 = func.call @cc_errorp(%256) : (i64) -> i64
            %278 = arith.cmpi ne, %277, %276 : i64
            %279 = scf.if %278 -> (i64) {
              scf.yield %256 : i64
            } else {
              func.call @stack_push_pointer(%251) : (i64) -> ()
              %280 = func.call @stack_pop_pointer() : () -> i64
              %281 = llvm.mlir.addressof @str27 : !llvm.ptr
              %282 = arith.constant 9 : i64
              %283 = func.call @cc_make_string(%281, %282) : (!llvm.ptr, i64) -> i64
              %284 = llvm.mlir.addressof @str28 : !llvm.ptr
              %285 = arith.constant 11 : i64
              %286 = func.call @cc_make_string(%284, %285) : (!llvm.ptr, i64) -> i64
              %287 = func.call @cc_intern(%283, %286) : (i64, i64) -> i64
              %288 = func.call @cc_nil_value() : () -> i64
              %289 = func.call @cc_cons(%287, %288) : (i64, i64) -> i64
              %290 = func.call @cc_values_pack(%289) : (i64) -> i64
              func.call @stack_push_pointer(%287) : (i64) -> ()
              %291 = func.call @stack_pop_pointer() : () -> i64
              %292 = func.call @cc_nil_value() : () -> i64
              %293 = func.call @cc_errorp(%280) : (i64) -> i64
              %294 = arith.cmpi ne, %293, %292 : i64
              %295 = arith.cmpi eq, %292, %292 : i64
              %296 = arith.andi %294, %295 : i1
              %297 = scf.if %296 -> (i64) {
                scf.yield %280 : i64
              } else {
                scf.yield %292 : i64
              }
              %298 = func.call @cc_errorp(%291) : (i64) -> i64
              %299 = arith.cmpi ne, %298, %292 : i64
              %300 = arith.cmpi eq, %297, %292 : i64
              %301 = arith.andi %299, %300 : i1
              %302 = scf.if %301 -> (i64) {
                scf.yield %291 : i64
              } else {
                scf.yield %297 : i64
              }
              %303 = arith.cmpi ne, %302, %292 : i64
              scf.if %303 {
                func.call @stack_push_pointer(%302) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%280) : (i64) -> ()
                func.call @stack_push_pointer(%291) : (i64) -> ()
                %304 = llvm.mlir.addressof @str29 : !llvm.ptr
                %305 = func.call @cc_make_function_ref_const(%304) : (!llvm.ptr) -> i64
                %306 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%305, %306) : (i64, i64) -> ()
              }
              %307 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %307 : i64
            }
            %308 = func.call @cc_nil_value() : () -> i64
            %309 = func.call @cc_errorp(%279) : (i64) -> i64
            %310 = arith.cmpi ne, %309, %308 : i64
            %311 = scf.if %310 -> (i64) {
              scf.yield %279 : i64
            } else {
              %312 = arith.constant 34 : i64
              %313 = func.call @cc_box_character(%312) : (i64) -> i64
              func.call @stack_push_pointer(%313) : (i64) -> ()
              %314 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%251) : (i64) -> ()
              %315 = func.call @stack_pop_pointer() : () -> i64
              %316 = func.call @cc_nil_value() : () -> i64
              %317 = func.call @cc_errorp(%314) : (i64) -> i64
              %318 = arith.cmpi ne, %317, %316 : i64
              %319 = arith.cmpi eq, %316, %316 : i64
              %320 = arith.andi %318, %319 : i1
              %321 = scf.if %320 -> (i64) {
                scf.yield %314 : i64
              } else {
                scf.yield %316 : i64
              }
              %322 = func.call @cc_errorp(%315) : (i64) -> i64
              %323 = arith.cmpi ne, %322, %316 : i64
              %324 = arith.cmpi eq, %321, %316 : i64
              %325 = arith.andi %323, %324 : i1
              %326 = scf.if %325 -> (i64) {
                scf.yield %315 : i64
              } else {
                scf.yield %321 : i64
              }
              %327 = arith.cmpi ne, %326, %316 : i64
              scf.if %327 {
                func.call @stack_push_pointer(%326) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%314) : (i64) -> ()
                func.call @stack_push_pointer(%315) : (i64) -> ()
                %328 = llvm.mlir.addressof @str30 : !llvm.ptr
                %329 = func.call @cc_make_function_ref_const(%328) : (!llvm.ptr) -> i64
                %330 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%329, %330) : (i64, i64) -> ()
              }
              %331 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %331 : i64
            }
            func.call @stack_push_pointer(%311) : (i64) -> ()
            %332 = func.call @stack_pop_pointer() : () -> i64
            %333 = func.call @cc_multiple_value_list(%332) : (i64) -> i64
            %334 = llvm.mlir.addressof @str31 : !llvm.ptr
            %335 = arith.constant 6 : i64
            %336 = func.call @cc_make_string(%334, %335) : (!llvm.ptr, i64) -> i64
            %337 = func.call @cc_nil_value() : () -> i64
            %338 = func.call @cc_intern(%336, %337) : (i64, i64) -> i64
            %339 = func.call @cc_nil_value() : () -> i64
            %340 = func.call @cc_cons(%338, %339) : (i64, i64) -> i64
            %341 = func.call @cc_values_pack(%340) : (i64) -> i64
            %342 = func.call @cc_symbol_value(%338) : (i64) -> i64
            func.call @stack_push_pointer(%342) : (i64) -> ()
            %343 = func.call @stack_pop_pointer() : () -> i64
            %344 = func.call @cc_nil_value() : () -> i64
            %345 = func.call @cc_errorp(%343) : (i64) -> i64
            %346 = arith.cmpi ne, %345, %344 : i64
            %347 = arith.cmpi eq, %344, %344 : i64
            %348 = arith.andi %346, %347 : i1
            %349 = scf.if %348 -> (i64) {
              scf.yield %343 : i64
            } else {
              scf.yield %344 : i64
            }
            %350 = arith.cmpi ne, %349, %344 : i64
            scf.if %350 {
              func.call @stack_push_pointer(%349) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%343) : (i64) -> ()
              %351 = llvm.mlir.addressof @str32 : !llvm.ptr
              %352 = func.call @cc_make_function_ref_const(%351) : (!llvm.ptr) -> i64
              %353 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%352, %353) : (i64, i64) -> ()
            }
            %354 = func.call @stack_depth() : () -> i64
            %355 = arith.constant 0 : i64
            %356 = arith.cmpi sgt, %354, %355 : i64
            scf.if %356 {
              %357 = func.call @stack_pop_pointer() : () -> i64
            }
            %358 = func.call @cc_values_pack(%333) : (i64) -> i64
            func.call @stack_push_pointer(%358) : (i64) -> ()
            %359 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %359 : i64
          }
          func.call @stack_push_pointer(%231) : (i64) -> ()
          %360 = func.call @cc_set_symbol_value(%224, %225) : (i64, i64) -> i64
          %361 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %361 : i64
        }
        %362 = func.call @cc_nil_value() : () -> i64
        %363 = func.call @cc_errorp(%74) : (i64) -> i64
        %364 = arith.cmpi ne, %363, %362 : i64
        %365 = scf.if %364 -> (i64) {
          scf.yield %74 : i64
        } else {
          func.call @stack_push_pointer(%64) : (i64) -> ()
          %366 = func.call @stack_pop_pointer() : () -> i64
          %367 = llvm.mlir.addressof @str33 : !llvm.ptr
          %368 = arith.constant 9 : i64
          %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
          %370 = llvm.mlir.addressof @str34 : !llvm.ptr
          %371 = arith.constant 7 : i64
          %372 = func.call @cc_make_string(%370, %371) : (!llvm.ptr, i64) -> i64
          %373 = func.call @cc_intern(%369, %372) : (i64, i64) -> i64
          %374 = func.call @cc_nil_value() : () -> i64
          %375 = func.call @cc_cons(%373, %374) : (i64, i64) -> i64
          %376 = func.call @cc_values_pack(%375) : (i64) -> i64
          func.call @stack_push_pointer(%373) : (i64) -> ()
          %377 = func.call @stack_pop_pointer() : () -> i64
          %378 = llvm.mlir.addressof @str35 : !llvm.ptr
          %379 = arith.constant 5 : i64
          %380 = func.call @cc_make_string(%378, %379) : (!llvm.ptr, i64) -> i64
          %381 = llvm.mlir.addressof @str36 : !llvm.ptr
          %382 = arith.constant 7 : i64
          %383 = func.call @cc_make_string(%381, %382) : (!llvm.ptr, i64) -> i64
          %384 = func.call @cc_intern(%380, %383) : (i64, i64) -> i64
          %385 = func.call @cc_nil_value() : () -> i64
          %386 = func.call @cc_cons(%384, %385) : (i64, i64) -> i64
          %387 = func.call @cc_values_pack(%386) : (i64) -> i64
          func.call @stack_push_pointer(%384) : (i64) -> ()
          %388 = func.call @stack_pop_pointer() : () -> i64
          %389 = llvm.mlir.addressof @str37 : !llvm.ptr
          %390 = arith.constant 12 : i64
          %391 = func.call @cc_make_string(%389, %390) : (!llvm.ptr, i64) -> i64
          %392 = llvm.mlir.addressof @str38 : !llvm.ptr
          %393 = arith.constant 7 : i64
          %394 = func.call @cc_make_string(%392, %393) : (!llvm.ptr, i64) -> i64
          %395 = func.call @cc_intern(%391, %394) : (i64, i64) -> i64
          %396 = func.call @cc_nil_value() : () -> i64
          %397 = func.call @cc_cons(%395, %396) : (i64, i64) -> i64
          %398 = func.call @cc_values_pack(%397) : (i64) -> i64
          func.call @stack_push_pointer(%395) : (i64) -> ()
          %399 = func.call @stack_pop_pointer() : () -> i64
          %400 = llvm.mlir.addressof @str39 : !llvm.ptr
          %401 = arith.constant 13 : i64
          %402 = func.call @cc_make_string(%400, %401) : (!llvm.ptr, i64) -> i64
          %403 = llvm.mlir.addressof @str40 : !llvm.ptr
          %404 = arith.constant 11 : i64
          %405 = func.call @cc_make_string(%403, %404) : (!llvm.ptr, i64) -> i64
          %406 = func.call @cc_intern(%402, %405) : (i64, i64) -> i64
          %407 = func.call @cc_nil_value() : () -> i64
          %408 = func.call @cc_cons(%406, %407) : (i64, i64) -> i64
          %409 = func.call @cc_values_pack(%408) : (i64) -> i64
          func.call @stack_push_pointer(%406) : (i64) -> ()
          %410 = arith.constant 8 : i64
          func.call @stack_push_fixnum(%410) : (i64) -> ()
          func.call @stack_push_nil() : () -> ()
          %411 = func.call @stack_pop_pointer() : () -> i64
          %412 = func.call @stack_pop_pointer() : () -> i64
          %413 = func.call @cc_cons(%412, %411) : (i64, i64) -> i64
          func.call @stack_push_pointer(%413) : (i64) -> ()
          %414 = func.call @stack_pop_pointer() : () -> i64
          %415 = func.call @stack_pop_pointer() : () -> i64
          %416 = func.call @cc_cons(%415, %414) : (i64, i64) -> i64
          func.call @stack_push_pointer(%416) : (i64) -> ()
          %417 = func.call @stack_pop_pointer() : () -> i64
          %418 = func.call @cc_nil_value() : () -> i64
          %419 = func.call @cc_errorp(%366) : (i64) -> i64
          %420 = arith.cmpi ne, %419, %418 : i64
          %421 = arith.cmpi eq, %418, %418 : i64
          %422 = arith.andi %420, %421 : i1
          %423 = scf.if %422 -> (i64) {
            scf.yield %366 : i64
          } else {
            scf.yield %418 : i64
          }
          %424 = func.call @cc_errorp(%377) : (i64) -> i64
          %425 = arith.cmpi ne, %424, %418 : i64
          %426 = arith.cmpi eq, %423, %418 : i64
          %427 = arith.andi %425, %426 : i1
          %428 = scf.if %427 -> (i64) {
            scf.yield %377 : i64
          } else {
            scf.yield %423 : i64
          }
          %429 = func.call @cc_errorp(%388) : (i64) -> i64
          %430 = arith.cmpi ne, %429, %418 : i64
          %431 = arith.cmpi eq, %428, %418 : i64
          %432 = arith.andi %430, %431 : i1
          %433 = scf.if %432 -> (i64) {
            scf.yield %388 : i64
          } else {
            scf.yield %428 : i64
          }
          %434 = func.call @cc_errorp(%399) : (i64) -> i64
          %435 = arith.cmpi ne, %434, %418 : i64
          %436 = arith.cmpi eq, %433, %418 : i64
          %437 = arith.andi %435, %436 : i1
          %438 = scf.if %437 -> (i64) {
            scf.yield %399 : i64
          } else {
            scf.yield %433 : i64
          }
          %439 = func.call @cc_errorp(%417) : (i64) -> i64
          %440 = arith.cmpi ne, %439, %418 : i64
          %441 = arith.cmpi eq, %438, %418 : i64
          %442 = arith.andi %440, %441 : i1
          %443 = scf.if %442 -> (i64) {
            scf.yield %417 : i64
          } else {
            scf.yield %438 : i64
          }
          %444 = arith.cmpi ne, %443, %418 : i64
          scf.if %444 {
            func.call @stack_push_pointer(%443) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%366) : (i64) -> ()
            func.call @stack_push_pointer(%377) : (i64) -> ()
            func.call @stack_push_pointer(%388) : (i64) -> ()
            func.call @stack_push_pointer(%399) : (i64) -> ()
            func.call @stack_push_pointer(%417) : (i64) -> ()
            %445 = llvm.mlir.addressof @str41 : !llvm.ptr
            %446 = func.call @cc_make_function_ref_const(%445) : (!llvm.ptr) -> i64
            %447 = arith.constant 5 : i64
            func.call @cc_funcall_stack(%446, %447) : (i64, i64) -> ()
          }
          %448 = func.call @stack_pop_pointer() : () -> i64
          %449 = llvm.mlir.addressof @str42 : !llvm.ptr
          %450 = arith.constant 6 : i64
          %451 = func.call @cc_make_symbol(%449, %450) : (!llvm.ptr, i64) -> i64
          %452 = func.call @cc_symbol_value(%451) : (i64) -> i64
          %453 = func.call @cc_set_symbol_value(%451, %448) : (i64, i64) -> i64
          %454 = func.call @cc_nil_value() : () -> i64
          %455 = func.call @cc_nil_value() : () -> i64
          %456 = func.call @cc_errorp(%454) : (i64) -> i64
          %457 = arith.cmpi ne, %456, %455 : i64
          %458 = scf.if %457 -> (i64) {
            scf.yield %454 : i64
          } else {
            %459 = llvm.mlir.addressof @str43 : !llvm.ptr
            %460 = arith.constant 6 : i64
            %461 = func.call @cc_make_string(%459, %460) : (!llvm.ptr, i64) -> i64
            %462 = func.call @cc_nil_value() : () -> i64
            %463 = func.call @cc_intern(%461, %462) : (i64, i64) -> i64
            %464 = func.call @cc_nil_value() : () -> i64
            %465 = func.call @cc_cons(%463, %464) : (i64, i64) -> i64
            %466 = func.call @cc_values_pack(%465) : (i64) -> i64
            func.call @stack_push_pointer(%463) : (i64) -> ()
            %467 = func.call @stack_pop_pointer() : () -> i64
            %468 = func.call @cc_nil_value() : () -> i64
            %469 = func.call @cc_errorp(%467) : (i64) -> i64
            %470 = arith.cmpi ne, %469, %468 : i64
            %471 = arith.cmpi eq, %468, %468 : i64
            %472 = arith.andi %470, %471 : i1
            %473 = scf.if %472 -> (i64) {
              scf.yield %467 : i64
            } else {
              scf.yield %468 : i64
            }
            %474 = arith.cmpi ne, %473, %468 : i64
            scf.if %474 {
              func.call @stack_push_pointer(%473) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%467) : (i64) -> ()
              %475 = llvm.mlir.addressof @str44 : !llvm.ptr
              %476 = func.call @cc_make_function_ref_const(%475) : (!llvm.ptr) -> i64
              %477 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%476, %477) : (i64, i64) -> ()
            }
            %478 = func.call @stack_pop_pointer() : () -> i64
            %479 = func.call @cc_nil_value() : () -> i64
            %480 = func.call @cc_nil_value() : () -> i64
            %481 = func.call @cc_errorp(%479) : (i64) -> i64
            %482 = arith.cmpi ne, %481, %480 : i64
            %483 = scf.if %482 -> (i64) {
              scf.yield %479 : i64
            } else {
              func.call @stack_push_pointer(%478) : (i64) -> ()
              %484 = func.call @stack_pop_pointer() : () -> i64
              %485 = func.call @cc_nil_value() : () -> i64
              %486 = func.call @cc_errorp(%484) : (i64) -> i64
              %487 = arith.cmpi ne, %486, %485 : i64
              %488 = arith.cmpi eq, %485, %485 : i64
              %489 = arith.andi %487, %488 : i1
              %490 = scf.if %489 -> (i64) {
                scf.yield %484 : i64
              } else {
                scf.yield %485 : i64
              }
              %491 = arith.cmpi ne, %490, %485 : i64
              scf.if %491 {
                func.call @stack_push_pointer(%490) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%484) : (i64) -> ()
                %492 = llvm.mlir.addressof @str45 : !llvm.ptr
                %493 = func.call @cc_make_function_ref_const(%492) : (!llvm.ptr) -> i64
                %494 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%493, %494) : (i64, i64) -> ()
              }
              %495 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%478) : (i64) -> ()
              %496 = func.call @stack_pop_pointer() : () -> i64
              %497 = func.call @cc_nil_value() : () -> i64
              %498 = func.call @cc_errorp(%496) : (i64) -> i64
              %499 = arith.cmpi ne, %498, %497 : i64
              %500 = arith.cmpi eq, %497, %497 : i64
              %501 = arith.andi %499, %500 : i1
              %502 = scf.if %501 -> (i64) {
                scf.yield %496 : i64
              } else {
                scf.yield %497 : i64
              }
              %503 = arith.cmpi ne, %502, %497 : i64
              scf.if %503 {
                func.call @stack_push_pointer(%502) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%496) : (i64) -> ()
                %504 = llvm.mlir.addressof @str46 : !llvm.ptr
                %505 = func.call @cc_make_function_ref_const(%504) : (!llvm.ptr) -> i64
                %506 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%505, %506) : (i64, i64) -> ()
              }
              %507 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%478) : (i64) -> ()
              %508 = func.call @stack_pop_pointer() : () -> i64
              %509 = func.call @cc_nil_value() : () -> i64
              %510 = func.call @cc_errorp(%508) : (i64) -> i64
              %511 = arith.cmpi ne, %510, %509 : i64
              %512 = arith.cmpi eq, %509, %509 : i64
              %513 = arith.andi %511, %512 : i1
              %514 = scf.if %513 -> (i64) {
                scf.yield %508 : i64
              } else {
                scf.yield %509 : i64
              }
              %515 = arith.cmpi ne, %514, %509 : i64
              scf.if %515 {
                func.call @stack_push_pointer(%514) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%508) : (i64) -> ()
                %516 = llvm.mlir.addressof @str47 : !llvm.ptr
                %517 = func.call @cc_make_function_ref_const(%516) : (!llvm.ptr) -> i64
                %518 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%517, %518) : (i64, i64) -> ()
              }
              %519 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%478) : (i64) -> ()
              %520 = func.call @stack_pop_pointer() : () -> i64
              %521 = func.call @cc_nil_value() : () -> i64
              %522 = func.call @cc_errorp(%520) : (i64) -> i64
              %523 = arith.cmpi ne, %522, %521 : i64
              %524 = arith.cmpi eq, %521, %521 : i64
              %525 = arith.andi %523, %524 : i1
              %526 = scf.if %525 -> (i64) {
                scf.yield %520 : i64
              } else {
                scf.yield %521 : i64
              }
              %527 = arith.cmpi ne, %526, %521 : i64
              scf.if %527 {
                func.call @stack_push_pointer(%526) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%520) : (i64) -> ()
                %528 = llvm.mlir.addressof @str48 : !llvm.ptr
                %529 = func.call @cc_make_function_ref_const(%528) : (!llvm.ptr) -> i64
                %530 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%529, %530) : (i64, i64) -> ()
              }
              %531 = func.call @stack_pop_pointer() : () -> i64
              %532 = func.call @cc_nil_value() : () -> i64
              %533 = func.call @cc_errorp(%495) : (i64) -> i64
              %534 = arith.cmpi ne, %533, %532 : i64
              %535 = arith.cmpi eq, %532, %532 : i64
              %536 = arith.andi %534, %535 : i1
              %537 = scf.if %536 -> (i64) {
                scf.yield %495 : i64
              } else {
                scf.yield %532 : i64
              }
              %538 = func.call @cc_errorp(%507) : (i64) -> i64
              %539 = arith.cmpi ne, %538, %532 : i64
              %540 = arith.cmpi eq, %537, %532 : i64
              %541 = arith.andi %539, %540 : i1
              %542 = scf.if %541 -> (i64) {
                scf.yield %507 : i64
              } else {
                scf.yield %537 : i64
              }
              %543 = func.call @cc_errorp(%519) : (i64) -> i64
              %544 = arith.cmpi ne, %543, %532 : i64
              %545 = arith.cmpi eq, %542, %532 : i64
              %546 = arith.andi %544, %545 : i1
              %547 = scf.if %546 -> (i64) {
                scf.yield %519 : i64
              } else {
                scf.yield %542 : i64
              }
              %548 = func.call @cc_errorp(%531) : (i64) -> i64
              %549 = arith.cmpi ne, %548, %532 : i64
              %550 = arith.cmpi eq, %547, %532 : i64
              %551 = arith.andi %549, %550 : i1
              %552 = scf.if %551 -> (i64) {
                scf.yield %531 : i64
              } else {
                scf.yield %547 : i64
              }
              %553 = arith.cmpi ne, %552, %532 : i64
              scf.if %553 {
                func.call @stack_push_pointer(%552) : (i64) -> ()
              } else {
                %554 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%554) : (i64) -> ()
                func.call @stack_push_pointer(%531) : (i64) -> ()
                %555 = func.call @stack_pop_pointer() : () -> i64
                %556 = func.call @stack_pop_pointer() : () -> i64
                %557 = func.call @cc_cons(%555, %556) : (i64, i64) -> i64
                func.call @stack_push_pointer(%557) : (i64) -> ()
                func.call @stack_push_pointer(%519) : (i64) -> ()
                %558 = func.call @stack_pop_pointer() : () -> i64
                %559 = func.call @stack_pop_pointer() : () -> i64
                %560 = func.call @cc_cons(%558, %559) : (i64, i64) -> i64
                func.call @stack_push_pointer(%560) : (i64) -> ()
                func.call @stack_push_pointer(%507) : (i64) -> ()
                %561 = func.call @stack_pop_pointer() : () -> i64
                %562 = func.call @stack_pop_pointer() : () -> i64
                %563 = func.call @cc_cons(%561, %562) : (i64, i64) -> i64
                func.call @stack_push_pointer(%563) : (i64) -> ()
                func.call @stack_push_pointer(%495) : (i64) -> ()
                %564 = func.call @stack_pop_pointer() : () -> i64
                %565 = func.call @stack_pop_pointer() : () -> i64
                %566 = func.call @cc_cons(%564, %565) : (i64, i64) -> i64
                func.call @stack_push_pointer(%566) : (i64) -> ()
              }
              %567 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %567 : i64
            }
            func.call @stack_push_pointer(%483) : (i64) -> ()
            %568 = func.call @stack_pop_pointer() : () -> i64
            %569 = func.call @cc_multiple_value_list(%568) : (i64) -> i64
            %570 = llvm.mlir.addressof @str49 : !llvm.ptr
            %571 = arith.constant 6 : i64
            %572 = func.call @cc_make_string(%570, %571) : (!llvm.ptr, i64) -> i64
            %573 = func.call @cc_nil_value() : () -> i64
            %574 = func.call @cc_intern(%572, %573) : (i64, i64) -> i64
            %575 = func.call @cc_nil_value() : () -> i64
            %576 = func.call @cc_cons(%574, %575) : (i64, i64) -> i64
            %577 = func.call @cc_values_pack(%576) : (i64) -> i64
            %578 = func.call @cc_symbol_value(%574) : (i64) -> i64
            func.call @stack_push_pointer(%578) : (i64) -> ()
            %579 = func.call @stack_pop_pointer() : () -> i64
            %580 = func.call @cc_nil_value() : () -> i64
            %581 = func.call @cc_errorp(%579) : (i64) -> i64
            %582 = arith.cmpi ne, %581, %580 : i64
            %583 = arith.cmpi eq, %580, %580 : i64
            %584 = arith.andi %582, %583 : i1
            %585 = scf.if %584 -> (i64) {
              scf.yield %579 : i64
            } else {
              scf.yield %580 : i64
            }
            %586 = arith.cmpi ne, %585, %580 : i64
            scf.if %586 {
              func.call @stack_push_pointer(%585) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%579) : (i64) -> ()
              %587 = llvm.mlir.addressof @str50 : !llvm.ptr
              %588 = func.call @cc_make_function_ref_const(%587) : (!llvm.ptr) -> i64
              %589 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%588, %589) : (i64, i64) -> ()
            }
            %590 = func.call @stack_depth() : () -> i64
            %591 = arith.constant 0 : i64
            %592 = arith.cmpi sgt, %590, %591 : i64
            scf.if %592 {
              %593 = func.call @stack_pop_pointer() : () -> i64
            }
            %594 = func.call @cc_values_pack(%569) : (i64) -> i64
            func.call @stack_push_pointer(%594) : (i64) -> ()
            %595 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %595 : i64
          }
          func.call @stack_push_pointer(%458) : (i64) -> ()
          %596 = func.call @cc_set_symbol_value(%451, %452) : (i64, i64) -> i64
          %597 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%64) : (i64) -> ()
          %598 = func.call @stack_pop_pointer() : () -> i64
          %599 = llvm.mlir.addressof @str51 : !llvm.ptr
          %600 = arith.constant 9 : i64
          %601 = func.call @cc_make_string(%599, %600) : (!llvm.ptr, i64) -> i64
          %602 = llvm.mlir.addressof @str52 : !llvm.ptr
          %603 = arith.constant 7 : i64
          %604 = func.call @cc_make_string(%602, %603) : (!llvm.ptr, i64) -> i64
          %605 = func.call @cc_intern(%601, %604) : (i64, i64) -> i64
          %606 = func.call @cc_nil_value() : () -> i64
          %607 = func.call @cc_cons(%605, %606) : (i64, i64) -> i64
          %608 = func.call @cc_values_pack(%607) : (i64) -> i64
          func.call @stack_push_pointer(%605) : (i64) -> ()
          %609 = func.call @stack_pop_pointer() : () -> i64
          %610 = llvm.mlir.addressof @str53 : !llvm.ptr
          %611 = arith.constant 5 : i64
          %612 = func.call @cc_make_string(%610, %611) : (!llvm.ptr, i64) -> i64
          %613 = llvm.mlir.addressof @str54 : !llvm.ptr
          %614 = arith.constant 7 : i64
          %615 = func.call @cc_make_string(%613, %614) : (!llvm.ptr, i64) -> i64
          %616 = func.call @cc_intern(%612, %615) : (i64, i64) -> i64
          %617 = func.call @cc_nil_value() : () -> i64
          %618 = func.call @cc_cons(%616, %617) : (i64, i64) -> i64
          %619 = func.call @cc_values_pack(%618) : (i64) -> i64
          func.call @stack_push_pointer(%616) : (i64) -> ()
          %620 = func.call @stack_pop_pointer() : () -> i64
          %621 = llvm.mlir.addressof @str55 : !llvm.ptr
          %622 = arith.constant 12 : i64
          %623 = func.call @cc_make_string(%621, %622) : (!llvm.ptr, i64) -> i64
          %624 = llvm.mlir.addressof @str56 : !llvm.ptr
          %625 = arith.constant 7 : i64
          %626 = func.call @cc_make_string(%624, %625) : (!llvm.ptr, i64) -> i64
          %627 = func.call @cc_intern(%623, %626) : (i64, i64) -> i64
          %628 = func.call @cc_nil_value() : () -> i64
          %629 = func.call @cc_cons(%627, %628) : (i64, i64) -> i64
          %630 = func.call @cc_values_pack(%629) : (i64) -> i64
          func.call @stack_push_pointer(%627) : (i64) -> ()
          %631 = func.call @stack_pop_pointer() : () -> i64
          %632 = llvm.mlir.addressof @str57 : !llvm.ptr
          %633 = arith.constant 13 : i64
          %634 = func.call @cc_make_string(%632, %633) : (!llvm.ptr, i64) -> i64
          %635 = llvm.mlir.addressof @str58 : !llvm.ptr
          %636 = arith.constant 11 : i64
          %637 = func.call @cc_make_string(%635, %636) : (!llvm.ptr, i64) -> i64
          %638 = func.call @cc_intern(%634, %637) : (i64, i64) -> i64
          %639 = func.call @cc_nil_value() : () -> i64
          %640 = func.call @cc_cons(%638, %639) : (i64, i64) -> i64
          %641 = func.call @cc_values_pack(%640) : (i64) -> i64
          func.call @stack_push_pointer(%638) : (i64) -> ()
          %642 = arith.constant 8 : i64
          func.call @stack_push_fixnum(%642) : (i64) -> ()
          func.call @stack_push_nil() : () -> ()
          %643 = func.call @stack_pop_pointer() : () -> i64
          %644 = func.call @stack_pop_pointer() : () -> i64
          %645 = func.call @cc_cons(%644, %643) : (i64, i64) -> i64
          func.call @stack_push_pointer(%645) : (i64) -> ()
          %646 = func.call @stack_pop_pointer() : () -> i64
          %647 = func.call @stack_pop_pointer() : () -> i64
          %648 = func.call @cc_cons(%647, %646) : (i64, i64) -> i64
          func.call @stack_push_pointer(%648) : (i64) -> ()
          %649 = func.call @stack_pop_pointer() : () -> i64
          %650 = func.call @cc_nil_value() : () -> i64
          %651 = func.call @cc_errorp(%598) : (i64) -> i64
          %652 = arith.cmpi ne, %651, %650 : i64
          %653 = arith.cmpi eq, %650, %650 : i64
          %654 = arith.andi %652, %653 : i1
          %655 = scf.if %654 -> (i64) {
            scf.yield %598 : i64
          } else {
            scf.yield %650 : i64
          }
          %656 = func.call @cc_errorp(%609) : (i64) -> i64
          %657 = arith.cmpi ne, %656, %650 : i64
          %658 = arith.cmpi eq, %655, %650 : i64
          %659 = arith.andi %657, %658 : i1
          %660 = scf.if %659 -> (i64) {
            scf.yield %609 : i64
          } else {
            scf.yield %655 : i64
          }
          %661 = func.call @cc_errorp(%620) : (i64) -> i64
          %662 = arith.cmpi ne, %661, %650 : i64
          %663 = arith.cmpi eq, %660, %650 : i64
          %664 = arith.andi %662, %663 : i1
          %665 = scf.if %664 -> (i64) {
            scf.yield %620 : i64
          } else {
            scf.yield %660 : i64
          }
          %666 = func.call @cc_errorp(%631) : (i64) -> i64
          %667 = arith.cmpi ne, %666, %650 : i64
          %668 = arith.cmpi eq, %665, %650 : i64
          %669 = arith.andi %667, %668 : i1
          %670 = scf.if %669 -> (i64) {
            scf.yield %631 : i64
          } else {
            scf.yield %665 : i64
          }
          %671 = func.call @cc_errorp(%649) : (i64) -> i64
          %672 = arith.cmpi ne, %671, %650 : i64
          %673 = arith.cmpi eq, %670, %650 : i64
          %674 = arith.andi %672, %673 : i1
          %675 = scf.if %674 -> (i64) {
            scf.yield %649 : i64
          } else {
            scf.yield %670 : i64
          }
          %676 = arith.cmpi ne, %675, %650 : i64
          scf.if %676 {
            func.call @stack_push_pointer(%675) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%598) : (i64) -> ()
            func.call @stack_push_pointer(%609) : (i64) -> ()
            func.call @stack_push_pointer(%620) : (i64) -> ()
            func.call @stack_push_pointer(%631) : (i64) -> ()
            func.call @stack_push_pointer(%649) : (i64) -> ()
            %677 = llvm.mlir.addressof @str59 : !llvm.ptr
            %678 = func.call @cc_make_function_ref_const(%677) : (!llvm.ptr) -> i64
            %679 = arith.constant 5 : i64
            func.call @cc_funcall_stack(%678, %679) : (i64, i64) -> ()
          }
          %680 = func.call @stack_pop_pointer() : () -> i64
          %681 = llvm.mlir.addressof @str60 : !llvm.ptr
          %682 = arith.constant 6 : i64
          %683 = func.call @cc_make_symbol(%681, %682) : (!llvm.ptr, i64) -> i64
          %684 = func.call @cc_symbol_value(%683) : (i64) -> i64
          %685 = func.call @cc_set_symbol_value(%683, %680) : (i64, i64) -> i64
          %686 = func.call @cc_nil_value() : () -> i64
          %687 = func.call @cc_nil_value() : () -> i64
          %688 = func.call @cc_errorp(%686) : (i64) -> i64
          %689 = arith.cmpi ne, %688, %687 : i64
          %690 = scf.if %689 -> (i64) {
            scf.yield %686 : i64
          } else {
            %691 = llvm.mlir.addressof @str61 : !llvm.ptr
            %692 = arith.constant 6 : i64
            %693 = func.call @cc_make_string(%691, %692) : (!llvm.ptr, i64) -> i64
            %694 = func.call @cc_nil_value() : () -> i64
            %695 = func.call @cc_intern(%693, %694) : (i64, i64) -> i64
            %696 = func.call @cc_nil_value() : () -> i64
            %697 = func.call @cc_cons(%695, %696) : (i64, i64) -> i64
            %698 = func.call @cc_values_pack(%697) : (i64) -> i64
            func.call @stack_push_pointer(%695) : (i64) -> ()
            %699 = func.call @stack_pop_pointer() : () -> i64
            %700 = func.call @cc_nil_value() : () -> i64
            %701 = func.call @cc_errorp(%699) : (i64) -> i64
            %702 = arith.cmpi ne, %701, %700 : i64
            %703 = arith.cmpi eq, %700, %700 : i64
            %704 = arith.andi %702, %703 : i1
            %705 = scf.if %704 -> (i64) {
              scf.yield %699 : i64
            } else {
              scf.yield %700 : i64
            }
            %706 = arith.cmpi ne, %705, %700 : i64
            scf.if %706 {
              func.call @stack_push_pointer(%705) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%699) : (i64) -> ()
              %707 = llvm.mlir.addressof @str62 : !llvm.ptr
              %708 = func.call @cc_make_function_ref_const(%707) : (!llvm.ptr) -> i64
              %709 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%708, %709) : (i64, i64) -> ()
            }
            %710 = func.call @stack_pop_pointer() : () -> i64
            %711 = func.call @cc_nil_value() : () -> i64
            %712 = func.call @cc_nil_value() : () -> i64
            %713 = func.call @cc_errorp(%711) : (i64) -> i64
            %714 = arith.cmpi ne, %713, %712 : i64
            %715 = scf.if %714 -> (i64) {
              scf.yield %711 : i64
            } else {
              func.call @stack_push_pointer(%710) : (i64) -> ()
              %716 = func.call @stack_pop_pointer() : () -> i64
              %717 = func.call @cc_nil_value() : () -> i64
              %718 = func.call @cc_errorp(%716) : (i64) -> i64
              %719 = arith.cmpi ne, %718, %717 : i64
              %720 = arith.cmpi eq, %717, %717 : i64
              %721 = arith.andi %719, %720 : i1
              %722 = scf.if %721 -> (i64) {
                scf.yield %716 : i64
              } else {
                scf.yield %717 : i64
              }
              %723 = arith.cmpi ne, %722, %717 : i64
              scf.if %723 {
                func.call @stack_push_pointer(%722) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%716) : (i64) -> ()
                %724 = llvm.mlir.addressof @str63 : !llvm.ptr
                %725 = func.call @cc_make_function_ref_const(%724) : (!llvm.ptr) -> i64
                %726 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%725, %726) : (i64, i64) -> ()
              }
              %727 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%710) : (i64) -> ()
              %728 = func.call @stack_pop_pointer() : () -> i64
              %729 = func.call @cc_nil_value() : () -> i64
              %730 = func.call @cc_errorp(%728) : (i64) -> i64
              %731 = arith.cmpi ne, %730, %729 : i64
              %732 = arith.cmpi eq, %729, %729 : i64
              %733 = arith.andi %731, %732 : i1
              %734 = scf.if %733 -> (i64) {
                scf.yield %728 : i64
              } else {
                scf.yield %729 : i64
              }
              %735 = arith.cmpi ne, %734, %729 : i64
              scf.if %735 {
                func.call @stack_push_pointer(%734) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%728) : (i64) -> ()
                %736 = llvm.mlir.addressof @str64 : !llvm.ptr
                %737 = func.call @cc_make_function_ref_const(%736) : (!llvm.ptr) -> i64
                %738 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%737, %738) : (i64, i64) -> ()
              }
              %739 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%710) : (i64) -> ()
              %740 = func.call @stack_pop_pointer() : () -> i64
              %741 = llvm.mlir.addressof @str65 : !llvm.ptr
              %742 = arith.constant 9 : i64
              %743 = func.call @cc_make_string(%741, %742) : (!llvm.ptr, i64) -> i64
              %744 = llvm.mlir.addressof @str66 : !llvm.ptr
              %745 = arith.constant 11 : i64
              %746 = func.call @cc_make_string(%744, %745) : (!llvm.ptr, i64) -> i64
              %747 = func.call @cc_intern(%743, %746) : (i64, i64) -> i64
              %748 = func.call @cc_nil_value() : () -> i64
              %749 = func.call @cc_cons(%747, %748) : (i64, i64) -> i64
              %750 = func.call @cc_values_pack(%749) : (i64) -> i64
              func.call @stack_push_pointer(%747) : (i64) -> ()
              %751 = func.call @stack_pop_pointer() : () -> i64
              %752 = func.call @cc_nil_value() : () -> i64
              %753 = func.call @cc_errorp(%740) : (i64) -> i64
              %754 = arith.cmpi ne, %753, %752 : i64
              %755 = arith.cmpi eq, %752, %752 : i64
              %756 = arith.andi %754, %755 : i1
              %757 = scf.if %756 -> (i64) {
                scf.yield %740 : i64
              } else {
                scf.yield %752 : i64
              }
              %758 = func.call @cc_errorp(%751) : (i64) -> i64
              %759 = arith.cmpi ne, %758, %752 : i64
              %760 = arith.cmpi eq, %757, %752 : i64
              %761 = arith.andi %759, %760 : i1
              %762 = scf.if %761 -> (i64) {
                scf.yield %751 : i64
              } else {
                scf.yield %757 : i64
              }
              %763 = arith.cmpi ne, %762, %752 : i64
              scf.if %763 {
                func.call @stack_push_pointer(%762) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%740) : (i64) -> ()
                func.call @stack_push_pointer(%751) : (i64) -> ()
                %764 = llvm.mlir.addressof @str67 : !llvm.ptr
                %765 = func.call @cc_make_function_ref_const(%764) : (!llvm.ptr) -> i64
                %766 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%765, %766) : (i64, i64) -> ()
              }
              %767 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%710) : (i64) -> ()
              %768 = func.call @stack_pop_pointer() : () -> i64
              %769 = func.call @cc_nil_value() : () -> i64
              %770 = func.call @cc_errorp(%768) : (i64) -> i64
              %771 = arith.cmpi ne, %770, %769 : i64
              %772 = arith.cmpi eq, %769, %769 : i64
              %773 = arith.andi %771, %772 : i1
              %774 = scf.if %773 -> (i64) {
                scf.yield %768 : i64
              } else {
                scf.yield %769 : i64
              }
              %775 = arith.cmpi ne, %774, %769 : i64
              scf.if %775 {
                func.call @stack_push_pointer(%774) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%768) : (i64) -> ()
                %776 = llvm.mlir.addressof @str68 : !llvm.ptr
                %777 = func.call @cc_make_function_ref_const(%776) : (!llvm.ptr) -> i64
                %778 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%777, %778) : (i64, i64) -> ()
              }
              %779 = func.call @stack_pop_pointer() : () -> i64
              %780 = arith.constant 34 : i64
              %781 = func.call @cc_box_character(%780) : (i64) -> i64
              func.call @stack_push_pointer(%781) : (i64) -> ()
              %782 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%710) : (i64) -> ()
              %783 = func.call @stack_pop_pointer() : () -> i64
              %784 = func.call @cc_nil_value() : () -> i64
              %785 = func.call @cc_errorp(%782) : (i64) -> i64
              %786 = arith.cmpi ne, %785, %784 : i64
              %787 = arith.cmpi eq, %784, %784 : i64
              %788 = arith.andi %786, %787 : i1
              %789 = scf.if %788 -> (i64) {
                scf.yield %782 : i64
              } else {
                scf.yield %784 : i64
              }
              %790 = func.call @cc_errorp(%783) : (i64) -> i64
              %791 = arith.cmpi ne, %790, %784 : i64
              %792 = arith.cmpi eq, %789, %784 : i64
              %793 = arith.andi %791, %792 : i1
              %794 = scf.if %793 -> (i64) {
                scf.yield %783 : i64
              } else {
                scf.yield %789 : i64
              }
              %795 = arith.cmpi ne, %794, %784 : i64
              scf.if %795 {
                func.call @stack_push_pointer(%794) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%782) : (i64) -> ()
                func.call @stack_push_pointer(%783) : (i64) -> ()
                %796 = llvm.mlir.addressof @str69 : !llvm.ptr
                %797 = func.call @cc_make_function_ref_const(%796) : (!llvm.ptr) -> i64
                %798 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%797, %798) : (i64, i64) -> ()
              }
              %799 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%710) : (i64) -> ()
              %800 = func.call @stack_pop_pointer() : () -> i64
              %801 = func.call @cc_nil_value() : () -> i64
              %802 = func.call @cc_errorp(%800) : (i64) -> i64
              %803 = arith.cmpi ne, %802, %801 : i64
              %804 = arith.cmpi eq, %801, %801 : i64
              %805 = arith.andi %803, %804 : i1
              %806 = scf.if %805 -> (i64) {
                scf.yield %800 : i64
              } else {
                scf.yield %801 : i64
              }
              %807 = arith.cmpi ne, %806, %801 : i64
              scf.if %807 {
                func.call @stack_push_pointer(%806) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%800) : (i64) -> ()
                %808 = llvm.mlir.addressof @str70 : !llvm.ptr
                %809 = func.call @cc_make_function_ref_const(%808) : (!llvm.ptr) -> i64
                %810 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%809, %810) : (i64, i64) -> ()
              }
              %811 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%710) : (i64) -> ()
              %812 = func.call @stack_pop_pointer() : () -> i64
              %813 = llvm.mlir.addressof @str71 : !llvm.ptr
              %814 = arith.constant 13 : i64
              %815 = func.call @cc_make_string(%813, %814) : (!llvm.ptr, i64) -> i64
              %816 = llvm.mlir.addressof @str72 : !llvm.ptr
              %817 = arith.constant 11 : i64
              %818 = func.call @cc_make_string(%816, %817) : (!llvm.ptr, i64) -> i64
              %819 = func.call @cc_intern(%815, %818) : (i64, i64) -> i64
              %820 = func.call @cc_nil_value() : () -> i64
              %821 = func.call @cc_cons(%819, %820) : (i64, i64) -> i64
              %822 = func.call @cc_values_pack(%821) : (i64) -> i64
              func.call @stack_push_pointer(%819) : (i64) -> ()
              %823 = arith.constant 8 : i64
              func.call @stack_push_fixnum(%823) : (i64) -> ()
              func.call @stack_push_nil() : () -> ()
              %824 = func.call @stack_pop_pointer() : () -> i64
              %825 = func.call @stack_pop_pointer() : () -> i64
              %826 = func.call @cc_cons(%825, %824) : (i64, i64) -> i64
              func.call @stack_push_pointer(%826) : (i64) -> ()
              %827 = func.call @stack_pop_pointer() : () -> i64
              %828 = func.call @stack_pop_pointer() : () -> i64
              %829 = func.call @cc_cons(%828, %827) : (i64, i64) -> i64
              func.call @stack_push_pointer(%829) : (i64) -> ()
              %830 = func.call @stack_pop_pointer() : () -> i64
              %831 = func.call @cc_nil_value() : () -> i64
              %832 = func.call @cc_errorp(%812) : (i64) -> i64
              %833 = arith.cmpi ne, %832, %831 : i64
              %834 = arith.cmpi eq, %831, %831 : i64
              %835 = arith.andi %833, %834 : i1
              %836 = scf.if %835 -> (i64) {
                scf.yield %812 : i64
              } else {
                scf.yield %831 : i64
              }
              %837 = func.call @cc_errorp(%830) : (i64) -> i64
              %838 = arith.cmpi ne, %837, %831 : i64
              %839 = arith.cmpi eq, %836, %831 : i64
              %840 = arith.andi %838, %839 : i1
              %841 = scf.if %840 -> (i64) {
                scf.yield %830 : i64
              } else {
                scf.yield %836 : i64
              }
              %842 = arith.cmpi ne, %841, %831 : i64
              scf.if %842 {
                func.call @stack_push_pointer(%841) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%812) : (i64) -> ()
                func.call @stack_push_pointer(%830) : (i64) -> ()
                %843 = llvm.mlir.addressof @str73 : !llvm.ptr
                %844 = func.call @cc_make_function_ref_const(%843) : (!llvm.ptr) -> i64
                %845 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%844, %845) : (i64, i64) -> ()
              }
              %846 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%710) : (i64) -> ()
              %847 = func.call @stack_pop_pointer() : () -> i64
              %848 = func.call @cc_nil_value() : () -> i64
              %849 = func.call @cc_errorp(%847) : (i64) -> i64
              %850 = arith.cmpi ne, %849, %848 : i64
              %851 = arith.cmpi eq, %848, %848 : i64
              %852 = arith.andi %850, %851 : i1
              %853 = scf.if %852 -> (i64) {
                scf.yield %847 : i64
              } else {
                scf.yield %848 : i64
              }
              %854 = arith.cmpi ne, %853, %848 : i64
              scf.if %854 {
                func.call @stack_push_pointer(%853) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%847) : (i64) -> ()
                %855 = llvm.mlir.addressof @str74 : !llvm.ptr
                %856 = func.call @cc_make_function_ref_const(%855) : (!llvm.ptr) -> i64
                %857 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%856, %857) : (i64, i64) -> ()
              }
              %858 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%710) : (i64) -> ()
              %859 = func.call @stack_pop_pointer() : () -> i64
              %860 = func.call @cc_nil_value() : () -> i64
              %861 = func.call @cc_errorp(%859) : (i64) -> i64
              %862 = arith.cmpi ne, %861, %860 : i64
              %863 = arith.cmpi eq, %860, %860 : i64
              %864 = arith.andi %862, %863 : i1
              %865 = scf.if %864 -> (i64) {
                scf.yield %859 : i64
              } else {
                scf.yield %860 : i64
              }
              %866 = arith.cmpi ne, %865, %860 : i64
              scf.if %866 {
                func.call @stack_push_pointer(%865) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%859) : (i64) -> ()
                %867 = llvm.mlir.addressof @str75 : !llvm.ptr
                %868 = func.call @cc_make_function_ref_const(%867) : (!llvm.ptr) -> i64
                %869 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%868, %869) : (i64, i64) -> ()
              }
              %870 = func.call @stack_pop_pointer() : () -> i64
              %871 = func.call @cc_nil_value() : () -> i64
              %872 = func.call @cc_errorp(%727) : (i64) -> i64
              %873 = arith.cmpi ne, %872, %871 : i64
              %874 = arith.cmpi eq, %871, %871 : i64
              %875 = arith.andi %873, %874 : i1
              %876 = scf.if %875 -> (i64) {
                scf.yield %727 : i64
              } else {
                scf.yield %871 : i64
              }
              %877 = func.call @cc_errorp(%739) : (i64) -> i64
              %878 = arith.cmpi ne, %877, %871 : i64
              %879 = arith.cmpi eq, %876, %871 : i64
              %880 = arith.andi %878, %879 : i1
              %881 = scf.if %880 -> (i64) {
                scf.yield %739 : i64
              } else {
                scf.yield %876 : i64
              }
              %882 = func.call @cc_errorp(%767) : (i64) -> i64
              %883 = arith.cmpi ne, %882, %871 : i64
              %884 = arith.cmpi eq, %881, %871 : i64
              %885 = arith.andi %883, %884 : i1
              %886 = scf.if %885 -> (i64) {
                scf.yield %767 : i64
              } else {
                scf.yield %881 : i64
              }
              %887 = func.call @cc_errorp(%779) : (i64) -> i64
              %888 = arith.cmpi ne, %887, %871 : i64
              %889 = arith.cmpi eq, %886, %871 : i64
              %890 = arith.andi %888, %889 : i1
              %891 = scf.if %890 -> (i64) {
                scf.yield %779 : i64
              } else {
                scf.yield %886 : i64
              }
              %892 = func.call @cc_errorp(%799) : (i64) -> i64
              %893 = arith.cmpi ne, %892, %871 : i64
              %894 = arith.cmpi eq, %891, %871 : i64
              %895 = arith.andi %893, %894 : i1
              %896 = scf.if %895 -> (i64) {
                scf.yield %799 : i64
              } else {
                scf.yield %891 : i64
              }
              %897 = func.call @cc_errorp(%811) : (i64) -> i64
              %898 = arith.cmpi ne, %897, %871 : i64
              %899 = arith.cmpi eq, %896, %871 : i64
              %900 = arith.andi %898, %899 : i1
              %901 = scf.if %900 -> (i64) {
                scf.yield %811 : i64
              } else {
                scf.yield %896 : i64
              }
              %902 = func.call @cc_errorp(%846) : (i64) -> i64
              %903 = arith.cmpi ne, %902, %871 : i64
              %904 = arith.cmpi eq, %901, %871 : i64
              %905 = arith.andi %903, %904 : i1
              %906 = scf.if %905 -> (i64) {
                scf.yield %846 : i64
              } else {
                scf.yield %901 : i64
              }
              %907 = func.call @cc_errorp(%858) : (i64) -> i64
              %908 = arith.cmpi ne, %907, %871 : i64
              %909 = arith.cmpi eq, %906, %871 : i64
              %910 = arith.andi %908, %909 : i1
              %911 = scf.if %910 -> (i64) {
                scf.yield %858 : i64
              } else {
                scf.yield %906 : i64
              }
              %912 = func.call @cc_errorp(%870) : (i64) -> i64
              %913 = arith.cmpi ne, %912, %871 : i64
              %914 = arith.cmpi eq, %911, %871 : i64
              %915 = arith.andi %913, %914 : i1
              %916 = scf.if %915 -> (i64) {
                scf.yield %870 : i64
              } else {
                scf.yield %911 : i64
              }
              %917 = arith.cmpi ne, %916, %871 : i64
              scf.if %917 {
                func.call @stack_push_pointer(%916) : (i64) -> ()
              } else {
                %918 = func.call @cc_nil_value() : () -> i64
                func.call @stack_push_pointer(%918) : (i64) -> ()
                func.call @stack_push_pointer(%870) : (i64) -> ()
                %919 = func.call @stack_pop_pointer() : () -> i64
                %920 = func.call @stack_pop_pointer() : () -> i64
                %921 = func.call @cc_cons(%919, %920) : (i64, i64) -> i64
                func.call @stack_push_pointer(%921) : (i64) -> ()
                func.call @stack_push_pointer(%858) : (i64) -> ()
                %922 = func.call @stack_pop_pointer() : () -> i64
                %923 = func.call @stack_pop_pointer() : () -> i64
                %924 = func.call @cc_cons(%922, %923) : (i64, i64) -> i64
                func.call @stack_push_pointer(%924) : (i64) -> ()
                func.call @stack_push_pointer(%846) : (i64) -> ()
                %925 = func.call @stack_pop_pointer() : () -> i64
                %926 = func.call @stack_pop_pointer() : () -> i64
                %927 = func.call @cc_cons(%925, %926) : (i64, i64) -> i64
                func.call @stack_push_pointer(%927) : (i64) -> ()
                func.call @stack_push_pointer(%811) : (i64) -> ()
                %928 = func.call @stack_pop_pointer() : () -> i64
                %929 = func.call @stack_pop_pointer() : () -> i64
                %930 = func.call @cc_cons(%928, %929) : (i64, i64) -> i64
                func.call @stack_push_pointer(%930) : (i64) -> ()
                func.call @stack_push_pointer(%799) : (i64) -> ()
                %931 = func.call @stack_pop_pointer() : () -> i64
                %932 = func.call @stack_pop_pointer() : () -> i64
                %933 = func.call @cc_cons(%931, %932) : (i64, i64) -> i64
                func.call @stack_push_pointer(%933) : (i64) -> ()
                func.call @stack_push_pointer(%779) : (i64) -> ()
                %934 = func.call @stack_pop_pointer() : () -> i64
                %935 = func.call @stack_pop_pointer() : () -> i64
                %936 = func.call @cc_cons(%934, %935) : (i64, i64) -> i64
                func.call @stack_push_pointer(%936) : (i64) -> ()
                func.call @stack_push_pointer(%767) : (i64) -> ()
                %937 = func.call @stack_pop_pointer() : () -> i64
                %938 = func.call @stack_pop_pointer() : () -> i64
                %939 = func.call @cc_cons(%937, %938) : (i64, i64) -> i64
                func.call @stack_push_pointer(%939) : (i64) -> ()
                func.call @stack_push_pointer(%739) : (i64) -> ()
                %940 = func.call @stack_pop_pointer() : () -> i64
                %941 = func.call @stack_pop_pointer() : () -> i64
                %942 = func.call @cc_cons(%940, %941) : (i64, i64) -> i64
                func.call @stack_push_pointer(%942) : (i64) -> ()
                func.call @stack_push_pointer(%727) : (i64) -> ()
                %943 = func.call @stack_pop_pointer() : () -> i64
                %944 = func.call @stack_pop_pointer() : () -> i64
                %945 = func.call @cc_cons(%943, %944) : (i64, i64) -> i64
                func.call @stack_push_pointer(%945) : (i64) -> ()
              }
              %946 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %946 : i64
            }
            func.call @stack_push_pointer(%715) : (i64) -> ()
            %947 = func.call @stack_pop_pointer() : () -> i64
            %948 = func.call @cc_multiple_value_list(%947) : (i64) -> i64
            %949 = llvm.mlir.addressof @str76 : !llvm.ptr
            %950 = arith.constant 6 : i64
            %951 = func.call @cc_make_string(%949, %950) : (!llvm.ptr, i64) -> i64
            %952 = func.call @cc_nil_value() : () -> i64
            %953 = func.call @cc_intern(%951, %952) : (i64, i64) -> i64
            %954 = func.call @cc_nil_value() : () -> i64
            %955 = func.call @cc_cons(%953, %954) : (i64, i64) -> i64
            %956 = func.call @cc_values_pack(%955) : (i64) -> i64
            %957 = func.call @cc_symbol_value(%953) : (i64) -> i64
            func.call @stack_push_pointer(%957) : (i64) -> ()
            %958 = func.call @stack_pop_pointer() : () -> i64
            %959 = func.call @cc_nil_value() : () -> i64
            %960 = func.call @cc_errorp(%958) : (i64) -> i64
            %961 = arith.cmpi ne, %960, %959 : i64
            %962 = arith.cmpi eq, %959, %959 : i64
            %963 = arith.andi %961, %962 : i1
            %964 = scf.if %963 -> (i64) {
              scf.yield %958 : i64
            } else {
              scf.yield %959 : i64
            }
            %965 = arith.cmpi ne, %964, %959 : i64
            scf.if %965 {
              func.call @stack_push_pointer(%964) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%958) : (i64) -> ()
              %966 = llvm.mlir.addressof @str77 : !llvm.ptr
              %967 = func.call @cc_make_function_ref_const(%966) : (!llvm.ptr) -> i64
              %968 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%967, %968) : (i64, i64) -> ()
            }
            %969 = func.call @stack_depth() : () -> i64
            %970 = arith.constant 0 : i64
            %971 = arith.cmpi sgt, %969, %970 : i64
            scf.if %971 {
              %972 = func.call @stack_pop_pointer() : () -> i64
            }
            %973 = func.call @cc_values_pack(%948) : (i64) -> i64
            func.call @stack_push_pointer(%973) : (i64) -> ()
            %974 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %974 : i64
          }
          func.call @stack_push_pointer(%690) : (i64) -> ()
          %975 = func.call @cc_set_symbol_value(%683, %684) : (i64, i64) -> i64
          %976 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %977 = func.call @stack_pop_pointer() : () -> i64
          %978 = func.call @cc_cons(%976, %977) : (i64, i64) -> i64
          func.call @stack_push_pointer(%978) : (i64) -> ()
          %979 = func.call @stack_pop_pointer() : () -> i64
          %980 = func.call @cc_cons(%597, %979) : (i64, i64) -> i64
          func.call @stack_push_pointer(%980) : (i64) -> ()
          %981 = func.call @stack_pop_pointer() : () -> i64
          %982 = func.call @cc_values_pack(%981) : (i64) -> i64
          func.call @stack_push_pointer(%982) : (i64) -> ()
          %983 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %983 : i64
        }
        func.call @stack_push_pointer(%365) : (i64) -> ()
        %984 = func.call @stack_pop_pointer() : () -> i64
        %985 = func.call @cc_multiple_value_list(%984) : (i64) -> i64
        func.call @stack_push_pointer(%64) : (i64) -> ()
        %986 = func.call @stack_pop_pointer() : () -> i64
        %987 = func.call @cc_nil_value() : () -> i64
        %988 = func.call @cc_errorp(%986) : (i64) -> i64
        %989 = arith.cmpi ne, %988, %987 : i64
        %990 = arith.cmpi eq, %987, %987 : i64
        %991 = arith.andi %989, %990 : i1
        %992 = scf.if %991 -> (i64) {
          scf.yield %986 : i64
        } else {
          scf.yield %987 : i64
        }
        %993 = arith.cmpi ne, %992, %987 : i64
        scf.if %993 {
          func.call @stack_push_pointer(%992) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%986) : (i64) -> ()
          %994 = llvm.mlir.addressof @str78 : !llvm.ptr
          %995 = func.call @cc_make_function_ref_const(%994) : (!llvm.ptr) -> i64
          %996 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%995, %996) : (i64, i64) -> ()
        }
        %997 = func.call @stack_depth() : () -> i64
        %998 = arith.constant 0 : i64
        %999 = arith.cmpi sgt, %997, %998 : i64
        scf.if %999 {
          %1000 = func.call @stack_pop_pointer() : () -> i64
        }
        %1001 = func.call @cc_values_pack(%985) : (i64) -> i64
        func.call @stack_push_pointer(%1001) : (i64) -> ()
        %1002 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %1002 : i64
      }
      func.call @stack_push_pointer(%69) : (i64) -> ()
      %1003 = func.call @stack_pop_pointer() : () -> i64
      %1004 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%1004) : (i64) -> ()
      %1005 = func.call @stack_pop_pointer() : () -> i64
      %1006 = func.call @cc_nil_value() : () -> i64
      %1007 = func.call @cc_errorp(%1005) : (i64) -> i64
      %1008 = arith.cmpi ne, %1007, %1006 : i64
      %1009 = arith.cmpi eq, %1006, %1006 : i64
      %1010 = arith.andi %1008, %1009 : i1
      %1011 = scf.if %1010 -> (i64) {
        scf.yield %1005 : i64
      } else {
        scf.yield %1006 : i64
      }
      %1012 = arith.cmpi ne, %1011, %1006 : i64
      scf.if %1012 {
        func.call @stack_push_pointer(%1011) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1005) : (i64) -> ()
        %1013 = llvm.mlir.addressof @str79 : !llvm.ptr
        %1014 = func.call @cc_make_function_ref_const(%1013) : (!llvm.ptr) -> i64
        %1015 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1014, %1015) : (i64, i64) -> ()
      }
      %1016 = func.call @stack_pop_pointer() : () -> i64
      %1017 = arith.constant 33 : i64
      func.call @stack_push_fixnum(%1017) : (i64) -> ()
      %1018 = arith.constant 34 : i64
      func.call @stack_push_fixnum(%1018) : (i64) -> ()
      %1019 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%1019) : (i64) -> ()
      %1020 = func.call @stack_pop_pointer() : () -> i64
      %1021 = func.call @cc_nil_value() : () -> i64
      %1022 = func.call @cc_errorp(%1020) : (i64) -> i64
      %1023 = arith.cmpi ne, %1022, %1021 : i64
      %1024 = arith.cmpi eq, %1021, %1021 : i64
      %1025 = arith.andi %1023, %1024 : i1
      %1026 = scf.if %1025 -> (i64) {
        scf.yield %1020 : i64
      } else {
        scf.yield %1021 : i64
      }
      %1027 = arith.cmpi ne, %1026, %1021 : i64
      scf.if %1027 {
        func.call @stack_push_pointer(%1026) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1020) : (i64) -> ()
        %1028 = llvm.mlir.addressof @str80 : !llvm.ptr
        %1029 = func.call @cc_make_function_ref_const(%1028) : (!llvm.ptr) -> i64
        %1030 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1029, %1030) : (i64, i64) -> ()
      }
      %1031 = arith.constant 12 : i64
      %1032 = func.call @cc_collect_args(%1031) : (i64) -> i64
      %1033 = func.call @cc_funcall(%1016, %1032) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1033) : (i64) -> ()
      %1034 = func.call @stack_pop_pointer() : () -> i64
      %1035 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%1035) : (i64) -> ()
      %1036 = func.call @stack_pop_pointer() : () -> i64
      %1037 = func.call @cc_nil_value() : () -> i64
      %1038 = func.call @cc_errorp(%1036) : (i64) -> i64
      %1039 = arith.cmpi ne, %1038, %1037 : i64
      %1040 = arith.cmpi eq, %1037, %1037 : i64
      %1041 = arith.andi %1039, %1040 : i1
      %1042 = scf.if %1041 -> (i64) {
        scf.yield %1036 : i64
      } else {
        scf.yield %1037 : i64
      }
      %1043 = arith.cmpi ne, %1042, %1037 : i64
      scf.if %1043 {
        func.call @stack_push_pointer(%1042) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1036) : (i64) -> ()
        %1044 = llvm.mlir.addressof @str81 : !llvm.ptr
        %1045 = func.call @cc_make_function_ref_const(%1044) : (!llvm.ptr) -> i64
        %1046 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1045, %1046) : (i64, i64) -> ()
      }
      %1047 = func.call @stack_pop_pointer() : () -> i64
      %1048 = arith.constant 33 : i64
      func.call @stack_push_fixnum(%1048) : (i64) -> ()
      %1049 = llvm.mlir.addressof @str82 : !llvm.ptr
      %1050 = arith.constant 9 : i64
      %1051 = func.call @cc_make_string(%1049, %1050) : (!llvm.ptr, i64) -> i64
      %1052 = llvm.mlir.addressof @str83 : !llvm.ptr
      %1053 = arith.constant 11 : i64
      %1054 = func.call @cc_make_string(%1052, %1053) : (!llvm.ptr, i64) -> i64
      %1055 = func.call @cc_intern(%1051, %1054) : (i64, i64) -> i64
      %1056 = func.call @cc_nil_value() : () -> i64
      %1057 = func.call @cc_cons(%1055, %1056) : (i64, i64) -> i64
      %1058 = func.call @cc_values_pack(%1057) : (i64) -> i64
      %1059 = func.call @cc_symbol_value(%1055) : (i64) -> i64
      func.call @stack_push_pointer(%1059) : (i64) -> ()
      %1060 = arith.constant 34 : i64
      %1061 = func.call @cc_box_character(%1060) : (i64) -> i64
      func.call @stack_push_pointer(%1061) : (i64) -> ()
      func.call @stack_push_nil() : () -> ()
      %1062 = llvm.mlir.addressof @str84 : !llvm.ptr
      %1063 = arith.constant 9 : i64
      %1064 = func.call @cc_make_string(%1062, %1063) : (!llvm.ptr, i64) -> i64
      %1065 = llvm.mlir.addressof @str85 : !llvm.ptr
      %1066 = arith.constant 11 : i64
      %1067 = func.call @cc_make_string(%1065, %1066) : (!llvm.ptr, i64) -> i64
      %1068 = func.call @cc_intern(%1064, %1067) : (i64, i64) -> i64
      %1069 = func.call @cc_nil_value() : () -> i64
      %1070 = func.call @cc_cons(%1068, %1069) : (i64, i64) -> i64
      %1071 = func.call @cc_values_pack(%1070) : (i64) -> i64
      %1072 = func.call @cc_symbol_value(%1068) : (i64) -> i64
      func.call @stack_push_pointer(%1072) : (i64) -> ()
      %1073 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%1073) : (i64) -> ()
      %1074 = func.call @stack_pop_pointer() : () -> i64
      %1075 = func.call @cc_nil_value() : () -> i64
      %1076 = func.call @cc_errorp(%1074) : (i64) -> i64
      %1077 = arith.cmpi ne, %1076, %1075 : i64
      %1078 = arith.cmpi eq, %1075, %1075 : i64
      %1079 = arith.andi %1077, %1078 : i1
      %1080 = scf.if %1079 -> (i64) {
        scf.yield %1074 : i64
      } else {
        scf.yield %1075 : i64
      }
      %1081 = arith.cmpi ne, %1080, %1075 : i64
      scf.if %1081 {
        func.call @stack_push_pointer(%1080) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1074) : (i64) -> ()
        %1082 = llvm.mlir.addressof @str86 : !llvm.ptr
        %1083 = func.call @cc_make_function_ref_const(%1082) : (!llvm.ptr) -> i64
        %1084 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1083, %1084) : (i64, i64) -> ()
      }
      %1085 = arith.constant 34 : i64
      func.call @stack_push_fixnum(%1085) : (i64) -> ()
      %1086 = arith.constant 8 : i64
      func.call @stack_push_fixnum(%1086) : (i64) -> ()
      %1087 = func.call @stack_pop_pointer() : () -> i64
      %1088 = func.call @cc_nil_value() : () -> i64
      %1089 = func.call @cc_errorp(%1087) : (i64) -> i64
      %1090 = arith.cmpi ne, %1089, %1088 : i64
      %1091 = arith.cmpi eq, %1088, %1088 : i64
      %1092 = arith.andi %1090, %1091 : i1
      %1093 = scf.if %1092 -> (i64) {
        scf.yield %1087 : i64
      } else {
        scf.yield %1088 : i64
      }
      %1094 = arith.cmpi ne, %1093, %1088 : i64
      scf.if %1094 {
        func.call @stack_push_pointer(%1093) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%1087) : (i64) -> ()
        %1095 = llvm.mlir.addressof @str87 : !llvm.ptr
        %1096 = func.call @cc_make_function_ref_const(%1095) : (!llvm.ptr) -> i64
        %1097 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%1096, %1097) : (i64, i64) -> ()
      }
      %1098 = arith.constant 32 : i64
      %1099 = func.call @cc_collect_args(%1098) : (i64) -> i64
      %1100 = func.call @cc_funcall(%1047, %1099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1100) : (i64) -> ()
      %1101 = arith.constant 4 : i64
      %1102 = func.call @cc_collect_args(%1101) : (i64) -> i64
      %1103 = func.call @cc_funcall(%1034, %1102) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1103) : (i64) -> ()
      %1104 = func.call @stack_pop_pointer() : () -> i64
      %1105 = func.call @cc_nil_value() : () -> i64
      %1106 = func.call @cc_errorp(%49) : (i64) -> i64
      %1107 = arith.cmpi ne, %1106, %1105 : i64
      %1108 = arith.cmpi eq, %1105, %1105 : i64
      %1109 = arith.andi %1107, %1108 : i1
      %1110 = scf.if %1109 -> (i64) {
        scf.yield %49 : i64
      } else {
        scf.yield %1105 : i64
      }
      %1111 = func.call @cc_errorp(%1003) : (i64) -> i64
      %1112 = arith.cmpi ne, %1111, %1105 : i64
      %1113 = arith.cmpi eq, %1110, %1105 : i64
      %1114 = arith.andi %1112, %1113 : i1
      %1115 = scf.if %1114 -> (i64) {
        scf.yield %1003 : i64
      } else {
        scf.yield %1110 : i64
      }
      %1116 = func.call @cc_errorp(%1104) : (i64) -> i64
      %1117 = arith.cmpi ne, %1116, %1105 : i64
      %1118 = arith.cmpi eq, %1115, %1105 : i64
      %1119 = arith.andi %1117, %1118 : i1
      %1120 = scf.if %1119 -> (i64) {
        scf.yield %1104 : i64
      } else {
        scf.yield %1115 : i64
      }
      %1121 = arith.cmpi ne, %1120, %1105 : i64
      scf.if %1121 {
        func.call @stack_push_pointer(%1120) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%49) : (i64) -> ()
        func.call @stack_push_pointer(%1003) : (i64) -> ()
        func.call @stack_push_pointer(%1104) : (i64) -> ()
        %1122 = llvm.mlir.addressof @str88 : !llvm.ptr
        %1123 = func.call @cc_make_function_ref_const(%1122) : (!llvm.ptr) -> i64
        %1124 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%1123, %1124) : (i64, i64) -> ()
      }
      %1125 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1125 : i64
    }
    %1126 = func.call @cc_nil_value() : () -> i64
    %1127 = func.call @cc_errorp(%39) : (i64) -> i64
    %1128 = arith.cmpi ne, %1127, %1126 : i64
    %1129 = scf.if %1128 -> (i64) {
      scf.yield %39 : i64
    } else {
      %1130 = func.call @cc_nil_value() : () -> i64
      %1131 = arith.cmpi ne, %1130, %1130 : i64
      scf.if %1131 {
        func.call @stack_push_pointer(%1130) : (i64) -> ()
      } else {
        %1132 = llvm.mlir.addressof @str89 : !llvm.ptr
        %1133 = func.call @cc_make_function_ref_const(%1132) : (!llvm.ptr) -> i64
        %1134 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1133, %1134) : (i64, i64) -> ()
      }
      %1135 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1135 : i64
    }
    func.call @stack_push_pointer(%1129) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("clisp/in_work/regression-tests/framework.lisp\00") : !llvm.array<46 x i8>
  llvm.mlir.global private constant @str2("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str3("STREAM-ELEMENT-TYPE.02.PROBE\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str4("stream-element-type\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str5("core:mkstemp\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str6("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str7("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str9("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str10("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str11("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str12("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str13("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str14("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str17("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str19("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str20("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str21("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str23("mearts\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str24("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("MAKE-SYNONYM-STREAM\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str26("WRITE-BYTE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str27("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str28("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str29("set-stream-element-type\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str30("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str31("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str32("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str33("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str34("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str35("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str36("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str37("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str38("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str39("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str40("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str41("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("mearts\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str43("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str44("MAKE-SYNONYM-STREAM\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str45("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str46("READ-BYTE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str47("READ-BYTE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str48("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str49("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str50("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str51("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str52("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str53("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str54("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str55("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str56("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str57("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str58("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str59("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str60("mearts\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str61("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str62("MAKE-SYNONYM-STREAM\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str63("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str64("READ-BYTE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str65("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str66("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("set-stream-element-type\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str68("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str69("UNREAD-CHAR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str71("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str72("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str73("set-stream-element-type\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str74("READ-BYTE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str75("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str76("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str77("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str78("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str79("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str80("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str81("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str82("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str83("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str84("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str85("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str86("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str87("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str88("test\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str89("show-test-summary\00") : !llvm.array<18 x i8>
}
