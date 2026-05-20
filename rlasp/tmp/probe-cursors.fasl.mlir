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
  func.func @"%FN%show-input-cursor"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 17 : i64
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
    %22 = arith.constant 5 : i64
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
      %41 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%41) : (i64) -> ()
      %42 = func.call @stack_pop_pointer() : () -> i64
      %43 = llvm.mlir.addressof @str6 : !llvm.ptr
      %44 = arith.constant 13 : i64
      %45 = func.call @cc_make_string(%43, %44) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%45) : (i64) -> ()
      %46 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%35) : (i64) -> ()
      %47 = func.call @stack_pop_pointer() : () -> i64
      %48 = func.call @cc_nil_value() : () -> i64
      %49 = func.call @cc_errorp(%47) : (i64) -> i64
      %50 = arith.cmpi ne, %49, %48 : i64
      %51 = arith.cmpi eq, %48, %48 : i64
      %52 = arith.andi %50, %51 : i1
      %53 = scf.if %52 -> (i64) {
        scf.yield %47 : i64
      } else {
        scf.yield %48 : i64
      }
      %54 = arith.cmpi ne, %53, %48 : i64
      scf.if %54 {
        func.call @stack_push_pointer(%53) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%47) : (i64) -> ()
        %55 = llvm.mlir.addressof @str7 : !llvm.ptr
        %56 = func.call @cc_make_function_ref_const(%55) : (!llvm.ptr) -> i64
        %57 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%56, %57) : (i64, i64) -> ()
      }
      %58 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%35) : (i64) -> ()
      %59 = func.call @stack_pop_pointer() : () -> i64
      %60 = func.call @cc_nil_value() : () -> i64
      %61 = func.call @cc_errorp(%59) : (i64) -> i64
      %62 = arith.cmpi ne, %61, %60 : i64
      %63 = arith.cmpi eq, %60, %60 : i64
      %64 = arith.andi %62, %63 : i1
      %65 = scf.if %64 -> (i64) {
        scf.yield %59 : i64
      } else {
        scf.yield %60 : i64
      }
      %66 = arith.cmpi ne, %65, %60 : i64
      scf.if %66 {
        func.call @stack_push_pointer(%65) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%59) : (i64) -> ()
        %67 = llvm.mlir.addressof @str8 : !llvm.ptr
        %68 = func.call @cc_make_function_ref_const(%67) : (!llvm.ptr) -> i64
        %69 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%68, %69) : (i64, i64) -> ()
      }
      %70 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%42) : (i64) -> ()
      func.call @stack_push_pointer(%46) : (i64) -> ()
      func.call @stack_push_pointer(%58) : (i64) -> ()
      func.call @stack_push_pointer(%70) : (i64) -> ()
      %71 = llvm.mlir.addressof @str9 : !llvm.ptr
      %72 = func.call @cc_make_function_ref_const(%71) : (!llvm.ptr) -> i64
      %73 = arith.constant 4 : i64
      func.call @cc_funcall_stack(%72, %73) : (i64, i64) -> ()
      %74 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %74 : i64
    }
    %75 = func.call @cc_nil_value() : () -> i64
    %76 = func.call @cc_errorp(%40) : (i64) -> i64
    %77 = arith.cmpi ne, %76, %75 : i64
    %78 = scf.if %77 -> (i64) {
      scf.yield %40 : i64
    } else {
      %79 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%79) : (i64) -> ()
      %80 = func.call @stack_pop_pointer() : () -> i64
      %81 = llvm.mlir.addressof @str10 : !llvm.ptr
      %82 = arith.constant 17 : i64
      %83 = func.call @cc_make_string(%81, %82) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%83) : (i64) -> ()
      %84 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%35) : (i64) -> ()
      %85 = func.call @stack_pop_pointer() : () -> i64
      %86 = func.call @cc_nil_value() : () -> i64
      %87 = func.call @cc_errorp(%85) : (i64) -> i64
      %88 = arith.cmpi ne, %87, %86 : i64
      %89 = arith.cmpi eq, %86, %86 : i64
      %90 = arith.andi %88, %89 : i1
      %91 = scf.if %90 -> (i64) {
        scf.yield %85 : i64
      } else {
        scf.yield %86 : i64
      }
      %92 = arith.cmpi ne, %91, %86 : i64
      scf.if %92 {
        func.call @stack_push_pointer(%91) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%85) : (i64) -> ()
        %93 = llvm.mlir.addressof @str11 : !llvm.ptr
        %94 = func.call @cc_make_function_ref_const(%93) : (!llvm.ptr) -> i64
        %95 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%94, %95) : (i64, i64) -> ()
      }
      %96 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%35) : (i64) -> ()
      %97 = func.call @stack_pop_pointer() : () -> i64
      %98 = func.call @cc_nil_value() : () -> i64
      %99 = func.call @cc_errorp(%97) : (i64) -> i64
      %100 = arith.cmpi ne, %99, %98 : i64
      %101 = arith.cmpi eq, %98, %98 : i64
      %102 = arith.andi %100, %101 : i1
      %103 = scf.if %102 -> (i64) {
        scf.yield %97 : i64
      } else {
        scf.yield %98 : i64
      }
      %104 = arith.cmpi ne, %103, %98 : i64
      scf.if %104 {
        func.call @stack_push_pointer(%103) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%97) : (i64) -> ()
        %105 = llvm.mlir.addressof @str12 : !llvm.ptr
        %106 = func.call @cc_make_function_ref_const(%105) : (!llvm.ptr) -> i64
        %107 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%106, %107) : (i64, i64) -> ()
      }
      %108 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%35) : (i64) -> ()
      %109 = func.call @stack_pop_pointer() : () -> i64
      %110 = func.call @cc_nil_value() : () -> i64
      %111 = func.call @cc_errorp(%109) : (i64) -> i64
      %112 = arith.cmpi ne, %111, %110 : i64
      %113 = arith.cmpi eq, %110, %110 : i64
      %114 = arith.andi %112, %113 : i1
      %115 = scf.if %114 -> (i64) {
        scf.yield %109 : i64
      } else {
        scf.yield %110 : i64
      }
      %116 = arith.cmpi ne, %115, %110 : i64
      scf.if %116 {
        func.call @stack_push_pointer(%115) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%109) : (i64) -> ()
        %117 = llvm.mlir.addressof @str13 : !llvm.ptr
        %118 = func.call @cc_make_function_ref_const(%117) : (!llvm.ptr) -> i64
        %119 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%118, %119) : (i64, i64) -> ()
      }
      %120 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%80) : (i64) -> ()
      func.call @stack_push_pointer(%84) : (i64) -> ()
      func.call @stack_push_pointer(%96) : (i64) -> ()
      func.call @stack_push_pointer(%108) : (i64) -> ()
      func.call @stack_push_pointer(%120) : (i64) -> ()
      %121 = llvm.mlir.addressof @str14 : !llvm.ptr
      %122 = func.call @cc_make_function_ref_const(%121) : (!llvm.ptr) -> i64
      %123 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%122, %123) : (i64, i64) -> ()
      %124 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %124 : i64
    }
    %125 = func.call @cc_nil_value() : () -> i64
    %126 = func.call @cc_errorp(%78) : (i64) -> i64
    %127 = arith.cmpi ne, %126, %125 : i64
    %128 = scf.if %127 -> (i64) {
      scf.yield %78 : i64
    } else {
      %129 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%129) : (i64) -> ()
      %130 = func.call @stack_pop_pointer() : () -> i64
      %131 = llvm.mlir.addressof @str15 : !llvm.ptr
      %132 = arith.constant 16 : i64
      %133 = func.call @cc_make_string(%131, %132) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%133) : (i64) -> ()
      %134 = func.call @stack_pop_pointer() : () -> i64
      %135 = arith.constant 97 : i64
      %136 = func.call @cc_box_character(%135) : (i64) -> i64
      func.call @stack_push_pointer(%136) : (i64) -> ()
      %137 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%35) : (i64) -> ()
      %138 = func.call @stack_pop_pointer() : () -> i64
      %139 = func.call @cc_nil_value() : () -> i64
      %140 = func.call @cc_errorp(%137) : (i64) -> i64
      %141 = arith.cmpi ne, %140, %139 : i64
      %142 = arith.cmpi eq, %139, %139 : i64
      %143 = arith.andi %141, %142 : i1
      %144 = scf.if %143 -> (i64) {
        scf.yield %137 : i64
      } else {
        scf.yield %139 : i64
      }
      %145 = func.call @cc_errorp(%138) : (i64) -> i64
      %146 = arith.cmpi ne, %145, %139 : i64
      %147 = arith.cmpi eq, %144, %139 : i64
      %148 = arith.andi %146, %147 : i1
      %149 = scf.if %148 -> (i64) {
        scf.yield %138 : i64
      } else {
        scf.yield %144 : i64
      }
      %150 = arith.cmpi ne, %149, %139 : i64
      scf.if %150 {
        func.call @stack_push_pointer(%149) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%137) : (i64) -> ()
        func.call @stack_push_pointer(%138) : (i64) -> ()
        %151 = llvm.mlir.addressof @str16 : !llvm.ptr
        %152 = func.call @cc_make_function_ref_const(%151) : (!llvm.ptr) -> i64
        %153 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%152, %153) : (i64, i64) -> ()
      }
      %154 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%35) : (i64) -> ()
      %155 = func.call @stack_pop_pointer() : () -> i64
      %156 = func.call @cc_nil_value() : () -> i64
      %157 = func.call @cc_errorp(%155) : (i64) -> i64
      %158 = arith.cmpi ne, %157, %156 : i64
      %159 = arith.cmpi eq, %156, %156 : i64
      %160 = arith.andi %158, %159 : i1
      %161 = scf.if %160 -> (i64) {
        scf.yield %155 : i64
      } else {
        scf.yield %156 : i64
      }
      %162 = arith.cmpi ne, %161, %156 : i64
      scf.if %162 {
        func.call @stack_push_pointer(%161) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%155) : (i64) -> ()
        %163 = llvm.mlir.addressof @str17 : !llvm.ptr
        %164 = func.call @cc_make_function_ref_const(%163) : (!llvm.ptr) -> i64
        %165 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%164, %165) : (i64, i64) -> ()
      }
      %166 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%35) : (i64) -> ()
      %167 = func.call @stack_pop_pointer() : () -> i64
      %168 = func.call @cc_nil_value() : () -> i64
      %169 = func.call @cc_errorp(%167) : (i64) -> i64
      %170 = arith.cmpi ne, %169, %168 : i64
      %171 = arith.cmpi eq, %168, %168 : i64
      %172 = arith.andi %170, %171 : i1
      %173 = scf.if %172 -> (i64) {
        scf.yield %167 : i64
      } else {
        scf.yield %168 : i64
      }
      %174 = arith.cmpi ne, %173, %168 : i64
      scf.if %174 {
        func.call @stack_push_pointer(%173) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%167) : (i64) -> ()
        %175 = llvm.mlir.addressof @str18 : !llvm.ptr
        %176 = func.call @cc_make_function_ref_const(%175) : (!llvm.ptr) -> i64
        %177 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%176, %177) : (i64, i64) -> ()
      }
      %178 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%130) : (i64) -> ()
      func.call @stack_push_pointer(%134) : (i64) -> ()
      func.call @stack_push_pointer(%154) : (i64) -> ()
      func.call @stack_push_pointer(%166) : (i64) -> ()
      func.call @stack_push_pointer(%178) : (i64) -> ()
      %179 = llvm.mlir.addressof @str19 : !llvm.ptr
      %180 = func.call @cc_make_function_ref_const(%179) : (!llvm.ptr) -> i64
      %181 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%180, %181) : (i64, i64) -> ()
      %182 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %182 : i64
    }
    func.call @stack_push_pointer(%128) : (i64) -> ()
    %183 = func.call @stack_pop_pointer() : () -> i64
    %184 = func.call @cc_multiple_value_list(%183) : (i64) -> i64
    %185 = llvm.mlir.addressof @str20 : !llvm.ptr
    %186 = arith.constant 38 : i64
    %187 = func.call @cc_make_symbol(%185, %186) : (!llvm.ptr, i64) -> i64
    %188 = func.call @cc_symbol_value(%187) : (i64) -> i64
    %189 = llvm.mlir.addressof @str21 : !llvm.ptr
    %190 = arith.constant 39 : i64
    %191 = func.call @cc_make_symbol(%189, %190) : (!llvm.ptr, i64) -> i64
    %192 = func.call @cc_symbol_value(%191) : (i64) -> i64
    %193 = llvm.mlir.addressof @str22 : !llvm.ptr
    %194 = arith.constant 40 : i64
    %195 = func.call @cc_make_symbol(%193, %194) : (!llvm.ptr, i64) -> i64
    %196 = func.call @cc_symbol_value(%195) : (i64) -> i64
    %197 = func.call @cc_nil_value() : () -> i64
    %198 = arith.cmpi ne, %188, %197 : i64
    %199 = scf.if %198 -> (i64) {
      scf.yield %196 : i64
    } else {
      scf.yield %184 : i64
    }
    %200 = func.call @cc_values_pack(%199) : (i64) -> i64
    func.call @stack_push_pointer(%200) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%show-input-cursor-suite"() {
    %201 = llvm.mlir.addressof @str23 : !llvm.ptr
    %202 = arith.constant 23 : i64
    %203 = func.call @cc_make_string(%201, %202) : (!llvm.ptr, i64) -> i64
    %204 = func.call @cc_nil_value() : () -> i64
    %205 = func.call @cc_intern(%203, %204) : (i64, i64) -> i64
    %206 = func.call @cc_nil_value() : () -> i64
    %207 = func.call @cc_cons(%205, %206) : (i64, i64) -> i64
    %208 = func.call @cc_values_pack(%207) : (i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%205) : (i64) -> ()
    %209 = func.call @cc_nil_value() : () -> i64
    %210 = llvm.mlir.addressof @str24 : !llvm.ptr
    %211 = arith.constant 38 : i64
    %212 = func.call @cc_make_symbol(%210, %211) : (!llvm.ptr, i64) -> i64
    %213 = func.call @cc_set_symbol_value(%212, %209) : (i64, i64) -> i64
    %214 = llvm.mlir.addressof @str25 : !llvm.ptr
    %215 = arith.constant 39 : i64
    %216 = func.call @cc_make_symbol(%214, %215) : (!llvm.ptr, i64) -> i64
    %217 = func.call @cc_set_symbol_value(%216, %209) : (i64, i64) -> i64
    %218 = llvm.mlir.addressof @str26 : !llvm.ptr
    %219 = arith.constant 40 : i64
    %220 = func.call @cc_make_symbol(%218, %219) : (!llvm.ptr, i64) -> i64
    %221 = func.call @cc_set_symbol_value(%220, %209) : (i64, i64) -> i64
    %222 = llvm.mlir.addressof @str27 : !llvm.ptr
    %223 = arith.constant 5 : i64
    %224 = func.call @cc_make_string(%222, %223) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%224) : (i64) -> ()
    %225 = func.call @stack_pop_pointer() : () -> i64
    %226 = func.call @cc_nil_value() : () -> i64
    %227 = func.call @cc_errorp(%225) : (i64) -> i64
    %228 = arith.cmpi ne, %227, %226 : i64
    %229 = arith.cmpi eq, %226, %226 : i64
    %230 = arith.andi %228, %229 : i1
    %231 = scf.if %230 -> (i64) {
      scf.yield %225 : i64
    } else {
      scf.yield %226 : i64
    }
    %232 = arith.cmpi ne, %231, %226 : i64
    scf.if %232 {
      func.call @stack_push_pointer(%231) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%225) : (i64) -> ()
      %233 = llvm.mlir.addressof @str28 : !llvm.ptr
      %234 = func.call @cc_make_function_ref_const(%233) : (!llvm.ptr) -> i64
      %235 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%234, %235) : (i64, i64) -> ()
    }
    %236 = func.call @stack_pop_pointer() : () -> i64
    %237 = func.call @cc_nil_value() : () -> i64
    %238 = func.call @cc_nil_value() : () -> i64
    %239 = func.call @cc_errorp(%237) : (i64) -> i64
    %240 = arith.cmpi ne, %239, %238 : i64
    %241 = scf.if %240 -> (i64) {
      scf.yield %237 : i64
    } else {
      %336 = llvm.mlir.addressof @str35 : !llvm.ptr
      %337 = arith.constant 35 : i64
      %338 = func.call @cc_make_symbol(%336, %337) : (!llvm.ptr, i64) -> i64
      %339 = func.call @cc_persistent_root_value(%338) : (i64) -> i64
      %340 = func.call @cc_set_symbol_value(%339, %236) : (i64, i64) -> i64
      func.call @stack_push_pointer(%339) : (i64) -> ()
      %341 = arith.constant 193685610299395 : i64
      %342 = arith.constant 1 : i64
      %343 = func.call @cc_make_closure(%341, %342) : (i64, i64) -> i64
      %344 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%344) : (i64) -> ()
      %345 = func.call @stack_pop_pointer() : () -> i64
      %346 = llvm.mlir.addressof @str36 : !llvm.ptr
      %347 = arith.constant 16 : i64
      %348 = func.call @cc_make_string(%346, %347) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%348) : (i64) -> ()
      %349 = func.call @stack_pop_pointer() : () -> i64
      %350 = func.call @cc_symbol_value(%339) : (i64) -> i64
      func.call @stack_push_pointer(%350) : (i64) -> ()
      %351 = func.call @stack_pop_pointer() : () -> i64
      %352 = func.call @cc_nil_value() : () -> i64
      %353 = func.call @cc_errorp(%351) : (i64) -> i64
      %354 = arith.cmpi ne, %353, %352 : i64
      %355 = arith.cmpi eq, %352, %352 : i64
      %356 = arith.andi %354, %355 : i1
      %357 = scf.if %356 -> (i64) {
        scf.yield %351 : i64
      } else {
        scf.yield %352 : i64
      }
      %358 = arith.cmpi ne, %357, %352 : i64
      scf.if %358 {
        func.call @stack_push_pointer(%357) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%351) : (i64) -> ()
        %359 = llvm.mlir.addressof @str37 : !llvm.ptr
        %360 = func.call @cc_make_function_ref_const(%359) : (!llvm.ptr) -> i64
        %361 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%360, %361) : (i64, i64) -> ()
      }
      %362 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%343, %362) : (i64, i64) -> ()
      %363 = func.call @stack_pop_pointer() : () -> i64
      %364 = arith.constant 97 : i64
      %365 = func.call @cc_box_character(%364) : (i64) -> i64
      func.call @stack_push_pointer(%365) : (i64) -> ()
      %366 = func.call @stack_pop_pointer() : () -> i64
      %367 = func.call @cc_symbol_value(%339) : (i64) -> i64
      func.call @stack_push_pointer(%367) : (i64) -> ()
      %368 = func.call @stack_pop_pointer() : () -> i64
      %369 = func.call @cc_nil_value() : () -> i64
      %370 = func.call @cc_errorp(%366) : (i64) -> i64
      %371 = arith.cmpi ne, %370, %369 : i64
      %372 = arith.cmpi eq, %369, %369 : i64
      %373 = arith.andi %371, %372 : i1
      %374 = scf.if %373 -> (i64) {
        scf.yield %366 : i64
      } else {
        scf.yield %369 : i64
      }
      %375 = func.call @cc_errorp(%368) : (i64) -> i64
      %376 = arith.cmpi ne, %375, %369 : i64
      %377 = arith.cmpi eq, %374, %369 : i64
      %378 = arith.andi %376, %377 : i1
      %379 = scf.if %378 -> (i64) {
        scf.yield %368 : i64
      } else {
        scf.yield %374 : i64
      }
      %380 = arith.cmpi ne, %379, %369 : i64
      scf.if %380 {
        func.call @stack_push_pointer(%379) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%366) : (i64) -> ()
        func.call @stack_push_pointer(%368) : (i64) -> ()
        %381 = llvm.mlir.addressof @str38 : !llvm.ptr
        %382 = func.call @cc_make_function_ref_const(%381) : (!llvm.ptr) -> i64
        %383 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%382, %383) : (i64, i64) -> ()
      }
      %384 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%343, %384) : (i64, i64) -> ()
      %385 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %386 = func.call @stack_pop_pointer() : () -> i64
      %387 = func.call @cc_symbol_value(%339) : (i64) -> i64
      func.call @stack_push_pointer(%387) : (i64) -> ()
      %388 = func.call @stack_pop_pointer() : () -> i64
      %389 = func.call @cc_nil_value() : () -> i64
      %390 = func.call @cc_errorp(%386) : (i64) -> i64
      %391 = arith.cmpi ne, %390, %389 : i64
      %392 = arith.cmpi eq, %389, %389 : i64
      %393 = arith.andi %391, %392 : i1
      %394 = scf.if %393 -> (i64) {
        scf.yield %386 : i64
      } else {
        scf.yield %389 : i64
      }
      %395 = func.call @cc_errorp(%388) : (i64) -> i64
      %396 = arith.cmpi ne, %395, %389 : i64
      %397 = arith.cmpi eq, %394, %389 : i64
      %398 = arith.andi %396, %397 : i1
      %399 = scf.if %398 -> (i64) {
        scf.yield %388 : i64
      } else {
        scf.yield %394 : i64
      }
      %400 = arith.cmpi ne, %399, %389 : i64
      scf.if %400 {
        func.call @stack_push_pointer(%399) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%386) : (i64) -> ()
        func.call @stack_push_pointer(%388) : (i64) -> ()
        %401 = llvm.mlir.addressof @str39 : !llvm.ptr
        %402 = func.call @cc_make_function_ref_const(%401) : (!llvm.ptr) -> i64
        %403 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%402, %403) : (i64, i64) -> ()
      }
      %404 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%343, %404) : (i64, i64) -> ()
      %405 = func.call @stack_pop_pointer() : () -> i64
      %406 = func.call @cc_symbol_value(%339) : (i64) -> i64
      func.call @stack_push_pointer(%406) : (i64) -> ()
      %407 = func.call @stack_pop_pointer() : () -> i64
      %408 = func.call @cc_nil_value() : () -> i64
      %409 = func.call @cc_errorp(%407) : (i64) -> i64
      %410 = arith.cmpi ne, %409, %408 : i64
      %411 = arith.cmpi eq, %408, %408 : i64
      %412 = arith.andi %410, %411 : i1
      %413 = scf.if %412 -> (i64) {
        scf.yield %407 : i64
      } else {
        scf.yield %408 : i64
      }
      %414 = arith.cmpi ne, %413, %408 : i64
      scf.if %414 {
        func.call @stack_push_pointer(%413) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%407) : (i64) -> ()
        %415 = llvm.mlir.addressof @str40 : !llvm.ptr
        %416 = func.call @cc_make_function_ref_const(%415) : (!llvm.ptr) -> i64
        %417 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%416, %417) : (i64, i64) -> ()
      }
      %418 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%343, %418) : (i64, i64) -> ()
      %419 = func.call @stack_pop_pointer() : () -> i64
      %420 = func.call @cc_symbol_value(%339) : (i64) -> i64
      func.call @stack_push_pointer(%420) : (i64) -> ()
      %421 = func.call @stack_pop_pointer() : () -> i64
      %422 = func.call @cc_nil_value() : () -> i64
      %423 = func.call @cc_errorp(%421) : (i64) -> i64
      %424 = arith.cmpi ne, %423, %422 : i64
      %425 = arith.cmpi eq, %422, %422 : i64
      %426 = arith.andi %424, %425 : i1
      %427 = scf.if %426 -> (i64) {
        scf.yield %421 : i64
      } else {
        scf.yield %422 : i64
      }
      %428 = arith.cmpi ne, %427, %422 : i64
      scf.if %428 {
        func.call @stack_push_pointer(%427) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%421) : (i64) -> ()
        %429 = llvm.mlir.addressof @str41 : !llvm.ptr
        %430 = func.call @cc_make_function_ref_const(%429) : (!llvm.ptr) -> i64
        %431 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%430, %431) : (i64, i64) -> ()
      }
      %432 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%343, %432) : (i64, i64) -> ()
      %433 = func.call @stack_pop_pointer() : () -> i64
      %434 = func.call @cc_symbol_value(%339) : (i64) -> i64
      func.call @stack_push_pointer(%434) : (i64) -> ()
      %435 = func.call @stack_pop_pointer() : () -> i64
      %436 = func.call @cc_nil_value() : () -> i64
      %437 = func.call @cc_errorp(%435) : (i64) -> i64
      %438 = arith.cmpi ne, %437, %436 : i64
      %439 = arith.cmpi eq, %436, %436 : i64
      %440 = arith.andi %438, %439 : i1
      %441 = scf.if %440 -> (i64) {
        scf.yield %435 : i64
      } else {
        scf.yield %436 : i64
      }
      %442 = arith.cmpi ne, %441, %436 : i64
      scf.if %442 {
        func.call @stack_push_pointer(%441) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%435) : (i64) -> ()
        %443 = llvm.mlir.addressof @str42 : !llvm.ptr
        %444 = func.call @cc_make_function_ref_const(%443) : (!llvm.ptr) -> i64
        %445 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%444, %445) : (i64, i64) -> ()
      }
      %446 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%343, %446) : (i64, i64) -> ()
      %447 = func.call @stack_pop_pointer() : () -> i64
      %448 = func.call @cc_symbol_value(%339) : (i64) -> i64
      func.call @stack_push_pointer(%448) : (i64) -> ()
      %449 = func.call @stack_pop_pointer() : () -> i64
      %450 = func.call @cc_nil_value() : () -> i64
      %451 = func.call @cc_errorp(%449) : (i64) -> i64
      %452 = arith.cmpi ne, %451, %450 : i64
      %453 = arith.cmpi eq, %450, %450 : i64
      %454 = arith.andi %452, %453 : i1
      %455 = scf.if %454 -> (i64) {
        scf.yield %449 : i64
      } else {
        scf.yield %450 : i64
      }
      %456 = arith.cmpi ne, %455, %450 : i64
      scf.if %456 {
        func.call @stack_push_pointer(%455) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%449) : (i64) -> ()
        %457 = llvm.mlir.addressof @str43 : !llvm.ptr
        %458 = func.call @cc_make_function_ref_const(%457) : (!llvm.ptr) -> i64
        %459 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%458, %459) : (i64, i64) -> ()
      }
      %460 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%343, %460) : (i64, i64) -> ()
      %461 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %462 = func.call @stack_pop_pointer() : () -> i64
      %463 = func.call @cc_cons(%461, %462) : (i64, i64) -> i64
      func.call @stack_push_pointer(%463) : (i64) -> ()
      %464 = func.call @stack_pop_pointer() : () -> i64
      %465 = func.call @cc_cons(%447, %464) : (i64, i64) -> i64
      func.call @stack_push_pointer(%465) : (i64) -> ()
      %466 = func.call @stack_pop_pointer() : () -> i64
      %467 = func.call @cc_cons(%433, %466) : (i64, i64) -> i64
      func.call @stack_push_pointer(%467) : (i64) -> ()
      %468 = func.call @stack_pop_pointer() : () -> i64
      %469 = func.call @cc_cons(%419, %468) : (i64, i64) -> i64
      func.call @stack_push_pointer(%469) : (i64) -> ()
      %470 = func.call @stack_pop_pointer() : () -> i64
      %471 = func.call @cc_cons(%405, %470) : (i64, i64) -> i64
      func.call @stack_push_pointer(%471) : (i64) -> ()
      %472 = func.call @stack_pop_pointer() : () -> i64
      %473 = func.call @cc_cons(%385, %472) : (i64, i64) -> i64
      func.call @stack_push_pointer(%473) : (i64) -> ()
      %474 = func.call @stack_pop_pointer() : () -> i64
      %475 = func.call @cc_cons(%363, %474) : (i64, i64) -> i64
      func.call @stack_push_pointer(%475) : (i64) -> ()
      %476 = func.call @stack_pop_pointer() : () -> i64
      %477 = func.call @cc_values_pack(%476) : (i64) -> i64
      func.call @stack_push_pointer(%477) : (i64) -> ()
      %478 = func.call @stack_pop_pointer() : () -> i64
      %479 = func.call @cc_errorp(%478) : (i64) -> i64
      %480 = func.call @cc_nil_value() : () -> i64
      %481 = arith.cmpi ne, %479, %480 : i64
      scf.if %481 {
        func.call @stack_push_pointer(%478) : (i64) -> ()
      } else {
        %482 = func.call @cc_multiple_value_list(%478) : (i64) -> i64
        func.call @stack_push_pointer(%482) : (i64) -> ()
      }
      %483 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%345) : (i64) -> ()
      func.call @stack_push_pointer(%349) : (i64) -> ()
      func.call @stack_push_pointer(%483) : (i64) -> ()
      %484 = llvm.mlir.addressof @str44 : !llvm.ptr
      %485 = func.call @cc_make_function_ref_const(%484) : (!llvm.ptr) -> i64
      %486 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%485, %486) : (i64, i64) -> ()
      %487 = func.call @stack_pop_pointer() : () -> i64
      %488 = func.call @cc_multiple_value_list(%487) : (i64) -> i64
      %489 = func.call @cc_symbol_value(%339) : (i64) -> i64
      %490 = func.call @cc_values_pack(%488) : (i64) -> i64
      func.call @stack_push_pointer(%490) : (i64) -> ()
      %491 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %491 : i64
    }
    func.call @stack_push_pointer(%241) : (i64) -> ()
    %492 = func.call @stack_pop_pointer() : () -> i64
    %493 = func.call @cc_multiple_value_list(%492) : (i64) -> i64
    %494 = llvm.mlir.addressof @str45 : !llvm.ptr
    %495 = arith.constant 38 : i64
    %496 = func.call @cc_make_symbol(%494, %495) : (!llvm.ptr, i64) -> i64
    %497 = func.call @cc_symbol_value(%496) : (i64) -> i64
    %498 = llvm.mlir.addressof @str46 : !llvm.ptr
    %499 = arith.constant 39 : i64
    %500 = func.call @cc_make_symbol(%498, %499) : (!llvm.ptr, i64) -> i64
    %501 = func.call @cc_symbol_value(%500) : (i64) -> i64
    %502 = llvm.mlir.addressof @str47 : !llvm.ptr
    %503 = arith.constant 40 : i64
    %504 = func.call @cc_make_symbol(%502, %503) : (!llvm.ptr, i64) -> i64
    %505 = func.call @cc_symbol_value(%504) : (i64) -> i64
    %506 = func.call @cc_nil_value() : () -> i64
    %507 = arith.cmpi ne, %497, %506 : i64
    %508 = scf.if %507 -> (i64) {
      scf.yield %505 : i64
    } else {
      scf.yield %493 : i64
    }
    %509 = func.call @cc_values_pack(%508) : (i64) -> i64
    func.call @stack_push_pointer(%509) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"%FN%show-output-cursor-suite"() {
    %510 = llvm.mlir.addressof @str48 : !llvm.ptr
    %511 = arith.constant 24 : i64
    %512 = func.call @cc_make_string(%510, %511) : (!llvm.ptr, i64) -> i64
    %513 = func.call @cc_nil_value() : () -> i64
    %514 = func.call @cc_intern(%512, %513) : (i64, i64) -> i64
    %515 = func.call @cc_nil_value() : () -> i64
    %516 = func.call @cc_cons(%514, %515) : (i64, i64) -> i64
    %517 = func.call @cc_values_pack(%516) : (i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%514) : (i64) -> ()
    %518 = func.call @cc_nil_value() : () -> i64
    %519 = llvm.mlir.addressof @str49 : !llvm.ptr
    %520 = arith.constant 38 : i64
    %521 = func.call @cc_make_symbol(%519, %520) : (!llvm.ptr, i64) -> i64
    %522 = func.call @cc_set_symbol_value(%521, %518) : (i64, i64) -> i64
    %523 = llvm.mlir.addressof @str50 : !llvm.ptr
    %524 = arith.constant 39 : i64
    %525 = func.call @cc_make_symbol(%523, %524) : (!llvm.ptr, i64) -> i64
    %526 = func.call @cc_set_symbol_value(%525, %518) : (i64, i64) -> i64
    %527 = llvm.mlir.addressof @str51 : !llvm.ptr
    %528 = arith.constant 40 : i64
    %529 = func.call @cc_make_symbol(%527, %528) : (!llvm.ptr, i64) -> i64
    %530 = func.call @cc_set_symbol_value(%529, %518) : (i64, i64) -> i64
    %531 = func.call @cc_nil_value() : () -> i64
    %532 = arith.cmpi ne, %531, %531 : i64
    scf.if %532 {
      func.call @stack_push_pointer(%531) : (i64) -> ()
    } else {
      %533 = llvm.mlir.addressof @str52 : !llvm.ptr
      %534 = func.call @cc_make_function_ref_const(%533) : (!llvm.ptr) -> i64
      %535 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%534, %535) : (i64, i64) -> ()
    }
    %536 = func.call @stack_pop_pointer() : () -> i64
    %537 = func.call @cc_nil_value() : () -> i64
    %538 = func.call @cc_nil_value() : () -> i64
    %539 = func.call @cc_errorp(%537) : (i64) -> i64
    %540 = arith.cmpi ne, %539, %538 : i64
    %541 = scf.if %540 -> (i64) {
      scf.yield %537 : i64
    } else {
      %636 = llvm.mlir.addressof @str59 : !llvm.ptr
      %637 = arith.constant 35 : i64
      %638 = func.call @cc_make_symbol(%636, %637) : (!llvm.ptr, i64) -> i64
      %639 = func.call @cc_persistent_root_value(%638) : (i64) -> i64
      %640 = func.call @cc_set_symbol_value(%639, %536) : (i64, i64) -> i64
      func.call @stack_push_pointer(%639) : (i64) -> ()
      %641 = arith.constant 193685610299399 : i64
      %642 = arith.constant 1 : i64
      %643 = func.call @cc_make_closure(%641, %642) : (i64, i64) -> i64
      %644 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%644) : (i64) -> ()
      %645 = func.call @stack_pop_pointer() : () -> i64
      %646 = llvm.mlir.addressof @str60 : !llvm.ptr
      %647 = arith.constant 17 : i64
      %648 = func.call @cc_make_string(%646, %647) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%648) : (i64) -> ()
      %649 = func.call @stack_pop_pointer() : () -> i64
      %650 = arith.constant 97 : i64
      %651 = func.call @cc_box_character(%650) : (i64) -> i64
      func.call @stack_push_pointer(%651) : (i64) -> ()
      %652 = func.call @stack_pop_pointer() : () -> i64
      %653 = func.call @cc_symbol_value(%639) : (i64) -> i64
      func.call @stack_push_pointer(%653) : (i64) -> ()
      %654 = func.call @stack_pop_pointer() : () -> i64
      %655 = func.call @cc_nil_value() : () -> i64
      %656 = func.call @cc_errorp(%652) : (i64) -> i64
      %657 = arith.cmpi ne, %656, %655 : i64
      %658 = arith.cmpi eq, %655, %655 : i64
      %659 = arith.andi %657, %658 : i1
      %660 = scf.if %659 -> (i64) {
        scf.yield %652 : i64
      } else {
        scf.yield %655 : i64
      }
      %661 = func.call @cc_errorp(%654) : (i64) -> i64
      %662 = arith.cmpi ne, %661, %655 : i64
      %663 = arith.cmpi eq, %660, %655 : i64
      %664 = arith.andi %662, %663 : i1
      %665 = scf.if %664 -> (i64) {
        scf.yield %654 : i64
      } else {
        scf.yield %660 : i64
      }
      %666 = arith.cmpi ne, %665, %655 : i64
      scf.if %666 {
        func.call @stack_push_pointer(%665) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%652) : (i64) -> ()
        func.call @stack_push_pointer(%654) : (i64) -> ()
        %667 = llvm.mlir.addressof @str61 : !llvm.ptr
        %668 = func.call @cc_make_function_ref_const(%667) : (!llvm.ptr) -> i64
        %669 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%668, %669) : (i64, i64) -> ()
      }
      %670 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%643, %670) : (i64, i64) -> ()
      %671 = func.call @stack_pop_pointer() : () -> i64
      %672 = arith.constant 98 : i64
      %673 = func.call @cc_box_character(%672) : (i64) -> i64
      func.call @stack_push_pointer(%673) : (i64) -> ()
      %674 = func.call @stack_pop_pointer() : () -> i64
      %675 = func.call @cc_symbol_value(%639) : (i64) -> i64
      func.call @stack_push_pointer(%675) : (i64) -> ()
      %676 = func.call @stack_pop_pointer() : () -> i64
      %677 = func.call @cc_nil_value() : () -> i64
      %678 = func.call @cc_errorp(%674) : (i64) -> i64
      %679 = arith.cmpi ne, %678, %677 : i64
      %680 = arith.cmpi eq, %677, %677 : i64
      %681 = arith.andi %679, %680 : i1
      %682 = scf.if %681 -> (i64) {
        scf.yield %674 : i64
      } else {
        scf.yield %677 : i64
      }
      %683 = func.call @cc_errorp(%676) : (i64) -> i64
      %684 = arith.cmpi ne, %683, %677 : i64
      %685 = arith.cmpi eq, %682, %677 : i64
      %686 = arith.andi %684, %685 : i1
      %687 = scf.if %686 -> (i64) {
        scf.yield %676 : i64
      } else {
        scf.yield %682 : i64
      }
      %688 = arith.cmpi ne, %687, %677 : i64
      scf.if %688 {
        func.call @stack_push_pointer(%687) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%674) : (i64) -> ()
        func.call @stack_push_pointer(%676) : (i64) -> ()
        %689 = llvm.mlir.addressof @str62 : !llvm.ptr
        %690 = func.call @cc_make_function_ref_const(%689) : (!llvm.ptr) -> i64
        %691 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%690, %691) : (i64, i64) -> ()
      }
      %692 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%643, %692) : (i64, i64) -> ()
      %693 = func.call @stack_pop_pointer() : () -> i64
      %694 = arith.constant 10 : i64
      %695 = func.call @cc_box_character(%694) : (i64) -> i64
      func.call @stack_push_pointer(%695) : (i64) -> ()
      %696 = func.call @stack_pop_pointer() : () -> i64
      %697 = func.call @cc_symbol_value(%639) : (i64) -> i64
      func.call @stack_push_pointer(%697) : (i64) -> ()
      %698 = func.call @stack_pop_pointer() : () -> i64
      %699 = func.call @cc_nil_value() : () -> i64
      %700 = func.call @cc_errorp(%696) : (i64) -> i64
      %701 = arith.cmpi ne, %700, %699 : i64
      %702 = arith.cmpi eq, %699, %699 : i64
      %703 = arith.andi %701, %702 : i1
      %704 = scf.if %703 -> (i64) {
        scf.yield %696 : i64
      } else {
        scf.yield %699 : i64
      }
      %705 = func.call @cc_errorp(%698) : (i64) -> i64
      %706 = arith.cmpi ne, %705, %699 : i64
      %707 = arith.cmpi eq, %704, %699 : i64
      %708 = arith.andi %706, %707 : i1
      %709 = scf.if %708 -> (i64) {
        scf.yield %698 : i64
      } else {
        scf.yield %704 : i64
      }
      %710 = arith.cmpi ne, %709, %699 : i64
      scf.if %710 {
        func.call @stack_push_pointer(%709) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%696) : (i64) -> ()
        func.call @stack_push_pointer(%698) : (i64) -> ()
        %711 = llvm.mlir.addressof @str63 : !llvm.ptr
        %712 = func.call @cc_make_function_ref_const(%711) : (!llvm.ptr) -> i64
        %713 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%712, %713) : (i64, i64) -> ()
      }
      %714 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%643, %714) : (i64, i64) -> ()
      %715 = func.call @stack_pop_pointer() : () -> i64
      %716 = llvm.mlir.addressof @str64 : !llvm.ptr
      %717 = arith.constant 2 : i64
      %718 = func.call @cc_make_string(%716, %717) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%718) : (i64) -> ()
      %719 = func.call @stack_pop_pointer() : () -> i64
      %720 = func.call @cc_symbol_value(%639) : (i64) -> i64
      func.call @stack_push_pointer(%720) : (i64) -> ()
      %721 = func.call @stack_pop_pointer() : () -> i64
      %722 = func.call @cc_nil_value() : () -> i64
      %723 = func.call @cc_errorp(%719) : (i64) -> i64
      %724 = arith.cmpi ne, %723, %722 : i64
      %725 = arith.cmpi eq, %722, %722 : i64
      %726 = arith.andi %724, %725 : i1
      %727 = scf.if %726 -> (i64) {
        scf.yield %719 : i64
      } else {
        scf.yield %722 : i64
      }
      %728 = func.call @cc_errorp(%721) : (i64) -> i64
      %729 = arith.cmpi ne, %728, %722 : i64
      %730 = arith.cmpi eq, %727, %722 : i64
      %731 = arith.andi %729, %730 : i1
      %732 = scf.if %731 -> (i64) {
        scf.yield %721 : i64
      } else {
        scf.yield %727 : i64
      }
      %733 = arith.cmpi ne, %732, %722 : i64
      scf.if %733 {
        func.call @stack_push_pointer(%732) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%719) : (i64) -> ()
        func.call @stack_push_pointer(%721) : (i64) -> ()
        %734 = llvm.mlir.addressof @str65 : !llvm.ptr
        %735 = func.call @cc_make_function_ref_const(%734) : (!llvm.ptr) -> i64
        %736 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%735, %736) : (i64, i64) -> ()
      }
      %737 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%643, %737) : (i64, i64) -> ()
      %738 = func.call @stack_pop_pointer() : () -> i64
      %739 = arith.constant 101 : i64
      %740 = func.call @cc_box_character(%739) : (i64) -> i64
      func.call @stack_push_pointer(%740) : (i64) -> ()
      %741 = func.call @stack_pop_pointer() : () -> i64
      %742 = func.call @cc_symbol_value(%639) : (i64) -> i64
      func.call @stack_push_pointer(%742) : (i64) -> ()
      %743 = func.call @stack_pop_pointer() : () -> i64
      %744 = func.call @cc_nil_value() : () -> i64
      %745 = func.call @cc_errorp(%741) : (i64) -> i64
      %746 = arith.cmpi ne, %745, %744 : i64
      %747 = arith.cmpi eq, %744, %744 : i64
      %748 = arith.andi %746, %747 : i1
      %749 = scf.if %748 -> (i64) {
        scf.yield %741 : i64
      } else {
        scf.yield %744 : i64
      }
      %750 = func.call @cc_errorp(%743) : (i64) -> i64
      %751 = arith.cmpi ne, %750, %744 : i64
      %752 = arith.cmpi eq, %749, %744 : i64
      %753 = arith.andi %751, %752 : i1
      %754 = scf.if %753 -> (i64) {
        scf.yield %743 : i64
      } else {
        scf.yield %749 : i64
      }
      %755 = arith.cmpi ne, %754, %744 : i64
      scf.if %755 {
        func.call @stack_push_pointer(%754) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%741) : (i64) -> ()
        func.call @stack_push_pointer(%743) : (i64) -> ()
        %756 = llvm.mlir.addressof @str66 : !llvm.ptr
        %757 = func.call @cc_make_function_ref_const(%756) : (!llvm.ptr) -> i64
        %758 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%757, %758) : (i64, i64) -> ()
      }
      %759 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%643, %759) : (i64, i64) -> ()
      %760 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %761 = func.call @stack_pop_pointer() : () -> i64
      %762 = func.call @cc_cons(%760, %761) : (i64, i64) -> i64
      func.call @stack_push_pointer(%762) : (i64) -> ()
      %763 = func.call @stack_pop_pointer() : () -> i64
      %764 = func.call @cc_cons(%738, %763) : (i64, i64) -> i64
      func.call @stack_push_pointer(%764) : (i64) -> ()
      %765 = func.call @stack_pop_pointer() : () -> i64
      %766 = func.call @cc_cons(%715, %765) : (i64, i64) -> i64
      func.call @stack_push_pointer(%766) : (i64) -> ()
      %767 = func.call @stack_pop_pointer() : () -> i64
      %768 = func.call @cc_cons(%693, %767) : (i64, i64) -> i64
      func.call @stack_push_pointer(%768) : (i64) -> ()
      %769 = func.call @stack_pop_pointer() : () -> i64
      %770 = func.call @cc_cons(%671, %769) : (i64, i64) -> i64
      func.call @stack_push_pointer(%770) : (i64) -> ()
      %771 = func.call @stack_pop_pointer() : () -> i64
      %772 = func.call @cc_values_pack(%771) : (i64) -> i64
      func.call @stack_push_pointer(%772) : (i64) -> ()
      %773 = func.call @stack_pop_pointer() : () -> i64
      %774 = func.call @cc_errorp(%773) : (i64) -> i64
      %775 = func.call @cc_nil_value() : () -> i64
      %776 = arith.cmpi ne, %774, %775 : i64
      scf.if %776 {
        func.call @stack_push_pointer(%773) : (i64) -> ()
      } else {
        %777 = func.call @cc_multiple_value_list(%773) : (i64) -> i64
        func.call @stack_push_pointer(%777) : (i64) -> ()
      }
      %778 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%645) : (i64) -> ()
      func.call @stack_push_pointer(%649) : (i64) -> ()
      func.call @stack_push_pointer(%778) : (i64) -> ()
      %779 = llvm.mlir.addressof @str67 : !llvm.ptr
      %780 = func.call @cc_make_function_ref_const(%779) : (!llvm.ptr) -> i64
      %781 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%780, %781) : (i64, i64) -> ()
      %782 = func.call @stack_depth() : () -> i64
      %783 = arith.constant 0 : i64
      %784 = arith.cmpi sgt, %782, %783 : i64
      scf.if %784 {
        %785 = func.call @stack_pop_pointer() : () -> i64
      }
      %786 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%786) : (i64) -> ()
      %787 = func.call @stack_pop_pointer() : () -> i64
      %788 = llvm.mlir.addressof @str68 : !llvm.ptr
      %789 = arith.constant 11 : i64
      %790 = func.call @cc_make_string(%788, %789) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%790) : (i64) -> ()
      %791 = func.call @stack_pop_pointer() : () -> i64
      %792 = func.call @cc_symbol_value(%639) : (i64) -> i64
      func.call @stack_push_pointer(%792) : (i64) -> ()
      %793 = func.call @stack_pop_pointer() : () -> i64
      %794 = func.call @cc_nil_value() : () -> i64
      %795 = func.call @cc_errorp(%793) : (i64) -> i64
      %796 = arith.cmpi ne, %795, %794 : i64
      %797 = arith.cmpi eq, %794, %794 : i64
      %798 = arith.andi %796, %797 : i1
      %799 = scf.if %798 -> (i64) {
        scf.yield %793 : i64
      } else {
        scf.yield %794 : i64
      }
      %800 = arith.cmpi ne, %799, %794 : i64
      scf.if %800 {
        func.call @stack_push_pointer(%799) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%793) : (i64) -> ()
        %801 = llvm.mlir.addressof @str69 : !llvm.ptr
        %802 = func.call @cc_make_function_ref_const(%801) : (!llvm.ptr) -> i64
        %803 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%802, %803) : (i64, i64) -> ()
      }
      %804 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%787) : (i64) -> ()
      func.call @stack_push_pointer(%791) : (i64) -> ()
      func.call @stack_push_pointer(%804) : (i64) -> ()
      %805 = llvm.mlir.addressof @str70 : !llvm.ptr
      %806 = func.call @cc_make_function_ref_const(%805) : (!llvm.ptr) -> i64
      %807 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%806, %807) : (i64, i64) -> ()
      %808 = func.call @stack_pop_pointer() : () -> i64
      %809 = func.call @cc_multiple_value_list(%808) : (i64) -> i64
      %810 = func.call @cc_symbol_value(%639) : (i64) -> i64
      %811 = func.call @cc_values_pack(%809) : (i64) -> i64
      func.call @stack_push_pointer(%811) : (i64) -> ()
      %812 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %812 : i64
    }
    func.call @stack_push_pointer(%541) : (i64) -> ()
    %813 = func.call @stack_pop_pointer() : () -> i64
    %814 = func.call @cc_multiple_value_list(%813) : (i64) -> i64
    %815 = llvm.mlir.addressof @str71 : !llvm.ptr
    %816 = arith.constant 38 : i64
    %817 = func.call @cc_make_symbol(%815, %816) : (!llvm.ptr, i64) -> i64
    %818 = func.call @cc_symbol_value(%817) : (i64) -> i64
    %819 = llvm.mlir.addressof @str72 : !llvm.ptr
    %820 = arith.constant 39 : i64
    %821 = func.call @cc_make_symbol(%819, %820) : (!llvm.ptr, i64) -> i64
    %822 = func.call @cc_symbol_value(%821) : (i64) -> i64
    %823 = llvm.mlir.addressof @str73 : !llvm.ptr
    %824 = arith.constant 40 : i64
    %825 = func.call @cc_make_symbol(%823, %824) : (!llvm.ptr, i64) -> i64
    %826 = func.call @cc_symbol_value(%825) : (i64) -> i64
    %827 = func.call @cc_nil_value() : () -> i64
    %828 = arith.cmpi ne, %818, %827 : i64
    %829 = scf.if %828 -> (i64) {
      scf.yield %826 : i64
    } else {
      scf.yield %814 : i64
    }
    %830 = func.call @cc_values_pack(%829) : (i64) -> i64
    func.call @stack_push_pointer(%830) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %831 = llvm.mlir.addressof @str74 : !llvm.ptr
    %832 = arith.constant 6 : i64
    %833 = func.call @cc_make_string(%831, %832) : (!llvm.ptr, i64) -> i64
    %834 = func.call @cc_nil_value() : () -> i64
    %835 = func.call @cc_intern(%833, %834) : (i64, i64) -> i64
    %836 = func.call @cc_nil_value() : () -> i64
    %837 = func.call @cc_cons(%835, %836) : (i64, i64) -> i64
    %838 = func.call @cc_values_pack(%837) : (i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%835) : (i64) -> ()
    %839 = func.call @cc_nil_value() : () -> i64
    %840 = func.call @cc_nil_value() : () -> i64
    %841 = func.call @cc_errorp(%839) : (i64) -> i64
    %842 = arith.cmpi ne, %841, %840 : i64
    %843 = scf.if %842 -> (i64) {
      scf.yield %839 : i64
    } else {
      %844 = llvm.mlir.addressof @str75 : !llvm.ptr
      %845 = arith.constant 11 : i64
      %846 = func.call @cc_make_string(%844, %845) : (!llvm.ptr, i64) -> i64
      %847 = llvm.mlir.addressof @str76 : !llvm.ptr
      %848 = arith.constant 7 : i64
      %849 = func.call @cc_make_string(%847, %848) : (!llvm.ptr, i64) -> i64
      %850 = func.call @cc_intern(%846, %849) : (i64, i64) -> i64
      %851 = func.call @cc_nil_value() : () -> i64
      %852 = func.call @cc_cons(%850, %851) : (i64, i64) -> i64
      %853 = func.call @cc_values_pack(%852) : (i64) -> i64
      func.call @stack_push_pointer(%850) : (i64) -> ()
      %854 = func.call @stack_pop_pointer() : () -> i64
      %855 = func.call @cc_in_package(%854) : (i64) -> i64
      func.call @stack_push_pointer(%855) : (i64) -> ()
      %856 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %856 : i64
    }
    %857 = func.call @cc_nil_value() : () -> i64
    %858 = func.call @cc_errorp(%843) : (i64) -> i64
    %859 = arith.cmpi ne, %858, %857 : i64
    %860 = scf.if %859 -> (i64) {
      scf.yield %843 : i64
    } else {
      %861 = llvm.mlir.addressof @str77 : !llvm.ptr
      %862 = func.call @cc_make_function_ref_const(%861) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%862) : (i64) -> ()
      %863 = func.call @stack_pop_pointer() : () -> i64
      %864 = llvm.mlir.addressof @str78 : !llvm.ptr
      %865 = arith.constant 17 : i64
      %866 = func.call @cc_make_string(%864, %865) : (!llvm.ptr, i64) -> i64
      %867 = llvm.mlir.addressof @str79 : !llvm.ptr
      %868 = arith.constant 15 : i64
      %869 = func.call @cc_make_string(%867, %868) : (!llvm.ptr, i64) -> i64
      %870 = func.call @cc_intern(%866, %869) : (i64, i64) -> i64
      %871 = func.call @cc_nil_value() : () -> i64
      %872 = func.call @cc_cons(%870, %871) : (i64, i64) -> i64
      %873 = func.call @cc_values_pack(%872) : (i64) -> i64
      %874 = func.call @cc_set_symbol_value(%870, %863) : (i64, i64) -> i64
      func.call @stack_push_pointer(%863) : (i64) -> ()
      %875 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %875 : i64
    }
    %876 = func.call @cc_nil_value() : () -> i64
    %877 = func.call @cc_errorp(%860) : (i64) -> i64
    %878 = arith.cmpi ne, %877, %876 : i64
    %879 = scf.if %878 -> (i64) {
      scf.yield %860 : i64
    } else {
      %880 = llvm.mlir.addressof @str80 : !llvm.ptr
      %881 = func.call @cc_make_function_ref_const(%880) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%881) : (i64) -> ()
      %882 = func.call @stack_pop_pointer() : () -> i64
      %883 = llvm.mlir.addressof @str81 : !llvm.ptr
      %884 = arith.constant 17 : i64
      %885 = func.call @cc_make_string(%883, %884) : (!llvm.ptr, i64) -> i64
      %886 = llvm.mlir.addressof @str82 : !llvm.ptr
      %887 = arith.constant 15 : i64
      %888 = func.call @cc_make_string(%886, %887) : (!llvm.ptr, i64) -> i64
      %889 = func.call @cc_intern(%885, %888) : (i64, i64) -> i64
      %890 = func.call @cc_nil_value() : () -> i64
      %891 = func.call @cc_cons(%889, %890) : (i64, i64) -> i64
      %892 = func.call @cc_values_pack(%891) : (i64) -> i64
      %893 = func.call @cc_set_symbol_value(%889, %882) : (i64, i64) -> i64
      func.call @stack_push_pointer(%882) : (i64) -> ()
      %894 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %894 : i64
    }
    %895 = func.call @cc_nil_value() : () -> i64
    %896 = func.call @cc_errorp(%879) : (i64) -> i64
    %897 = arith.cmpi ne, %896, %895 : i64
    %898 = scf.if %897 -> (i64) {
      scf.yield %879 : i64
    } else {
      %899 = llvm.mlir.addressof @str83 : !llvm.ptr
      %900 = func.call @cc_make_function_ref_const(%899) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%900) : (i64) -> ()
      %901 = func.call @stack_pop_pointer() : () -> i64
      %902 = llvm.mlir.addressof @str84 : !llvm.ptr
      %903 = arith.constant 17 : i64
      %904 = func.call @cc_make_string(%902, %903) : (!llvm.ptr, i64) -> i64
      %905 = llvm.mlir.addressof @str85 : !llvm.ptr
      %906 = arith.constant 15 : i64
      %907 = func.call @cc_make_string(%905, %906) : (!llvm.ptr, i64) -> i64
      %908 = func.call @cc_intern(%904, %907) : (i64, i64) -> i64
      %909 = func.call @cc_nil_value() : () -> i64
      %910 = func.call @cc_cons(%908, %909) : (i64, i64) -> i64
      %911 = func.call @cc_values_pack(%910) : (i64) -> i64
      %912 = func.call @cc_set_symbol_value(%908, %901) : (i64, i64) -> i64
      func.call @stack_push_pointer(%901) : (i64) -> ()
      %913 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %913 : i64
    }
    %914 = func.call @cc_nil_value() : () -> i64
    %915 = func.call @cc_errorp(%898) : (i64) -> i64
    %916 = arith.cmpi ne, %915, %914 : i64
    %917 = scf.if %916 -> (i64) {
      scf.yield %898 : i64
    } else {
      %918 = llvm.mlir.addressof @str86 : !llvm.ptr
      %919 = func.call @cc_make_function_ref_const(%918) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%919) : (i64) -> ()
      %920 = func.call @stack_pop_pointer() : () -> i64
      %921 = llvm.mlir.addressof @str87 : !llvm.ptr
      %922 = arith.constant 17 : i64
      %923 = func.call @cc_make_string(%921, %922) : (!llvm.ptr, i64) -> i64
      %924 = llvm.mlir.addressof @str88 : !llvm.ptr
      %925 = arith.constant 15 : i64
      %926 = func.call @cc_make_string(%924, %925) : (!llvm.ptr, i64) -> i64
      %927 = func.call @cc_intern(%923, %926) : (i64, i64) -> i64
      %928 = func.call @cc_nil_value() : () -> i64
      %929 = func.call @cc_cons(%927, %928) : (i64, i64) -> i64
      %930 = func.call @cc_values_pack(%929) : (i64) -> i64
      %931 = func.call @cc_set_symbol_value(%927, %920) : (i64, i64) -> i64
      func.call @stack_push_pointer(%920) : (i64) -> ()
      %932 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %932 : i64
    }
    %933 = func.call @cc_nil_value() : () -> i64
    %934 = func.call @cc_errorp(%917) : (i64) -> i64
    %935 = arith.cmpi ne, %934, %933 : i64
    %936 = scf.if %935 -> (i64) {
      scf.yield %917 : i64
    } else {
      %937 = func.call @cc_nil_value() : () -> i64
      %938 = arith.cmpi ne, %937, %937 : i64
      scf.if %938 {
        func.call @stack_push_pointer(%937) : (i64) -> ()
      } else {
        %939 = llvm.mlir.addressof @str89 : !llvm.ptr
        %940 = func.call @cc_make_function_ref_const(%939) : (!llvm.ptr) -> i64
        %941 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%940, %941) : (i64, i64) -> ()
      }
      %942 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %942 : i64
    }
    %943 = func.call @cc_nil_value() : () -> i64
    %944 = func.call @cc_errorp(%936) : (i64) -> i64
    %945 = arith.cmpi ne, %944, %943 : i64
    %946 = scf.if %945 -> (i64) {
      scf.yield %936 : i64
    } else {
      %947 = llvm.mlir.addressof @str90 : !llvm.ptr
      %948 = func.call @cc_make_function_ref_const(%947) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%948) : (i64) -> ()
      %949 = func.call @stack_pop_pointer() : () -> i64
      %950 = llvm.mlir.addressof @str91 : !llvm.ptr
      %951 = arith.constant 23 : i64
      %952 = func.call @cc_make_string(%950, %951) : (!llvm.ptr, i64) -> i64
      %953 = llvm.mlir.addressof @str92 : !llvm.ptr
      %954 = arith.constant 15 : i64
      %955 = func.call @cc_make_string(%953, %954) : (!llvm.ptr, i64) -> i64
      %956 = func.call @cc_intern(%952, %955) : (i64, i64) -> i64
      %957 = func.call @cc_nil_value() : () -> i64
      %958 = func.call @cc_cons(%956, %957) : (i64, i64) -> i64
      %959 = func.call @cc_values_pack(%958) : (i64) -> i64
      %960 = func.call @cc_set_symbol_value(%956, %949) : (i64, i64) -> i64
      func.call @stack_push_pointer(%949) : (i64) -> ()
      %961 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %961 : i64
    }
    %962 = func.call @cc_nil_value() : () -> i64
    %963 = func.call @cc_errorp(%946) : (i64) -> i64
    %964 = arith.cmpi ne, %963, %962 : i64
    %965 = scf.if %964 -> (i64) {
      scf.yield %946 : i64
    } else {
      %966 = llvm.mlir.addressof @str93 : !llvm.ptr
      %967 = func.call @cc_make_function_ref_const(%966) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%967) : (i64) -> ()
      %968 = func.call @stack_pop_pointer() : () -> i64
      %969 = llvm.mlir.addressof @str94 : !llvm.ptr
      %970 = arith.constant 23 : i64
      %971 = func.call @cc_make_string(%969, %970) : (!llvm.ptr, i64) -> i64
      %972 = llvm.mlir.addressof @str95 : !llvm.ptr
      %973 = arith.constant 15 : i64
      %974 = func.call @cc_make_string(%972, %973) : (!llvm.ptr, i64) -> i64
      %975 = func.call @cc_intern(%971, %974) : (i64, i64) -> i64
      %976 = func.call @cc_nil_value() : () -> i64
      %977 = func.call @cc_cons(%975, %976) : (i64, i64) -> i64
      %978 = func.call @cc_values_pack(%977) : (i64) -> i64
      %979 = func.call @cc_set_symbol_value(%975, %968) : (i64, i64) -> i64
      func.call @stack_push_pointer(%968) : (i64) -> ()
      %980 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %980 : i64
    }
    %981 = func.call @cc_nil_value() : () -> i64
    %982 = func.call @cc_errorp(%965) : (i64) -> i64
    %983 = arith.cmpi ne, %982, %981 : i64
    %984 = scf.if %983 -> (i64) {
      scf.yield %965 : i64
    } else {
      %985 = llvm.mlir.addressof @str96 : !llvm.ptr
      %986 = func.call @cc_make_function_ref_const(%985) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%986) : (i64) -> ()
      %987 = func.call @stack_pop_pointer() : () -> i64
      %988 = llvm.mlir.addressof @str97 : !llvm.ptr
      %989 = arith.constant 23 : i64
      %990 = func.call @cc_make_string(%988, %989) : (!llvm.ptr, i64) -> i64
      %991 = llvm.mlir.addressof @str98 : !llvm.ptr
      %992 = arith.constant 15 : i64
      %993 = func.call @cc_make_string(%991, %992) : (!llvm.ptr, i64) -> i64
      %994 = func.call @cc_intern(%990, %993) : (i64, i64) -> i64
      %995 = func.call @cc_nil_value() : () -> i64
      %996 = func.call @cc_cons(%994, %995) : (i64, i64) -> i64
      %997 = func.call @cc_values_pack(%996) : (i64) -> i64
      %998 = func.call @cc_set_symbol_value(%994, %987) : (i64, i64) -> i64
      func.call @stack_push_pointer(%987) : (i64) -> ()
      %999 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %999 : i64
    }
    %1000 = func.call @cc_nil_value() : () -> i64
    %1001 = func.call @cc_errorp(%984) : (i64) -> i64
    %1002 = arith.cmpi ne, %1001, %1000 : i64
    %1003 = scf.if %1002 -> (i64) {
      scf.yield %984 : i64
    } else {
      %1004 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1005 = func.call @cc_make_function_ref_const(%1004) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1005) : (i64) -> ()
      %1006 = func.call @stack_pop_pointer() : () -> i64
      %1007 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1008 = arith.constant 23 : i64
      %1009 = func.call @cc_make_string(%1007, %1008) : (!llvm.ptr, i64) -> i64
      %1010 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1011 = arith.constant 15 : i64
      %1012 = func.call @cc_make_string(%1010, %1011) : (!llvm.ptr, i64) -> i64
      %1013 = func.call @cc_intern(%1009, %1012) : (i64, i64) -> i64
      %1014 = func.call @cc_nil_value() : () -> i64
      %1015 = func.call @cc_cons(%1013, %1014) : (i64, i64) -> i64
      %1016 = func.call @cc_values_pack(%1015) : (i64) -> i64
      %1017 = func.call @cc_set_symbol_value(%1013, %1006) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1006) : (i64) -> ()
      %1018 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1018 : i64
    }
    %1019 = func.call @cc_nil_value() : () -> i64
    %1020 = func.call @cc_errorp(%1003) : (i64) -> i64
    %1021 = arith.cmpi ne, %1020, %1019 : i64
    %1022 = scf.if %1021 -> (i64) {
      scf.yield %1003 : i64
    } else {
      %1023 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1024 = func.call @cc_make_function_ref_const(%1023) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1024) : (i64) -> ()
      %1025 = func.call @stack_pop_pointer() : () -> i64
      %1026 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1027 = arith.constant 24 : i64
      %1028 = func.call @cc_make_string(%1026, %1027) : (!llvm.ptr, i64) -> i64
      %1029 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1030 = arith.constant 15 : i64
      %1031 = func.call @cc_make_string(%1029, %1030) : (!llvm.ptr, i64) -> i64
      %1032 = func.call @cc_intern(%1028, %1031) : (i64, i64) -> i64
      %1033 = func.call @cc_nil_value() : () -> i64
      %1034 = func.call @cc_cons(%1032, %1033) : (i64, i64) -> i64
      %1035 = func.call @cc_values_pack(%1034) : (i64) -> i64
      %1036 = func.call @cc_set_symbol_value(%1032, %1025) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1025) : (i64) -> ()
      %1037 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1037 : i64
    }
    %1038 = func.call @cc_nil_value() : () -> i64
    %1039 = func.call @cc_errorp(%1022) : (i64) -> i64
    %1040 = arith.cmpi ne, %1039, %1038 : i64
    %1041 = scf.if %1040 -> (i64) {
      scf.yield %1022 : i64
    } else {
      %1042 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1043 = func.call @cc_make_function_ref_const(%1042) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1043) : (i64) -> ()
      %1044 = func.call @stack_pop_pointer() : () -> i64
      %1045 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1046 = arith.constant 24 : i64
      %1047 = func.call @cc_make_string(%1045, %1046) : (!llvm.ptr, i64) -> i64
      %1048 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1049 = arith.constant 15 : i64
      %1050 = func.call @cc_make_string(%1048, %1049) : (!llvm.ptr, i64) -> i64
      %1051 = func.call @cc_intern(%1047, %1050) : (i64, i64) -> i64
      %1052 = func.call @cc_nil_value() : () -> i64
      %1053 = func.call @cc_cons(%1051, %1052) : (i64, i64) -> i64
      %1054 = func.call @cc_values_pack(%1053) : (i64) -> i64
      %1055 = func.call @cc_set_symbol_value(%1051, %1044) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1044) : (i64) -> ()
      %1056 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1056 : i64
    }
    %1057 = func.call @cc_nil_value() : () -> i64
    %1058 = func.call @cc_errorp(%1041) : (i64) -> i64
    %1059 = arith.cmpi ne, %1058, %1057 : i64
    %1060 = scf.if %1059 -> (i64) {
      scf.yield %1041 : i64
    } else {
      %1061 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1062 = func.call @cc_make_function_ref_const(%1061) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1062) : (i64) -> ()
      %1063 = func.call @stack_pop_pointer() : () -> i64
      %1064 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1065 = arith.constant 24 : i64
      %1066 = func.call @cc_make_string(%1064, %1065) : (!llvm.ptr, i64) -> i64
      %1067 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1068 = arith.constant 15 : i64
      %1069 = func.call @cc_make_string(%1067, %1068) : (!llvm.ptr, i64) -> i64
      %1070 = func.call @cc_intern(%1066, %1069) : (i64, i64) -> i64
      %1071 = func.call @cc_nil_value() : () -> i64
      %1072 = func.call @cc_cons(%1070, %1071) : (i64, i64) -> i64
      %1073 = func.call @cc_values_pack(%1072) : (i64) -> i64
      %1074 = func.call @cc_set_symbol_value(%1070, %1063) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1063) : (i64) -> ()
      %1075 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1075 : i64
    }
    %1076 = func.call @cc_nil_value() : () -> i64
    %1077 = func.call @cc_errorp(%1060) : (i64) -> i64
    %1078 = arith.cmpi ne, %1077, %1076 : i64
    %1079 = scf.if %1078 -> (i64) {
      scf.yield %1060 : i64
    } else {
      %1080 = llvm.mlir.addressof @str111 : !llvm.ptr
      %1081 = func.call @cc_make_function_ref_const(%1080) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1081) : (i64) -> ()
      %1082 = func.call @stack_pop_pointer() : () -> i64
      %1083 = llvm.mlir.addressof @str112 : !llvm.ptr
      %1084 = arith.constant 24 : i64
      %1085 = func.call @cc_make_string(%1083, %1084) : (!llvm.ptr, i64) -> i64
      %1086 = llvm.mlir.addressof @str113 : !llvm.ptr
      %1087 = arith.constant 15 : i64
      %1088 = func.call @cc_make_string(%1086, %1087) : (!llvm.ptr, i64) -> i64
      %1089 = func.call @cc_intern(%1085, %1088) : (i64, i64) -> i64
      %1090 = func.call @cc_nil_value() : () -> i64
      %1091 = func.call @cc_cons(%1089, %1090) : (i64, i64) -> i64
      %1092 = func.call @cc_values_pack(%1091) : (i64) -> i64
      %1093 = func.call @cc_set_symbol_value(%1089, %1082) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1082) : (i64) -> ()
      %1094 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1094 : i64
    }
    %1095 = func.call @cc_nil_value() : () -> i64
    %1096 = func.call @cc_errorp(%1079) : (i64) -> i64
    %1097 = arith.cmpi ne, %1096, %1095 : i64
    %1098 = scf.if %1097 -> (i64) {
      scf.yield %1079 : i64
    } else {
      %1099 = func.call @cc_nil_value() : () -> i64
      %1100 = arith.cmpi ne, %1099, %1099 : i64
      scf.if %1100 {
        func.call @stack_push_pointer(%1099) : (i64) -> ()
      } else {
        %1101 = llvm.mlir.addressof @str114 : !llvm.ptr
        %1102 = func.call @cc_make_function_ref_const(%1101) : (!llvm.ptr) -> i64
        %1103 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1102, %1103) : (i64, i64) -> ()
      }
      %1104 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1104 : i64
    }
    %1105 = func.call @cc_nil_value() : () -> i64
    %1106 = func.call @cc_errorp(%1098) : (i64) -> i64
    %1107 = arith.cmpi ne, %1106, %1105 : i64
    %1108 = scf.if %1107 -> (i64) {
      scf.yield %1098 : i64
    } else {
      %1109 = func.call @cc_nil_value() : () -> i64
      %1110 = arith.cmpi ne, %1109, %1109 : i64
      scf.if %1110 {
        func.call @stack_push_pointer(%1109) : (i64) -> ()
      } else {
        %1111 = llvm.mlir.addressof @str115 : !llvm.ptr
        %1112 = func.call @cc_make_function_ref_const(%1111) : (!llvm.ptr) -> i64
        %1113 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1112, %1113) : (i64, i64) -> ()
      }
      %1114 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1114 : i64
    }
    func.call @stack_push_pointer(%1108) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_193685610299395"() {
    %242 = func.call @stack_pop_pointer() : () -> i64
    %243 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%242) : (i64) -> ()
    %244 = func.call @stack_pop_pointer() : () -> i64
    %245 = llvm.mlir.addressof @str29 : !llvm.ptr
    %246 = arith.constant 6 : i64
    %247 = func.call @cc_make_string(%245, %246) : (!llvm.ptr, i64) -> i64
    %248 = llvm.mlir.addressof @str30 : !llvm.ptr
    %249 = arith.constant 7 : i64
    %250 = func.call @cc_make_string(%248, %249) : (!llvm.ptr, i64) -> i64
    %251 = func.call @cc_intern(%247, %250) : (i64, i64) -> i64
    %252 = func.call @cc_nil_value() : () -> i64
    %253 = func.call @cc_cons(%251, %252) : (i64, i64) -> i64
    %254 = func.call @cc_values_pack(%253) : (i64) -> i64
    func.call @stack_push_pointer(%251) : (i64) -> ()
    %255 = func.call @stack_pop_pointer() : () -> i64
    %256 = func.call @cc_symbol_value(%243) : (i64) -> i64
    func.call @stack_push_pointer(%256) : (i64) -> ()
    %257 = func.call @stack_pop_pointer() : () -> i64
    %258 = func.call @cc_nil_value() : () -> i64
    %259 = func.call @cc_errorp(%257) : (i64) -> i64
    %260 = arith.cmpi ne, %259, %258 : i64
    %261 = arith.cmpi eq, %258, %258 : i64
    %262 = arith.andi %260, %261 : i1
    %263 = scf.if %262 -> (i64) {
      scf.yield %257 : i64
    } else {
      scf.yield %258 : i64
    }
    %264 = arith.cmpi ne, %263, %258 : i64
    scf.if %264 {
      func.call @stack_push_pointer(%263) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%257) : (i64) -> ()
      %265 = llvm.mlir.addressof @str31 : !llvm.ptr
      %266 = func.call @cc_make_function_ref_const(%265) : (!llvm.ptr) -> i64
      %267 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%266, %267) : (i64, i64) -> ()
    }
    %268 = func.call @stack_pop_pointer() : () -> i64
    %269 = llvm.mlir.addressof @str32 : !llvm.ptr
    %270 = arith.constant 4 : i64
    %271 = func.call @cc_make_string(%269, %270) : (!llvm.ptr, i64) -> i64
    %272 = llvm.mlir.addressof @str33 : !llvm.ptr
    %273 = arith.constant 7 : i64
    %274 = func.call @cc_make_string(%272, %273) : (!llvm.ptr, i64) -> i64
    %275 = func.call @cc_intern(%271, %274) : (i64, i64) -> i64
    %276 = func.call @cc_nil_value() : () -> i64
    %277 = func.call @cc_cons(%275, %276) : (i64, i64) -> i64
    %278 = func.call @cc_values_pack(%277) : (i64) -> i64
    func.call @stack_push_pointer(%275) : (i64) -> ()
    %279 = func.call @stack_pop_pointer() : () -> i64
    %280 = func.call @cc_symbol_value(%243) : (i64) -> i64
    func.call @stack_push_pointer(%280) : (i64) -> ()
    %281 = func.call @stack_pop_pointer() : () -> i64
    %282 = func.call @cc_nil_value() : () -> i64
    %283 = func.call @cc_errorp(%281) : (i64) -> i64
    %284 = arith.cmpi ne, %283, %282 : i64
    %285 = arith.cmpi eq, %282, %282 : i64
    %286 = arith.andi %284, %285 : i1
    %287 = scf.if %286 -> (i64) {
      scf.yield %281 : i64
    } else {
      scf.yield %282 : i64
    }
    %288 = arith.cmpi ne, %287, %282 : i64
    scf.if %288 {
      func.call @stack_push_pointer(%287) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%281) : (i64) -> ()
      %289 = llvm.mlir.addressof @str34 : !llvm.ptr
      %290 = func.call @cc_make_function_ref_const(%289) : (!llvm.ptr) -> i64
      %291 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%290, %291) : (i64, i64) -> ()
    }
    %292 = func.call @stack_pop_pointer() : () -> i64
    %293 = func.call @cc_nil_value() : () -> i64
    %294 = func.call @cc_errorp(%244) : (i64) -> i64
    %295 = arith.cmpi ne, %294, %293 : i64
    %296 = arith.cmpi eq, %293, %293 : i64
    %297 = arith.andi %295, %296 : i1
    %298 = scf.if %297 -> (i64) {
      scf.yield %244 : i64
    } else {
      scf.yield %293 : i64
    }
    %299 = func.call @cc_errorp(%255) : (i64) -> i64
    %300 = arith.cmpi ne, %299, %293 : i64
    %301 = arith.cmpi eq, %298, %293 : i64
    %302 = arith.andi %300, %301 : i1
    %303 = scf.if %302 -> (i64) {
      scf.yield %255 : i64
    } else {
      scf.yield %298 : i64
    }
    %304 = func.call @cc_errorp(%268) : (i64) -> i64
    %305 = arith.cmpi ne, %304, %293 : i64
    %306 = arith.cmpi eq, %303, %293 : i64
    %307 = arith.andi %305, %306 : i1
    %308 = scf.if %307 -> (i64) {
      scf.yield %268 : i64
    } else {
      scf.yield %303 : i64
    }
    %309 = func.call @cc_errorp(%279) : (i64) -> i64
    %310 = arith.cmpi ne, %309, %293 : i64
    %311 = arith.cmpi eq, %308, %293 : i64
    %312 = arith.andi %310, %311 : i1
    %313 = scf.if %312 -> (i64) {
      scf.yield %279 : i64
    } else {
      scf.yield %308 : i64
    }
    %314 = func.call @cc_errorp(%292) : (i64) -> i64
    %315 = arith.cmpi ne, %314, %293 : i64
    %316 = arith.cmpi eq, %313, %293 : i64
    %317 = arith.andi %315, %316 : i1
    %318 = scf.if %317 -> (i64) {
      scf.yield %292 : i64
    } else {
      scf.yield %313 : i64
    }
    %319 = arith.cmpi ne, %318, %293 : i64
    scf.if %319 {
      func.call @stack_push_pointer(%318) : (i64) -> ()
    } else {
      %320 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%320) : (i64) -> ()
      func.call @stack_push_pointer(%292) : (i64) -> ()
      %321 = func.call @stack_pop_pointer() : () -> i64
      %322 = func.call @stack_pop_pointer() : () -> i64
      %323 = func.call @cc_cons(%321, %322) : (i64, i64) -> i64
      func.call @stack_push_pointer(%323) : (i64) -> ()
      func.call @stack_push_pointer(%279) : (i64) -> ()
      %324 = func.call @stack_pop_pointer() : () -> i64
      %325 = func.call @stack_pop_pointer() : () -> i64
      %326 = func.call @cc_cons(%324, %325) : (i64, i64) -> i64
      func.call @stack_push_pointer(%326) : (i64) -> ()
      func.call @stack_push_pointer(%268) : (i64) -> ()
      %327 = func.call @stack_pop_pointer() : () -> i64
      %328 = func.call @stack_pop_pointer() : () -> i64
      %329 = func.call @cc_cons(%327, %328) : (i64, i64) -> i64
      func.call @stack_push_pointer(%329) : (i64) -> ()
      func.call @stack_push_pointer(%255) : (i64) -> ()
      %330 = func.call @stack_pop_pointer() : () -> i64
      %331 = func.call @stack_pop_pointer() : () -> i64
      %332 = func.call @cc_cons(%330, %331) : (i64, i64) -> i64
      func.call @stack_push_pointer(%332) : (i64) -> ()
      func.call @stack_push_pointer(%244) : (i64) -> ()
      %333 = func.call @stack_pop_pointer() : () -> i64
      %334 = func.call @stack_pop_pointer() : () -> i64
      %335 = func.call @cc_cons(%333, %334) : (i64, i64) -> i64
      func.call @stack_push_pointer(%335) : (i64) -> ()
    }
    func.return
  }
  func.func @"__lambda_193685610299399"() {
    %542 = func.call @stack_pop_pointer() : () -> i64
    %543 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%542) : (i64) -> ()
    %544 = func.call @stack_pop_pointer() : () -> i64
    %545 = llvm.mlir.addressof @str53 : !llvm.ptr
    %546 = arith.constant 6 : i64
    %547 = func.call @cc_make_string(%545, %546) : (!llvm.ptr, i64) -> i64
    %548 = llvm.mlir.addressof @str54 : !llvm.ptr
    %549 = arith.constant 7 : i64
    %550 = func.call @cc_make_string(%548, %549) : (!llvm.ptr, i64) -> i64
    %551 = func.call @cc_intern(%547, %550) : (i64, i64) -> i64
    %552 = func.call @cc_nil_value() : () -> i64
    %553 = func.call @cc_cons(%551, %552) : (i64, i64) -> i64
    %554 = func.call @cc_values_pack(%553) : (i64) -> i64
    func.call @stack_push_pointer(%551) : (i64) -> ()
    %555 = func.call @stack_pop_pointer() : () -> i64
    %556 = func.call @cc_symbol_value(%543) : (i64) -> i64
    func.call @stack_push_pointer(%556) : (i64) -> ()
    %557 = func.call @stack_pop_pointer() : () -> i64
    %558 = func.call @cc_nil_value() : () -> i64
    %559 = func.call @cc_errorp(%557) : (i64) -> i64
    %560 = arith.cmpi ne, %559, %558 : i64
    %561 = arith.cmpi eq, %558, %558 : i64
    %562 = arith.andi %560, %561 : i1
    %563 = scf.if %562 -> (i64) {
      scf.yield %557 : i64
    } else {
      scf.yield %558 : i64
    }
    %564 = arith.cmpi ne, %563, %558 : i64
    scf.if %564 {
      func.call @stack_push_pointer(%563) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%557) : (i64) -> ()
      %565 = llvm.mlir.addressof @str55 : !llvm.ptr
      %566 = func.call @cc_make_function_ref_const(%565) : (!llvm.ptr) -> i64
      %567 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%566, %567) : (i64, i64) -> ()
    }
    %568 = func.call @stack_pop_pointer() : () -> i64
    %569 = llvm.mlir.addressof @str56 : !llvm.ptr
    %570 = arith.constant 4 : i64
    %571 = func.call @cc_make_string(%569, %570) : (!llvm.ptr, i64) -> i64
    %572 = llvm.mlir.addressof @str57 : !llvm.ptr
    %573 = arith.constant 7 : i64
    %574 = func.call @cc_make_string(%572, %573) : (!llvm.ptr, i64) -> i64
    %575 = func.call @cc_intern(%571, %574) : (i64, i64) -> i64
    %576 = func.call @cc_nil_value() : () -> i64
    %577 = func.call @cc_cons(%575, %576) : (i64, i64) -> i64
    %578 = func.call @cc_values_pack(%577) : (i64) -> i64
    func.call @stack_push_pointer(%575) : (i64) -> ()
    %579 = func.call @stack_pop_pointer() : () -> i64
    %580 = func.call @cc_symbol_value(%543) : (i64) -> i64
    func.call @stack_push_pointer(%580) : (i64) -> ()
    %581 = func.call @stack_pop_pointer() : () -> i64
    %582 = func.call @cc_nil_value() : () -> i64
    %583 = func.call @cc_errorp(%581) : (i64) -> i64
    %584 = arith.cmpi ne, %583, %582 : i64
    %585 = arith.cmpi eq, %582, %582 : i64
    %586 = arith.andi %584, %585 : i1
    %587 = scf.if %586 -> (i64) {
      scf.yield %581 : i64
    } else {
      scf.yield %582 : i64
    }
    %588 = arith.cmpi ne, %587, %582 : i64
    scf.if %588 {
      func.call @stack_push_pointer(%587) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%581) : (i64) -> ()
      %589 = llvm.mlir.addressof @str58 : !llvm.ptr
      %590 = func.call @cc_make_function_ref_const(%589) : (!llvm.ptr) -> i64
      %591 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%590, %591) : (i64, i64) -> ()
    }
    %592 = func.call @stack_pop_pointer() : () -> i64
    %593 = func.call @cc_nil_value() : () -> i64
    %594 = func.call @cc_errorp(%544) : (i64) -> i64
    %595 = arith.cmpi ne, %594, %593 : i64
    %596 = arith.cmpi eq, %593, %593 : i64
    %597 = arith.andi %595, %596 : i1
    %598 = scf.if %597 -> (i64) {
      scf.yield %544 : i64
    } else {
      scf.yield %593 : i64
    }
    %599 = func.call @cc_errorp(%555) : (i64) -> i64
    %600 = arith.cmpi ne, %599, %593 : i64
    %601 = arith.cmpi eq, %598, %593 : i64
    %602 = arith.andi %600, %601 : i1
    %603 = scf.if %602 -> (i64) {
      scf.yield %555 : i64
    } else {
      scf.yield %598 : i64
    }
    %604 = func.call @cc_errorp(%568) : (i64) -> i64
    %605 = arith.cmpi ne, %604, %593 : i64
    %606 = arith.cmpi eq, %603, %593 : i64
    %607 = arith.andi %605, %606 : i1
    %608 = scf.if %607 -> (i64) {
      scf.yield %568 : i64
    } else {
      scf.yield %603 : i64
    }
    %609 = func.call @cc_errorp(%579) : (i64) -> i64
    %610 = arith.cmpi ne, %609, %593 : i64
    %611 = arith.cmpi eq, %608, %593 : i64
    %612 = arith.andi %610, %611 : i1
    %613 = scf.if %612 -> (i64) {
      scf.yield %579 : i64
    } else {
      scf.yield %608 : i64
    }
    %614 = func.call @cc_errorp(%592) : (i64) -> i64
    %615 = arith.cmpi ne, %614, %593 : i64
    %616 = arith.cmpi eq, %613, %593 : i64
    %617 = arith.andi %615, %616 : i1
    %618 = scf.if %617 -> (i64) {
      scf.yield %592 : i64
    } else {
      scf.yield %613 : i64
    }
    %619 = arith.cmpi ne, %618, %593 : i64
    scf.if %619 {
      func.call @stack_push_pointer(%618) : (i64) -> ()
    } else {
      %620 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%620) : (i64) -> ()
      func.call @stack_push_pointer(%592) : (i64) -> ()
      %621 = func.call @stack_pop_pointer() : () -> i64
      %622 = func.call @stack_pop_pointer() : () -> i64
      %623 = func.call @cc_cons(%621, %622) : (i64, i64) -> i64
      func.call @stack_push_pointer(%623) : (i64) -> ()
      func.call @stack_push_pointer(%579) : (i64) -> ()
      %624 = func.call @stack_pop_pointer() : () -> i64
      %625 = func.call @stack_pop_pointer() : () -> i64
      %626 = func.call @cc_cons(%624, %625) : (i64, i64) -> i64
      func.call @stack_push_pointer(%626) : (i64) -> ()
      func.call @stack_push_pointer(%568) : (i64) -> ()
      %627 = func.call @stack_pop_pointer() : () -> i64
      %628 = func.call @stack_pop_pointer() : () -> i64
      %629 = func.call @cc_cons(%627, %628) : (i64, i64) -> i64
      func.call @stack_push_pointer(%629) : (i64) -> ()
      func.call @stack_push_pointer(%555) : (i64) -> ()
      %630 = func.call @stack_pop_pointer() : () -> i64
      %631 = func.call @stack_pop_pointer() : () -> i64
      %632 = func.call @cc_cons(%630, %631) : (i64, i64) -> i64
      func.call @stack_push_pointer(%632) : (i64) -> ()
      func.call @stack_push_pointer(%544) : (i64) -> ()
      %633 = func.call @stack_pop_pointer() : () -> i64
      %634 = func.call @stack_pop_pointer() : () -> i64
      %635 = func.call @cc_cons(%633, %634) : (i64, i64) -> i64
      func.call @stack_push_pointer(%635) : (i64) -> ()
    }
    func.return
  }
  llvm.mlir.global private constant @str0("SHOW-INPUT-CURSOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_193685610299392*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_193685610299392*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_193685610299392*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("ab\0Acd\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str5("MAKE-STRING-INPUT-STREAM\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str6("c0=~S l0=~S~%\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str7("core:stream-input-column\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str8("core:stream-input-line\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str9("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str10("r1=~S c=~S l=~S~%\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str11("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str12("core:stream-input-column\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str13("core:stream-input-line\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str14("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str15("u=~S c=~S l=~S~%\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str16("UNREAD-CHAR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str17("core:stream-input-column\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str18("core:stream-input-line\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str19("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETFLAG_193685610299392*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETVALUE_193685610299392*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETMVLIST_193685610299392*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str23("SHOW-INPUT-CURSOR-SUITE\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str24("*__MLIR_BLOCK_RETFLAG_193685610299393*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str25("*__MLIR_BLOCK_RETVALUE_193685610299393*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str26("*__MLIR_BLOCK_RETMVLIST_193685610299393*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str27("ab\0Acd\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str28("MAKE-STRING-INPUT-STREAM\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str29("COLUMN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str30("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str31("core:stream-input-column\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str32("LINE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("core:stream-input-line\00") : !llvm.array<23 x i8>
  llvm.mlir.global private constant @str35("#:%%DYN-CELL-193685610299396-STREAM\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str36("input-suite=~S~%\00") : !llvm.array<17 x i8>
  llvm.mlir.global private constant @str37("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str38("UNREAD-CHAR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str39("PEEK-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str40("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str41("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str42("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str43("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str44("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str45("*__MLIR_BLOCK_RETFLAG_193685610299393*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str46("*__MLIR_BLOCK_RETVALUE_193685610299393*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str47("*__MLIR_BLOCK_RETMVLIST_193685610299393*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str48("SHOW-OUTPUT-CURSOR-SUITE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str49("*__MLIR_BLOCK_RETFLAG_193685610299397*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str50("*__MLIR_BLOCK_RETVALUE_193685610299397*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str51("*__MLIR_BLOCK_RETMVLIST_193685610299397*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str52("MAKE-STRING-OUTPUT-STREAM\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str53("COLUMN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str54("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str55("core:stream-output-column\00") : !llvm.array<26 x i8>
  llvm.mlir.global private constant @str56("LINE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str57("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str58("core:stream-output-line\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str59("#:%%DYN-CELL-193685610299400-STREAM\00") : !llvm.array<36 x i8>
  llvm.mlir.global private constant @str60("output-suite=~S~%\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str61("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str62("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str63("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str64("cd\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str65("WRITE-LINE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str66("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str67("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str68("buffer=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str69("GET-OUTPUT-STREAM-STRING\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str70("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str71("*__MLIR_BLOCK_RETFLAG_193685610299397*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str72("*__MLIR_BLOCK_RETVALUE_193685610299397*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str73("*__MLIR_BLOCK_RETMVLIST_193685610299397*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str74("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str75("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str76("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str77("%FN%show-input-cursor\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str78("SHOW-INPUT-CURSOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str79("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str80("%FN%show-input-cursor\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str81("SHOW-INPUT-CURSOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str82("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str83("%FN%show-input-cursor\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str84("SHOW-INPUT-CURSOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str85("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str86("%FN%show-input-cursor\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str87("SHOW-INPUT-CURSOR\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str88("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str89("%FN%show-input-cursor\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str90("%FN%show-input-cursor-suite\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str91("SHOW-INPUT-CURSOR-SUITE\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str92("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str93("%FN%show-input-cursor-suite\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str94("SHOW-INPUT-CURSOR-SUITE\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str95("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str96("%FN%show-input-cursor-suite\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str97("SHOW-INPUT-CURSOR-SUITE\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str98("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str99("%FN%show-input-cursor-suite\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str100("SHOW-INPUT-CURSOR-SUITE\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str101("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str102("%FN%show-output-cursor-suite\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str103("SHOW-OUTPUT-CURSOR-SUITE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str104("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str105("%FN%show-output-cursor-suite\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str106("SHOW-OUTPUT-CURSOR-SUITE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str107("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str108("%FN%show-output-cursor-suite\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str109("SHOW-OUTPUT-CURSOR-SUITE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str110("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str111("%FN%show-output-cursor-suite\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str112("SHOW-OUTPUT-CURSOR-SUITE\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str113("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str114("%FN%show-input-cursor-suite\00") : !llvm.array<28 x i8>
  llvm.mlir.global private constant @str115("%FN%show-output-cursor-suite\00") : !llvm.array<29 x i8>
}
