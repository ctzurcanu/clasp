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
  func.func @"%FN%show-element-type"() {
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
    %10 = arith.constant 37 : i64
    %11 = func.call @cc_make_symbol(%9, %10) : (!llvm.ptr, i64) -> i64
    %12 = func.call @cc_set_symbol_value(%11, %8) : (i64, i64) -> i64
    %13 = llvm.mlir.addressof @str2 : !llvm.ptr
    %14 = arith.constant 38 : i64
    %15 = func.call @cc_make_symbol(%13, %14) : (!llvm.ptr, i64) -> i64
    %16 = func.call @cc_set_symbol_value(%15, %8) : (i64, i64) -> i64
    %17 = llvm.mlir.addressof @str3 : !llvm.ptr
    %18 = arith.constant 39 : i64
    %19 = func.call @cc_make_symbol(%17, %18) : (!llvm.ptr, i64) -> i64
    %20 = func.call @cc_set_symbol_value(%19, %8) : (i64, i64) -> i64
    %21 = llvm.mlir.addressof @str4 : !llvm.ptr
    %22 = arith.constant 18 : i64
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
        %125 = arith.constant 13 : i64
        %126 = func.call @cc_make_string(%124, %125) : (!llvm.ptr, i64) -> i64
        %127 = llvm.mlir.addressof @str21 : !llvm.ptr
        %128 = arith.constant 11 : i64
        %129 = func.call @cc_make_string(%127, %128) : (!llvm.ptr, i64) -> i64
        %130 = func.call @cc_intern(%126, %129) : (i64, i64) -> i64
        %131 = func.call @cc_nil_value() : () -> i64
        %132 = func.call @cc_cons(%130, %131) : (i64, i64) -> i64
        %133 = func.call @cc_values_pack(%132) : (i64) -> i64
        func.call @stack_push_pointer(%130) : (i64) -> ()
        %134 = arith.constant 8 : i64
        func.call @stack_push_fixnum(%134) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %135 = func.call @stack_pop_pointer() : () -> i64
        %136 = func.call @stack_pop_pointer() : () -> i64
        %137 = func.call @cc_cons(%136, %135) : (i64, i64) -> i64
        func.call @stack_push_pointer(%137) : (i64) -> ()
        %138 = func.call @stack_pop_pointer() : () -> i64
        %139 = func.call @stack_pop_pointer() : () -> i64
        %140 = func.call @cc_cons(%139, %138) : (i64, i64) -> i64
        func.call @stack_push_pointer(%140) : (i64) -> ()
        %141 = func.call @stack_pop_pointer() : () -> i64
        %142 = func.call @cc_nil_value() : () -> i64
        %143 = func.call @cc_errorp(%46) : (i64) -> i64
        %144 = arith.cmpi ne, %143, %142 : i64
        %145 = arith.cmpi eq, %142, %142 : i64
        %146 = arith.andi %144, %145 : i1
        %147 = scf.if %146 -> (i64) {
          scf.yield %46 : i64
        } else {
          scf.yield %142 : i64
        }
        %148 = func.call @cc_errorp(%57) : (i64) -> i64
        %149 = arith.cmpi ne, %148, %142 : i64
        %150 = arith.cmpi eq, %147, %142 : i64
        %151 = arith.andi %149, %150 : i1
        %152 = scf.if %151 -> (i64) {
          scf.yield %57 : i64
        } else {
          scf.yield %147 : i64
        }
        %153 = func.call @cc_errorp(%68) : (i64) -> i64
        %154 = arith.cmpi ne, %153, %142 : i64
        %155 = arith.cmpi eq, %152, %142 : i64
        %156 = arith.andi %154, %155 : i1
        %157 = scf.if %156 -> (i64) {
          scf.yield %68 : i64
        } else {
          scf.yield %152 : i64
        }
        %158 = func.call @cc_errorp(%79) : (i64) -> i64
        %159 = arith.cmpi ne, %158, %142 : i64
        %160 = arith.cmpi eq, %157, %142 : i64
        %161 = arith.andi %159, %160 : i1
        %162 = scf.if %161 -> (i64) {
          scf.yield %79 : i64
        } else {
          scf.yield %157 : i64
        }
        %163 = func.call @cc_errorp(%90) : (i64) -> i64
        %164 = arith.cmpi ne, %163, %142 : i64
        %165 = arith.cmpi eq, %162, %142 : i64
        %166 = arith.andi %164, %165 : i1
        %167 = scf.if %166 -> (i64) {
          scf.yield %90 : i64
        } else {
          scf.yield %162 : i64
        }
        %168 = func.call @cc_errorp(%101) : (i64) -> i64
        %169 = arith.cmpi ne, %168, %142 : i64
        %170 = arith.cmpi eq, %167, %142 : i64
        %171 = arith.andi %169, %170 : i1
        %172 = scf.if %171 -> (i64) {
          scf.yield %101 : i64
        } else {
          scf.yield %167 : i64
        }
        %173 = func.call @cc_errorp(%112) : (i64) -> i64
        %174 = arith.cmpi ne, %173, %142 : i64
        %175 = arith.cmpi eq, %172, %142 : i64
        %176 = arith.andi %174, %175 : i1
        %177 = scf.if %176 -> (i64) {
          scf.yield %112 : i64
        } else {
          scf.yield %172 : i64
        }
        %178 = func.call @cc_errorp(%123) : (i64) -> i64
        %179 = arith.cmpi ne, %178, %142 : i64
        %180 = arith.cmpi eq, %177, %142 : i64
        %181 = arith.andi %179, %180 : i1
        %182 = scf.if %181 -> (i64) {
          scf.yield %123 : i64
        } else {
          scf.yield %177 : i64
        }
        %183 = func.call @cc_errorp(%141) : (i64) -> i64
        %184 = arith.cmpi ne, %183, %142 : i64
        %185 = arith.cmpi eq, %182, %142 : i64
        %186 = arith.andi %184, %185 : i1
        %187 = scf.if %186 -> (i64) {
          scf.yield %141 : i64
        } else {
          scf.yield %182 : i64
        }
        %188 = arith.cmpi ne, %187, %142 : i64
        scf.if %188 {
          func.call @stack_push_pointer(%187) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%46) : (i64) -> ()
          func.call @stack_push_pointer(%57) : (i64) -> ()
          func.call @stack_push_pointer(%68) : (i64) -> ()
          func.call @stack_push_pointer(%79) : (i64) -> ()
          func.call @stack_push_pointer(%90) : (i64) -> ()
          func.call @stack_push_pointer(%101) : (i64) -> ()
          func.call @stack_push_pointer(%112) : (i64) -> ()
          func.call @stack_push_pointer(%123) : (i64) -> ()
          func.call @stack_push_pointer(%141) : (i64) -> ()
          %189 = llvm.mlir.addressof @str22 : !llvm.ptr
          %190 = func.call @cc_make_function_ref_const(%189) : (!llvm.ptr) -> i64
          %191 = arith.constant 9 : i64
          func.call @cc_funcall_stack(%190, %191) : (i64, i64) -> ()
        }
        %192 = func.call @stack_pop_pointer() : () -> i64
        %193 = func.call @cc_nil_value() : () -> i64
        %194 = func.call @cc_nil_value() : () -> i64
        %195 = func.call @cc_errorp(%193) : (i64) -> i64
        %196 = arith.cmpi ne, %195, %194 : i64
        %197 = scf.if %196 -> (i64) {
          scf.yield %193 : i64
        } else {
          %198 = func.call @cc_nil_value() : () -> i64
          %199 = func.call @cc_nil_value() : () -> i64
          %200 = func.call @cc_errorp(%198) : (i64) -> i64
          %201 = arith.cmpi ne, %200, %199 : i64
          %202 = scf.if %201 -> (i64) {
            scf.yield %198 : i64
          } else {
            %203 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%203) : (i64) -> ()
            %204 = func.call @stack_pop_pointer() : () -> i64
            %205 = llvm.mlir.addressof @str23 : !llvm.ptr
            %206 = arith.constant 12 : i64
            %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%207) : (i64) -> ()
            %208 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%192) : (i64) -> ()
            %209 = func.call @stack_pop_pointer() : () -> i64
            %210 = func.call @cc_nil_value() : () -> i64
            %211 = func.call @cc_errorp(%209) : (i64) -> i64
            %212 = arith.cmpi ne, %211, %210 : i64
            %213 = arith.cmpi eq, %210, %210 : i64
            %214 = arith.andi %212, %213 : i1
            %215 = scf.if %214 -> (i64) {
              scf.yield %209 : i64
            } else {
              scf.yield %210 : i64
            }
            %216 = arith.cmpi ne, %215, %210 : i64
            scf.if %216 {
              func.call @stack_push_pointer(%215) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%209) : (i64) -> ()
              %217 = llvm.mlir.addressof @str24 : !llvm.ptr
              %218 = func.call @cc_make_function_ref_const(%217) : (!llvm.ptr) -> i64
              %219 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%218, %219) : (i64, i64) -> ()
            }
            %220 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%204) : (i64) -> ()
            func.call @stack_push_pointer(%208) : (i64) -> ()
            func.call @stack_push_pointer(%220) : (i64) -> ()
            %221 = llvm.mlir.addressof @str25 : !llvm.ptr
            %222 = func.call @cc_make_function_ref_const(%221) : (!llvm.ptr) -> i64
            %223 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%222, %223) : (i64, i64) -> ()
            %224 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %224 : i64
          }
          %225 = func.call @cc_nil_value() : () -> i64
          %226 = func.call @cc_errorp(%202) : (i64) -> i64
          %227 = arith.cmpi ne, %226, %225 : i64
          %228 = scf.if %227 -> (i64) {
            scf.yield %202 : i64
          } else {
            %229 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%229) : (i64) -> ()
            %230 = func.call @stack_pop_pointer() : () -> i64
            %231 = llvm.mlir.addressof @str26 : !llvm.ptr
            %232 = arith.constant 7 : i64
            %233 = func.call @cc_make_string(%231, %232) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%233) : (i64) -> ()
            %234 = func.call @stack_pop_pointer() : () -> i64
            %235 = arith.constant 33 : i64
            func.call @stack_push_fixnum(%235) : (i64) -> ()
            %236 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%192) : (i64) -> ()
            %237 = func.call @stack_pop_pointer() : () -> i64
            %238 = func.call @cc_nil_value() : () -> i64
            %239 = func.call @cc_errorp(%236) : (i64) -> i64
            %240 = arith.cmpi ne, %239, %238 : i64
            %241 = arith.cmpi eq, %238, %238 : i64
            %242 = arith.andi %240, %241 : i1
            %243 = scf.if %242 -> (i64) {
              scf.yield %236 : i64
            } else {
              scf.yield %238 : i64
            }
            %244 = func.call @cc_errorp(%237) : (i64) -> i64
            %245 = arith.cmpi ne, %244, %238 : i64
            %246 = arith.cmpi eq, %243, %238 : i64
            %247 = arith.andi %245, %246 : i1
            %248 = scf.if %247 -> (i64) {
              scf.yield %237 : i64
            } else {
              scf.yield %243 : i64
            }
            %249 = arith.cmpi ne, %248, %238 : i64
            scf.if %249 {
              func.call @stack_push_pointer(%248) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%236) : (i64) -> ()
              func.call @stack_push_pointer(%237) : (i64) -> ()
              %250 = llvm.mlir.addressof @str27 : !llvm.ptr
              %251 = func.call @cc_make_function_ref_const(%250) : (!llvm.ptr) -> i64
              %252 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%251, %252) : (i64, i64) -> ()
            }
            %253 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%230) : (i64) -> ()
            func.call @stack_push_pointer(%234) : (i64) -> ()
            func.call @stack_push_pointer(%253) : (i64) -> ()
            %254 = llvm.mlir.addressof @str28 : !llvm.ptr
            %255 = func.call @cc_make_function_ref_const(%254) : (!llvm.ptr) -> i64
            %256 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%255, %256) : (i64, i64) -> ()
            %257 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %257 : i64
          }
          %258 = func.call @cc_nil_value() : () -> i64
          %259 = func.call @cc_errorp(%228) : (i64) -> i64
          %260 = arith.cmpi ne, %259, %258 : i64
          %261 = scf.if %260 -> (i64) {
            scf.yield %228 : i64
          } else {
            %262 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%262) : (i64) -> ()
            %263 = func.call @stack_pop_pointer() : () -> i64
            %264 = llvm.mlir.addressof @str29 : !llvm.ptr
            %265 = arith.constant 13 : i64
            %266 = func.call @cc_make_string(%264, %265) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%266) : (i64) -> ()
            %267 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%192) : (i64) -> ()
            %268 = func.call @stack_pop_pointer() : () -> i64
            %269 = llvm.mlir.addressof @str30 : !llvm.ptr
            %270 = arith.constant 9 : i64
            %271 = func.call @cc_make_string(%269, %270) : (!llvm.ptr, i64) -> i64
            %272 = llvm.mlir.addressof @str31 : !llvm.ptr
            %273 = arith.constant 11 : i64
            %274 = func.call @cc_make_string(%272, %273) : (!llvm.ptr, i64) -> i64
            %275 = func.call @cc_intern(%271, %274) : (i64, i64) -> i64
            %276 = func.call @cc_nil_value() : () -> i64
            %277 = func.call @cc_cons(%275, %276) : (i64, i64) -> i64
            %278 = func.call @cc_values_pack(%277) : (i64) -> i64
            func.call @stack_push_pointer(%275) : (i64) -> ()
            %279 = func.call @stack_pop_pointer() : () -> i64
            %280 = func.call @cc_nil_value() : () -> i64
            %281 = func.call @cc_errorp(%268) : (i64) -> i64
            %282 = arith.cmpi ne, %281, %280 : i64
            %283 = arith.cmpi eq, %280, %280 : i64
            %284 = arith.andi %282, %283 : i1
            %285 = scf.if %284 -> (i64) {
              scf.yield %268 : i64
            } else {
              scf.yield %280 : i64
            }
            %286 = func.call @cc_errorp(%279) : (i64) -> i64
            %287 = arith.cmpi ne, %286, %280 : i64
            %288 = arith.cmpi eq, %285, %280 : i64
            %289 = arith.andi %287, %288 : i1
            %290 = scf.if %289 -> (i64) {
              scf.yield %279 : i64
            } else {
              scf.yield %285 : i64
            }
            %291 = arith.cmpi ne, %290, %280 : i64
            scf.if %291 {
              func.call @stack_push_pointer(%290) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%268) : (i64) -> ()
              func.call @stack_push_pointer(%279) : (i64) -> ()
              %292 = llvm.mlir.addressof @str32 : !llvm.ptr
              %293 = func.call @cc_make_function_ref_const(%292) : (!llvm.ptr) -> i64
              %294 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%293, %294) : (i64, i64) -> ()
            }
            %295 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%263) : (i64) -> ()
            func.call @stack_push_pointer(%267) : (i64) -> ()
            func.call @stack_push_pointer(%295) : (i64) -> ()
            %296 = llvm.mlir.addressof @str33 : !llvm.ptr
            %297 = func.call @cc_make_function_ref_const(%296) : (!llvm.ptr) -> i64
            %298 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%297, %298) : (i64, i64) -> ()
            %299 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %299 : i64
          }
          %300 = func.call @cc_nil_value() : () -> i64
          %301 = func.call @cc_errorp(%261) : (i64) -> i64
          %302 = arith.cmpi ne, %301, %300 : i64
          %303 = scf.if %302 -> (i64) {
            scf.yield %261 : i64
          } else {
            %304 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%304) : (i64) -> ()
            %305 = func.call @stack_pop_pointer() : () -> i64
            %306 = llvm.mlir.addressof @str34 : !llvm.ptr
            %307 = arith.constant 7 : i64
            %308 = func.call @cc_make_string(%306, %307) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%308) : (i64) -> ()
            %309 = func.call @stack_pop_pointer() : () -> i64
            %310 = arith.constant 34 : i64
            %311 = func.call @cc_box_character(%310) : (i64) -> i64
            func.call @stack_push_pointer(%311) : (i64) -> ()
            %312 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%192) : (i64) -> ()
            %313 = func.call @stack_pop_pointer() : () -> i64
            %314 = func.call @cc_nil_value() : () -> i64
            %315 = func.call @cc_errorp(%312) : (i64) -> i64
            %316 = arith.cmpi ne, %315, %314 : i64
            %317 = arith.cmpi eq, %314, %314 : i64
            %318 = arith.andi %316, %317 : i1
            %319 = scf.if %318 -> (i64) {
              scf.yield %312 : i64
            } else {
              scf.yield %314 : i64
            }
            %320 = func.call @cc_errorp(%313) : (i64) -> i64
            %321 = arith.cmpi ne, %320, %314 : i64
            %322 = arith.cmpi eq, %319, %314 : i64
            %323 = arith.andi %321, %322 : i1
            %324 = scf.if %323 -> (i64) {
              scf.yield %313 : i64
            } else {
              scf.yield %319 : i64
            }
            %325 = arith.cmpi ne, %324, %314 : i64
            scf.if %325 {
              func.call @stack_push_pointer(%324) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%312) : (i64) -> ()
              func.call @stack_push_pointer(%313) : (i64) -> ()
              %326 = llvm.mlir.addressof @str35 : !llvm.ptr
              %327 = func.call @cc_make_function_ref_const(%326) : (!llvm.ptr) -> i64
              %328 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%327, %328) : (i64, i64) -> ()
            }
            %329 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%305) : (i64) -> ()
            func.call @stack_push_pointer(%309) : (i64) -> ()
            func.call @stack_push_pointer(%329) : (i64) -> ()
            %330 = llvm.mlir.addressof @str36 : !llvm.ptr
            %331 = func.call @cc_make_function_ref_const(%330) : (!llvm.ptr) -> i64
            %332 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%331, %332) : (i64, i64) -> ()
            %333 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %333 : i64
          }
          %334 = func.call @cc_nil_value() : () -> i64
          %335 = func.call @cc_errorp(%303) : (i64) -> i64
          %336 = arith.cmpi ne, %335, %334 : i64
          %337 = scf.if %336 -> (i64) {
            scf.yield %303 : i64
          } else {
            %338 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%338) : (i64) -> ()
            %339 = func.call @stack_pop_pointer() : () -> i64
            %340 = llvm.mlir.addressof @str37 : !llvm.ptr
            %341 = arith.constant 12 : i64
            %342 = func.call @cc_make_string(%340, %341) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%342) : (i64) -> ()
            %343 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%192) : (i64) -> ()
            %344 = func.call @stack_pop_pointer() : () -> i64
            %345 = func.call @cc_nil_value() : () -> i64
            %346 = func.call @cc_errorp(%344) : (i64) -> i64
            %347 = arith.cmpi ne, %346, %345 : i64
            %348 = arith.cmpi eq, %345, %345 : i64
            %349 = arith.andi %347, %348 : i1
            %350 = scf.if %349 -> (i64) {
              scf.yield %344 : i64
            } else {
              scf.yield %345 : i64
            }
            %351 = arith.cmpi ne, %350, %345 : i64
            scf.if %351 {
              func.call @stack_push_pointer(%350) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%344) : (i64) -> ()
              %352 = llvm.mlir.addressof @str38 : !llvm.ptr
              %353 = func.call @cc_make_function_ref_const(%352) : (!llvm.ptr) -> i64
              %354 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%353, %354) : (i64, i64) -> ()
            }
            %355 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%339) : (i64) -> ()
            func.call @stack_push_pointer(%343) : (i64) -> ()
            func.call @stack_push_pointer(%355) : (i64) -> ()
            %356 = llvm.mlir.addressof @str39 : !llvm.ptr
            %357 = func.call @cc_make_function_ref_const(%356) : (!llvm.ptr) -> i64
            %358 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%357, %358) : (i64, i64) -> ()
            %359 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %359 : i64
          }
          func.call @stack_push_pointer(%337) : (i64) -> ()
          %360 = func.call @stack_pop_pointer() : () -> i64
          %361 = func.call @cc_multiple_value_list(%360) : (i64) -> i64
          func.call @stack_push_pointer(%192) : (i64) -> ()
          %362 = func.call @stack_pop_pointer() : () -> i64
          %363 = func.call @cc_nil_value() : () -> i64
          %364 = func.call @cc_errorp(%362) : (i64) -> i64
          %365 = arith.cmpi ne, %364, %363 : i64
          %366 = arith.cmpi eq, %363, %363 : i64
          %367 = arith.andi %365, %366 : i1
          %368 = scf.if %367 -> (i64) {
            scf.yield %362 : i64
          } else {
            scf.yield %363 : i64
          }
          %369 = arith.cmpi ne, %368, %363 : i64
          scf.if %369 {
            func.call @stack_push_pointer(%368) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%362) : (i64) -> ()
            %370 = llvm.mlir.addressof @str40 : !llvm.ptr
            %371 = func.call @cc_make_function_ref_const(%370) : (!llvm.ptr) -> i64
            %372 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%371, %372) : (i64, i64) -> ()
          }
          %373 = func.call @stack_depth() : () -> i64
          %374 = arith.constant 0 : i64
          %375 = arith.cmpi sgt, %373, %374 : i64
          scf.if %375 {
            %376 = func.call @stack_pop_pointer() : () -> i64
          }
          %377 = func.call @cc_values_pack(%361) : (i64) -> i64
          func.call @stack_push_pointer(%377) : (i64) -> ()
          %378 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %378 : i64
        }
        func.call @stack_push_pointer(%197) : (i64) -> ()
        %379 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %379 : i64
      }
      %380 = func.call @cc_nil_value() : () -> i64
      %381 = func.call @cc_errorp(%45) : (i64) -> i64
      %382 = arith.cmpi ne, %381, %380 : i64
      %383 = scf.if %382 -> (i64) {
        scf.yield %45 : i64
      } else {
        func.call @stack_push_pointer(%35) : (i64) -> ()
        %384 = func.call @stack_pop_pointer() : () -> i64
        %385 = llvm.mlir.addressof @str41 : !llvm.ptr
        %386 = arith.constant 9 : i64
        %387 = func.call @cc_make_string(%385, %386) : (!llvm.ptr, i64) -> i64
        %388 = llvm.mlir.addressof @str42 : !llvm.ptr
        %389 = arith.constant 7 : i64
        %390 = func.call @cc_make_string(%388, %389) : (!llvm.ptr, i64) -> i64
        %391 = func.call @cc_intern(%387, %390) : (i64, i64) -> i64
        %392 = func.call @cc_nil_value() : () -> i64
        %393 = func.call @cc_cons(%391, %392) : (i64, i64) -> i64
        %394 = func.call @cc_values_pack(%393) : (i64) -> i64
        func.call @stack_push_pointer(%391) : (i64) -> ()
        %395 = func.call @stack_pop_pointer() : () -> i64
        %396 = llvm.mlir.addressof @str43 : !llvm.ptr
        %397 = arith.constant 5 : i64
        %398 = func.call @cc_make_string(%396, %397) : (!llvm.ptr, i64) -> i64
        %399 = llvm.mlir.addressof @str44 : !llvm.ptr
        %400 = arith.constant 7 : i64
        %401 = func.call @cc_make_string(%399, %400) : (!llvm.ptr, i64) -> i64
        %402 = func.call @cc_intern(%398, %401) : (i64, i64) -> i64
        %403 = func.call @cc_nil_value() : () -> i64
        %404 = func.call @cc_cons(%402, %403) : (i64, i64) -> i64
        %405 = func.call @cc_values_pack(%404) : (i64) -> i64
        func.call @stack_push_pointer(%402) : (i64) -> ()
        %406 = func.call @stack_pop_pointer() : () -> i64
        %407 = llvm.mlir.addressof @str45 : !llvm.ptr
        %408 = arith.constant 12 : i64
        %409 = func.call @cc_make_string(%407, %408) : (!llvm.ptr, i64) -> i64
        %410 = llvm.mlir.addressof @str46 : !llvm.ptr
        %411 = arith.constant 7 : i64
        %412 = func.call @cc_make_string(%410, %411) : (!llvm.ptr, i64) -> i64
        %413 = func.call @cc_intern(%409, %412) : (i64, i64) -> i64
        %414 = func.call @cc_nil_value() : () -> i64
        %415 = func.call @cc_cons(%413, %414) : (i64, i64) -> i64
        %416 = func.call @cc_values_pack(%415) : (i64) -> i64
        func.call @stack_push_pointer(%413) : (i64) -> ()
        %417 = func.call @stack_pop_pointer() : () -> i64
        %418 = llvm.mlir.addressof @str47 : !llvm.ptr
        %419 = arith.constant 13 : i64
        %420 = func.call @cc_make_string(%418, %419) : (!llvm.ptr, i64) -> i64
        %421 = llvm.mlir.addressof @str48 : !llvm.ptr
        %422 = arith.constant 11 : i64
        %423 = func.call @cc_make_string(%421, %422) : (!llvm.ptr, i64) -> i64
        %424 = func.call @cc_intern(%420, %423) : (i64, i64) -> i64
        %425 = func.call @cc_nil_value() : () -> i64
        %426 = func.call @cc_cons(%424, %425) : (i64, i64) -> i64
        %427 = func.call @cc_values_pack(%426) : (i64) -> i64
        func.call @stack_push_pointer(%424) : (i64) -> ()
        %428 = arith.constant 8 : i64
        func.call @stack_push_fixnum(%428) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %429 = func.call @stack_pop_pointer() : () -> i64
        %430 = func.call @stack_pop_pointer() : () -> i64
        %431 = func.call @cc_cons(%430, %429) : (i64, i64) -> i64
        func.call @stack_push_pointer(%431) : (i64) -> ()
        %432 = func.call @stack_pop_pointer() : () -> i64
        %433 = func.call @stack_pop_pointer() : () -> i64
        %434 = func.call @cc_cons(%433, %432) : (i64, i64) -> i64
        func.call @stack_push_pointer(%434) : (i64) -> ()
        %435 = func.call @stack_pop_pointer() : () -> i64
        %436 = func.call @cc_nil_value() : () -> i64
        %437 = func.call @cc_errorp(%384) : (i64) -> i64
        %438 = arith.cmpi ne, %437, %436 : i64
        %439 = arith.cmpi eq, %436, %436 : i64
        %440 = arith.andi %438, %439 : i1
        %441 = scf.if %440 -> (i64) {
          scf.yield %384 : i64
        } else {
          scf.yield %436 : i64
        }
        %442 = func.call @cc_errorp(%395) : (i64) -> i64
        %443 = arith.cmpi ne, %442, %436 : i64
        %444 = arith.cmpi eq, %441, %436 : i64
        %445 = arith.andi %443, %444 : i1
        %446 = scf.if %445 -> (i64) {
          scf.yield %395 : i64
        } else {
          scf.yield %441 : i64
        }
        %447 = func.call @cc_errorp(%406) : (i64) -> i64
        %448 = arith.cmpi ne, %447, %436 : i64
        %449 = arith.cmpi eq, %446, %436 : i64
        %450 = arith.andi %448, %449 : i1
        %451 = scf.if %450 -> (i64) {
          scf.yield %406 : i64
        } else {
          scf.yield %446 : i64
        }
        %452 = func.call @cc_errorp(%417) : (i64) -> i64
        %453 = arith.cmpi ne, %452, %436 : i64
        %454 = arith.cmpi eq, %451, %436 : i64
        %455 = arith.andi %453, %454 : i1
        %456 = scf.if %455 -> (i64) {
          scf.yield %417 : i64
        } else {
          scf.yield %451 : i64
        }
        %457 = func.call @cc_errorp(%435) : (i64) -> i64
        %458 = arith.cmpi ne, %457, %436 : i64
        %459 = arith.cmpi eq, %456, %436 : i64
        %460 = arith.andi %458, %459 : i1
        %461 = scf.if %460 -> (i64) {
          scf.yield %435 : i64
        } else {
          scf.yield %456 : i64
        }
        %462 = arith.cmpi ne, %461, %436 : i64
        scf.if %462 {
          func.call @stack_push_pointer(%461) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%384) : (i64) -> ()
          func.call @stack_push_pointer(%395) : (i64) -> ()
          func.call @stack_push_pointer(%406) : (i64) -> ()
          func.call @stack_push_pointer(%417) : (i64) -> ()
          func.call @stack_push_pointer(%435) : (i64) -> ()
          %463 = llvm.mlir.addressof @str49 : !llvm.ptr
          %464 = func.call @cc_make_function_ref_const(%463) : (!llvm.ptr) -> i64
          %465 = arith.constant 5 : i64
          func.call @cc_funcall_stack(%464, %465) : (i64, i64) -> ()
        }
        %466 = func.call @stack_pop_pointer() : () -> i64
        %467 = func.call @cc_nil_value() : () -> i64
        %468 = func.call @cc_nil_value() : () -> i64
        %469 = func.call @cc_errorp(%467) : (i64) -> i64
        %470 = arith.cmpi ne, %469, %468 : i64
        %471 = scf.if %470 -> (i64) {
          scf.yield %467 : i64
        } else {
          %472 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%472) : (i64) -> ()
          %473 = func.call @stack_pop_pointer() : () -> i64
          %474 = llvm.mlir.addressof @str50 : !llvm.ptr
          %475 = arith.constant 8 : i64
          %476 = func.call @cc_make_string(%474, %475) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%476) : (i64) -> ()
          %477 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%466) : (i64) -> ()
          %478 = func.call @stack_pop_pointer() : () -> i64
          %479 = func.call @cc_nil_value() : () -> i64
          %480 = func.call @cc_errorp(%478) : (i64) -> i64
          %481 = arith.cmpi ne, %480, %479 : i64
          %482 = arith.cmpi eq, %479, %479 : i64
          %483 = arith.andi %481, %482 : i1
          %484 = scf.if %483 -> (i64) {
            scf.yield %478 : i64
          } else {
            scf.yield %479 : i64
          }
          %485 = arith.cmpi ne, %484, %479 : i64
          scf.if %485 {
            func.call @stack_push_pointer(%484) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%478) : (i64) -> ()
            %486 = llvm.mlir.addressof @str51 : !llvm.ptr
            %487 = func.call @cc_make_function_ref_const(%486) : (!llvm.ptr) -> i64
            %488 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%487, %488) : (i64, i64) -> ()
          }
          %489 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%466) : (i64) -> ()
          %490 = func.call @stack_pop_pointer() : () -> i64
          %491 = func.call @cc_nil_value() : () -> i64
          %492 = func.call @cc_errorp(%490) : (i64) -> i64
          %493 = arith.cmpi ne, %492, %491 : i64
          %494 = arith.cmpi eq, %491, %491 : i64
          %495 = arith.andi %493, %494 : i1
          %496 = scf.if %495 -> (i64) {
            scf.yield %490 : i64
          } else {
            scf.yield %491 : i64
          }
          %497 = arith.cmpi ne, %496, %491 : i64
          scf.if %497 {
            func.call @stack_push_pointer(%496) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%490) : (i64) -> ()
            %498 = llvm.mlir.addressof @str52 : !llvm.ptr
            %499 = func.call @cc_make_function_ref_const(%498) : (!llvm.ptr) -> i64
            %500 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%499, %500) : (i64, i64) -> ()
          }
          %501 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%466) : (i64) -> ()
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
            %510 = llvm.mlir.addressof @str53 : !llvm.ptr
            %511 = func.call @cc_make_function_ref_const(%510) : (!llvm.ptr) -> i64
            %512 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%511, %512) : (i64, i64) -> ()
          }
          %513 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%466) : (i64) -> ()
          %514 = func.call @stack_pop_pointer() : () -> i64
          %515 = func.call @cc_nil_value() : () -> i64
          %516 = func.call @cc_errorp(%514) : (i64) -> i64
          %517 = arith.cmpi ne, %516, %515 : i64
          %518 = arith.cmpi eq, %515, %515 : i64
          %519 = arith.andi %517, %518 : i1
          %520 = scf.if %519 -> (i64) {
            scf.yield %514 : i64
          } else {
            scf.yield %515 : i64
          }
          %521 = arith.cmpi ne, %520, %515 : i64
          scf.if %521 {
            func.call @stack_push_pointer(%520) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%514) : (i64) -> ()
            %522 = llvm.mlir.addressof @str54 : !llvm.ptr
            %523 = func.call @cc_make_function_ref_const(%522) : (!llvm.ptr) -> i64
            %524 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%523, %524) : (i64, i64) -> ()
          }
          %525 = func.call @stack_pop_pointer() : () -> i64
          %526 = func.call @cc_nil_value() : () -> i64
          %527 = func.call @cc_errorp(%489) : (i64) -> i64
          %528 = arith.cmpi ne, %527, %526 : i64
          %529 = arith.cmpi eq, %526, %526 : i64
          %530 = arith.andi %528, %529 : i1
          %531 = scf.if %530 -> (i64) {
            scf.yield %489 : i64
          } else {
            scf.yield %526 : i64
          }
          %532 = func.call @cc_errorp(%501) : (i64) -> i64
          %533 = arith.cmpi ne, %532, %526 : i64
          %534 = arith.cmpi eq, %531, %526 : i64
          %535 = arith.andi %533, %534 : i1
          %536 = scf.if %535 -> (i64) {
            scf.yield %501 : i64
          } else {
            scf.yield %531 : i64
          }
          %537 = func.call @cc_errorp(%513) : (i64) -> i64
          %538 = arith.cmpi ne, %537, %526 : i64
          %539 = arith.cmpi eq, %536, %526 : i64
          %540 = arith.andi %538, %539 : i1
          %541 = scf.if %540 -> (i64) {
            scf.yield %513 : i64
          } else {
            scf.yield %536 : i64
          }
          %542 = func.call @cc_errorp(%525) : (i64) -> i64
          %543 = arith.cmpi ne, %542, %526 : i64
          %544 = arith.cmpi eq, %541, %526 : i64
          %545 = arith.andi %543, %544 : i1
          %546 = scf.if %545 -> (i64) {
            scf.yield %525 : i64
          } else {
            scf.yield %541 : i64
          }
          %547 = arith.cmpi ne, %546, %526 : i64
          scf.if %547 {
            func.call @stack_push_pointer(%546) : (i64) -> ()
          } else {
            %548 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%548) : (i64) -> ()
            func.call @stack_push_pointer(%525) : (i64) -> ()
            %549 = func.call @stack_pop_pointer() : () -> i64
            %550 = func.call @stack_pop_pointer() : () -> i64
            %551 = func.call @cc_cons(%549, %550) : (i64, i64) -> i64
            func.call @stack_push_pointer(%551) : (i64) -> ()
            func.call @stack_push_pointer(%513) : (i64) -> ()
            %552 = func.call @stack_pop_pointer() : () -> i64
            %553 = func.call @stack_pop_pointer() : () -> i64
            %554 = func.call @cc_cons(%552, %553) : (i64, i64) -> i64
            func.call @stack_push_pointer(%554) : (i64) -> ()
            func.call @stack_push_pointer(%501) : (i64) -> ()
            %555 = func.call @stack_pop_pointer() : () -> i64
            %556 = func.call @stack_pop_pointer() : () -> i64
            %557 = func.call @cc_cons(%555, %556) : (i64, i64) -> i64
            func.call @stack_push_pointer(%557) : (i64) -> ()
            func.call @stack_push_pointer(%489) : (i64) -> ()
            %558 = func.call @stack_pop_pointer() : () -> i64
            %559 = func.call @stack_pop_pointer() : () -> i64
            %560 = func.call @cc_cons(%558, %559) : (i64, i64) -> i64
            func.call @stack_push_pointer(%560) : (i64) -> ()
          }
          %561 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%473) : (i64) -> ()
          func.call @stack_push_pointer(%477) : (i64) -> ()
          func.call @stack_push_pointer(%561) : (i64) -> ()
          %562 = llvm.mlir.addressof @str55 : !llvm.ptr
          %563 = func.call @cc_make_function_ref_const(%562) : (!llvm.ptr) -> i64
          %564 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%563, %564) : (i64, i64) -> ()
          %565 = func.call @stack_pop_pointer() : () -> i64
          %566 = func.call @cc_multiple_value_list(%565) : (i64) -> i64
          func.call @stack_push_pointer(%466) : (i64) -> ()
          %567 = func.call @stack_pop_pointer() : () -> i64
          %568 = func.call @cc_nil_value() : () -> i64
          %569 = func.call @cc_errorp(%567) : (i64) -> i64
          %570 = arith.cmpi ne, %569, %568 : i64
          %571 = arith.cmpi eq, %568, %568 : i64
          %572 = arith.andi %570, %571 : i1
          %573 = scf.if %572 -> (i64) {
            scf.yield %567 : i64
          } else {
            scf.yield %568 : i64
          }
          %574 = arith.cmpi ne, %573, %568 : i64
          scf.if %574 {
            func.call @stack_push_pointer(%573) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%567) : (i64) -> ()
            %575 = llvm.mlir.addressof @str56 : !llvm.ptr
            %576 = func.call @cc_make_function_ref_const(%575) : (!llvm.ptr) -> i64
            %577 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%576, %577) : (i64, i64) -> ()
          }
          %578 = func.call @stack_depth() : () -> i64
          %579 = arith.constant 0 : i64
          %580 = arith.cmpi sgt, %578, %579 : i64
          scf.if %580 {
            %581 = func.call @stack_pop_pointer() : () -> i64
          }
          %582 = func.call @cc_values_pack(%566) : (i64) -> i64
          func.call @stack_push_pointer(%582) : (i64) -> ()
          %583 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %583 : i64
        }
        func.call @stack_push_pointer(%471) : (i64) -> ()
        %584 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %584 : i64
      }
      %585 = func.call @cc_nil_value() : () -> i64
      %586 = func.call @cc_errorp(%383) : (i64) -> i64
      %587 = arith.cmpi ne, %586, %585 : i64
      %588 = scf.if %587 -> (i64) {
        scf.yield %383 : i64
      } else {
        func.call @stack_push_pointer(%35) : (i64) -> ()
        %589 = func.call @stack_pop_pointer() : () -> i64
        %590 = llvm.mlir.addressof @str57 : !llvm.ptr
        %591 = arith.constant 9 : i64
        %592 = func.call @cc_make_string(%590, %591) : (!llvm.ptr, i64) -> i64
        %593 = llvm.mlir.addressof @str58 : !llvm.ptr
        %594 = arith.constant 7 : i64
        %595 = func.call @cc_make_string(%593, %594) : (!llvm.ptr, i64) -> i64
        %596 = func.call @cc_intern(%592, %595) : (i64, i64) -> i64
        %597 = func.call @cc_nil_value() : () -> i64
        %598 = func.call @cc_cons(%596, %597) : (i64, i64) -> i64
        %599 = func.call @cc_values_pack(%598) : (i64) -> i64
        func.call @stack_push_pointer(%596) : (i64) -> ()
        %600 = func.call @stack_pop_pointer() : () -> i64
        %601 = llvm.mlir.addressof @str59 : !llvm.ptr
        %602 = arith.constant 5 : i64
        %603 = func.call @cc_make_string(%601, %602) : (!llvm.ptr, i64) -> i64
        %604 = llvm.mlir.addressof @str60 : !llvm.ptr
        %605 = arith.constant 7 : i64
        %606 = func.call @cc_make_string(%604, %605) : (!llvm.ptr, i64) -> i64
        %607 = func.call @cc_intern(%603, %606) : (i64, i64) -> i64
        %608 = func.call @cc_nil_value() : () -> i64
        %609 = func.call @cc_cons(%607, %608) : (i64, i64) -> i64
        %610 = func.call @cc_values_pack(%609) : (i64) -> i64
        func.call @stack_push_pointer(%607) : (i64) -> ()
        %611 = func.call @stack_pop_pointer() : () -> i64
        %612 = llvm.mlir.addressof @str61 : !llvm.ptr
        %613 = arith.constant 12 : i64
        %614 = func.call @cc_make_string(%612, %613) : (!llvm.ptr, i64) -> i64
        %615 = llvm.mlir.addressof @str62 : !llvm.ptr
        %616 = arith.constant 7 : i64
        %617 = func.call @cc_make_string(%615, %616) : (!llvm.ptr, i64) -> i64
        %618 = func.call @cc_intern(%614, %617) : (i64, i64) -> i64
        %619 = func.call @cc_nil_value() : () -> i64
        %620 = func.call @cc_cons(%618, %619) : (i64, i64) -> i64
        %621 = func.call @cc_values_pack(%620) : (i64) -> i64
        func.call @stack_push_pointer(%618) : (i64) -> ()
        %622 = func.call @stack_pop_pointer() : () -> i64
        %623 = llvm.mlir.addressof @str63 : !llvm.ptr
        %624 = arith.constant 13 : i64
        %625 = func.call @cc_make_string(%623, %624) : (!llvm.ptr, i64) -> i64
        %626 = llvm.mlir.addressof @str64 : !llvm.ptr
        %627 = arith.constant 11 : i64
        %628 = func.call @cc_make_string(%626, %627) : (!llvm.ptr, i64) -> i64
        %629 = func.call @cc_intern(%625, %628) : (i64, i64) -> i64
        %630 = func.call @cc_nil_value() : () -> i64
        %631 = func.call @cc_cons(%629, %630) : (i64, i64) -> i64
        %632 = func.call @cc_values_pack(%631) : (i64) -> i64
        func.call @stack_push_pointer(%629) : (i64) -> ()
        %633 = arith.constant 8 : i64
        func.call @stack_push_fixnum(%633) : (i64) -> ()
        func.call @stack_push_nil() : () -> ()
        %634 = func.call @stack_pop_pointer() : () -> i64
        %635 = func.call @stack_pop_pointer() : () -> i64
        %636 = func.call @cc_cons(%635, %634) : (i64, i64) -> i64
        func.call @stack_push_pointer(%636) : (i64) -> ()
        %637 = func.call @stack_pop_pointer() : () -> i64
        %638 = func.call @stack_pop_pointer() : () -> i64
        %639 = func.call @cc_cons(%638, %637) : (i64, i64) -> i64
        func.call @stack_push_pointer(%639) : (i64) -> ()
        %640 = func.call @stack_pop_pointer() : () -> i64
        %641 = func.call @cc_nil_value() : () -> i64
        %642 = func.call @cc_errorp(%589) : (i64) -> i64
        %643 = arith.cmpi ne, %642, %641 : i64
        %644 = arith.cmpi eq, %641, %641 : i64
        %645 = arith.andi %643, %644 : i1
        %646 = scf.if %645 -> (i64) {
          scf.yield %589 : i64
        } else {
          scf.yield %641 : i64
        }
        %647 = func.call @cc_errorp(%600) : (i64) -> i64
        %648 = arith.cmpi ne, %647, %641 : i64
        %649 = arith.cmpi eq, %646, %641 : i64
        %650 = arith.andi %648, %649 : i1
        %651 = scf.if %650 -> (i64) {
          scf.yield %600 : i64
        } else {
          scf.yield %646 : i64
        }
        %652 = func.call @cc_errorp(%611) : (i64) -> i64
        %653 = arith.cmpi ne, %652, %641 : i64
        %654 = arith.cmpi eq, %651, %641 : i64
        %655 = arith.andi %653, %654 : i1
        %656 = scf.if %655 -> (i64) {
          scf.yield %611 : i64
        } else {
          scf.yield %651 : i64
        }
        %657 = func.call @cc_errorp(%622) : (i64) -> i64
        %658 = arith.cmpi ne, %657, %641 : i64
        %659 = arith.cmpi eq, %656, %641 : i64
        %660 = arith.andi %658, %659 : i1
        %661 = scf.if %660 -> (i64) {
          scf.yield %622 : i64
        } else {
          scf.yield %656 : i64
        }
        %662 = func.call @cc_errorp(%640) : (i64) -> i64
        %663 = arith.cmpi ne, %662, %641 : i64
        %664 = arith.cmpi eq, %661, %641 : i64
        %665 = arith.andi %663, %664 : i1
        %666 = scf.if %665 -> (i64) {
          scf.yield %640 : i64
        } else {
          scf.yield %661 : i64
        }
        %667 = arith.cmpi ne, %666, %641 : i64
        scf.if %667 {
          func.call @stack_push_pointer(%666) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%589) : (i64) -> ()
          func.call @stack_push_pointer(%600) : (i64) -> ()
          func.call @stack_push_pointer(%611) : (i64) -> ()
          func.call @stack_push_pointer(%622) : (i64) -> ()
          func.call @stack_push_pointer(%640) : (i64) -> ()
          %668 = llvm.mlir.addressof @str65 : !llvm.ptr
          %669 = func.call @cc_make_function_ref_const(%668) : (!llvm.ptr) -> i64
          %670 = arith.constant 5 : i64
          func.call @cc_funcall_stack(%669, %670) : (i64, i64) -> ()
        }
        %671 = func.call @stack_pop_pointer() : () -> i64
        %672 = func.call @cc_nil_value() : () -> i64
        %673 = func.call @cc_nil_value() : () -> i64
        %674 = func.call @cc_errorp(%672) : (i64) -> i64
        %675 = arith.cmpi ne, %674, %673 : i64
        %676 = scf.if %675 -> (i64) {
          scf.yield %672 : i64
        } else {
          %677 = func.call @cc_nil_value() : () -> i64
          %678 = func.call @cc_nil_value() : () -> i64
          %679 = func.call @cc_errorp(%677) : (i64) -> i64
          %680 = arith.cmpi ne, %679, %678 : i64
          %681 = scf.if %680 -> (i64) {
            scf.yield %677 : i64
          } else {
            %682 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%682) : (i64) -> ()
            %683 = func.call @stack_pop_pointer() : () -> i64
            %684 = llvm.mlir.addressof @str66 : !llvm.ptr
            %685 = arith.constant 12 : i64
            %686 = func.call @cc_make_string(%684, %685) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%686) : (i64) -> ()
            %687 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%671) : (i64) -> ()
            %688 = func.call @stack_pop_pointer() : () -> i64
            %689 = func.call @cc_nil_value() : () -> i64
            %690 = func.call @cc_errorp(%688) : (i64) -> i64
            %691 = arith.cmpi ne, %690, %689 : i64
            %692 = arith.cmpi eq, %689, %689 : i64
            %693 = arith.andi %691, %692 : i1
            %694 = scf.if %693 -> (i64) {
              scf.yield %688 : i64
            } else {
              scf.yield %689 : i64
            }
            %695 = arith.cmpi ne, %694, %689 : i64
            scf.if %695 {
              func.call @stack_push_pointer(%694) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%688) : (i64) -> ()
              %696 = llvm.mlir.addressof @str67 : !llvm.ptr
              %697 = func.call @cc_make_function_ref_const(%696) : (!llvm.ptr) -> i64
              %698 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%697, %698) : (i64, i64) -> ()
            }
            %699 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%683) : (i64) -> ()
            func.call @stack_push_pointer(%687) : (i64) -> ()
            func.call @stack_push_pointer(%699) : (i64) -> ()
            %700 = llvm.mlir.addressof @str68 : !llvm.ptr
            %701 = func.call @cc_make_function_ref_const(%700) : (!llvm.ptr) -> i64
            %702 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%701, %702) : (i64, i64) -> ()
            %703 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %703 : i64
          }
          %704 = func.call @cc_nil_value() : () -> i64
          %705 = func.call @cc_errorp(%681) : (i64) -> i64
          %706 = arith.cmpi ne, %705, %704 : i64
          %707 = scf.if %706 -> (i64) {
            scf.yield %681 : i64
          } else {
            %708 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%708) : (i64) -> ()
            %709 = func.call @stack_pop_pointer() : () -> i64
            %710 = llvm.mlir.addressof @str69 : !llvm.ptr
            %711 = arith.constant 12 : i64
            %712 = func.call @cc_make_string(%710, %711) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%712) : (i64) -> ()
            %713 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%671) : (i64) -> ()
            %714 = func.call @stack_pop_pointer() : () -> i64
            %715 = func.call @cc_nil_value() : () -> i64
            %716 = func.call @cc_errorp(%714) : (i64) -> i64
            %717 = arith.cmpi ne, %716, %715 : i64
            %718 = arith.cmpi eq, %715, %715 : i64
            %719 = arith.andi %717, %718 : i1
            %720 = scf.if %719 -> (i64) {
              scf.yield %714 : i64
            } else {
              scf.yield %715 : i64
            }
            %721 = arith.cmpi ne, %720, %715 : i64
            scf.if %721 {
              func.call @stack_push_pointer(%720) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%714) : (i64) -> ()
              %722 = llvm.mlir.addressof @str70 : !llvm.ptr
              %723 = func.call @cc_make_function_ref_const(%722) : (!llvm.ptr) -> i64
              %724 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%723, %724) : (i64, i64) -> ()
            }
            %725 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%709) : (i64) -> ()
            func.call @stack_push_pointer(%713) : (i64) -> ()
            func.call @stack_push_pointer(%725) : (i64) -> ()
            %726 = llvm.mlir.addressof @str71 : !llvm.ptr
            %727 = func.call @cc_make_function_ref_const(%726) : (!llvm.ptr) -> i64
            %728 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%727, %728) : (i64, i64) -> ()
            %729 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %729 : i64
          }
          %730 = func.call @cc_nil_value() : () -> i64
          %731 = func.call @cc_errorp(%707) : (i64) -> i64
          %732 = arith.cmpi ne, %731, %730 : i64
          %733 = scf.if %732 -> (i64) {
            scf.yield %707 : i64
          } else {
            %734 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%734) : (i64) -> ()
            %735 = func.call @stack_pop_pointer() : () -> i64
            %736 = llvm.mlir.addressof @str72 : !llvm.ptr
            %737 = arith.constant 17 : i64
            %738 = func.call @cc_make_string(%736, %737) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%738) : (i64) -> ()
            %739 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%671) : (i64) -> ()
            %740 = func.call @stack_pop_pointer() : () -> i64
            %741 = llvm.mlir.addressof @str73 : !llvm.ptr
            %742 = arith.constant 9 : i64
            %743 = func.call @cc_make_string(%741, %742) : (!llvm.ptr, i64) -> i64
            %744 = llvm.mlir.addressof @str74 : !llvm.ptr
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
              %764 = llvm.mlir.addressof @str75 : !llvm.ptr
              %765 = func.call @cc_make_function_ref_const(%764) : (!llvm.ptr) -> i64
              %766 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%765, %766) : (i64, i64) -> ()
            }
            %767 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%735) : (i64) -> ()
            func.call @stack_push_pointer(%739) : (i64) -> ()
            func.call @stack_push_pointer(%767) : (i64) -> ()
            %768 = llvm.mlir.addressof @str76 : !llvm.ptr
            %769 = func.call @cc_make_function_ref_const(%768) : (!llvm.ptr) -> i64
            %770 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%769, %770) : (i64, i64) -> ()
            %771 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %771 : i64
          }
          %772 = func.call @cc_nil_value() : () -> i64
          %773 = func.call @cc_errorp(%733) : (i64) -> i64
          %774 = arith.cmpi ne, %773, %772 : i64
          %775 = scf.if %774 -> (i64) {
            scf.yield %733 : i64
          } else {
            %776 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%776) : (i64) -> ()
            %777 = func.call @stack_pop_pointer() : () -> i64
            %778 = llvm.mlir.addressof @str77 : !llvm.ptr
            %779 = arith.constant 11 : i64
            %780 = func.call @cc_make_string(%778, %779) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%780) : (i64) -> ()
            %781 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%671) : (i64) -> ()
            %782 = func.call @stack_pop_pointer() : () -> i64
            %783 = func.call @cc_nil_value() : () -> i64
            %784 = func.call @cc_errorp(%782) : (i64) -> i64
            %785 = arith.cmpi ne, %784, %783 : i64
            %786 = arith.cmpi eq, %783, %783 : i64
            %787 = arith.andi %785, %786 : i1
            %788 = scf.if %787 -> (i64) {
              scf.yield %782 : i64
            } else {
              scf.yield %783 : i64
            }
            %789 = arith.cmpi ne, %788, %783 : i64
            scf.if %789 {
              func.call @stack_push_pointer(%788) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%782) : (i64) -> ()
              %790 = llvm.mlir.addressof @str78 : !llvm.ptr
              %791 = func.call @cc_make_function_ref_const(%790) : (!llvm.ptr) -> i64
              %792 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%791, %792) : (i64, i64) -> ()
            }
            %793 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%777) : (i64) -> ()
            func.call @stack_push_pointer(%781) : (i64) -> ()
            func.call @stack_push_pointer(%793) : (i64) -> ()
            %794 = llvm.mlir.addressof @str79 : !llvm.ptr
            %795 = func.call @cc_make_function_ref_const(%794) : (!llvm.ptr) -> i64
            %796 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%795, %796) : (i64, i64) -> ()
            %797 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %797 : i64
          }
          %798 = func.call @cc_nil_value() : () -> i64
          %799 = func.call @cc_errorp(%775) : (i64) -> i64
          %800 = arith.cmpi ne, %799, %798 : i64
          %801 = scf.if %800 -> (i64) {
            scf.yield %775 : i64
          } else {
            %802 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%802) : (i64) -> ()
            %803 = func.call @stack_pop_pointer() : () -> i64
            %804 = llvm.mlir.addressof @str80 : !llvm.ptr
            %805 = arith.constant 11 : i64
            %806 = func.call @cc_make_string(%804, %805) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%806) : (i64) -> ()
            %807 = func.call @stack_pop_pointer() : () -> i64
            %808 = arith.constant 34 : i64
            %809 = func.call @cc_box_character(%808) : (i64) -> i64
            func.call @stack_push_pointer(%809) : (i64) -> ()
            %810 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%671) : (i64) -> ()
            %811 = func.call @stack_pop_pointer() : () -> i64
            %812 = func.call @cc_nil_value() : () -> i64
            %813 = func.call @cc_errorp(%810) : (i64) -> i64
            %814 = arith.cmpi ne, %813, %812 : i64
            %815 = arith.cmpi eq, %812, %812 : i64
            %816 = arith.andi %814, %815 : i1
            %817 = scf.if %816 -> (i64) {
              scf.yield %810 : i64
            } else {
              scf.yield %812 : i64
            }
            %818 = func.call @cc_errorp(%811) : (i64) -> i64
            %819 = arith.cmpi ne, %818, %812 : i64
            %820 = arith.cmpi eq, %817, %812 : i64
            %821 = arith.andi %819, %820 : i1
            %822 = scf.if %821 -> (i64) {
              scf.yield %811 : i64
            } else {
              scf.yield %817 : i64
            }
            %823 = arith.cmpi ne, %822, %812 : i64
            scf.if %823 {
              func.call @stack_push_pointer(%822) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%810) : (i64) -> ()
              func.call @stack_push_pointer(%811) : (i64) -> ()
              %824 = llvm.mlir.addressof @str81 : !llvm.ptr
              %825 = func.call @cc_make_function_ref_const(%824) : (!llvm.ptr) -> i64
              %826 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%825, %826) : (i64, i64) -> ()
            }
            %827 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%803) : (i64) -> ()
            func.call @stack_push_pointer(%807) : (i64) -> ()
            func.call @stack_push_pointer(%827) : (i64) -> ()
            %828 = llvm.mlir.addressof @str82 : !llvm.ptr
            %829 = func.call @cc_make_function_ref_const(%828) : (!llvm.ptr) -> i64
            %830 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%829, %830) : (i64, i64) -> ()
            %831 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %831 : i64
          }
          %832 = func.call @cc_nil_value() : () -> i64
          %833 = func.call @cc_errorp(%801) : (i64) -> i64
          %834 = arith.cmpi ne, %833, %832 : i64
          %835 = scf.if %834 -> (i64) {
            scf.yield %801 : i64
          } else {
            %836 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%836) : (i64) -> ()
            %837 = func.call @stack_pop_pointer() : () -> i64
            %838 = llvm.mlir.addressof @str83 : !llvm.ptr
            %839 = arith.constant 10 : i64
            %840 = func.call @cc_make_string(%838, %839) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%840) : (i64) -> ()
            %841 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%671) : (i64) -> ()
            %842 = func.call @stack_pop_pointer() : () -> i64
            %843 = func.call @cc_nil_value() : () -> i64
            %844 = func.call @cc_errorp(%842) : (i64) -> i64
            %845 = arith.cmpi ne, %844, %843 : i64
            %846 = arith.cmpi eq, %843, %843 : i64
            %847 = arith.andi %845, %846 : i1
            %848 = scf.if %847 -> (i64) {
              scf.yield %842 : i64
            } else {
              scf.yield %843 : i64
            }
            %849 = arith.cmpi ne, %848, %843 : i64
            scf.if %849 {
              func.call @stack_push_pointer(%848) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%842) : (i64) -> ()
              %850 = llvm.mlir.addressof @str84 : !llvm.ptr
              %851 = func.call @cc_make_function_ref_const(%850) : (!llvm.ptr) -> i64
              %852 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%851, %852) : (i64, i64) -> ()
            }
            %853 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%671) : (i64) -> ()
            %854 = func.call @stack_pop_pointer() : () -> i64
            %855 = llvm.mlir.addressof @str85 : !llvm.ptr
            %856 = arith.constant 13 : i64
            %857 = func.call @cc_make_string(%855, %856) : (!llvm.ptr, i64) -> i64
            %858 = llvm.mlir.addressof @str86 : !llvm.ptr
            %859 = arith.constant 11 : i64
            %860 = func.call @cc_make_string(%858, %859) : (!llvm.ptr, i64) -> i64
            %861 = func.call @cc_intern(%857, %860) : (i64, i64) -> i64
            %862 = func.call @cc_nil_value() : () -> i64
            %863 = func.call @cc_cons(%861, %862) : (i64, i64) -> i64
            %864 = func.call @cc_values_pack(%863) : (i64) -> i64
            func.call @stack_push_pointer(%861) : (i64) -> ()
            %865 = arith.constant 8 : i64
            func.call @stack_push_fixnum(%865) : (i64) -> ()
            func.call @stack_push_nil() : () -> ()
            %866 = func.call @stack_pop_pointer() : () -> i64
            %867 = func.call @stack_pop_pointer() : () -> i64
            %868 = func.call @cc_cons(%867, %866) : (i64, i64) -> i64
            func.call @stack_push_pointer(%868) : (i64) -> ()
            %869 = func.call @stack_pop_pointer() : () -> i64
            %870 = func.call @stack_pop_pointer() : () -> i64
            %871 = func.call @cc_cons(%870, %869) : (i64, i64) -> i64
            func.call @stack_push_pointer(%871) : (i64) -> ()
            %872 = func.call @stack_pop_pointer() : () -> i64
            %873 = func.call @cc_nil_value() : () -> i64
            %874 = func.call @cc_errorp(%854) : (i64) -> i64
            %875 = arith.cmpi ne, %874, %873 : i64
            %876 = arith.cmpi eq, %873, %873 : i64
            %877 = arith.andi %875, %876 : i1
            %878 = scf.if %877 -> (i64) {
              scf.yield %854 : i64
            } else {
              scf.yield %873 : i64
            }
            %879 = func.call @cc_errorp(%872) : (i64) -> i64
            %880 = arith.cmpi ne, %879, %873 : i64
            %881 = arith.cmpi eq, %878, %873 : i64
            %882 = arith.andi %880, %881 : i1
            %883 = scf.if %882 -> (i64) {
              scf.yield %872 : i64
            } else {
              scf.yield %878 : i64
            }
            %884 = arith.cmpi ne, %883, %873 : i64
            scf.if %884 {
              func.call @stack_push_pointer(%883) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%854) : (i64) -> ()
              func.call @stack_push_pointer(%872) : (i64) -> ()
              %885 = llvm.mlir.addressof @str87 : !llvm.ptr
              %886 = func.call @cc_make_function_ref_const(%885) : (!llvm.ptr) -> i64
              %887 = arith.constant 2 : i64
              func.call @cc_funcall_stack(%886, %887) : (i64, i64) -> ()
            }
            %888 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%671) : (i64) -> ()
            %889 = func.call @stack_pop_pointer() : () -> i64
            %890 = func.call @cc_nil_value() : () -> i64
            %891 = func.call @cc_errorp(%889) : (i64) -> i64
            %892 = arith.cmpi ne, %891, %890 : i64
            %893 = arith.cmpi eq, %890, %890 : i64
            %894 = arith.andi %892, %893 : i1
            %895 = scf.if %894 -> (i64) {
              scf.yield %889 : i64
            } else {
              scf.yield %890 : i64
            }
            %896 = arith.cmpi ne, %895, %890 : i64
            scf.if %896 {
              func.call @stack_push_pointer(%895) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%889) : (i64) -> ()
              %897 = llvm.mlir.addressof @str88 : !llvm.ptr
              %898 = func.call @cc_make_function_ref_const(%897) : (!llvm.ptr) -> i64
              %899 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%898, %899) : (i64, i64) -> ()
            }
            %900 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%671) : (i64) -> ()
            %901 = func.call @stack_pop_pointer() : () -> i64
            %902 = func.call @cc_nil_value() : () -> i64
            %903 = func.call @cc_errorp(%901) : (i64) -> i64
            %904 = arith.cmpi ne, %903, %902 : i64
            %905 = arith.cmpi eq, %902, %902 : i64
            %906 = arith.andi %904, %905 : i1
            %907 = scf.if %906 -> (i64) {
              scf.yield %901 : i64
            } else {
              scf.yield %902 : i64
            }
            %908 = arith.cmpi ne, %907, %902 : i64
            scf.if %908 {
              func.call @stack_push_pointer(%907) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%901) : (i64) -> ()
              %909 = llvm.mlir.addressof @str89 : !llvm.ptr
              %910 = func.call @cc_make_function_ref_const(%909) : (!llvm.ptr) -> i64
              %911 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%910, %911) : (i64, i64) -> ()
            }
            %912 = func.call @stack_pop_pointer() : () -> i64
            %913 = func.call @cc_nil_value() : () -> i64
            %914 = func.call @cc_errorp(%853) : (i64) -> i64
            %915 = arith.cmpi ne, %914, %913 : i64
            %916 = arith.cmpi eq, %913, %913 : i64
            %917 = arith.andi %915, %916 : i1
            %918 = scf.if %917 -> (i64) {
              scf.yield %853 : i64
            } else {
              scf.yield %913 : i64
            }
            %919 = func.call @cc_errorp(%888) : (i64) -> i64
            %920 = arith.cmpi ne, %919, %913 : i64
            %921 = arith.cmpi eq, %918, %913 : i64
            %922 = arith.andi %920, %921 : i1
            %923 = scf.if %922 -> (i64) {
              scf.yield %888 : i64
            } else {
              scf.yield %918 : i64
            }
            %924 = func.call @cc_errorp(%900) : (i64) -> i64
            %925 = arith.cmpi ne, %924, %913 : i64
            %926 = arith.cmpi eq, %923, %913 : i64
            %927 = arith.andi %925, %926 : i1
            %928 = scf.if %927 -> (i64) {
              scf.yield %900 : i64
            } else {
              scf.yield %923 : i64
            }
            %929 = func.call @cc_errorp(%912) : (i64) -> i64
            %930 = arith.cmpi ne, %929, %913 : i64
            %931 = arith.cmpi eq, %928, %913 : i64
            %932 = arith.andi %930, %931 : i1
            %933 = scf.if %932 -> (i64) {
              scf.yield %912 : i64
            } else {
              scf.yield %928 : i64
            }
            %934 = arith.cmpi ne, %933, %913 : i64
            scf.if %934 {
              func.call @stack_push_pointer(%933) : (i64) -> ()
            } else {
              %935 = func.call @cc_nil_value() : () -> i64
              func.call @stack_push_pointer(%935) : (i64) -> ()
              func.call @stack_push_pointer(%912) : (i64) -> ()
              %936 = func.call @stack_pop_pointer() : () -> i64
              %937 = func.call @stack_pop_pointer() : () -> i64
              %938 = func.call @cc_cons(%936, %937) : (i64, i64) -> i64
              func.call @stack_push_pointer(%938) : (i64) -> ()
              func.call @stack_push_pointer(%900) : (i64) -> ()
              %939 = func.call @stack_pop_pointer() : () -> i64
              %940 = func.call @stack_pop_pointer() : () -> i64
              %941 = func.call @cc_cons(%939, %940) : (i64, i64) -> i64
              func.call @stack_push_pointer(%941) : (i64) -> ()
              func.call @stack_push_pointer(%888) : (i64) -> ()
              %942 = func.call @stack_pop_pointer() : () -> i64
              %943 = func.call @stack_pop_pointer() : () -> i64
              %944 = func.call @cc_cons(%942, %943) : (i64, i64) -> i64
              func.call @stack_push_pointer(%944) : (i64) -> ()
              func.call @stack_push_pointer(%853) : (i64) -> ()
              %945 = func.call @stack_pop_pointer() : () -> i64
              %946 = func.call @stack_pop_pointer() : () -> i64
              %947 = func.call @cc_cons(%945, %946) : (i64, i64) -> i64
              func.call @stack_push_pointer(%947) : (i64) -> ()
            }
            %948 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%837) : (i64) -> ()
            func.call @stack_push_pointer(%841) : (i64) -> ()
            func.call @stack_push_pointer(%948) : (i64) -> ()
            %949 = llvm.mlir.addressof @str90 : !llvm.ptr
            %950 = func.call @cc_make_function_ref_const(%949) : (!llvm.ptr) -> i64
            %951 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%950, %951) : (i64, i64) -> ()
            %952 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %952 : i64
          }
          func.call @stack_push_pointer(%835) : (i64) -> ()
          %953 = func.call @stack_pop_pointer() : () -> i64
          %954 = func.call @cc_multiple_value_list(%953) : (i64) -> i64
          func.call @stack_push_pointer(%671) : (i64) -> ()
          %955 = func.call @stack_pop_pointer() : () -> i64
          %956 = func.call @cc_nil_value() : () -> i64
          %957 = func.call @cc_errorp(%955) : (i64) -> i64
          %958 = arith.cmpi ne, %957, %956 : i64
          %959 = arith.cmpi eq, %956, %956 : i64
          %960 = arith.andi %958, %959 : i1
          %961 = scf.if %960 -> (i64) {
            scf.yield %955 : i64
          } else {
            scf.yield %956 : i64
          }
          %962 = arith.cmpi ne, %961, %956 : i64
          scf.if %962 {
            func.call @stack_push_pointer(%961) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%955) : (i64) -> ()
            %963 = llvm.mlir.addressof @str91 : !llvm.ptr
            %964 = func.call @cc_make_function_ref_const(%963) : (!llvm.ptr) -> i64
            %965 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%964, %965) : (i64, i64) -> ()
          }
          %966 = func.call @stack_depth() : () -> i64
          %967 = arith.constant 0 : i64
          %968 = arith.cmpi sgt, %966, %967 : i64
          scf.if %968 {
            %969 = func.call @stack_pop_pointer() : () -> i64
          }
          %970 = func.call @cc_values_pack(%954) : (i64) -> i64
          func.call @stack_push_pointer(%970) : (i64) -> ()
          %971 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %971 : i64
        }
        func.call @stack_push_pointer(%676) : (i64) -> ()
        %972 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %972 : i64
      }
      func.call @stack_push_pointer(%588) : (i64) -> ()
      %973 = func.call @stack_pop_pointer() : () -> i64
      %974 = func.call @cc_multiple_value_list(%973) : (i64) -> i64
      func.call @stack_push_pointer(%35) : (i64) -> ()
      %975 = func.call @stack_pop_pointer() : () -> i64
      %976 = func.call @cc_nil_value() : () -> i64
      %977 = func.call @cc_errorp(%975) : (i64) -> i64
      %978 = arith.cmpi ne, %977, %976 : i64
      %979 = arith.cmpi eq, %976, %976 : i64
      %980 = arith.andi %978, %979 : i1
      %981 = scf.if %980 -> (i64) {
        scf.yield %975 : i64
      } else {
        scf.yield %976 : i64
      }
      %982 = arith.cmpi ne, %981, %976 : i64
      scf.if %982 {
        func.call @stack_push_pointer(%981) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%975) : (i64) -> ()
        %983 = llvm.mlir.addressof @str92 : !llvm.ptr
        %984 = func.call @cc_make_function_ref_const(%983) : (!llvm.ptr) -> i64
        %985 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%984, %985) : (i64, i64) -> ()
      }
      %986 = func.call @stack_depth() : () -> i64
      %987 = arith.constant 0 : i64
      %988 = arith.cmpi sgt, %986, %987 : i64
      scf.if %988 {
        %989 = func.call @stack_pop_pointer() : () -> i64
      }
      %990 = func.call @cc_values_pack(%974) : (i64) -> i64
      func.call @stack_push_pointer(%990) : (i64) -> ()
      %991 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %991 : i64
    }
    func.call @stack_push_pointer(%40) : (i64) -> ()
    %992 = func.call @stack_pop_pointer() : () -> i64
    %993 = func.call @cc_multiple_value_list(%992) : (i64) -> i64
    %994 = llvm.mlir.addressof @str93 : !llvm.ptr
    %995 = arith.constant 37 : i64
    %996 = func.call @cc_make_symbol(%994, %995) : (!llvm.ptr, i64) -> i64
    %997 = func.call @cc_symbol_value(%996) : (i64) -> i64
    %998 = llvm.mlir.addressof @str94 : !llvm.ptr
    %999 = arith.constant 38 : i64
    %1000 = func.call @cc_make_symbol(%998, %999) : (!llvm.ptr, i64) -> i64
    %1001 = func.call @cc_symbol_value(%1000) : (i64) -> i64
    %1002 = llvm.mlir.addressof @str95 : !llvm.ptr
    %1003 = arith.constant 39 : i64
    %1004 = func.call @cc_make_symbol(%1002, %1003) : (!llvm.ptr, i64) -> i64
    %1005 = func.call @cc_symbol_value(%1004) : (i64) -> i64
    %1006 = func.call @cc_nil_value() : () -> i64
    %1007 = arith.cmpi ne, %997, %1006 : i64
    %1008 = scf.if %1007 -> (i64) {
      scf.yield %1005 : i64
    } else {
      scf.yield %993 : i64
    }
    %1009 = func.call @cc_values_pack(%1008) : (i64) -> i64
    func.call @stack_push_pointer(%1009) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %1010 = llvm.mlir.addressof @str96 : !llvm.ptr
    %1011 = arith.constant 6 : i64
    %1012 = func.call @cc_make_string(%1010, %1011) : (!llvm.ptr, i64) -> i64
    %1013 = func.call @cc_nil_value() : () -> i64
    %1014 = func.call @cc_intern(%1012, %1013) : (i64, i64) -> i64
    %1015 = func.call @cc_nil_value() : () -> i64
    %1016 = func.call @cc_cons(%1014, %1015) : (i64, i64) -> i64
    %1017 = func.call @cc_values_pack(%1016) : (i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%1014) : (i64) -> ()
    %1018 = func.call @cc_nil_value() : () -> i64
    %1019 = func.call @cc_nil_value() : () -> i64
    %1020 = func.call @cc_errorp(%1018) : (i64) -> i64
    %1021 = arith.cmpi ne, %1020, %1019 : i64
    %1022 = scf.if %1021 -> (i64) {
      scf.yield %1018 : i64
    } else {
      %1023 = llvm.mlir.addressof @str97 : !llvm.ptr
      %1024 = arith.constant 11 : i64
      %1025 = func.call @cc_make_string(%1023, %1024) : (!llvm.ptr, i64) -> i64
      %1026 = llvm.mlir.addressof @str98 : !llvm.ptr
      %1027 = arith.constant 7 : i64
      %1028 = func.call @cc_make_string(%1026, %1027) : (!llvm.ptr, i64) -> i64
      %1029 = func.call @cc_intern(%1025, %1028) : (i64, i64) -> i64
      %1030 = func.call @cc_nil_value() : () -> i64
      %1031 = func.call @cc_cons(%1029, %1030) : (i64, i64) -> i64
      %1032 = func.call @cc_values_pack(%1031) : (i64) -> i64
      func.call @stack_push_pointer(%1029) : (i64) -> ()
      %1033 = func.call @stack_pop_pointer() : () -> i64
      %1034 = func.call @cc_in_package(%1033) : (i64) -> i64
      func.call @stack_push_pointer(%1034) : (i64) -> ()
      %1035 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1035 : i64
    }
    %1036 = func.call @cc_nil_value() : () -> i64
    %1037 = func.call @cc_errorp(%1022) : (i64) -> i64
    %1038 = arith.cmpi ne, %1037, %1036 : i64
    %1039 = scf.if %1038 -> (i64) {
      scf.yield %1022 : i64
    } else {
      %1040 = llvm.mlir.addressof @str99 : !llvm.ptr
      %1041 = func.call @cc_make_function_ref_const(%1040) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1041) : (i64) -> ()
      %1042 = func.call @stack_pop_pointer() : () -> i64
      %1043 = llvm.mlir.addressof @str100 : !llvm.ptr
      %1044 = arith.constant 17 : i64
      %1045 = func.call @cc_make_string(%1043, %1044) : (!llvm.ptr, i64) -> i64
      %1046 = llvm.mlir.addressof @str101 : !llvm.ptr
      %1047 = arith.constant 15 : i64
      %1048 = func.call @cc_make_string(%1046, %1047) : (!llvm.ptr, i64) -> i64
      %1049 = func.call @cc_intern(%1045, %1048) : (i64, i64) -> i64
      %1050 = func.call @cc_nil_value() : () -> i64
      %1051 = func.call @cc_cons(%1049, %1050) : (i64, i64) -> i64
      %1052 = func.call @cc_values_pack(%1051) : (i64) -> i64
      %1053 = func.call @cc_set_symbol_value(%1049, %1042) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1042) : (i64) -> ()
      %1054 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1054 : i64
    }
    %1055 = func.call @cc_nil_value() : () -> i64
    %1056 = func.call @cc_errorp(%1039) : (i64) -> i64
    %1057 = arith.cmpi ne, %1056, %1055 : i64
    %1058 = scf.if %1057 -> (i64) {
      scf.yield %1039 : i64
    } else {
      %1059 = llvm.mlir.addressof @str102 : !llvm.ptr
      %1060 = func.call @cc_make_function_ref_const(%1059) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1060) : (i64) -> ()
      %1061 = func.call @stack_pop_pointer() : () -> i64
      %1062 = llvm.mlir.addressof @str103 : !llvm.ptr
      %1063 = arith.constant 17 : i64
      %1064 = func.call @cc_make_string(%1062, %1063) : (!llvm.ptr, i64) -> i64
      %1065 = llvm.mlir.addressof @str104 : !llvm.ptr
      %1066 = arith.constant 15 : i64
      %1067 = func.call @cc_make_string(%1065, %1066) : (!llvm.ptr, i64) -> i64
      %1068 = func.call @cc_intern(%1064, %1067) : (i64, i64) -> i64
      %1069 = func.call @cc_nil_value() : () -> i64
      %1070 = func.call @cc_cons(%1068, %1069) : (i64, i64) -> i64
      %1071 = func.call @cc_values_pack(%1070) : (i64) -> i64
      %1072 = func.call @cc_set_symbol_value(%1068, %1061) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1061) : (i64) -> ()
      %1073 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1073 : i64
    }
    %1074 = func.call @cc_nil_value() : () -> i64
    %1075 = func.call @cc_errorp(%1058) : (i64) -> i64
    %1076 = arith.cmpi ne, %1075, %1074 : i64
    %1077 = scf.if %1076 -> (i64) {
      scf.yield %1058 : i64
    } else {
      %1078 = llvm.mlir.addressof @str105 : !llvm.ptr
      %1079 = func.call @cc_make_function_ref_const(%1078) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1079) : (i64) -> ()
      %1080 = func.call @stack_pop_pointer() : () -> i64
      %1081 = llvm.mlir.addressof @str106 : !llvm.ptr
      %1082 = arith.constant 17 : i64
      %1083 = func.call @cc_make_string(%1081, %1082) : (!llvm.ptr, i64) -> i64
      %1084 = llvm.mlir.addressof @str107 : !llvm.ptr
      %1085 = arith.constant 15 : i64
      %1086 = func.call @cc_make_string(%1084, %1085) : (!llvm.ptr, i64) -> i64
      %1087 = func.call @cc_intern(%1083, %1086) : (i64, i64) -> i64
      %1088 = func.call @cc_nil_value() : () -> i64
      %1089 = func.call @cc_cons(%1087, %1088) : (i64, i64) -> i64
      %1090 = func.call @cc_values_pack(%1089) : (i64) -> i64
      %1091 = func.call @cc_set_symbol_value(%1087, %1080) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1080) : (i64) -> ()
      %1092 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1092 : i64
    }
    %1093 = func.call @cc_nil_value() : () -> i64
    %1094 = func.call @cc_errorp(%1077) : (i64) -> i64
    %1095 = arith.cmpi ne, %1094, %1093 : i64
    %1096 = scf.if %1095 -> (i64) {
      scf.yield %1077 : i64
    } else {
      %1097 = llvm.mlir.addressof @str108 : !llvm.ptr
      %1098 = func.call @cc_make_function_ref_const(%1097) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%1098) : (i64) -> ()
      %1099 = func.call @stack_pop_pointer() : () -> i64
      %1100 = llvm.mlir.addressof @str109 : !llvm.ptr
      %1101 = arith.constant 17 : i64
      %1102 = func.call @cc_make_string(%1100, %1101) : (!llvm.ptr, i64) -> i64
      %1103 = llvm.mlir.addressof @str110 : !llvm.ptr
      %1104 = arith.constant 15 : i64
      %1105 = func.call @cc_make_string(%1103, %1104) : (!llvm.ptr, i64) -> i64
      %1106 = func.call @cc_intern(%1102, %1105) : (i64, i64) -> i64
      %1107 = func.call @cc_nil_value() : () -> i64
      %1108 = func.call @cc_cons(%1106, %1107) : (i64, i64) -> i64
      %1109 = func.call @cc_values_pack(%1108) : (i64) -> i64
      %1110 = func.call @cc_set_symbol_value(%1106, %1099) : (i64, i64) -> i64
      func.call @stack_push_pointer(%1099) : (i64) -> ()
      %1111 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1111 : i64
    }
    %1112 = func.call @cc_nil_value() : () -> i64
    %1113 = func.call @cc_errorp(%1096) : (i64) -> i64
    %1114 = arith.cmpi ne, %1113, %1112 : i64
    %1115 = scf.if %1114 -> (i64) {
      scf.yield %1096 : i64
    } else {
      %1116 = func.call @cc_nil_value() : () -> i64
      %1117 = arith.cmpi ne, %1116, %1116 : i64
      scf.if %1117 {
        func.call @stack_push_pointer(%1116) : (i64) -> ()
      } else {
        %1118 = llvm.mlir.addressof @str111 : !llvm.ptr
        %1119 = func.call @cc_make_function_ref_const(%1118) : (!llvm.ptr) -> i64
        %1120 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%1119, %1120) : (i64, i64) -> ()
      }
      %1121 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %1121 : i64
    }
    func.call @stack_push_pointer(%1115) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("SHOW-ELEMENT-TYPE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_37506892431360*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_37506892431360*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_37506892431360*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("probe-element-type\00") : !llvm.array<19 x i8>
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
  llvm.mlir.global private constant @str23("out-et1=~S~%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str24("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str25("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str26("wb=~S~%\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str27("WRITE-BYTE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str28("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str29("set-char=~S~%\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str30("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str31("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str32("set-stream-element-type\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str33("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str34("wc=~S~%\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str35("WRITE-CHAR\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str36("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str37("out-et2=~S~%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str38("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str39("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str41("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str42("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str43("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str44("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str45("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str46("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str47("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str48("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str50("in1=~S~%\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str51("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str52("READ-BYTE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str53("READ-BYTE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str54("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str55("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str56("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str57("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str58("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str59("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str60("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str61("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str62("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str63("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str64("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str66("in2-et1=~S~%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str67("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str68("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str69("in2-rb1=~S~%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str70("READ-BYTE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str71("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str72("in2-set-char=~S~%\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str73("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str74("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str75("set-stream-element-type\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str76("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str77("in2-rc=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str78("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str79("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str80("unread=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str81("UNREAD-CHAR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str82("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str83("in2-b=~S~%\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str84("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str85("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str86("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str87("set-stream-element-type\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str88("READ-BYTE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str89("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str90("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str91("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str92("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str93("*__MLIR_BLOCK_RETFLAG_37506892431360*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str94("*__MLIR_BLOCK_RETVALUE_37506892431360*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str95("*__MLIR_BLOCK_RETMVLIST_37506892431360*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str96("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str97("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str98("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str99("%FN%show-element-type\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str100("SHOW-ELEMENT-TYPE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str101("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str102("%FN%show-element-type\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str103("SHOW-ELEMENT-TYPE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str104("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str105("%FN%show-element-type\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str106("SHOW-ELEMENT-TYPE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str107("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str108("%FN%show-element-type\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str109("SHOW-ELEMENT-TYPE\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str110("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str111("%FN%show-element-type\00") : !llvm.array<22 x i8>
}
