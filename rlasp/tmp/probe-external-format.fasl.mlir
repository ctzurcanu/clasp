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
  func.func @"%FN%show-external-format"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 20 : i64
    %2 = func.call @cc_make_string(%0, %1) : (!llvm.ptr, i64) -> i64
    %3 = func.call @cc_nil_value() : () -> i64
    %4 = func.call @cc_intern(%2, %3) : (i64, i64) -> i64
    %5 = func.call @cc_nil_value() : () -> i64
    %6 = func.call @cc_cons(%4, %5) : (i64, i64) -> i64
    %7 = func.call @cc_values_pack(%6) : (i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%4) : (i64) -> ()
    %8 = func.call @cc_nil_value() : () -> i64
    %9 = llvm.mlir.addressof @str1 : !llvm.ptr
    %10 = arith.constant 38 : i64
    %11 = func.call @cc_make_symbol(%9, %10) : (!llvm.ptr, i64) -> i64
    %12 = func.call @cc_set_symbol_value(%11, %8) : (i64, i64) -> i64
    %13 = llvm.mlir.addressof @str2 : !llvm.ptr
    %14 = arith.constant 39 : i64
    %15 = func.call @cc_make_symbol(%13, %14) : (!llvm.ptr, i64) -> i64
    %16 = func.call @cc_set_symbol_value(%15, %8) : (i64, i64) -> i64
    %17 = llvm.mlir.addressof @str3 : !llvm.ptr
    %18 = arith.constant 40 : i64
    %19 = func.call @cc_make_symbol(%17, %18) : (!llvm.ptr, i64) -> i64
    %20 = func.call @cc_set_symbol_value(%19, %8) : (i64, i64) -> i64
    %21 = llvm.mlir.addressof @str4 : !llvm.ptr
    %22 = arith.constant 21 : i64
    %23 = func.call @cc_make_string(%21, %22) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%23) : (i64) -> ()
    %24 = func.call @stack_pop_pointer() : () -> i64
    %25 = func.call @cc_nil_value() : () -> i64
    %26 = func.call @cc_errorp(%24) : (i64) -> i64
    %27 = arith.cmpi ne, %26, %25 : i64
    %28 = arith.cmpi eq, %25, %25 : i64
    %29 = arith.andi %27, %28 : i1
    %30 = scf.if %29 -> (i64) {
      scf.yield %24 : i64
    } else {
      scf.yield %25 : i64
    }
    %31 = arith.cmpi ne, %30, %25 : i64
    scf.if %31 {
      func.call @stack_push_pointer(%30) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%24) : (i64) -> ()
      %32 = llvm.mlir.addressof @str5 : !llvm.ptr
      %33 = func.call @cc_make_function_ref_const(%32) : (!llvm.ptr) -> i64
      %34 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%33, %34) : (i64, i64) -> ()
    }
    %35 = func.call @stack_pop_pointer() : () -> i64
    %36 = func.call @cc_nil_value() : () -> i64
    %37 = func.call @cc_nil_value() : () -> i64
    %38 = func.call @cc_errorp(%36) : (i64) -> i64
    %39 = arith.cmpi ne, %38, %37 : i64
    %40 = scf.if %39 -> (i64) {
      scf.yield %36 : i64
    } else {
      %41 = func.call @cc_nil_value() : () -> i64
      %42 = func.call @cc_nil_value() : () -> i64
      %43 = func.call @cc_errorp(%41) : (i64) -> i64
      %44 = arith.cmpi ne, %43, %42 : i64
      %45 = scf.if %44 -> (i64) {
        scf.yield %41 : i64
      } else {
        func.call @stack_push_pointer(%35) : (i64) -> ()
        %46 = func.call @stack_pop_pointer() : () -> i64
        %47 = llvm.mlir.addressof @str6 : !llvm.ptr
        %48 = arith.constant 17 : i64
        %49 = func.call @cc_make_string(%47, %48) : (!llvm.ptr, i64) -> i64
        %50 = llvm.mlir.addressof @str7 : !llvm.ptr
        %51 = arith.constant 7 : i64
        %52 = func.call @cc_make_string(%50, %51) : (!llvm.ptr, i64) -> i64
        %53 = func.call @cc_intern(%49, %52) : (i64, i64) -> i64
        %54 = func.call @cc_nil_value() : () -> i64
        %55 = func.call @cc_cons(%53, %54) : (i64, i64) -> i64
        %56 = func.call @cc_values_pack(%55) : (i64) -> i64
        func.call @stack_push_pointer(%53) : (i64) -> ()
        %57 = func.call @stack_pop_pointer() : () -> i64
        %58 = llvm.mlir.addressof @str8 : !llvm.ptr
        %59 = arith.constant 6 : i64
        %60 = func.call @cc_make_string(%58, %59) : (!llvm.ptr, i64) -> i64
        %61 = llvm.mlir.addressof @str9 : !llvm.ptr
        %62 = arith.constant 7 : i64
        %63 = func.call @cc_make_string(%61, %62) : (!llvm.ptr, i64) -> i64
        %64 = func.call @cc_intern(%60, %63) : (i64, i64) -> i64
        %65 = func.call @cc_nil_value() : () -> i64
        %66 = func.call @cc_cons(%64, %65) : (i64, i64) -> i64
        %67 = func.call @cc_values_pack(%66) : (i64) -> i64
        func.call @stack_push_pointer(%64) : (i64) -> ()
        %68 = func.call @stack_pop_pointer() : () -> i64
        %69 = llvm.mlir.addressof @str10 : !llvm.ptr
        %70 = arith.constant 9 : i64
        %71 = func.call @cc_make_string(%69, %70) : (!llvm.ptr, i64) -> i64
        %72 = llvm.mlir.addressof @str11 : !llvm.ptr
        %73 = arith.constant 7 : i64
        %74 = func.call @cc_make_string(%72, %73) : (!llvm.ptr, i64) -> i64
        %75 = func.call @cc_intern(%71, %74) : (i64, i64) -> i64
        %76 = func.call @cc_nil_value() : () -> i64
        %77 = func.call @cc_cons(%75, %76) : (i64, i64) -> i64
        %78 = func.call @cc_values_pack(%77) : (i64) -> i64
        func.call @stack_push_pointer(%75) : (i64) -> ()
        %79 = func.call @stack_pop_pointer() : () -> i64
        %80 = llvm.mlir.addressof @str12 : !llvm.ptr
        %81 = arith.constant 9 : i64
        %82 = func.call @cc_make_string(%80, %81) : (!llvm.ptr, i64) -> i64
        %83 = llvm.mlir.addressof @str13 : !llvm.ptr
        %84 = arith.constant 7 : i64
        %85 = func.call @cc_make_string(%83, %84) : (!llvm.ptr, i64) -> i64
        %86 = func.call @cc_intern(%82, %85) : (i64, i64) -> i64
        %87 = func.call @cc_nil_value() : () -> i64
        %88 = func.call @cc_cons(%86, %87) : (i64, i64) -> i64
        %89 = func.call @cc_values_pack(%88) : (i64) -> i64
        func.call @stack_push_pointer(%86) : (i64) -> ()
        %90 = func.call @stack_pop_pointer() : () -> i64
        %91 = llvm.mlir.addressof @str14 : !llvm.ptr
        %92 = arith.constant 9 : i64
        %93 = func.call @cc_make_string(%91, %92) : (!llvm.ptr, i64) -> i64
        %94 = llvm.mlir.addressof @str15 : !llvm.ptr
        %95 = arith.constant 7 : i64
        %96 = func.call @cc_make_string(%94, %95) : (!llvm.ptr, i64) -> i64
        %97 = func.call @cc_intern(%93, %96) : (i64, i64) -> i64
        %98 = func.call @cc_nil_value() : () -> i64
        %99 = func.call @cc_cons(%97, %98) : (i64, i64) -> i64
        %100 = func.call @cc_values_pack(%99) : (i64) -> i64
        func.call @stack_push_pointer(%97) : (i64) -> ()
        %101 = func.call @stack_pop_pointer() : () -> i64
        %102 = llvm.mlir.addressof @str16 : !llvm.ptr
        %103 = arith.constant 6 : i64
        %104 = func.call @cc_make_string(%102, %103) : (!llvm.ptr, i64) -> i64
        %105 = llvm.mlir.addressof @str17 : !llvm.ptr
        %106 = arith.constant 7 : i64
        %107 = func.call @cc_make_string(%105, %106) : (!llvm.ptr, i64) -> i64
        %108 = func.call @cc_intern(%104, %107) : (i64, i64) -> i64
        %109 = func.call @cc_nil_value() : () -> i64
        %110 = func.call @cc_cons(%108, %109) : (i64, i64) -> i64
        %111 = func.call @cc_values_pack(%110) : (i64) -> i64
        func.call @stack_push_pointer(%108) : (i64) -> ()
        %112 = func.call @stack_pop_pointer() : () -> i64
        %113 = llvm.mlir.addressof @str18 : !llvm.ptr
        %114 = arith.constant 12 : i64
        %115 = func.call @cc_make_string(%113, %114) : (!llvm.ptr, i64) -> i64
        %116 = llvm.mlir.addressof @str19 : !llvm.ptr
        %117 = arith.constant 7 : i64
        %118 = func.call @cc_make_string(%116, %117) : (!llvm.ptr, i64) -> i64
        %119 = func.call @cc_intern(%115, %118) : (i64, i64) -> i64
        %120 = func.call @cc_nil_value() : () -> i64
        %121 = func.call @cc_cons(%119, %120) : (i64, i64) -> i64
        %122 = func.call @cc_values_pack(%121) : (i64) -> i64
        func.call @stack_push_pointer(%119) : (i64) -> ()
        %123 = func.call @stack_pop_pointer() : () -> i64
        %124 = llvm.mlir.addressof @str20 : !llvm.ptr
        %125 = arith.constant 9 : i64
        %126 = func.call @cc_make_string(%124, %125) : (!llvm.ptr, i64) -> i64
        %127 = llvm.mlir.addressof @str21 : !llvm.ptr
        %128 = arith.constant 11 : i64
        %129 = func.call @cc_make_string(%127, %128) : (!llvm.ptr, i64) -> i64
        %130 = func.call @cc_intern(%126, %129) : (i64, i64) -> i64
        %131 = func.call @cc_nil_value() : () -> i64
        %132 = func.call @cc_cons(%130, %131) : (i64, i64) -> i64
        %133 = func.call @cc_values_pack(%132) : (i64) -> i64
        func.call @stack_push_pointer(%130) : (i64) -> ()
        %134 = func.call @stack_pop_pointer() : () -> i64
        %135 = llvm.mlir.addressof @str22 : !llvm.ptr
        %136 = arith.constant 15 : i64
        %137 = func.call @cc_make_string(%135, %136) : (!llvm.ptr, i64) -> i64
        %138 = llvm.mlir.addressof @str23 : !llvm.ptr
        %139 = arith.constant 7 : i64
        %140 = func.call @cc_make_string(%138, %139) : (!llvm.ptr, i64) -> i64
        %141 = func.call @cc_intern(%137, %140) : (i64, i64) -> i64
        %142 = func.call @cc_nil_value() : () -> i64
        %143 = func.call @cc_cons(%141, %142) : (i64, i64) -> i64
        %144 = func.call @cc_values_pack(%143) : (i64) -> i64
        func.call @stack_push_pointer(%141) : (i64) -> ()
        %145 = func.call @stack_pop_pointer() : () -> i64
        %146 = llvm.mlir.addressof @str24 : !llvm.ptr
        %147 = arith.constant 5 : i64
        %148 = func.call @cc_make_string(%146, %147) : (!llvm.ptr, i64) -> i64
        %149 = llvm.mlir.addressof @str25 : !llvm.ptr
        %150 = arith.constant 7 : i64
        %151 = func.call @cc_make_string(%149, %150) : (!llvm.ptr, i64) -> i64
        %152 = func.call @cc_intern(%148, %151) : (i64, i64) -> i64
        %153 = func.call @cc_nil_value() : () -> i64
        %154 = func.call @cc_cons(%152, %153) : (i64, i64) -> i64
        %155 = func.call @cc_values_pack(%154) : (i64) -> i64
        func.call @stack_push_pointer(%152) : (i64) -> ()
        %156 = func.call @stack_pop_pointer() : () -> i64
        %157 = func.call @cc_nil_value() : () -> i64
        %158 = func.call @cc_errorp(%46) : (i64) -> i64
        %159 = arith.cmpi ne, %158, %157 : i64
        %160 = arith.cmpi eq, %157, %157 : i64
        %161 = arith.andi %159, %160 : i1
        %162 = scf.if %161 -> (i64) {
          scf.yield %46 : i64
        } else {
          scf.yield %157 : i64
        }
        %163 = func.call @cc_errorp(%57) : (i64) -> i64
        %164 = arith.cmpi ne, %163, %157 : i64
        %165 = arith.cmpi eq, %162, %157 : i64
        %166 = arith.andi %164, %165 : i1
        %167 = scf.if %166 -> (i64) {
          scf.yield %57 : i64
        } else {
          scf.yield %162 : i64
        }
        %168 = func.call @cc_errorp(%68) : (i64) -> i64
        %169 = arith.cmpi ne, %168, %157 : i64
        %170 = arith.cmpi eq, %167, %157 : i64
        %171 = arith.andi %169, %170 : i1
        %172 = scf.if %171 -> (i64) {
          scf.yield %68 : i64
        } else {
          scf.yield %167 : i64
        }
        %173 = func.call @cc_errorp(%79) : (i64) -> i64
        %174 = arith.cmpi ne, %173, %157 : i64
        %175 = arith.cmpi eq, %172, %157 : i64
        %176 = arith.andi %174, %175 : i1
        %177 = scf.if %176 -> (i64) {
          scf.yield %79 : i64
        } else {
          scf.yield %172 : i64
        }
        %178 = func.call @cc_errorp(%90) : (i64) -> i64
        %179 = arith.cmpi ne, %178, %157 : i64
        %180 = arith.cmpi eq, %177, %157 : i64
        %181 = arith.andi %179, %180 : i1
        %182 = scf.if %181 -> (i64) {
          scf.yield %90 : i64
        } else {
          scf.yield %177 : i64
        }
        %183 = func.call @cc_errorp(%101) : (i64) -> i64
        %184 = arith.cmpi ne, %183, %157 : i64
        %185 = arith.cmpi eq, %182, %157 : i64
        %186 = arith.andi %184, %185 : i1
        %187 = scf.if %186 -> (i64) {
          scf.yield %101 : i64
        } else {
          scf.yield %182 : i64
        }
        %188 = func.call @cc_errorp(%112) : (i64) -> i64
        %189 = arith.cmpi ne, %188, %157 : i64
        %190 = arith.cmpi eq, %187, %157 : i64
        %191 = arith.andi %189, %190 : i1
        %192 = scf.if %191 -> (i64) {
          scf.yield %112 : i64
        } else {
          scf.yield %187 : i64
        }
        %193 = func.call @cc_errorp(%123) : (i64) -> i64
        %194 = arith.cmpi ne, %193, %157 : i64
        %195 = arith.cmpi eq, %192, %157 : i64
        %196 = arith.andi %194, %195 : i1
        %197 = scf.if %196 -> (i64) {
          scf.yield %123 : i64
        } else {
          scf.yield %192 : i64
        }
        %198 = func.call @cc_errorp(%134) : (i64) -> i64
        %199 = arith.cmpi ne, %198, %157 : i64
        %200 = arith.cmpi eq, %197, %157 : i64
        %201 = arith.andi %199, %200 : i1
        %202 = scf.if %201 -> (i64) {
          scf.yield %134 : i64
        } else {
          scf.yield %197 : i64
        }
        %203 = func.call @cc_errorp(%145) : (i64) -> i64
        %204 = arith.cmpi ne, %203, %157 : i64
        %205 = arith.cmpi eq, %202, %157 : i64
        %206 = arith.andi %204, %205 : i1
        %207 = scf.if %206 -> (i64) {
          scf.yield %145 : i64
        } else {
          scf.yield %202 : i64
        }
        %208 = func.call @cc_errorp(%156) : (i64) -> i64
        %209 = arith.cmpi ne, %208, %157 : i64
        %210 = arith.cmpi eq, %207, %157 : i64
        %211 = arith.andi %209, %210 : i1
        %212 = scf.if %211 -> (i64) {
          scf.yield %156 : i64
        } else {
          scf.yield %207 : i64
        }
        %213 = arith.cmpi ne, %212, %157 : i64
        scf.if %213 {
          func.call @stack_push_pointer(%212) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%46) : (i64) -> ()
          func.call @stack_push_pointer(%57) : (i64) -> ()
          func.call @stack_push_pointer(%68) : (i64) -> ()
          func.call @stack_push_pointer(%79) : (i64) -> ()
          func.call @stack_push_pointer(%90) : (i64) -> ()
          func.call @stack_push_pointer(%101) : (i64) -> ()
          func.call @stack_push_pointer(%112) : (i64) -> ()
          func.call @stack_push_pointer(%123) : (i64) -> ()
          func.call @stack_push_pointer(%134) : (i64) -> ()
          func.call @stack_push_pointer(%145) : (i64) -> ()
          func.call @stack_push_pointer(%156) : (i64) -> ()
          %214 = llvm.mlir.addressof @str26 : !llvm.ptr
          %215 = func.call @cc_make_function_ref_const(%214) : (!llvm.ptr) -> i64
          %216 = arith.constant 11 : i64
          func.call @cc_funcall_stack(%215, %216) : (i64, i64) -> ()
        }
        %217 = func.call @stack_pop_pointer() : () -> i64
        %218 = func.call @cc_nil_value() : () -> i64
        %219 = func.call @cc_nil_value() : () -> i64
        %220 = func.call @cc_errorp(%218) : (i64) -> i64
        %221 = arith.cmpi ne, %220, %219 : i64
        %222 = scf.if %221 -> (i64) {
          scf.yield %218 : i64
        } else {
          %223 = func.call @cc_nil_value() : () -> i64
          %224 = func.call @cc_nil_value() : () -> i64
          %225 = func.call @cc_errorp(%223) : (i64) -> i64
          %226 = arith.cmpi ne, %225, %224 : i64
          %227 = scf.if %226 -> (i64) {
            scf.yield %223 : i64
          } else {
            %228 = arith.constant 33 : i64
            %229 = func.call @cc_box_character(%228) : (i64) -> i64
            func.call @stack_push_pointer(%229) : (i64) -> ()
            %230 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%217) : (i64) -> ()
            %231 = func.call @stack_pop_pointer() : () -> i64
            %232 = func.call @cc_nil_value() : () -> i64
            %233 = func.call @cc_errorp(%230) : (i64) -> i64
            %234 = arith.cmpi ne, %233, %232 : i64
            %235 = arith.cmpi eq, %232, %232 : i64
            %236 = arith.andi %234, %235 : i1
            %237 = scf.if %236 -> (i64) {
              scf.yield %230 : i64
            } else {
              scf.yield %232 : i64
            }
            %238 = func.call @cc_errorp(%231) : (i64) -> i64
            %239 = arith.cmpi ne, %238, %232 : i64
            %240 = arith.cmpi eq, %237, %232 : i64
            %241 = arith.andi %239, %240 : i1
            %242 = scf.if %241 -> (i64) {
              scf.yield %231 : i64
            } else {
              scf.yield %237 : i64
            }
            %243 = arith.cmpi ne, %242, %232 : i64
            scf.if %243 {
              func.call @stack_push_pointer(%242) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%230) : (i64) -> ()
              func.call @stack_push_pointer(%231) : (i64) -> ()
              %244 = llvm.mlir.addressof @str27 : !llvm.ptr
              %245 = func.call @cc_make_function_ref_const(%244) : (!llvm.ptr) -> i64
              %246 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%245, %246) : (i64, i64) -> ()
            }
            %247 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %247 : i64
          }
          %248 = func.call @cc_nil_value() : () -> i64
          %249 = func.call @cc_errorp(%227) : (i64) -> i64
          %250 = arith.cmpi ne, %249, %248 : i64
          %251 = scf.if %250 -> (i64) {
            scf.yield %227 : i64
          } else {
            %252 = arith.constant 10 : i64
            %253 = func.call @cc_box_character(%252) : (i64) -> i64
            func.call @stack_push_pointer(%253) : (i64) -> ()
            %254 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%217) : (i64) -> ()
            %255 = func.call @stack_pop_pointer() : () -> i64
            %256 = func.call @cc_nil_value() : () -> i64
            %257 = func.call @cc_errorp(%254) : (i64) -> i64
            %258 = arith.cmpi ne, %257, %256 : i64
            %259 = arith.cmpi eq, %256, %256 : i64
            %260 = arith.andi %258, %259 : i1
            %261 = scf.if %260 -> (i64) {
              scf.yield %254 : i64
            } else {
              scf.yield %256 : i64
            }
            %262 = func.call @cc_errorp(%255) : (i64) -> i64
            %263 = arith.cmpi ne, %262, %256 : i64
            %264 = arith.cmpi eq, %261, %256 : i64
            %265 = arith.andi %263, %264 : i1
            %266 = scf.if %265 -> (i64) {
              scf.yield %255 : i64
            } else {
              scf.yield %261 : i64
            }
            %267 = arith.cmpi ne, %266, %256 : i64
            scf.if %267 {
              func.call @stack_push_pointer(%266) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%254) : (i64) -> ()
              func.call @stack_push_pointer(%255) : (i64) -> ()
              %268 = llvm.mlir.addressof @str28 : !llvm.ptr
              %269 = func.call @cc_make_function_ref_const(%268) : (!llvm.ptr) -> i64
              %270 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%269, %270) : (i64, i64) -> ()
            }
            %271 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %271 : i64
          }
          %272 = func.call @cc_nil_value() : () -> i64
          %273 = func.call @cc_errorp(%251) : (i64) -> i64
          %274 = arith.cmpi ne, %273, %272 : i64
          %275 = scf.if %274 -> (i64) {
            scf.yield %251 : i64
          } else {
            %276 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%276) : (i64) -> ()
            %277 = func.call @stack_pop_pointer() : () -> i64
            %278 = llvm.mlir.addressof @str29 : !llvm.ptr
            %279 = arith.constant 13 : i64
            %280 = func.call @cc_make_string(%278, %279) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%280) : (i64) -> ()
            %281 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%217) : (i64) -> ()
            %282 = func.call @stack_pop_pointer() : () -> i64
            %283 = llvm.mlir.addressof @str30 : !llvm.ptr
            %284 = arith.constant 5 : i64
            %285 = func.call @cc_make_string(%283, %284) : (!llvm.ptr, i64) -> i64
            %286 = llvm.mlir.addressof @str31 : !llvm.ptr
            %287 = arith.constant 7 : i64
            %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
            %289 = func.call @cc_intern(%285, %288) : (i64, i64) -> i64
            %290 = func.call @cc_nil_value() : () -> i64
            %291 = func.call @cc_cons(%289, %290) : (i64, i64) -> i64
            %292 = func.call @cc_values_pack(%291) : (i64) -> i64
            func.call @stack_push_pointer(%289) : (i64) -> ()
            %293 = llvm.mlir.addressof @str32 : !llvm.ptr
            %294 = arith.constant 4 : i64
            %295 = func.call @cc_make_string(%293, %294) : (!llvm.ptr, i64) -> i64
            %296 = llvm.mlir.addressof @str33 : !llvm.ptr
            %297 = arith.constant 7 : i64
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
            %309 = func.call @stack_pop_pointer() : () -> i64
            %310 = func.call @cc_nil_value() : () -> i64
            %311 = func.call @cc_errorp(%282) : (i64) -> i64
            %312 = arith.cmpi ne, %311, %310 : i64
            %313 = arith.cmpi eq, %310, %310 : i64
            %314 = arith.andi %312, %313 : i1
            %315 = scf.if %314 -> (i64) {
              scf.yield %282 : i64
            } else {
              scf.yield %310 : i64
            }
            %316 = func.call @cc_errorp(%309) : (i64) -> i64
            %317 = arith.cmpi ne, %316, %310 : i64
            %318 = arith.cmpi eq, %315, %310 : i64
            %319 = arith.andi %317, %318 : i1
            %320 = scf.if %319 -> (i64) {
              scf.yield %309 : i64
            } else {
              scf.yield %315 : i64
            }
            %321 = arith.cmpi ne, %320, %310 : i64
            scf.if %321 {
              func.call @stack_push_pointer(%320) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%282) : (i64) -> ()
              func.call @stack_push_pointer(%309) : (i64) -> ()
              %322 = llvm.mlir.addressof @str34 : !llvm.ptr
              %323 = func.call @cc_make_function_ref_const(%322) : (!llvm.ptr) -> i64
              %324 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%323, %324) : (i64, i64) -> ()
            }
            %325 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%277) : (i64) -> ()
            func.call @stack_push_pointer(%281) : (i64) -> ()
            func.call @stack_push_pointer(%325) : (i64) -> ()
            %326 = llvm.mlir.addressof @str35 : !llvm.ptr
            %327 = func.call @cc_make_function_ref_const(%326) : (!llvm.ptr) -> i64
            %328 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%327, %328) : (i64, i64) -> ()
            %329 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %329 : i64
          }
          %330 = func.call @cc_nil_value() : () -> i64
          %331 = func.call @cc_errorp(%275) : (i64) -> i64
          %332 = arith.cmpi ne, %331, %330 : i64
          %333 = scf.if %332 -> (i64) {
            scf.yield %275 : i64
          } else {
            %334 = arith.constant 33 : i64
            %335 = func.call @cc_box_character(%334) : (i64) -> i64
            func.call @stack_push_pointer(%335) : (i64) -> ()
            %336 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%217) : (i64) -> ()
            %337 = func.call @stack_pop_pointer() : () -> i64
            %338 = func.call @cc_nil_value() : () -> i64
            %339 = func.call @cc_errorp(%336) : (i64) -> i64
            %340 = arith.cmpi ne, %339, %338 : i64
            %341 = arith.cmpi eq, %338, %338 : i64
            %342 = arith.andi %340, %341 : i1
            %343 = scf.if %342 -> (i64) {
              scf.yield %336 : i64
            } else {
              scf.yield %338 : i64
            }
            %344 = func.call @cc_errorp(%337) : (i64) -> i64
            %345 = arith.cmpi ne, %344, %338 : i64
            %346 = arith.cmpi eq, %343, %338 : i64
            %347 = arith.andi %345, %346 : i1
            %348 = scf.if %347 -> (i64) {
              scf.yield %337 : i64
            } else {
              scf.yield %343 : i64
            }
            %349 = arith.cmpi ne, %348, %338 : i64
            scf.if %349 {
              func.call @stack_push_pointer(%348) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%336) : (i64) -> ()
              func.call @stack_push_pointer(%337) : (i64) -> ()
              %350 = llvm.mlir.addressof @str36 : !llvm.ptr
              %351 = func.call @cc_make_function_ref_const(%350) : (!llvm.ptr) -> i64
              %352 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%351, %352) : (i64, i64) -> ()
            }
            %353 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %353 : i64
          }
          %354 = func.call @cc_nil_value() : () -> i64
          %355 = func.call @cc_errorp(%333) : (i64) -> i64
          %356 = arith.cmpi ne, %355, %354 : i64
          %357 = scf.if %356 -> (i64) {
            scf.yield %333 : i64
          } else {
            %358 = arith.constant 10 : i64
            %359 = func.call @cc_box_character(%358) : (i64) -> i64
            func.call @stack_push_pointer(%359) : (i64) -> ()
            %360 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%217) : (i64) -> ()
            %361 = func.call @stack_pop_pointer() : () -> i64
            %362 = func.call @cc_nil_value() : () -> i64
            %363 = func.call @cc_errorp(%360) : (i64) -> i64
            %364 = arith.cmpi ne, %363, %362 : i64
            %365 = arith.cmpi eq, %362, %362 : i64
            %366 = arith.andi %364, %365 : i1
            %367 = scf.if %366 -> (i64) {
              scf.yield %360 : i64
            } else {
              scf.yield %362 : i64
            }
            %368 = func.call @cc_errorp(%361) : (i64) -> i64
            %369 = arith.cmpi ne, %368, %362 : i64
            %370 = arith.cmpi eq, %367, %362 : i64
            %371 = arith.andi %369, %370 : i1
            %372 = scf.if %371 -> (i64) {
              scf.yield %361 : i64
            } else {
              scf.yield %367 : i64
            }
            %373 = arith.cmpi ne, %372, %362 : i64
            scf.if %373 {
              func.call @stack_push_pointer(%372) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%360) : (i64) -> ()
              func.call @stack_push_pointer(%361) : (i64) -> ()
              %374 = llvm.mlir.addressof @str37 : !llvm.ptr
              %375 = func.call @cc_make_function_ref_const(%374) : (!llvm.ptr) -> i64
              %376 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%375, %376) : (i64, i64) -> ()
            }
            %377 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %377 : i64
          }
          %378 = func.call @cc_nil_value() : () -> i64
          %379 = func.call @cc_errorp(%357) : (i64) -> i64
          %380 = arith.cmpi ne, %379, %378 : i64
          %381 = scf.if %380 -> (i64) {
            scf.yield %357 : i64
          } else {
            %382 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%382) : (i64) -> ()
            %383 = func.call @stack_pop_pointer() : () -> i64
            %384 = llvm.mlir.addressof @str38 : !llvm.ptr
            %385 = arith.constant 12 : i64
            %386 = func.call @cc_make_string(%384, %385) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%386) : (i64) -> ()
            %387 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%217) : (i64) -> ()
            %388 = func.call @stack_pop_pointer() : () -> i64
            %389 = llvm.mlir.addressof @str39 : !llvm.ptr
            %390 = arith.constant 7 : i64
            %391 = func.call @cc_make_string(%389, %390) : (!llvm.ptr, i64) -> i64
            %392 = llvm.mlir.addressof @str40 : !llvm.ptr
            %393 = arith.constant 7 : i64
            %394 = func.call @cc_make_string(%392, %393) : (!llvm.ptr, i64) -> i64
            %395 = func.call @cc_intern(%391, %394) : (i64, i64) -> i64
            %396 = func.call @cc_nil_value() : () -> i64
            %397 = func.call @cc_cons(%395, %396) : (i64, i64) -> i64
            %398 = func.call @cc_values_pack(%397) : (i64) -> i64
            func.call @stack_push_pointer(%395) : (i64) -> ()
            %399 = func.call @stack_pop_pointer() : () -> i64
            %400 = func.call @cc_nil_value() : () -> i64
            %401 = func.call @cc_errorp(%388) : (i64) -> i64
            %402 = arith.cmpi ne, %401, %400 : i64
            %403 = arith.cmpi eq, %400, %400 : i64
            %404 = arith.andi %402, %403 : i1
            %405 = scf.if %404 -> (i64) {
              scf.yield %388 : i64
            } else {
              scf.yield %400 : i64
            }
            %406 = func.call @cc_errorp(%399) : (i64) -> i64
            %407 = arith.cmpi ne, %406, %400 : i64
            %408 = arith.cmpi eq, %405, %400 : i64
            %409 = arith.andi %407, %408 : i1
            %410 = scf.if %409 -> (i64) {
              scf.yield %399 : i64
            } else {
              scf.yield %405 : i64
            }
            %411 = arith.cmpi ne, %410, %400 : i64
            scf.if %411 {
              func.call @stack_push_pointer(%410) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%388) : (i64) -> ()
              func.call @stack_push_pointer(%399) : (i64) -> ()
              %412 = llvm.mlir.addressof @str41 : !llvm.ptr
              %413 = func.call @cc_make_function_ref_const(%412) : (!llvm.ptr) -> i64
              %414 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%413, %414) : (i64, i64) -> ()
            }
            %415 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%383) : (i64) -> ()
            func.call @stack_push_pointer(%387) : (i64) -> ()
            func.call @stack_push_pointer(%415) : (i64) -> ()
            %416 = llvm.mlir.addressof @str42 : !llvm.ptr
            %417 = func.call @cc_make_function_ref_const(%416) : (!llvm.ptr) -> i64
            %418 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%417, %418) : (i64, i64) -> ()
            %419 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %419 : i64
          }
          %420 = func.call @cc_nil_value() : () -> i64
          %421 = func.call @cc_errorp(%381) : (i64) -> i64
          %422 = arith.cmpi ne, %421, %420 : i64
          %423 = scf.if %422 -> (i64) {
            scf.yield %381 : i64
          } else {
            %424 = arith.constant 8482 : i64
            %425 = func.call @cc_box_character(%424) : (i64) -> i64
            func.call @stack_push_pointer(%425) : (i64) -> ()
            %426 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%217) : (i64) -> ()
            %427 = func.call @stack_pop_pointer() : () -> i64
            %428 = func.call @cc_nil_value() : () -> i64
            %429 = func.call @cc_errorp(%426) : (i64) -> i64
            %430 = arith.cmpi ne, %429, %428 : i64
            %431 = arith.cmpi eq, %428, %428 : i64
            %432 = arith.andi %430, %431 : i1
            %433 = scf.if %432 -> (i64) {
              scf.yield %426 : i64
            } else {
              scf.yield %428 : i64
            }
            %434 = func.call @cc_errorp(%427) : (i64) -> i64
            %435 = arith.cmpi ne, %434, %428 : i64
            %436 = arith.cmpi eq, %433, %428 : i64
            %437 = arith.andi %435, %436 : i1
            %438 = scf.if %437 -> (i64) {
              scf.yield %427 : i64
            } else {
              scf.yield %433 : i64
            }
            %439 = arith.cmpi ne, %438, %428 : i64
            scf.if %439 {
              func.call @stack_push_pointer(%438) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%426) : (i64) -> ()
              func.call @stack_push_pointer(%427) : (i64) -> ()
              %440 = llvm.mlir.addressof @str43 : !llvm.ptr
              %441 = func.call @cc_make_function_ref_const(%440) : (!llvm.ptr) -> i64
              %442 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%441, %442) : (i64, i64) -> ()
            }
            %443 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %443 : i64
          }
          func.call @stack_push_pointer(%423) : (i64) -> ()
          %444 = func.call @stack_pop_pointer() : () -> i64
          %445 = func.call @cc_multiple_value_list(%444) : (i64) -> i64
          func.call @stack_push_pointer(%217) : (i64) -> ()
          %446 = func.call @stack_pop_pointer() : () -> i64
          %447 = func.call @cc_nil_value() : () -> i64
          %448 = func.call @cc_errorp(%446) : (i64) -> i64
          %449 = arith.cmpi ne, %448, %447 : i64
          %450 = arith.cmpi eq, %447, %447 : i64
          %451 = arith.andi %449, %450 : i1
          %452 = scf.if %451 -> (i64) {
            scf.yield %446 : i64
          } else {
            scf.yield %447 : i64
          }
          %453 = arith.cmpi ne, %452, %447 : i64
          scf.if %453 {
            func.call @stack_push_pointer(%452) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%446) : (i64) -> ()
            %454 = llvm.mlir.addressof @str44 : !llvm.ptr
            %455 = func.call @cc_make_function_ref_const(%454) : (!llvm.ptr) -> i64
            %456 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%455, %456) : (i64, i64) -> ()
          }
          %457 = func.call @stack_depth() : () -> i64
          %458 = arith.constant 0 : i64
          %459 = arith.cmpi sgt, %457, %458 : i64
          scf.if %459 {
            %460 = func.call @stack_pop_pointer() : () -> i64
          }
          %461 = func.call @cc_values_pack(%445) : (i64) -> i64
          func.call @stack_push_pointer(%461) : (i64) -> ()
          %462 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %462 : i64
        }
        func.call @stack_push_pointer(%222) : (i64) -> ()
        %463 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %463 : i64
      }
      %464 = func.call @cc_nil_value() : () -> i64
      %465 = func.call @cc_errorp(%45) : (i64) -> i64
      %466 = arith.cmpi ne, %465, %464 : i64
      %467 = scf.if %466 -> (i64) {
        scf.yield %45 : i64
      } else {
        func.call @stack_push_pointer(%35) : (i64) -> ()
        %468 = func.call @stack_pop_pointer() : () -> i64
        %469 = llvm.mlir.addressof @str45 : !llvm.ptr
        %470 = arith.constant 9 : i64
        %471 = func.call @cc_make_string(%469, %470) : (!llvm.ptr, i64) -> i64
        %472 = llvm.mlir.addressof @str46 : !llvm.ptr
        %473 = arith.constant 7 : i64
        %474 = func.call @cc_make_string(%472, %473) : (!llvm.ptr, i64) -> i64
        %475 = func.call @cc_intern(%471, %474) : (i64, i64) -> i64
        %476 = func.call @cc_nil_value() : () -> i64
        %477 = func.call @cc_cons(%475, %476) : (i64, i64) -> i64
        %478 = func.call @cc_values_pack(%477) : (i64) -> i64
        func.call @stack_push_pointer(%475) : (i64) -> ()
        %479 = func.call @stack_pop_pointer() : () -> i64
        %480 = llvm.mlir.addressof @str47 : !llvm.ptr
        %481 = arith.constant 5 : i64
        %482 = func.call @cc_make_string(%480, %481) : (!llvm.ptr, i64) -> i64
        %483 = llvm.mlir.addressof @str48 : !llvm.ptr
        %484 = arith.constant 7 : i64
        %485 = func.call @cc_make_string(%483, %484) : (!llvm.ptr, i64) -> i64
        %486 = func.call @cc_intern(%482, %485) : (i64, i64) -> i64
        %487 = func.call @cc_nil_value() : () -> i64
        %488 = func.call @cc_cons(%486, %487) : (i64, i64) -> i64
        %489 = func.call @cc_values_pack(%488) : (i64) -> i64
        func.call @stack_push_pointer(%486) : (i64) -> ()
        %490 = func.call @stack_pop_pointer() : () -> i64
        %491 = llvm.mlir.addressof @str49 : !llvm.ptr
        %492 = arith.constant 12 : i64
        %493 = func.call @cc_make_string(%491, %492) : (!llvm.ptr, i64) -> i64
        %494 = llvm.mlir.addressof @str50 : !llvm.ptr
        %495 = arith.constant 7 : i64
        %496 = func.call @cc_make_string(%494, %495) : (!llvm.ptr, i64) -> i64
        %497 = func.call @cc_intern(%493, %496) : (i64, i64) -> i64
        %498 = func.call @cc_nil_value() : () -> i64
        %499 = func.call @cc_cons(%497, %498) : (i64, i64) -> i64
        %500 = func.call @cc_values_pack(%499) : (i64) -> i64
        func.call @stack_push_pointer(%497) : (i64) -> ()
        %501 = func.call @stack_pop_pointer() : () -> i64
        %502 = llvm.mlir.addressof @str51 : !llvm.ptr
        %503 = arith.constant 9 : i64
        %504 = func.call @cc_make_string(%502, %503) : (!llvm.ptr, i64) -> i64
        %505 = llvm.mlir.addressof @str52 : !llvm.ptr
        %506 = arith.constant 11 : i64
        %507 = func.call @cc_make_string(%505, %506) : (!llvm.ptr, i64) -> i64
        %508 = func.call @cc_intern(%504, %507) : (i64, i64) -> i64
        %509 = func.call @cc_nil_value() : () -> i64
        %510 = func.call @cc_cons(%508, %509) : (i64, i64) -> i64
        %511 = func.call @cc_values_pack(%510) : (i64) -> i64
        func.call @stack_push_pointer(%508) : (i64) -> ()
        %512 = func.call @stack_pop_pointer() : () -> i64
        %513 = llvm.mlir.addressof @str53 : !llvm.ptr
        %514 = arith.constant 15 : i64
        %515 = func.call @cc_make_string(%513, %514) : (!llvm.ptr, i64) -> i64
        %516 = llvm.mlir.addressof @str54 : !llvm.ptr
        %517 = arith.constant 7 : i64
        %518 = func.call @cc_make_string(%516, %517) : (!llvm.ptr, i64) -> i64
        %519 = func.call @cc_intern(%515, %518) : (i64, i64) -> i64
        %520 = func.call @cc_nil_value() : () -> i64
        %521 = func.call @cc_cons(%519, %520) : (i64, i64) -> i64
        %522 = func.call @cc_values_pack(%521) : (i64) -> i64
        func.call @stack_push_pointer(%519) : (i64) -> ()
        %523 = func.call @stack_pop_pointer() : () -> i64
        %524 = llvm.mlir.addressof @str55 : !llvm.ptr
        %525 = arith.constant 5 : i64
        %526 = func.call @cc_make_string(%524, %525) : (!llvm.ptr, i64) -> i64
        %527 = llvm.mlir.addressof @str56 : !llvm.ptr
        %528 = arith.constant 7 : i64
        %529 = func.call @cc_make_string(%527, %528) : (!llvm.ptr, i64) -> i64
        %530 = func.call @cc_intern(%526, %529) : (i64, i64) -> i64
        %531 = func.call @cc_nil_value() : () -> i64
        %532 = func.call @cc_cons(%530, %531) : (i64, i64) -> i64
        %533 = func.call @cc_values_pack(%532) : (i64) -> i64
        func.call @stack_push_pointer(%530) : (i64) -> ()
        %534 = func.call @stack_pop_pointer() : () -> i64
        %535 = func.call @cc_nil_value() : () -> i64
        %536 = func.call @cc_errorp(%468) : (i64) -> i64
        %537 = arith.cmpi ne, %536, %535 : i64
        %538 = arith.cmpi eq, %535, %535 : i64
        %539 = arith.andi %537, %538 : i1
        %540 = scf.if %539 -> (i64) {
          scf.yield %468 : i64
        } else {
          scf.yield %535 : i64
        }
        %541 = func.call @cc_errorp(%479) : (i64) -> i64
        %542 = arith.cmpi ne, %541, %535 : i64
        %543 = arith.cmpi eq, %540, %535 : i64
        %544 = arith.andi %542, %543 : i1
        %545 = scf.if %544 -> (i64) {
          scf.yield %479 : i64
        } else {
          scf.yield %540 : i64
        }
        %546 = func.call @cc_errorp(%490) : (i64) -> i64
        %547 = arith.cmpi ne, %546, %535 : i64
        %548 = arith.cmpi eq, %545, %535 : i64
        %549 = arith.andi %547, %548 : i1
        %550 = scf.if %549 -> (i64) {
          scf.yield %490 : i64
        } else {
          scf.yield %545 : i64
        }
        %551 = func.call @cc_errorp(%501) : (i64) -> i64
        %552 = arith.cmpi ne, %551, %535 : i64
        %553 = arith.cmpi eq, %550, %535 : i64
        %554 = arith.andi %552, %553 : i1
        %555 = scf.if %554 -> (i64) {
          scf.yield %501 : i64
        } else {
          scf.yield %550 : i64
        }
        %556 = func.call @cc_errorp(%512) : (i64) -> i64
        %557 = arith.cmpi ne, %556, %535 : i64
        %558 = arith.cmpi eq, %555, %535 : i64
        %559 = arith.andi %557, %558 : i1
        %560 = scf.if %559 -> (i64) {
          scf.yield %512 : i64
        } else {
          scf.yield %555 : i64
        }
        %561 = func.call @cc_errorp(%523) : (i64) -> i64
        %562 = arith.cmpi ne, %561, %535 : i64
        %563 = arith.cmpi eq, %560, %535 : i64
        %564 = arith.andi %562, %563 : i1
        %565 = scf.if %564 -> (i64) {
          scf.yield %523 : i64
        } else {
          scf.yield %560 : i64
        }
        %566 = func.call @cc_errorp(%534) : (i64) -> i64
        %567 = arith.cmpi ne, %566, %535 : i64
        %568 = arith.cmpi eq, %565, %535 : i64
        %569 = arith.andi %567, %568 : i1
        %570 = scf.if %569 -> (i64) {
          scf.yield %534 : i64
        } else {
          scf.yield %565 : i64
        }
        %571 = arith.cmpi ne, %570, %535 : i64
        scf.if %571 {
          func.call @stack_push_pointer(%570) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%468) : (i64) -> ()
          func.call @stack_push_pointer(%479) : (i64) -> ()
          func.call @stack_push_pointer(%490) : (i64) -> ()
          func.call @stack_push_pointer(%501) : (i64) -> ()
          func.call @stack_push_pointer(%512) : (i64) -> ()
          func.call @stack_push_pointer(%523) : (i64) -> ()
          func.call @stack_push_pointer(%534) : (i64) -> ()
          %572 = llvm.mlir.addressof @str57 : !llvm.ptr
          %573 = func.call @cc_make_function_ref_const(%572) : (!llvm.ptr) -> i64
          %574 = arith.constant 7 : i64
          func.call @cc_funcall_stack(%573, %574) : (i64, i64) -> ()
        }
        %575 = func.call @stack_pop_pointer() : () -> i64
        %576 = func.call @cc_nil_value() : () -> i64
        %577 = func.call @cc_nil_value() : () -> i64
        %578 = func.call @cc_errorp(%576) : (i64) -> i64
        %579 = arith.cmpi ne, %578, %577 : i64
        %580 = scf.if %579 -> (i64) {
          scf.yield %576 : i64
        } else {
          %581 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%581) : (i64) -> ()
          %582 = func.call @stack_pop_pointer() : () -> i64
          %583 = llvm.mlir.addressof @str58 : !llvm.ptr
          %584 = arith.constant 13 : i64
          %585 = func.call @cc_make_string(%583, %584) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%585) : (i64) -> ()
          %586 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%575) : (i64) -> ()
          %587 = func.call @stack_pop_pointer() : () -> i64
          %588 = func.call @cc_nil_value() : () -> i64
          %589 = func.call @cc_errorp(%587) : (i64) -> i64
          %590 = arith.cmpi ne, %589, %588 : i64
          %591 = arith.cmpi eq, %588, %588 : i64
          %592 = arith.andi %590, %591 : i1
          %593 = scf.if %592 -> (i64) {
            scf.yield %587 : i64
          } else {
            scf.yield %588 : i64
          }
          %594 = arith.cmpi ne, %593, %588 : i64
          scf.if %594 {
            func.call @stack_push_pointer(%593) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%587) : (i64) -> ()
            %595 = llvm.mlir.addressof @str59 : !llvm.ptr
            %596 = func.call @cc_make_function_ref_const(%595) : (!llvm.ptr) -> i64
            %597 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%596, %597) : (i64, i64) -> ()
          }
          %598 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%575) : (i64) -> ()
          %599 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %600 = func.call @stack_pop_pointer() : () -> i64
          %601 = llvm.mlir.addressof @str60 : !llvm.ptr
          %602 = arith.constant 3 : i64
          %603 = func.call @cc_make_string(%601, %602) : (!llvm.ptr, i64) -> i64
          %604 = llvm.mlir.addressof @str61 : !llvm.ptr
          %605 = arith.constant 7 : i64
          %606 = func.call @cc_make_string(%604, %605) : (!llvm.ptr, i64) -> i64
          %607 = func.call @cc_intern(%603, %606) : (i64, i64) -> i64
          %608 = func.call @cc_nil_value() : () -> i64
          %609 = func.call @cc_cons(%607, %608) : (i64, i64) -> i64
          %610 = func.call @cc_values_pack(%609) : (i64) -> i64
          func.call @stack_push_pointer(%607) : (i64) -> ()
          %611 = func.call @stack_pop_pointer() : () -> i64
          %612 = func.call @cc_nil_value() : () -> i64
          %613 = func.call @cc_errorp(%599) : (i64) -> i64
          %614 = arith.cmpi ne, %613, %612 : i64
          %615 = arith.cmpi eq, %612, %612 : i64
          %616 = arith.andi %614, %615 : i1
          %617 = scf.if %616 -> (i64) {
            scf.yield %599 : i64
          } else {
            scf.yield %612 : i64
          }
          %618 = func.call @cc_errorp(%600) : (i64) -> i64
          %619 = arith.cmpi ne, %618, %612 : i64
          %620 = arith.cmpi eq, %617, %612 : i64
          %621 = arith.andi %619, %620 : i1
          %622 = scf.if %621 -> (i64) {
            scf.yield %600 : i64
          } else {
            scf.yield %617 : i64
          }
          %623 = func.call @cc_errorp(%611) : (i64) -> i64
          %624 = arith.cmpi ne, %623, %612 : i64
          %625 = arith.cmpi eq, %622, %612 : i64
          %626 = arith.andi %624, %625 : i1
          %627 = scf.if %626 -> (i64) {
            scf.yield %611 : i64
          } else {
            scf.yield %622 : i64
          }
          %628 = arith.cmpi ne, %627, %612 : i64
          scf.if %628 {
            func.call @stack_push_pointer(%627) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%599) : (i64) -> ()
            func.call @stack_push_pointer(%600) : (i64) -> ()
            func.call @stack_push_pointer(%611) : (i64) -> ()
            %629 = llvm.mlir.addressof @str62 : !llvm.ptr
            %630 = func.call @cc_make_function_ref_const(%629) : (!llvm.ptr) -> i64
            %631 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%630, %631) : (i64, i64) -> ()
          }
          %632 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%575) : (i64) -> ()
          %633 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %634 = func.call @stack_pop_pointer() : () -> i64
          %635 = llvm.mlir.addressof @str63 : !llvm.ptr
          %636 = arith.constant 3 : i64
          %637 = func.call @cc_make_string(%635, %636) : (!llvm.ptr, i64) -> i64
          %638 = llvm.mlir.addressof @str64 : !llvm.ptr
          %639 = arith.constant 7 : i64
          %640 = func.call @cc_make_string(%638, %639) : (!llvm.ptr, i64) -> i64
          %641 = func.call @cc_intern(%637, %640) : (i64, i64) -> i64
          %642 = func.call @cc_nil_value() : () -> i64
          %643 = func.call @cc_cons(%641, %642) : (i64, i64) -> i64
          %644 = func.call @cc_values_pack(%643) : (i64) -> i64
          func.call @stack_push_pointer(%641) : (i64) -> ()
          %645 = func.call @stack_pop_pointer() : () -> i64
          %646 = func.call @cc_nil_value() : () -> i64
          %647 = func.call @cc_errorp(%633) : (i64) -> i64
          %648 = arith.cmpi ne, %647, %646 : i64
          %649 = arith.cmpi eq, %646, %646 : i64
          %650 = arith.andi %648, %649 : i1
          %651 = scf.if %650 -> (i64) {
            scf.yield %633 : i64
          } else {
            scf.yield %646 : i64
          }
          %652 = func.call @cc_errorp(%634) : (i64) -> i64
          %653 = arith.cmpi ne, %652, %646 : i64
          %654 = arith.cmpi eq, %651, %646 : i64
          %655 = arith.andi %653, %654 : i1
          %656 = scf.if %655 -> (i64) {
            scf.yield %634 : i64
          } else {
            scf.yield %651 : i64
          }
          %657 = func.call @cc_errorp(%645) : (i64) -> i64
          %658 = arith.cmpi ne, %657, %646 : i64
          %659 = arith.cmpi eq, %656, %646 : i64
          %660 = arith.andi %658, %659 : i1
          %661 = scf.if %660 -> (i64) {
            scf.yield %645 : i64
          } else {
            scf.yield %656 : i64
          }
          %662 = arith.cmpi ne, %661, %646 : i64
          scf.if %662 {
            func.call @stack_push_pointer(%661) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%633) : (i64) -> ()
            func.call @stack_push_pointer(%634) : (i64) -> ()
            func.call @stack_push_pointer(%645) : (i64) -> ()
            %663 = llvm.mlir.addressof @str65 : !llvm.ptr
            %664 = func.call @cc_make_function_ref_const(%663) : (!llvm.ptr) -> i64
            %665 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%664, %665) : (i64, i64) -> ()
          }
          %666 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%575) : (i64) -> ()
          %667 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %668 = func.call @stack_pop_pointer() : () -> i64
          %669 = llvm.mlir.addressof @str66 : !llvm.ptr
          %670 = arith.constant 3 : i64
          %671 = func.call @cc_make_string(%669, %670) : (!llvm.ptr, i64) -> i64
          %672 = llvm.mlir.addressof @str67 : !llvm.ptr
          %673 = arith.constant 7 : i64
          %674 = func.call @cc_make_string(%672, %673) : (!llvm.ptr, i64) -> i64
          %675 = func.call @cc_intern(%671, %674) : (i64, i64) -> i64
          %676 = func.call @cc_nil_value() : () -> i64
          %677 = func.call @cc_cons(%675, %676) : (i64, i64) -> i64
          %678 = func.call @cc_values_pack(%677) : (i64) -> i64
          func.call @stack_push_pointer(%675) : (i64) -> ()
          %679 = func.call @stack_pop_pointer() : () -> i64
          %680 = func.call @cc_nil_value() : () -> i64
          %681 = func.call @cc_errorp(%667) : (i64) -> i64
          %682 = arith.cmpi ne, %681, %680 : i64
          %683 = arith.cmpi eq, %680, %680 : i64
          %684 = arith.andi %682, %683 : i1
          %685 = scf.if %684 -> (i64) {
            scf.yield %667 : i64
          } else {
            scf.yield %680 : i64
          }
          %686 = func.call @cc_errorp(%668) : (i64) -> i64
          %687 = arith.cmpi ne, %686, %680 : i64
          %688 = arith.cmpi eq, %685, %680 : i64
          %689 = arith.andi %687, %688 : i1
          %690 = scf.if %689 -> (i64) {
            scf.yield %668 : i64
          } else {
            scf.yield %685 : i64
          }
          %691 = func.call @cc_errorp(%679) : (i64) -> i64
          %692 = arith.cmpi ne, %691, %680 : i64
          %693 = arith.cmpi eq, %690, %680 : i64
          %694 = arith.andi %692, %693 : i1
          %695 = scf.if %694 -> (i64) {
            scf.yield %679 : i64
          } else {
            scf.yield %690 : i64
          }
          %696 = arith.cmpi ne, %695, %680 : i64
          scf.if %696 {
            func.call @stack_push_pointer(%695) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%667) : (i64) -> ()
            func.call @stack_push_pointer(%668) : (i64) -> ()
            func.call @stack_push_pointer(%679) : (i64) -> ()
            %697 = llvm.mlir.addressof @str68 : !llvm.ptr
            %698 = func.call @cc_make_function_ref_const(%697) : (!llvm.ptr) -> i64
            %699 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%698, %699) : (i64, i64) -> ()
          }
          %700 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%575) : (i64) -> ()
          %701 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %702 = func.call @stack_pop_pointer() : () -> i64
          %703 = llvm.mlir.addressof @str69 : !llvm.ptr
          %704 = arith.constant 3 : i64
          %705 = func.call @cc_make_string(%703, %704) : (!llvm.ptr, i64) -> i64
          %706 = llvm.mlir.addressof @str70 : !llvm.ptr
          %707 = arith.constant 7 : i64
          %708 = func.call @cc_make_string(%706, %707) : (!llvm.ptr, i64) -> i64
          %709 = func.call @cc_intern(%705, %708) : (i64, i64) -> i64
          %710 = func.call @cc_nil_value() : () -> i64
          %711 = func.call @cc_cons(%709, %710) : (i64, i64) -> i64
          %712 = func.call @cc_values_pack(%711) : (i64) -> i64
          func.call @stack_push_pointer(%709) : (i64) -> ()
          %713 = func.call @stack_pop_pointer() : () -> i64
          %714 = func.call @cc_nil_value() : () -> i64
          %715 = func.call @cc_errorp(%701) : (i64) -> i64
          %716 = arith.cmpi ne, %715, %714 : i64
          %717 = arith.cmpi eq, %714, %714 : i64
          %718 = arith.andi %716, %717 : i1
          %719 = scf.if %718 -> (i64) {
            scf.yield %701 : i64
          } else {
            scf.yield %714 : i64
          }
          %720 = func.call @cc_errorp(%702) : (i64) -> i64
          %721 = arith.cmpi ne, %720, %714 : i64
          %722 = arith.cmpi eq, %719, %714 : i64
          %723 = arith.andi %721, %722 : i1
          %724 = scf.if %723 -> (i64) {
            scf.yield %702 : i64
          } else {
            scf.yield %719 : i64
          }
          %725 = func.call @cc_errorp(%713) : (i64) -> i64
          %726 = arith.cmpi ne, %725, %714 : i64
          %727 = arith.cmpi eq, %724, %714 : i64
          %728 = arith.andi %726, %727 : i1
          %729 = scf.if %728 -> (i64) {
            scf.yield %713 : i64
          } else {
            scf.yield %724 : i64
          }
          %730 = arith.cmpi ne, %729, %714 : i64
          scf.if %730 {
            func.call @stack_push_pointer(%729) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%701) : (i64) -> ()
            func.call @stack_push_pointer(%702) : (i64) -> ()
            func.call @stack_push_pointer(%713) : (i64) -> ()
            %731 = llvm.mlir.addressof @str71 : !llvm.ptr
            %732 = func.call @cc_make_function_ref_const(%731) : (!llvm.ptr) -> i64
            %733 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%732, %733) : (i64, i64) -> ()
          }
          %734 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%575) : (i64) -> ()
          %735 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %736 = func.call @stack_pop_pointer() : () -> i64
          %737 = llvm.mlir.addressof @str72 : !llvm.ptr
          %738 = arith.constant 3 : i64
          %739 = func.call @cc_make_string(%737, %738) : (!llvm.ptr, i64) -> i64
          %740 = llvm.mlir.addressof @str73 : !llvm.ptr
          %741 = arith.constant 7 : i64
          %742 = func.call @cc_make_string(%740, %741) : (!llvm.ptr, i64) -> i64
          %743 = func.call @cc_intern(%739, %742) : (i64, i64) -> i64
          %744 = func.call @cc_nil_value() : () -> i64
          %745 = func.call @cc_cons(%743, %744) : (i64, i64) -> i64
          %746 = func.call @cc_values_pack(%745) : (i64) -> i64
          func.call @stack_push_pointer(%743) : (i64) -> ()
          %747 = func.call @stack_pop_pointer() : () -> i64
          %748 = func.call @cc_nil_value() : () -> i64
          %749 = func.call @cc_errorp(%735) : (i64) -> i64
          %750 = arith.cmpi ne, %749, %748 : i64
          %751 = arith.cmpi eq, %748, %748 : i64
          %752 = arith.andi %750, %751 : i1
          %753 = scf.if %752 -> (i64) {
            scf.yield %735 : i64
          } else {
            scf.yield %748 : i64
          }
          %754 = func.call @cc_errorp(%736) : (i64) -> i64
          %755 = arith.cmpi ne, %754, %748 : i64
          %756 = arith.cmpi eq, %753, %748 : i64
          %757 = arith.andi %755, %756 : i1
          %758 = scf.if %757 -> (i64) {
            scf.yield %736 : i64
          } else {
            scf.yield %753 : i64
          }
          %759 = func.call @cc_errorp(%747) : (i64) -> i64
          %760 = arith.cmpi ne, %759, %748 : i64
          %761 = arith.cmpi eq, %758, %748 : i64
          %762 = arith.andi %760, %761 : i1
          %763 = scf.if %762 -> (i64) {
            scf.yield %747 : i64
          } else {
            scf.yield %758 : i64
          }
          %764 = arith.cmpi ne, %763, %748 : i64
          scf.if %764 {
            func.call @stack_push_pointer(%763) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%735) : (i64) -> ()
            func.call @stack_push_pointer(%736) : (i64) -> ()
            func.call @stack_push_pointer(%747) : (i64) -> ()
            %765 = llvm.mlir.addressof @str74 : !llvm.ptr
            %766 = func.call @cc_make_function_ref_const(%765) : (!llvm.ptr) -> i64
            %767 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%766, %767) : (i64, i64) -> ()
          }
          %768 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%575) : (i64) -> ()
          %769 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %770 = func.call @stack_pop_pointer() : () -> i64
          %771 = llvm.mlir.addressof @str75 : !llvm.ptr
          %772 = arith.constant 3 : i64
          %773 = func.call @cc_make_string(%771, %772) : (!llvm.ptr, i64) -> i64
          %774 = llvm.mlir.addressof @str76 : !llvm.ptr
          %775 = arith.constant 7 : i64
          %776 = func.call @cc_make_string(%774, %775) : (!llvm.ptr, i64) -> i64
          %777 = func.call @cc_intern(%773, %776) : (i64, i64) -> i64
          %778 = func.call @cc_nil_value() : () -> i64
          %779 = func.call @cc_cons(%777, %778) : (i64, i64) -> i64
          %780 = func.call @cc_values_pack(%779) : (i64) -> i64
          func.call @stack_push_pointer(%777) : (i64) -> ()
          %781 = func.call @stack_pop_pointer() : () -> i64
          %782 = func.call @cc_nil_value() : () -> i64
          %783 = func.call @cc_errorp(%769) : (i64) -> i64
          %784 = arith.cmpi ne, %783, %782 : i64
          %785 = arith.cmpi eq, %782, %782 : i64
          %786 = arith.andi %784, %785 : i1
          %787 = scf.if %786 -> (i64) {
            scf.yield %769 : i64
          } else {
            scf.yield %782 : i64
          }
          %788 = func.call @cc_errorp(%770) : (i64) -> i64
          %789 = arith.cmpi ne, %788, %782 : i64
          %790 = arith.cmpi eq, %787, %782 : i64
          %791 = arith.andi %789, %790 : i1
          %792 = scf.if %791 -> (i64) {
            scf.yield %770 : i64
          } else {
            scf.yield %787 : i64
          }
          %793 = func.call @cc_errorp(%781) : (i64) -> i64
          %794 = arith.cmpi ne, %793, %782 : i64
          %795 = arith.cmpi eq, %792, %782 : i64
          %796 = arith.andi %794, %795 : i1
          %797 = scf.if %796 -> (i64) {
            scf.yield %781 : i64
          } else {
            scf.yield %792 : i64
          }
          %798 = arith.cmpi ne, %797, %782 : i64
          scf.if %798 {
            func.call @stack_push_pointer(%797) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%769) : (i64) -> ()
            func.call @stack_push_pointer(%770) : (i64) -> ()
            func.call @stack_push_pointer(%781) : (i64) -> ()
            %799 = llvm.mlir.addressof @str77 : !llvm.ptr
            %800 = func.call @cc_make_function_ref_const(%799) : (!llvm.ptr) -> i64
            %801 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%800, %801) : (i64, i64) -> ()
          }
          %802 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%575) : (i64) -> ()
          %803 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_nil() : () -> ()
          %804 = func.call @stack_pop_pointer() : () -> i64
          %805 = llvm.mlir.addressof @str78 : !llvm.ptr
          %806 = arith.constant 3 : i64
          %807 = func.call @cc_make_string(%805, %806) : (!llvm.ptr, i64) -> i64
          %808 = llvm.mlir.addressof @str79 : !llvm.ptr
          %809 = arith.constant 7 : i64
          %810 = func.call @cc_make_string(%808, %809) : (!llvm.ptr, i64) -> i64
          %811 = func.call @cc_intern(%807, %810) : (i64, i64) -> i64
          %812 = func.call @cc_nil_value() : () -> i64
          %813 = func.call @cc_cons(%811, %812) : (i64, i64) -> i64
          %814 = func.call @cc_values_pack(%813) : (i64) -> i64
          func.call @stack_push_pointer(%811) : (i64) -> ()
          %815 = func.call @stack_pop_pointer() : () -> i64
          %816 = func.call @cc_nil_value() : () -> i64
          %817 = func.call @cc_errorp(%803) : (i64) -> i64
          %818 = arith.cmpi ne, %817, %816 : i64
          %819 = arith.cmpi eq, %816, %816 : i64
          %820 = arith.andi %818, %819 : i1
          %821 = scf.if %820 -> (i64) {
            scf.yield %803 : i64
          } else {
            scf.yield %816 : i64
          }
          %822 = func.call @cc_errorp(%804) : (i64) -> i64
          %823 = arith.cmpi ne, %822, %816 : i64
          %824 = arith.cmpi eq, %821, %816 : i64
          %825 = arith.andi %823, %824 : i1
          %826 = scf.if %825 -> (i64) {
            scf.yield %804 : i64
          } else {
            scf.yield %821 : i64
          }
          %827 = func.call @cc_errorp(%815) : (i64) -> i64
          %828 = arith.cmpi ne, %827, %816 : i64
          %829 = arith.cmpi eq, %826, %816 : i64
          %830 = arith.andi %828, %829 : i1
          %831 = scf.if %830 -> (i64) {
            scf.yield %815 : i64
          } else {
            scf.yield %826 : i64
          }
          %832 = arith.cmpi ne, %831, %816 : i64
          scf.if %832 {
            func.call @stack_push_pointer(%831) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%803) : (i64) -> ()
            func.call @stack_push_pointer(%804) : (i64) -> ()
            func.call @stack_push_pointer(%815) : (i64) -> ()
            %833 = llvm.mlir.addressof @str80 : !llvm.ptr
            %834 = func.call @cc_make_function_ref_const(%833) : (!llvm.ptr) -> i64
            %835 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%834, %835) : (i64, i64) -> ()
          }
          %836 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%575) : (i64) -> ()
          %837 = func.call @stack_pop_pointer() : () -> i64
          %838 = func.call @cc_nil_value() : () -> i64
          %839 = func.call @cc_errorp(%837) : (i64) -> i64
          %840 = arith.cmpi ne, %839, %838 : i64
          %841 = arith.cmpi eq, %838, %838 : i64
          %842 = arith.andi %840, %841 : i1
          %843 = scf.if %842 -> (i64) {
            scf.yield %837 : i64
          } else {
            scf.yield %838 : i64
          }
          %844 = arith.cmpi ne, %843, %838 : i64
          scf.if %844 {
            func.call @stack_push_pointer(%843) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%837) : (i64) -> ()
            %845 = llvm.mlir.addressof @str81 : !llvm.ptr
            %846 = func.call @cc_make_function_ref_const(%845) : (!llvm.ptr) -> i64
            %847 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%846, %847) : (i64, i64) -> ()
          }
          %848 = func.call @stack_pop_pointer() : () -> i64
          %849 = func.call @cc_nil_value() : () -> i64
          %850 = func.call @cc_errorp(%598) : (i64) -> i64
          %851 = arith.cmpi ne, %850, %849 : i64
          %852 = arith.cmpi eq, %849, %849 : i64
          %853 = arith.andi %851, %852 : i1
          %854 = scf.if %853 -> (i64) {
            scf.yield %598 : i64
          } else {
            scf.yield %849 : i64
          }
          %855 = func.call @cc_errorp(%632) : (i64) -> i64
          %856 = arith.cmpi ne, %855, %849 : i64
          %857 = arith.cmpi eq, %854, %849 : i64
          %858 = arith.andi %856, %857 : i1
          %859 = scf.if %858 -> (i64) {
            scf.yield %632 : i64
          } else {
            scf.yield %854 : i64
          }
          %860 = func.call @cc_errorp(%666) : (i64) -> i64
          %861 = arith.cmpi ne, %860, %849 : i64
          %862 = arith.cmpi eq, %859, %849 : i64
          %863 = arith.andi %861, %862 : i1
          %864 = scf.if %863 -> (i64) {
            scf.yield %666 : i64
          } else {
            scf.yield %859 : i64
          }
          %865 = func.call @cc_errorp(%700) : (i64) -> i64
          %866 = arith.cmpi ne, %865, %849 : i64
          %867 = arith.cmpi eq, %864, %849 : i64
          %868 = arith.andi %866, %867 : i1
          %869 = scf.if %868 -> (i64) {
            scf.yield %700 : i64
          } else {
            scf.yield %864 : i64
          }
          %870 = func.call @cc_errorp(%734) : (i64) -> i64
          %871 = arith.cmpi ne, %870, %849 : i64
          %872 = arith.cmpi eq, %869, %849 : i64
          %873 = arith.andi %871, %872 : i1
          %874 = scf.if %873 -> (i64) {
            scf.yield %734 : i64
          } else {
            scf.yield %869 : i64
          }
          %875 = func.call @cc_errorp(%768) : (i64) -> i64
          %876 = arith.cmpi ne, %875, %849 : i64
          %877 = arith.cmpi eq, %874, %849 : i64
          %878 = arith.andi %876, %877 : i1
          %879 = scf.if %878 -> (i64) {
            scf.yield %768 : i64
          } else {
            scf.yield %874 : i64
          }
          %880 = func.call @cc_errorp(%802) : (i64) -> i64
          %881 = arith.cmpi ne, %880, %849 : i64
          %882 = arith.cmpi eq, %879, %849 : i64
          %883 = arith.andi %881, %882 : i1
          %884 = scf.if %883 -> (i64) {
            scf.yield %802 : i64
          } else {
            scf.yield %879 : i64
          }
          %885 = func.call @cc_errorp(%836) : (i64) -> i64
          %886 = arith.cmpi ne, %885, %849 : i64
          %887 = arith.cmpi eq, %884, %849 : i64
          %888 = arith.andi %886, %887 : i1
          %889 = scf.if %888 -> (i64) {
            scf.yield %836 : i64
          } else {
            scf.yield %884 : i64
          }
          %890 = func.call @cc_errorp(%848) : (i64) -> i64
          %891 = arith.cmpi ne, %890, %849 : i64
          %892 = arith.cmpi eq, %889, %849 : i64
          %893 = arith.andi %891, %892 : i1
          %894 = scf.if %893 -> (i64) {
            scf.yield %848 : i64
          } else {
            scf.yield %889 : i64
          }
          %895 = arith.cmpi ne, %894, %849 : i64
          scf.if %895 {
            func.call @stack_push_pointer(%894) : (i64) -> ()
          } else {
            %896 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%896) : (i64) -> ()
            func.call @stack_push_pointer(%848) : (i64) -> ()
            %897 = func.call @stack_pop_pointer() : () -> i64
            %898 = func.call @stack_pop_pointer() : () -> i64
            %899 = func.call @cc_cons(%897, %898) : (i64, i64) -> i64
            func.call @stack_push_pointer(%899) : (i64) -> ()
            func.call @stack_push_pointer(%836) : (i64) -> ()
            %900 = func.call @stack_pop_pointer() : () -> i64
            %901 = func.call @stack_pop_pointer() : () -> i64
            %902 = func.call @cc_cons(%900, %901) : (i64, i64) -> i64
            func.call @stack_push_pointer(%902) : (i64) -> ()
            func.call @stack_push_pointer(%802) : (i64) -> ()
            %903 = func.call @stack_pop_pointer() : () -> i64
            %904 = func.call @stack_pop_pointer() : () -> i64
            %905 = func.call @cc_cons(%903, %904) : (i64, i64) -> i64
            func.call @stack_push_pointer(%905) : (i64) -> ()
            func.call @stack_push_pointer(%768) : (i64) -> ()
            %906 = func.call @stack_pop_pointer() : () -> i64
            %907 = func.call @stack_pop_pointer() : () -> i64
            %908 = func.call @cc_cons(%906, %907) : (i64, i64) -> i64
            func.call @stack_push_pointer(%908) : (i64) -> ()
            func.call @stack_push_pointer(%734) : (i64) -> ()
            %909 = func.call @stack_pop_pointer() : () -> i64
            %910 = func.call @stack_pop_pointer() : () -> i64
            %911 = func.call @cc_cons(%909, %910) : (i64, i64) -> i64
            func.call @stack_push_pointer(%911) : (i64) -> ()
            func.call @stack_push_pointer(%700) : (i64) -> ()
            %912 = func.call @stack_pop_pointer() : () -> i64
            %913 = func.call @stack_pop_pointer() : () -> i64
            %914 = func.call @cc_cons(%912, %913) : (i64, i64) -> i64
            func.call @stack_push_pointer(%914) : (i64) -> ()
            func.call @stack_push_pointer(%666) : (i64) -> ()
            %915 = func.call @stack_pop_pointer() : () -> i64
            %916 = func.call @stack_pop_pointer() : () -> i64
            %917 = func.call @cc_cons(%915, %916) : (i64, i64) -> i64
            func.call @stack_push_pointer(%917) : (i64) -> ()
            func.call @stack_push_pointer(%632) : (i64) -> ()
            %918 = func.call @stack_pop_pointer() : () -> i64
            %919 = func.call @stack_pop_pointer() : () -> i64
            %920 = func.call @cc_cons(%918, %919) : (i64, i64) -> i64
            func.call @stack_push_pointer(%920) : (i64) -> ()
            func.call @stack_push_pointer(%598) : (i64) -> ()
            %921 = func.call @stack_pop_pointer() : () -> i64
            %922 = func.call @stack_pop_pointer() : () -> i64
            %923 = func.call @cc_cons(%921, %922) : (i64, i64) -> i64
            func.call @stack_push_pointer(%923) : (i64) -> ()
          }
          %924 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%582) : (i64) -> ()
          func.call @stack_push_pointer(%586) : (i64) -> ()
          func.call @stack_push_pointer(%924) : (i64) -> ()
          %925 = llvm.mlir.addressof @str82 : !llvm.ptr
          %926 = func.call @cc_make_function_ref_const(%925) : (!llvm.ptr) -> i64
          %927 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%926, %927) : (i64, i64) -> ()
          %928 = func.call @stack_pop_pointer() : () -> i64
          %929 = func.call @cc_multiple_value_list(%928) : (i64) -> i64
          func.call @stack_push_pointer(%575) : (i64) -> ()
          %930 = func.call @stack_pop_pointer() : () -> i64
          %931 = func.call @cc_nil_value() : () -> i64
          %932 = func.call @cc_errorp(%930) : (i64) -> i64
          %933 = arith.cmpi ne, %932, %931 : i64
          %934 = arith.cmpi eq, %931, %931 : i64
          %935 = arith.andi %933, %934 : i1
          %936 = scf.if %935 -> (i64) {
            scf.yield %930 : i64
          } else {
            scf.yield %931 : i64
          }
          %937 = arith.cmpi ne, %936, %931 : i64
          scf.if %937 {
            func.call @stack_push_pointer(%936) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%930) : (i64) -> ()
            %938 = llvm.mlir.addressof @str83 : !llvm.ptr
            %939 = func.call @cc_make_function_ref_const(%938) : (!llvm.ptr) -> i64
            %940 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%939, %940) : (i64, i64) -> ()
          }
          %941 = func.call @stack_depth() : () -> i64
          %942 = arith.constant 0 : i64
          %943 = arith.cmpi sgt, %941, %942 : i64
          scf.if %943 {
            %944 = func.call @stack_pop_pointer() : () -> i64
          }
          %945 = func.call @cc_values_pack(%929) : (i64) -> i64
          func.call @stack_push_pointer(%945) : (i64) -> ()
          %946 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %946 : i64
        }
        func.call @stack_push_pointer(%580) : (i64) -> ()
        %947 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %947 : i64
      }
      func.call @stack_push_pointer(%467) : (i64) -> ()
      %948 = func.call @stack_pop_pointer() : () -> i64
      %949 = func.call @cc_multiple_value_list(%948) : (i64) -> i64
      func.call @stack_push_pointer(%35) : (i64) -> ()
      %950 = func.call @stack_pop_pointer() : () -> i64
      %951 = func.call @cc_nil_value() : () -> i64
      %952 = func.call @cc_errorp(%950) : (i64) -> i64
      %953 = arith.cmpi ne, %952, %951 : i64
      %954 = arith.cmpi eq, %951, %951 : i64
      %955 = arith.andi %953, %954 : i1
      %956 = scf.if %955 -> (i64) {
        scf.yield %950 : i64
      } else {
        scf.yield %951 : i64
      }
      %957 = arith.cmpi ne, %956, %951 : i64
      scf.if %957 {
        func.call @stack_push_pointer(%956) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%950) : (i64) -> ()
        %958 = llvm.mlir.addressof @str84 : !llvm.ptr
        %959 = func.call @cc_make_function_ref_const(%958) : (!llvm.ptr) -> i64
        %960 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%959, %960) : (i64, i64) -> ()
      }
      %961 = func.call @stack_depth() : () -> i64
      %962 = arith.constant 0 : i64
      %963 = arith.cmpi sgt, %961, %962 : i64
      scf.if %963 {
        %964 = func.call @stack_pop_pointer() : () -> i64
      }
      %965 = func.call @cc_values_pack(%949) : (i64) -> i64
      func.call @stack_push_pointer(%965) : (i64) -> ()
      %966 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %966 : i64
    }
    func.call @stack_push_pointer(%40) : (i64) -> ()
    %967 = func.call @stack_pop_pointer() : () -> i64
    %968 = func.call @cc_multiple_value_list(%967) : (i64) -> i64
    %969 = llvm.mlir.addressof @str85 : !llvm.ptr
    %970 = arith.constant 38 : i64
    %971 = func.call @cc_make_symbol(%969, %970) : (!llvm.ptr, i64) -> i64
    %972 = func.call @cc_symbol_value(%971) : (i64) -> i64
    %973 = llvm.mlir.addressof @str86 : !llvm.ptr
    %974 = arith.constant 39 : i64
    %975 = func.call @cc_make_symbol(%973, %974) : (!llvm.ptr, i64) -> i64
    %976 = func.call @cc_symbol_value(%975) : (i64) -> i64
    %977 = llvm.mlir.addressof @str87 : !llvm.ptr
    %978 = arith.constant 40 : i64
    %979 = func.call @cc_make_symbol(%977, %978) : (!llvm.ptr, i64) -> i64
    %980 = func.call @cc_symbol_value(%979) : (i64) -> i64
    %981 = func.call @cc_nil_value() : () -> i64
    %982 = arith.cmpi ne, %972, %981 : i64
    %983 = scf.if %982 -> (i64) {
      scf.yield %980 : i64
    } else {
      scf.yield %968 : i64
    }
    %984 = func.call @cc_values_pack(%983) : (i64) -> i64
    func.call @stack_push_pointer(%984) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %985 = llvm.mlir.addressof @str88 : !llvm.ptr
    %986 = arith.constant 6 : i64
    %987 = func.call @cc_make_string(%985, %986) : (!llvm.ptr, i64) -> i64
    %988 = func.call @cc_nil_value() : () -> i64
    %989 = func.call @cc_intern(%987, %988) : (i64, i64) -> i64
    %990 = func.call @cc_nil_value() : () -> i64
    %991 = func.call @cc_cons(%989, %990) : (i64, i64) -> i64
    %992 = func.call @cc_values_pack(%991) : (i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%989) : (i64) -> ()
    %993 = func.call @cc_nil_value() : () -> i64
    %994 = func.call @cc_nil_value() : () -> i64
    %995 = func.call @cc_errorp(%993) : (i64) -> i64
    %996 = arith.cmpi ne, %995, %994 : i64
    %997 = scf.if %996 -> (i64) {
      scf.yield %993 : i64
    } else {
      %998 = llvm.mlir.addressof @str89 : !llvm.ptr
      %999 = arith.constant 11 : i64
      %1000 = func.call @cc_make_string(%998, %999) : (!llvm.ptr, i64) -> i64
      %1001 = llvm.mlir.addressof @str90 : !llvm.ptr
      %1002 = arith.constant 7 : i64
      %1003 = func.call @cc_make_string(%1001, %1002) : (!llvm.ptr, i64) -> i64
      %1004 = func.call @cc_intern(%1000, %1003) : (i64, i64) -> i64
      %1005 = func.call @cc_nil_value() : () -> i64
      %1006 = func.call @cc_cons(%1004, %1005) : (i64, i64) -> i64
      %1007 = func.call @cc_values_pack(%1006) : (i64) -> i64
      func.call @stack_push_pointer(%1004) : (i64) -> ()
      %1008 = func.call @stack_pop_pointer() : () -> i64
      %1009 = func.call @cc_in_package(%1008) : (i64) -> i64
      func.call @stack_push_pointer(%1009) : (i64) -> ()
      %1010 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1010 : i64
    }
    %1011 = func.call @cc_nil_value() : () -> i64
    %1012 = func.call @cc_errorp(%997) : (i64) -> i64
    %1013 = arith.cmpi ne, %1012, %1011 : i64
    %1014 = scf.if %1013 -> (i64) {
      scf.yield %997 : i64
    } else {
      %1015 = llvm.mlir.addressof @str91 : !llvm.ptr
      %1016 = func.call @cc_make_function_ref_const(%1015) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1016) : (i64) -> ()
      %1017 = func.call @stack_pop_pointer() : () -> i64
      %1018 = llvm.mlir.addressof @str92 : !llvm.ptr
      %1019 = arith.constant 20 : i64
      %1020 = func.call @cc_make_string(%1018, %1019) : (!llvm.ptr, i64) -> i64
      %1021 = llvm.mlir.addressof @str93 : !llvm.ptr
      %1022 = arith.constant 15 : i64
      %1023 = func.call @cc_make_string(%1021, %1022) : (!llvm.ptr, i64) -> i64
      %1024 = func.call @cc_intern(%1020, %1023) : (i64, i64) -> i64
      %1025 = func.call @cc_nil_value() : () -> i64
      %1026 = func.call @cc_cons(%1024, %1025) : (i64, i64) -> i64
      %1027 = func.call @cc_values_pack(%1026) : (i64) -> i64
      %1028 = func.call @cc_set_symbol_value(%1024, %1017) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1017) : (i64) -> ()
      %1029 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1029 : i64
    }
    %1030 = func.call @cc_nil_value() : () -> i64
    %1031 = func.call @cc_errorp(%1014) : (i64) -> i64
    %1032 = arith.cmpi ne, %1031, %1030 : i64
    %1033 = scf.if %1032 -> (i64) {
      scf.yield %1014 : i64
    } else {
      %1034 = llvm.mlir.addressof @str94 : !llvm.ptr
      %1035 = func.call @cc_make_function_ref_const(%1034) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1035) : (i64) -> ()
      %1036 = func.call @stack_pop_pointer() : () -> i64
      %1037 = llvm.mlir.addressof @str95 : !llvm.ptr
      %1038 = arith.constant 20 : i64
      %1039 = func.call @cc_make_string(%1037, %1038) : (!llvm.ptr, i64) -> i64
      %1040 = llvm.mlir.addressof @str96 : !llvm.ptr
      %1041 = arith.constant 15 : i64
      %1042 = func.call @cc_make_string(%1040, %1041) : (!llvm.ptr, i64) -> i64
      %1043 = func.call @cc_intern(%1039, %1042) : (i64, i64) -> i64
      %1044 = func.call @cc_nil_value() : () -> i64
      %1045 = func.call @cc_cons(%1043, %1044) : (i64, i64) -> i64
      %1046 = func.call @cc_values_pack(%1045) : (i64) -> i64
      %1047 = func.call @cc_set_symbol_value(%1043, %1036) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1036) : (i64) -> ()
      %1048 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1048 : i64
    }
    %1049 = func.call @cc_nil_value() : () -> i64
    %1050 = func.call @cc_errorp(%1033) : (i64) -> i64
    %1051 = arith.cmpi ne, %1050, %1049 : i64
    %1052 = scf.if %1051 -> (i64) {
      scf.yield %1033 : i64
    } else {
      %1053 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1054 = func.call @cc_make_function_ref_const(%1053) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1054) : (i64) -> ()
      %1055 = func.call @stack_pop_pointer() : () -> i64
      %1056 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1057 = arith.constant 20 : i64
      %1058 = func.call @cc_make_string(%1056, %1057) : (!llvm.ptr, i64) -> i64
      %1059 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1060 = arith.constant 15 : i64
      %1061 = func.call @cc_make_string(%1059, %1060) : (!llvm.ptr, i64) -> i64
      %1062 = func.call @cc_intern(%1058, %1061) : (i64, i64) -> i64
      %1063 = func.call @cc_nil_value() : () -> i64
      %1064 = func.call @cc_cons(%1062, %1063) : (i64, i64) -> i64
      %1065 = func.call @cc_values_pack(%1064) : (i64) -> i64
      %1066 = func.call @cc_set_symbol_value(%1062, %1055) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1055) : (i64) -> ()
      %1067 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1067 : i64
    }
    %1068 = func.call @cc_nil_value() : () -> i64
    %1069 = func.call @cc_errorp(%1052) : (i64) -> i64
    %1070 = arith.cmpi ne, %1069, %1068 : i64
    %1071 = scf.if %1070 -> (i64) {
      scf.yield %1052 : i64
    } else {
      %1072 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1073 = func.call @cc_make_function_ref_const(%1072) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1073) : (i64) -> ()
      %1074 = func.call @stack_pop_pointer() : () -> i64
      %1075 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1076 = arith.constant 20 : i64
      %1077 = func.call @cc_make_string(%1075, %1076) : (!llvm.ptr, i64) -> i64
      %1078 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1079 = arith.constant 15 : i64
      %1080 = func.call @cc_make_string(%1078, %1079) : (!llvm.ptr, i64) -> i64
      %1081 = func.call @cc_intern(%1077, %1080) : (i64, i64) -> i64
      %1082 = func.call @cc_nil_value() : () -> i64
      %1083 = func.call @cc_cons(%1081, %1082) : (i64, i64) -> i64
      %1084 = func.call @cc_values_pack(%1083) : (i64) -> i64
      %1085 = func.call @cc_set_symbol_value(%1081, %1074) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1074) : (i64) -> ()
      %1086 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1086 : i64
    }
    %1087 = func.call @cc_nil_value() : () -> i64
    %1088 = func.call @cc_errorp(%1071) : (i64) -> i64
    %1089 = arith.cmpi ne, %1088, %1087 : i64
    %1090 = scf.if %1089 -> (i64) {
      scf.yield %1071 : i64
    } else {
      %1091 = func.call @cc_nil_value() : () -> i64
      %1092 = arith.cmpi ne, %1091, %1091 : i64
      scf.if %1092 {
        func.call @stack_push_pointer(%1091) : (i64) -> ()
      } else {
        %1093 = llvm.mlir.addressof @str103 : !llvm.ptr
        %1094 = func.call @cc_make_function_ref_const(%1093) : (!llvm.ptr) -> i64
        %1095 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1094, %1095) : (i64, i64) -> ()
      }
      %1096 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1096 : i64
    }
    func.call @stack_push_pointer(%1090) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("SHOW-EXTERNAL-FORMAT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_281161544761344*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_281161544761344*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_281161544761344*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("probe-external-format\00") : !llvm.array<22 x i8>
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
  llvm.mlir.global private constant @str20("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str21("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str23("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str24("UTF-8\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str25("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str26("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str27("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str28("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str29("set-crlf=~S~%\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str30("UTF-8\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str31("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("CRLF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("set-stream-external-format\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str35("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str36("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str37("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str38("set-ucs=~S~%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str39("UCS-2BE\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str40("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str41("set-stream-external-format\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str42("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str43("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str44("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str45("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str46("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str48("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str49("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str50("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str51("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str52("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str53("EXTERNAL-FORMAT\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str54("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str55("UTF-8\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str56("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str57("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str58("read-all=~S~%\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str59("STREAM-EXTERNAL-FORMAT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str60("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str61("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str62("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str63("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str64("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str65("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str66("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str67("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str68("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str69("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str70("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str71("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str72("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str73("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str74("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str75("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str78("EOF\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str79("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str80("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str81("STREAM-EXTERNAL-FORMAT\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str82("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str83("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str84("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str85("*__MLIR_BLOCK_RETFLAG_281161544761344*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str86("*__MLIR_BLOCK_RETVALUE_281161544761344*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str87("*__MLIR_BLOCK_RETMVLIST_281161544761344*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str88("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str89("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str90("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str91("%FN%show-external-format\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str92("SHOW-EXTERNAL-FORMAT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str93("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str94("%FN%show-external-format\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str95("SHOW-EXTERNAL-FORMAT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str96("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str97("%FN%show-external-format\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str98("SHOW-EXTERNAL-FORMAT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str99("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str100("%FN%show-external-format\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str101("SHOW-EXTERNAL-FORMAT\00") : !llvm.array<21 x i8>
  llvm.mlir.global private constant @str102("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str103("%FN%show-external-format\00") : !llvm.array<25 x i8>
}
