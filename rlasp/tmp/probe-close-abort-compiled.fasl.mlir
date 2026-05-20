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
    %8 = llvm.mlir.addressof @str1 : !llvm.ptr
    %9 = arith.constant 11 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%10) : (i64) -> ()
    %11 = func.call @stack_pop_pointer() : () -> i64
    %12 = func.call @cc_nil_value() : () -> i64
    %13 = func.call @cc_errorp(%11) : (i64) -> i64
    %14 = arith.cmpi ne, %13, %12 : i64
    %15 = arith.cmpi eq, %12, %12 : i64
    %16 = arith.andi %14, %15 : i1
    %17 = scf.if %16 -> (i64) {
      scf.yield %11 : i64
    } else {
      scf.yield %12 : i64
    }
    %18 = arith.cmpi ne, %17, %12 : i64
    scf.if %18 {
      func.call @stack_push_pointer(%17) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%11) : (i64) -> ()
      %19 = llvm.mlir.addressof @str2 : !llvm.ptr
      %20 = func.call @cc_make_function_ref_const(%19) : (!llvm.ptr) -> i64
      %21 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%20, %21) : (i64, i64) -> ()
    }
    %22 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%22) : (i64) -> ()
    %23 = func.call @stack_pop_pointer() : () -> i64
    %24 = llvm.mlir.addressof @str3 : !llvm.ptr
    %25 = arith.constant 17 : i64
    %26 = func.call @cc_make_string(%24, %25) : (!llvm.ptr, i64) -> i64
    %27 = llvm.mlir.addressof @str4 : !llvm.ptr
    %28 = arith.constant 7 : i64
    %29 = func.call @cc_make_string(%27, %28) : (!llvm.ptr, i64) -> i64
    %30 = func.call @cc_intern(%26, %29) : (i64, i64) -> i64
    %31 = func.call @cc_nil_value() : () -> i64
    %32 = func.call @cc_cons(%30, %31) : (i64, i64) -> i64
    %33 = func.call @cc_values_pack(%32) : (i64) -> i64
    func.call @stack_push_pointer(%30) : (i64) -> ()
    %34 = func.call @stack_pop_pointer() : () -> i64
    %35 = llvm.mlir.addressof @str5 : !llvm.ptr
    %36 = arith.constant 6 : i64
    %37 = func.call @cc_make_string(%35, %36) : (!llvm.ptr, i64) -> i64
    %38 = llvm.mlir.addressof @str6 : !llvm.ptr
    %39 = arith.constant 7 : i64
    %40 = func.call @cc_make_string(%38, %39) : (!llvm.ptr, i64) -> i64
    %41 = func.call @cc_intern(%37, %40) : (i64, i64) -> i64
    %42 = func.call @cc_nil_value() : () -> i64
    %43 = func.call @cc_cons(%41, %42) : (i64, i64) -> i64
    %44 = func.call @cc_values_pack(%43) : (i64) -> i64
    func.call @stack_push_pointer(%41) : (i64) -> ()
    %45 = func.call @stack_pop_pointer() : () -> i64
    %46 = llvm.mlir.addressof @str7 : !llvm.ptr
    %47 = arith.constant 9 : i64
    %48 = func.call @cc_make_string(%46, %47) : (!llvm.ptr, i64) -> i64
    %49 = llvm.mlir.addressof @str8 : !llvm.ptr
    %50 = arith.constant 7 : i64
    %51 = func.call @cc_make_string(%49, %50) : (!llvm.ptr, i64) -> i64
    %52 = func.call @cc_intern(%48, %51) : (i64, i64) -> i64
    %53 = func.call @cc_nil_value() : () -> i64
    %54 = func.call @cc_cons(%52, %53) : (i64, i64) -> i64
    %55 = func.call @cc_values_pack(%54) : (i64) -> i64
    func.call @stack_push_pointer(%52) : (i64) -> ()
    %56 = func.call @stack_pop_pointer() : () -> i64
    %57 = llvm.mlir.addressof @str9 : !llvm.ptr
    %58 = arith.constant 6 : i64
    %59 = func.call @cc_make_string(%57, %58) : (!llvm.ptr, i64) -> i64
    %60 = llvm.mlir.addressof @str10 : !llvm.ptr
    %61 = arith.constant 7 : i64
    %62 = func.call @cc_make_string(%60, %61) : (!llvm.ptr, i64) -> i64
    %63 = func.call @cc_intern(%59, %62) : (i64, i64) -> i64
    %64 = func.call @cc_nil_value() : () -> i64
    %65 = func.call @cc_cons(%63, %64) : (i64, i64) -> i64
    %66 = func.call @cc_values_pack(%65) : (i64) -> i64
    func.call @stack_push_pointer(%63) : (i64) -> ()
    %67 = func.call @stack_pop_pointer() : () -> i64
    %68 = func.call @cc_nil_value() : () -> i64
    %69 = func.call @cc_errorp(%23) : (i64) -> i64
    %70 = arith.cmpi ne, %69, %68 : i64
    %71 = arith.cmpi eq, %68, %68 : i64
    %72 = arith.andi %70, %71 : i1
    %73 = scf.if %72 -> (i64) {
      scf.yield %23 : i64
    } else {
      scf.yield %68 : i64
    }
    %74 = func.call @cc_errorp(%34) : (i64) -> i64
    %75 = arith.cmpi ne, %74, %68 : i64
    %76 = arith.cmpi eq, %73, %68 : i64
    %77 = arith.andi %75, %76 : i1
    %78 = scf.if %77 -> (i64) {
      scf.yield %34 : i64
    } else {
      scf.yield %73 : i64
    }
    %79 = func.call @cc_errorp(%45) : (i64) -> i64
    %80 = arith.cmpi ne, %79, %68 : i64
    %81 = arith.cmpi eq, %78, %68 : i64
    %82 = arith.andi %80, %81 : i1
    %83 = scf.if %82 -> (i64) {
      scf.yield %45 : i64
    } else {
      scf.yield %78 : i64
    }
    %84 = func.call @cc_errorp(%56) : (i64) -> i64
    %85 = arith.cmpi ne, %84, %68 : i64
    %86 = arith.cmpi eq, %83, %68 : i64
    %87 = arith.andi %85, %86 : i1
    %88 = scf.if %87 -> (i64) {
      scf.yield %56 : i64
    } else {
      scf.yield %83 : i64
    }
    %89 = func.call @cc_errorp(%67) : (i64) -> i64
    %90 = arith.cmpi ne, %89, %68 : i64
    %91 = arith.cmpi eq, %88, %68 : i64
    %92 = arith.andi %90, %91 : i1
    %93 = scf.if %92 -> (i64) {
      scf.yield %67 : i64
    } else {
      scf.yield %88 : i64
    }
    %94 = arith.cmpi ne, %93, %68 : i64
    scf.if %94 {
      func.call @stack_push_pointer(%93) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%23) : (i64) -> ()
      func.call @stack_push_pointer(%34) : (i64) -> ()
      func.call @stack_push_pointer(%45) : (i64) -> ()
      func.call @stack_push_pointer(%56) : (i64) -> ()
      func.call @stack_push_pointer(%67) : (i64) -> ()
      %95 = llvm.mlir.addressof @str11 : !llvm.ptr
      %96 = func.call @cc_make_function_ref_const(%95) : (!llvm.ptr) -> i64
      %97 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%96, %97) : (i64, i64) -> ()
    }
    %98 = func.call @stack_pop_pointer() : () -> i64
    %99 = arith.constant 3 : i64
    func.call @stack_push_fixnum(%99) : (i64) -> ()
    %100 = func.call @stack_pop_pointer() : () -> i64
    %101 = llvm.mlir.addressof @str12 : !llvm.ptr
    %102 = arith.constant 12 : i64
    %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
    %104 = llvm.mlir.addressof @str13 : !llvm.ptr
    %105 = arith.constant 7 : i64
    %106 = func.call @cc_make_string(%104, %105) : (!llvm.ptr, i64) -> i64
    %107 = func.call @cc_intern(%103, %106) : (i64, i64) -> i64
    %108 = func.call @cc_nil_value() : () -> i64
    %109 = func.call @cc_cons(%107, %108) : (i64, i64) -> i64
    %110 = func.call @cc_values_pack(%109) : (i64) -> i64
    func.call @stack_push_pointer(%107) : (i64) -> ()
    %111 = func.call @stack_pop_pointer() : () -> i64
    %112 = llvm.mlir.addressof @str14 : !llvm.ptr
    %113 = arith.constant 9 : i64
    %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
    %115 = llvm.mlir.addressof @str15 : !llvm.ptr
    %116 = arith.constant 11 : i64
    %117 = func.call @cc_make_string(%115, %116) : (!llvm.ptr, i64) -> i64
    %118 = func.call @cc_intern(%114, %117) : (i64, i64) -> i64
    %119 = func.call @cc_nil_value() : () -> i64
    %120 = func.call @cc_cons(%118, %119) : (i64, i64) -> i64
    %121 = func.call @cc_values_pack(%120) : (i64) -> i64
    func.call @stack_push_pointer(%118) : (i64) -> ()
    %122 = func.call @stack_pop_pointer() : () -> i64
    %123 = func.call @cc_nil_value() : () -> i64
    %124 = func.call @cc_errorp(%100) : (i64) -> i64
    %125 = arith.cmpi ne, %124, %123 : i64
    %126 = arith.cmpi eq, %123, %123 : i64
    %127 = arith.andi %125, %126 : i1
    %128 = scf.if %127 -> (i64) {
      scf.yield %100 : i64
    } else {
      scf.yield %123 : i64
    }
    %129 = func.call @cc_errorp(%111) : (i64) -> i64
    %130 = arith.cmpi ne, %129, %123 : i64
    %131 = arith.cmpi eq, %128, %123 : i64
    %132 = arith.andi %130, %131 : i1
    %133 = scf.if %132 -> (i64) {
      scf.yield %111 : i64
    } else {
      scf.yield %128 : i64
    }
    %134 = func.call @cc_errorp(%122) : (i64) -> i64
    %135 = arith.cmpi ne, %134, %123 : i64
    %136 = arith.cmpi eq, %133, %123 : i64
    %137 = arith.andi %135, %136 : i1
    %138 = scf.if %137 -> (i64) {
      scf.yield %122 : i64
    } else {
      scf.yield %133 : i64
    }
    %139 = arith.cmpi ne, %138, %123 : i64
    scf.if %139 {
      func.call @stack_push_pointer(%138) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%100) : (i64) -> ()
      func.call @stack_push_pointer(%111) : (i64) -> ()
      func.call @stack_push_pointer(%122) : (i64) -> ()
      %140 = llvm.mlir.addressof @str16 : !llvm.ptr
      %141 = func.call @cc_make_function_ref_const(%140) : (!llvm.ptr) -> i64
      %142 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%141, %142) : (i64, i64) -> ()
    }
    %143 = func.call @stack_pop_pointer() : () -> i64
    %144 = func.call @cc_nil_value() : () -> i64
    %145 = func.call @cc_nil_value() : () -> i64
    %146 = func.call @cc_errorp(%144) : (i64) -> i64
    %147 = arith.cmpi ne, %146, %145 : i64
    %148:2 = scf.if %147 -> (i64, i64) {
      scf.yield %144, %98 : i64, i64
    } else {
      %149 = llvm.mlir.addressof @str17 : !llvm.ptr
      %150 = arith.constant 3 : i64
      %151 = func.call @cc_make_string(%149, %150) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%151) : (i64) -> ()
      %152 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%98) : (i64) -> ()
      %153 = func.call @stack_pop_pointer() : () -> i64
      %154 = func.call @cc_nil_value() : () -> i64
      %155 = func.call @cc_errorp(%152) : (i64) -> i64
      %156 = arith.cmpi ne, %155, %154 : i64
      %157 = arith.cmpi eq, %154, %154 : i64
      %158 = arith.andi %156, %157 : i1
      %159 = scf.if %158 -> (i64) {
        scf.yield %152 : i64
      } else {
        scf.yield %154 : i64
      }
      %160 = func.call @cc_errorp(%153) : (i64) -> i64
      %161 = arith.cmpi ne, %160, %154 : i64
      %162 = arith.cmpi eq, %159, %154 : i64
      %163 = arith.andi %161, %162 : i1
      %164 = scf.if %163 -> (i64) {
        scf.yield %153 : i64
      } else {
        scf.yield %159 : i64
      }
      %165 = arith.cmpi ne, %164, %154 : i64
      scf.if %165 {
        func.call @stack_push_pointer(%164) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%152) : (i64) -> ()
        func.call @stack_push_pointer(%153) : (i64) -> ()
        %166 = llvm.mlir.addressof @str18 : !llvm.ptr
        %167 = func.call @cc_make_function_ref_const(%166) : (!llvm.ptr) -> i64
        %168 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%167, %168) : (i64, i64) -> ()
      }
      %169 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %169, %98 : i64, i64
    }
    %170 = func.call @cc_nil_value() : () -> i64
    %171 = func.call @cc_errorp(%148#0) : (i64) -> i64
    %172 = arith.cmpi ne, %171, %170 : i64
    %173:2 = scf.if %172 -> (i64, i64) {
      scf.yield %148#0, %148#1 : i64, i64
    } else {
      func.call @stack_push_pointer(%148#1) : (i64) -> ()
      %174 = func.call @stack_pop_pointer() : () -> i64
      %175 = func.call @cc_nil_value() : () -> i64
      %176 = func.call @cc_errorp(%174) : (i64) -> i64
      %177 = arith.cmpi ne, %176, %175 : i64
      %178 = arith.cmpi eq, %175, %175 : i64
      %179 = arith.andi %177, %178 : i1
      %180 = scf.if %179 -> (i64) {
        scf.yield %174 : i64
      } else {
        scf.yield %175 : i64
      }
      %181 = arith.cmpi ne, %180, %175 : i64
      scf.if %181 {
        func.call @stack_push_pointer(%180) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%174) : (i64) -> ()
        %182 = llvm.mlir.addressof @str19 : !llvm.ptr
        %183 = func.call @cc_make_function_ref_const(%182) : (!llvm.ptr) -> i64
        %184 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%183, %184) : (i64, i64) -> ()
      }
      %185 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %185, %148#1 : i64, i64
    }
    %186 = func.call @cc_nil_value() : () -> i64
    %187 = func.call @cc_errorp(%173#0) : (i64) -> i64
    %188 = arith.cmpi ne, %187, %186 : i64
    %189:2 = scf.if %188 -> (i64, i64) {
      scf.yield %173#0, %173#1 : i64, i64
    } else {
      func.call @stack_push_pointer(%22) : (i64) -> ()
      %190 = func.call @stack_pop_pointer() : () -> i64
      %191 = llvm.mlir.addressof @str20 : !llvm.ptr
      %192 = arith.constant 17 : i64
      %193 = func.call @cc_make_string(%191, %192) : (!llvm.ptr, i64) -> i64
      %194 = llvm.mlir.addressof @str21 : !llvm.ptr
      %195 = arith.constant 7 : i64
      %196 = func.call @cc_make_string(%194, %195) : (!llvm.ptr, i64) -> i64
      %197 = func.call @cc_intern(%193, %196) : (i64, i64) -> i64
      %198 = func.call @cc_nil_value() : () -> i64
      %199 = func.call @cc_cons(%197, %198) : (i64, i64) -> i64
      %200 = func.call @cc_values_pack(%199) : (i64) -> i64
      func.call @stack_push_pointer(%197) : (i64) -> ()
      %201 = func.call @stack_pop_pointer() : () -> i64
      %202 = llvm.mlir.addressof @str22 : !llvm.ptr
      %203 = arith.constant 6 : i64
      %204 = func.call @cc_make_string(%202, %203) : (!llvm.ptr, i64) -> i64
      %205 = llvm.mlir.addressof @str23 : !llvm.ptr
      %206 = arith.constant 7 : i64
      %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
      %208 = func.call @cc_intern(%204, %207) : (i64, i64) -> i64
      %209 = func.call @cc_nil_value() : () -> i64
      %210 = func.call @cc_cons(%208, %209) : (i64, i64) -> i64
      %211 = func.call @cc_values_pack(%210) : (i64) -> i64
      func.call @stack_push_pointer(%208) : (i64) -> ()
      %212 = func.call @stack_pop_pointer() : () -> i64
      %213 = llvm.mlir.addressof @str24 : !llvm.ptr
      %214 = arith.constant 9 : i64
      %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
      %216 = llvm.mlir.addressof @str25 : !llvm.ptr
      %217 = arith.constant 7 : i64
      %218 = func.call @cc_make_string(%216, %217) : (!llvm.ptr, i64) -> i64
      %219 = func.call @cc_intern(%215, %218) : (i64, i64) -> i64
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_cons(%219, %220) : (i64, i64) -> i64
      %222 = func.call @cc_values_pack(%221) : (i64) -> i64
      func.call @stack_push_pointer(%219) : (i64) -> ()
      %223 = func.call @stack_pop_pointer() : () -> i64
      %224 = llvm.mlir.addressof @str26 : !llvm.ptr
      %225 = arith.constant 9 : i64
      %226 = func.call @cc_make_string(%224, %225) : (!llvm.ptr, i64) -> i64
      %227 = llvm.mlir.addressof @str27 : !llvm.ptr
      %228 = arith.constant 7 : i64
      %229 = func.call @cc_make_string(%227, %228) : (!llvm.ptr, i64) -> i64
      %230 = func.call @cc_intern(%226, %229) : (i64, i64) -> i64
      %231 = func.call @cc_nil_value() : () -> i64
      %232 = func.call @cc_cons(%230, %231) : (i64, i64) -> i64
      %233 = func.call @cc_values_pack(%232) : (i64) -> i64
      func.call @stack_push_pointer(%230) : (i64) -> ()
      %234 = func.call @stack_pop_pointer() : () -> i64
      %235 = llvm.mlir.addressof @str28 : !llvm.ptr
      %236 = arith.constant 9 : i64
      %237 = func.call @cc_make_string(%235, %236) : (!llvm.ptr, i64) -> i64
      %238 = llvm.mlir.addressof @str29 : !llvm.ptr
      %239 = arith.constant 7 : i64
      %240 = func.call @cc_make_string(%238, %239) : (!llvm.ptr, i64) -> i64
      %241 = func.call @cc_intern(%237, %240) : (i64, i64) -> i64
      %242 = func.call @cc_nil_value() : () -> i64
      %243 = func.call @cc_cons(%241, %242) : (i64, i64) -> i64
      %244 = func.call @cc_values_pack(%243) : (i64) -> i64
      func.call @stack_push_pointer(%241) : (i64) -> ()
      %245 = func.call @stack_pop_pointer() : () -> i64
      %246 = llvm.mlir.addressof @str30 : !llvm.ptr
      %247 = arith.constant 6 : i64
      %248 = func.call @cc_make_string(%246, %247) : (!llvm.ptr, i64) -> i64
      %249 = llvm.mlir.addressof @str31 : !llvm.ptr
      %250 = arith.constant 7 : i64
      %251 = func.call @cc_make_string(%249, %250) : (!llvm.ptr, i64) -> i64
      %252 = func.call @cc_intern(%248, %251) : (i64, i64) -> i64
      %253 = func.call @cc_nil_value() : () -> i64
      %254 = func.call @cc_cons(%252, %253) : (i64, i64) -> i64
      %255 = func.call @cc_values_pack(%254) : (i64) -> i64
      func.call @stack_push_pointer(%252) : (i64) -> ()
      %256 = func.call @stack_pop_pointer() : () -> i64
      %257 = func.call @cc_nil_value() : () -> i64
      %258 = func.call @cc_errorp(%190) : (i64) -> i64
      %259 = arith.cmpi ne, %258, %257 : i64
      %260 = arith.cmpi eq, %257, %257 : i64
      %261 = arith.andi %259, %260 : i1
      %262 = scf.if %261 -> (i64) {
        scf.yield %190 : i64
      } else {
        scf.yield %257 : i64
      }
      %263 = func.call @cc_errorp(%201) : (i64) -> i64
      %264 = arith.cmpi ne, %263, %257 : i64
      %265 = arith.cmpi eq, %262, %257 : i64
      %266 = arith.andi %264, %265 : i1
      %267 = scf.if %266 -> (i64) {
        scf.yield %201 : i64
      } else {
        scf.yield %262 : i64
      }
      %268 = func.call @cc_errorp(%212) : (i64) -> i64
      %269 = arith.cmpi ne, %268, %257 : i64
      %270 = arith.cmpi eq, %267, %257 : i64
      %271 = arith.andi %269, %270 : i1
      %272 = scf.if %271 -> (i64) {
        scf.yield %212 : i64
      } else {
        scf.yield %267 : i64
      }
      %273 = func.call @cc_errorp(%223) : (i64) -> i64
      %274 = arith.cmpi ne, %273, %257 : i64
      %275 = arith.cmpi eq, %272, %257 : i64
      %276 = arith.andi %274, %275 : i1
      %277 = scf.if %276 -> (i64) {
        scf.yield %223 : i64
      } else {
        scf.yield %272 : i64
      }
      %278 = func.call @cc_errorp(%234) : (i64) -> i64
      %279 = arith.cmpi ne, %278, %257 : i64
      %280 = arith.cmpi eq, %277, %257 : i64
      %281 = arith.andi %279, %280 : i1
      %282 = scf.if %281 -> (i64) {
        scf.yield %234 : i64
      } else {
        scf.yield %277 : i64
      }
      %283 = func.call @cc_errorp(%245) : (i64) -> i64
      %284 = arith.cmpi ne, %283, %257 : i64
      %285 = arith.cmpi eq, %282, %257 : i64
      %286 = arith.andi %284, %285 : i1
      %287 = scf.if %286 -> (i64) {
        scf.yield %245 : i64
      } else {
        scf.yield %282 : i64
      }
      %288 = func.call @cc_errorp(%256) : (i64) -> i64
      %289 = arith.cmpi ne, %288, %257 : i64
      %290 = arith.cmpi eq, %287, %257 : i64
      %291 = arith.andi %289, %290 : i1
      %292 = scf.if %291 -> (i64) {
        scf.yield %256 : i64
      } else {
        scf.yield %287 : i64
      }
      %293 = arith.cmpi ne, %292, %257 : i64
      scf.if %293 {
        func.call @stack_push_pointer(%292) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%190) : (i64) -> ()
        func.call @stack_push_pointer(%201) : (i64) -> ()
        func.call @stack_push_pointer(%212) : (i64) -> ()
        func.call @stack_push_pointer(%223) : (i64) -> ()
        func.call @stack_push_pointer(%234) : (i64) -> ()
        func.call @stack_push_pointer(%245) : (i64) -> ()
        func.call @stack_push_pointer(%256) : (i64) -> ()
        %294 = llvm.mlir.addressof @str32 : !llvm.ptr
        %295 = func.call @cc_make_function_ref_const(%294) : (!llvm.ptr) -> i64
        %296 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%295, %296) : (i64, i64) -> ()
      }
      %297 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%297) : (i64) -> ()
      %298 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %298, %297 : i64, i64
    }
    %299 = func.call @cc_nil_value() : () -> i64
    %300 = func.call @cc_errorp(%189#0) : (i64) -> i64
    %301 = arith.cmpi ne, %300, %299 : i64
    %302:2 = scf.if %301 -> (i64, i64) {
      scf.yield %189#0, %189#1 : i64, i64
    } else {
      %303 = llvm.mlir.addressof @str33 : !llvm.ptr
      %304 = arith.constant 3 : i64
      %305 = func.call @cc_make_string(%303, %304) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%305) : (i64) -> ()
      %306 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%189#1) : (i64) -> ()
      %307 = func.call @stack_pop_pointer() : () -> i64
      %308 = func.call @cc_nil_value() : () -> i64
      %309 = func.call @cc_errorp(%306) : (i64) -> i64
      %310 = arith.cmpi ne, %309, %308 : i64
      %311 = arith.cmpi eq, %308, %308 : i64
      %312 = arith.andi %310, %311 : i1
      %313 = scf.if %312 -> (i64) {
        scf.yield %306 : i64
      } else {
        scf.yield %308 : i64
      }
      %314 = func.call @cc_errorp(%307) : (i64) -> i64
      %315 = arith.cmpi ne, %314, %308 : i64
      %316 = arith.cmpi eq, %313, %308 : i64
      %317 = arith.andi %315, %316 : i1
      %318 = scf.if %317 -> (i64) {
        scf.yield %307 : i64
      } else {
        scf.yield %313 : i64
      }
      %319 = arith.cmpi ne, %318, %308 : i64
      scf.if %319 {
        func.call @stack_push_pointer(%318) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%306) : (i64) -> ()
        func.call @stack_push_pointer(%307) : (i64) -> ()
        %320 = llvm.mlir.addressof @str34 : !llvm.ptr
        %321 = func.call @cc_make_function_ref_const(%320) : (!llvm.ptr) -> i64
        %322 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%321, %322) : (i64, i64) -> ()
      }
      %323 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %323, %189#1 : i64, i64
    }
    %324 = func.call @cc_nil_value() : () -> i64
    %325 = func.call @cc_errorp(%302#0) : (i64) -> i64
    %326 = arith.cmpi ne, %325, %324 : i64
    %327:2 = scf.if %326 -> (i64, i64) {
      scf.yield %302#0, %302#1 : i64, i64
    } else {
      func.call @stack_push_pointer(%302#1) : (i64) -> ()
      %328 = func.call @stack_pop_pointer() : () -> i64
      %329 = func.call @cc_nil_value() : () -> i64
      %330 = func.call @cc_errorp(%328) : (i64) -> i64
      %331 = arith.cmpi ne, %330, %329 : i64
      %332 = arith.cmpi eq, %329, %329 : i64
      %333 = arith.andi %331, %332 : i1
      %334 = scf.if %333 -> (i64) {
        scf.yield %328 : i64
      } else {
        scf.yield %329 : i64
      }
      %335 = arith.cmpi ne, %334, %329 : i64
      scf.if %335 {
        func.call @stack_push_pointer(%334) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%328) : (i64) -> ()
        %336 = llvm.mlir.addressof @str35 : !llvm.ptr
        %337 = func.call @cc_make_function_ref_const(%336) : (!llvm.ptr) -> i64
        %338 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%337, %338) : (i64, i64) -> ()
      }
      %339 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %339, %302#1 : i64, i64
    }
    %340 = func.call @cc_nil_value() : () -> i64
    %341 = func.call @cc_errorp(%327#0) : (i64) -> i64
    %342 = arith.cmpi ne, %341, %340 : i64
    %343:2 = scf.if %342 -> (i64, i64) {
      scf.yield %327#0, %327#1 : i64, i64
    } else {
      func.call @stack_push_pointer(%22) : (i64) -> ()
      %344 = func.call @stack_pop_pointer() : () -> i64
      %345 = llvm.mlir.addressof @str36 : !llvm.ptr
      %346 = arith.constant 9 : i64
      %347 = func.call @cc_make_string(%345, %346) : (!llvm.ptr, i64) -> i64
      %348 = llvm.mlir.addressof @str37 : !llvm.ptr
      %349 = arith.constant 7 : i64
      %350 = func.call @cc_make_string(%348, %349) : (!llvm.ptr, i64) -> i64
      %351 = func.call @cc_intern(%347, %350) : (i64, i64) -> i64
      %352 = func.call @cc_nil_value() : () -> i64
      %353 = func.call @cc_cons(%351, %352) : (i64, i64) -> i64
      %354 = func.call @cc_values_pack(%353) : (i64) -> i64
      func.call @stack_push_pointer(%351) : (i64) -> ()
      %355 = func.call @stack_pop_pointer() : () -> i64
      %356 = llvm.mlir.addressof @str38 : !llvm.ptr
      %357 = arith.constant 5 : i64
      %358 = func.call @cc_make_string(%356, %357) : (!llvm.ptr, i64) -> i64
      %359 = llvm.mlir.addressof @str39 : !llvm.ptr
      %360 = arith.constant 7 : i64
      %361 = func.call @cc_make_string(%359, %360) : (!llvm.ptr, i64) -> i64
      %362 = func.call @cc_intern(%358, %361) : (i64, i64) -> i64
      %363 = func.call @cc_nil_value() : () -> i64
      %364 = func.call @cc_cons(%362, %363) : (i64, i64) -> i64
      %365 = func.call @cc_values_pack(%364) : (i64) -> i64
      func.call @stack_push_pointer(%362) : (i64) -> ()
      %366 = func.call @stack_pop_pointer() : () -> i64
      %367 = func.call @cc_nil_value() : () -> i64
      %368 = func.call @cc_errorp(%344) : (i64) -> i64
      %369 = arith.cmpi ne, %368, %367 : i64
      %370 = arith.cmpi eq, %367, %367 : i64
      %371 = arith.andi %369, %370 : i1
      %372 = scf.if %371 -> (i64) {
        scf.yield %344 : i64
      } else {
        scf.yield %367 : i64
      }
      %373 = func.call @cc_errorp(%355) : (i64) -> i64
      %374 = arith.cmpi ne, %373, %367 : i64
      %375 = arith.cmpi eq, %372, %367 : i64
      %376 = arith.andi %374, %375 : i1
      %377 = scf.if %376 -> (i64) {
        scf.yield %355 : i64
      } else {
        scf.yield %372 : i64
      }
      %378 = func.call @cc_errorp(%366) : (i64) -> i64
      %379 = arith.cmpi ne, %378, %367 : i64
      %380 = arith.cmpi eq, %377, %367 : i64
      %381 = arith.andi %379, %380 : i1
      %382 = scf.if %381 -> (i64) {
        scf.yield %366 : i64
      } else {
        scf.yield %377 : i64
      }
      %383 = arith.cmpi ne, %382, %367 : i64
      scf.if %383 {
        func.call @stack_push_pointer(%382) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%344) : (i64) -> ()
        func.call @stack_push_pointer(%355) : (i64) -> ()
        func.call @stack_push_pointer(%366) : (i64) -> ()
        %384 = llvm.mlir.addressof @str40 : !llvm.ptr
        %385 = func.call @cc_make_function_ref_const(%384) : (!llvm.ptr) -> i64
        %386 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%385, %386) : (i64, i64) -> ()
      }
      %387 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%387) : (i64) -> ()
      %388 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %388, %387 : i64, i64
    }
    %389 = func.call @cc_nil_value() : () -> i64
    %390 = func.call @cc_errorp(%343#0) : (i64) -> i64
    %391 = arith.cmpi ne, %390, %389 : i64
    %392:2 = scf.if %391 -> (i64, i64) {
      scf.yield %343#0, %343#1 : i64, i64
    } else {
      func.call @stack_push_pointer(%143) : (i64) -> ()
      %393 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%343#1) : (i64) -> ()
      %394 = func.call @stack_pop_pointer() : () -> i64
      %395 = llvm.mlir.addressof @str41 : !llvm.ptr
      %396 = arith.constant 5 : i64
      %397 = func.call @cc_make_string(%395, %396) : (!llvm.ptr, i64) -> i64
      %398 = llvm.mlir.addressof @str42 : !llvm.ptr
      %399 = arith.constant 7 : i64
      %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
      %401 = func.call @cc_intern(%397, %400) : (i64, i64) -> i64
      %402 = func.call @cc_nil_value() : () -> i64
      %403 = func.call @cc_cons(%401, %402) : (i64, i64) -> i64
      %404 = func.call @cc_values_pack(%403) : (i64) -> i64
      func.call @stack_push_pointer(%401) : (i64) -> ()
      %405 = func.call @stack_pop_pointer() : () -> i64
      %406 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%406) : (i64) -> ()
      %407 = func.call @stack_pop_pointer() : () -> i64
      %408 = llvm.mlir.addressof @str43 : !llvm.ptr
      %409 = arith.constant 3 : i64
      %410 = func.call @cc_make_string(%408, %409) : (!llvm.ptr, i64) -> i64
      %411 = llvm.mlir.addressof @str44 : !llvm.ptr
      %412 = arith.constant 7 : i64
      %413 = func.call @cc_make_string(%411, %412) : (!llvm.ptr, i64) -> i64
      %414 = func.call @cc_intern(%410, %413) : (i64, i64) -> i64
      %415 = func.call @cc_nil_value() : () -> i64
      %416 = func.call @cc_cons(%414, %415) : (i64, i64) -> i64
      %417 = func.call @cc_values_pack(%416) : (i64) -> i64
      func.call @stack_push_pointer(%414) : (i64) -> ()
      %418 = func.call @stack_pop_pointer() : () -> i64
      %419 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%419) : (i64) -> ()
      %420 = func.call @stack_pop_pointer() : () -> i64
      %421 = func.call @cc_nil_value() : () -> i64
      %422 = func.call @cc_errorp(%393) : (i64) -> i64
      %423 = arith.cmpi ne, %422, %421 : i64
      %424 = arith.cmpi eq, %421, %421 : i64
      %425 = arith.andi %423, %424 : i1
      %426 = scf.if %425 -> (i64) {
        scf.yield %393 : i64
      } else {
        scf.yield %421 : i64
      }
      %427 = func.call @cc_errorp(%394) : (i64) -> i64
      %428 = arith.cmpi ne, %427, %421 : i64
      %429 = arith.cmpi eq, %426, %421 : i64
      %430 = arith.andi %428, %429 : i1
      %431 = scf.if %430 -> (i64) {
        scf.yield %394 : i64
      } else {
        scf.yield %426 : i64
      }
      %432 = func.call @cc_errorp(%405) : (i64) -> i64
      %433 = arith.cmpi ne, %432, %421 : i64
      %434 = arith.cmpi eq, %431, %421 : i64
      %435 = arith.andi %433, %434 : i1
      %436 = scf.if %435 -> (i64) {
        scf.yield %405 : i64
      } else {
        scf.yield %431 : i64
      }
      %437 = func.call @cc_errorp(%407) : (i64) -> i64
      %438 = arith.cmpi ne, %437, %421 : i64
      %439 = arith.cmpi eq, %436, %421 : i64
      %440 = arith.andi %438, %439 : i1
      %441 = scf.if %440 -> (i64) {
        scf.yield %407 : i64
      } else {
        scf.yield %436 : i64
      }
      %442 = func.call @cc_errorp(%418) : (i64) -> i64
      %443 = arith.cmpi ne, %442, %421 : i64
      %444 = arith.cmpi eq, %441, %421 : i64
      %445 = arith.andi %443, %444 : i1
      %446 = scf.if %445 -> (i64) {
        scf.yield %418 : i64
      } else {
        scf.yield %441 : i64
      }
      %447 = func.call @cc_errorp(%420) : (i64) -> i64
      %448 = arith.cmpi ne, %447, %421 : i64
      %449 = arith.cmpi eq, %446, %421 : i64
      %450 = arith.andi %448, %449 : i1
      %451 = scf.if %450 -> (i64) {
        scf.yield %420 : i64
      } else {
        scf.yield %446 : i64
      }
      %452 = arith.cmpi ne, %451, %421 : i64
      scf.if %452 {
        func.call @stack_push_pointer(%451) : (i64) -> ()
      } else {
        %453 = func.call @cc_nil_value() : () -> i64
        %454 = func.call @cc_cons(%420, %453) : (i64, i64) -> i64
        %455 = func.call @cc_cons(%418, %454) : (i64, i64) -> i64
        %456 = func.call @cc_cons(%407, %455) : (i64, i64) -> i64
        %457 = func.call @cc_cons(%405, %456) : (i64, i64) -> i64
        %458 = func.call @cc_cons(%394, %457) : (i64, i64) -> i64
        %459 = func.call @cc_cons(%393, %458) : (i64, i64) -> i64
        func.call @stack_push_pointer(%459) : (i64) -> ()
        func.call @cc_read_sequence_stack() : () -> ()
      }
      %460 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %460, %343#1 : i64, i64
    }
    %461 = func.call @cc_nil_value() : () -> i64
    %462 = func.call @cc_errorp(%392#0) : (i64) -> i64
    %463 = arith.cmpi ne, %462, %461 : i64
    %464:2 = scf.if %463 -> (i64, i64) {
      scf.yield %392#0, %392#1 : i64, i64
    } else {
      func.call @stack_push_pointer(%392#1) : (i64) -> ()
      %465 = func.call @stack_pop_pointer() : () -> i64
      %466 = func.call @cc_nil_value() : () -> i64
      %467 = func.call @cc_errorp(%465) : (i64) -> i64
      %468 = arith.cmpi ne, %467, %466 : i64
      %469 = arith.cmpi eq, %466, %466 : i64
      %470 = arith.andi %468, %469 : i1
      %471 = scf.if %470 -> (i64) {
        scf.yield %465 : i64
      } else {
        scf.yield %466 : i64
      }
      %472 = arith.cmpi ne, %471, %466 : i64
      scf.if %472 {
        func.call @stack_push_pointer(%471) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%465) : (i64) -> ()
        %473 = llvm.mlir.addressof @str45 : !llvm.ptr
        %474 = func.call @cc_make_function_ref_const(%473) : (!llvm.ptr) -> i64
        %475 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%474, %475) : (i64, i64) -> ()
      }
      %476 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %476, %392#1 : i64, i64
    }
    %477 = func.call @cc_nil_value() : () -> i64
    %478 = func.call @cc_errorp(%464#0) : (i64) -> i64
    %479 = arith.cmpi ne, %478, %477 : i64
    %480:2 = scf.if %479 -> (i64, i64) {
      scf.yield %464#0, %464#1 : i64, i64
    } else {
      func.call @stack_push_pointer(%22) : (i64) -> ()
      %481 = func.call @stack_pop_pointer() : () -> i64
      %482 = func.call @cc_nil_value() : () -> i64
      %483 = func.call @cc_errorp(%481) : (i64) -> i64
      %484 = arith.cmpi ne, %483, %482 : i64
      %485 = arith.cmpi eq, %482, %482 : i64
      %486 = arith.andi %484, %485 : i1
      %487 = scf.if %486 -> (i64) {
        scf.yield %481 : i64
      } else {
        scf.yield %482 : i64
      }
      %488 = arith.cmpi ne, %487, %482 : i64
      scf.if %488 {
        func.call @stack_push_pointer(%487) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%481) : (i64) -> ()
        %489 = llvm.mlir.addressof @str46 : !llvm.ptr
        %490 = func.call @cc_make_function_ref_const(%489) : (!llvm.ptr) -> i64
        %491 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%490, %491) : (i64, i64) -> ()
      }
      %492 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %492, %464#1 : i64, i64
    }
    %493 = func.call @cc_nil_value() : () -> i64
    %494 = func.call @cc_errorp(%480#0) : (i64) -> i64
    %495 = arith.cmpi ne, %494, %493 : i64
    %496:2 = scf.if %495 -> (i64, i64) {
      scf.yield %480#0, %480#1 : i64, i64
    } else {
      %497 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%497) : (i64) -> ()
      %498 = func.call @stack_pop_pointer() : () -> i64
      %499 = llvm.mlir.addressof @str47 : !llvm.ptr
      %500 = arith.constant 28 : i64
      %501 = func.call @cc_make_string(%499, %500) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%501) : (i64) -> ()
      %502 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%143) : (i64) -> ()
      %503 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%143) : (i64) -> ()
      %504 = llvm.mlir.addressof @str48 : !llvm.ptr
      %505 = arith.constant 3 : i64
      %506 = func.call @cc_make_string(%504, %505) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%506) : (i64) -> ()
      %507 = func.call @stack_pop_pointer() : () -> i64
      %508 = func.call @stack_pop_pointer() : () -> i64
      %509 = func.call @cc_equalp(%508, %507) : (i64, i64) -> i64
      func.call @stack_push_pointer(%509) : (i64) -> ()
      %510 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%498) : (i64) -> ()
      func.call @stack_push_pointer(%502) : (i64) -> ()
      func.call @stack_push_pointer(%503) : (i64) -> ()
      func.call @stack_push_pointer(%510) : (i64) -> ()
      %511 = llvm.mlir.addressof @str49 : !llvm.ptr
      %512 = func.call @cc_make_function_ref_const(%511) : (!llvm.ptr) -> i64
      %513 = arith.constant 4 : i64
      func.call @cc_funcall_stack(%512, %513) : (i64, i64) -> ()
      %514 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %514, %480#1 : i64, i64
    }
    func.call @stack_push_pointer(%496#0) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("close-abort\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str2("core:mkstemp\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str3("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str4("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str5("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str6("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str7("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str8("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str9("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str10("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str11("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str12("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str13("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str14("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str17("foo\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str18("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str19("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str20("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str21("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str22("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str23("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str24("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str25("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str26("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str27("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str29("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str30("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str31("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str33("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str34("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str35("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str36("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str37("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str38("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str39("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str40("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str41("START\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str42("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("END\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str44("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str46("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str47("buffer=~s equalp-string=~s~%\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str48("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str49("FORMAT\00") : !llvm.array<7 x i8>
}
