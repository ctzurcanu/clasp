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
    func.call @stack_push_nil() : () -> ()
    %8 = func.call @stack_pop_pointer() : () -> i64
    %9 = func.call @cc_nil_value() : () -> i64
    %10 = func.call @cc_errorp(%8) : (i64) -> i64
    %11 = arith.cmpi ne, %10, %9 : i64
    %12 = arith.cmpi eq, %9, %9 : i64
    %13 = arith.andi %11, %12 : i1
    %14 = scf.if %13 -> (i64) {
      scf.yield %8 : i64
    } else {
      scf.yield %9 : i64
    }
    %15 = arith.cmpi ne, %14, %9 : i64
    scf.if %15 {
      func.call @stack_push_pointer(%14) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%8) : (i64) -> ()
      %16 = llvm.mlir.addressof @str1 : !llvm.ptr
      %17 = func.call @cc_make_function_ref_const(%16) : (!llvm.ptr) -> i64
      %18 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%17, %18) : (i64, i64) -> ()
    }
    %19 = func.call @stack_pop_pointer() : () -> i64
    %20 = llvm.mlir.addressof @str2 : !llvm.ptr
    %21 = arith.constant 23 : i64
    %22 = func.call @cc_make_symbol(%20, %21) : (!llvm.ptr, i64) -> i64
    %23 = func.call @cc_symbol_value(%22) : (i64) -> i64
    %24 = func.call @cc_set_symbol_value(%22, %19) : (i64, i64) -> i64
    %25 = func.call @cc_nil_value() : () -> i64
    %26 = func.call @cc_nil_value() : () -> i64
    %27 = func.call @cc_errorp(%25) : (i64) -> i64
    %28 = arith.cmpi ne, %27, %26 : i64
    %29 = scf.if %28 -> (i64) {
      scf.yield %25 : i64
    } else {
      %30 = llvm.mlir.addressof @str3 : !llvm.ptr
      %31 = arith.constant 6 : i64
      %32 = func.call @cc_make_string(%30, %31) : (!llvm.ptr, i64) -> i64
      %33 = llvm.mlir.addressof @str4 : !llvm.ptr
      %34 = arith.constant 11 : i64
      %35 = func.call @cc_make_string(%33, %34) : (!llvm.ptr, i64) -> i64
      %36 = func.call @cc_intern(%32, %35) : (i64, i64) -> i64
      %37 = func.call @cc_nil_value() : () -> i64
      %38 = func.call @cc_cons(%36, %37) : (i64, i64) -> i64
      %39 = func.call @cc_values_pack(%38) : (i64) -> i64
      func.call @stack_push_pointer(%36) : (i64) -> ()
      %40 = func.call @stack_pop_pointer() : () -> i64
      %41 = func.call @cc_nil_value() : () -> i64
      %42 = llvm.mlir.addressof @str5 : !llvm.ptr
      %43 = arith.constant 1 : i64
      %44 = func.call @cc_make_string(%42, %43) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%44) : (i64) -> ()
      %45 = func.call @stack_pop_pointer() : () -> i64
      %46 = func.call @cc_cons(%45, %41) : (i64, i64) -> i64
      %47 = arith.constant 127 : i64
      %48 = func.call @cc_box_character(%47) : (i64) -> i64
      func.call @stack_push_pointer(%48) : (i64) -> ()
      %49 = func.call @stack_pop_pointer() : () -> i64
      %50 = func.call @cc_string(%49) : (i64) -> i64
      func.call @stack_push_pointer(%50) : (i64) -> ()
      %51 = func.call @stack_pop_pointer() : () -> i64
      %52 = func.call @cc_cons(%51, %46) : (i64, i64) -> i64
      %53 = func.call @cc_concatenate(%40, %52) : (i64, i64) -> i64
      func.call @stack_push_pointer(%53) : (i64) -> ()
      %54 = func.call @stack_pop_pointer() : () -> i64
      %55 = func.call @cc_nil_value() : () -> i64
      %56 = func.call @cc_errorp(%54) : (i64) -> i64
      %57 = arith.cmpi ne, %56, %55 : i64
      %58 = arith.cmpi eq, %55, %55 : i64
      %59 = arith.andi %57, %58 : i1
      %60 = scf.if %59 -> (i64) {
        scf.yield %54 : i64
      } else {
        scf.yield %55 : i64
      }
      %61 = arith.cmpi ne, %60, %55 : i64
      scf.if %61 {
        func.call @stack_push_pointer(%60) : (i64) -> ()
      } else {
        %62 = func.call @cc_nil_value() : () -> i64
        %63 = func.call @cc_cons(%54, %62) : (i64, i64) -> i64
        func.call @stack_push_pointer(%63) : (i64) -> ()
        func.call @cc_read_from_string_stack() : () -> ()
      }
      %64 = func.call @stack_pop_pointer() : () -> i64
      %65 = func.call @cc_errorp(%64) : (i64) -> i64
      %66 = func.call @cc_nil_value() : () -> i64
      %67 = arith.cmpi ne, %65, %66 : i64
      %68 = scf.if %67 -> (i64) {
        %69 = func.call @cc_condition_value(%64) : (i64) -> i64
        %70 = llvm.mlir.addressof @str6 : !llvm.ptr
        %71 = arith.constant 12 : i64
        %72 = func.call @cc_make_string(%70, %71) : (!llvm.ptr, i64) -> i64
        %73 = llvm.mlir.addressof @str7 : !llvm.ptr
        %74 = arith.constant 11 : i64
        %75 = func.call @cc_make_string(%73, %74) : (!llvm.ptr, i64) -> i64
        %76 = func.call @cc_intern(%72, %75) : (i64, i64) -> i64
        %77 = func.call @cc_nil_value() : () -> i64
        %78 = func.call @cc_cons(%76, %77) : (i64, i64) -> i64
        %79 = func.call @cc_values_pack(%78) : (i64) -> i64
        func.call @stack_push_pointer(%76) : (i64) -> ()
        %80 = func.call @stack_pop_pointer() : () -> i64
        %81 = func.call @cc_typep(%69, %80) : (i64, i64) -> i64
        %82 = func.call @cc_nil_value() : () -> i64
        %83 = arith.cmpi ne, %81, %82 : i64
        %84 = scf.if %83 -> (i64) {
          %85 = llvm.mlir.addressof @str8 : !llvm.ptr
          %86 = arith.constant 6 : i64
          %87 = func.call @cc_make_string(%85, %86) : (!llvm.ptr, i64) -> i64
          %88 = llvm.mlir.addressof @str9 : !llvm.ptr
          %89 = arith.constant 7 : i64
          %90 = func.call @cc_make_string(%88, %89) : (!llvm.ptr, i64) -> i64
          %91 = func.call @cc_intern(%87, %90) : (i64, i64) -> i64
          %92 = func.call @cc_nil_value() : () -> i64
          %93 = func.call @cc_cons(%91, %92) : (i64, i64) -> i64
          %94 = func.call @cc_values_pack(%93) : (i64) -> i64
          func.call @stack_push_pointer(%91) : (i64) -> ()
          %95 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%69) : (i64) -> ()
          %96 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%69) : (i64) -> ()
          %97 = llvm.mlir.addressof @str10 : !llvm.ptr
          %98 = arith.constant 12 : i64
          %99 = func.call @cc_make_string(%97, %98) : (!llvm.ptr, i64) -> i64
          %100 = llvm.mlir.addressof @str11 : !llvm.ptr
          %101 = arith.constant 11 : i64
          %102 = func.call @cc_make_string(%100, %101) : (!llvm.ptr, i64) -> i64
          %103 = func.call @cc_intern(%99, %102) : (i64, i64) -> i64
          %104 = func.call @cc_nil_value() : () -> i64
          %105 = func.call @cc_cons(%103, %104) : (i64, i64) -> i64
          %106 = func.call @cc_values_pack(%105) : (i64) -> i64
          func.call @stack_push_pointer(%103) : (i64) -> ()
          %107 = func.call @stack_pop_pointer() : () -> i64
          %108 = func.call @stack_pop_pointer() : () -> i64
          %109 = func.call @cc_typep(%108, %107) : (i64, i64) -> i64
          func.call @stack_push_pointer(%109) : (i64) -> ()
          %110 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%69) : (i64) -> ()
          %111 = llvm.mlir.addressof @str12 : !llvm.ptr
          %112 = arith.constant 5 : i64
          %113 = func.call @cc_make_string(%111, %112) : (!llvm.ptr, i64) -> i64
          %114 = llvm.mlir.addressof @str13 : !llvm.ptr
          %115 = arith.constant 11 : i64
          %116 = func.call @cc_make_string(%114, %115) : (!llvm.ptr, i64) -> i64
          %117 = func.call @cc_intern(%113, %116) : (i64, i64) -> i64
          %118 = func.call @cc_nil_value() : () -> i64
          %119 = func.call @cc_cons(%117, %118) : (i64, i64) -> i64
          %120 = func.call @cc_values_pack(%119) : (i64) -> i64
          func.call @stack_push_pointer(%117) : (i64) -> ()
          %121 = func.call @stack_pop_pointer() : () -> i64
          %122 = func.call @stack_pop_pointer() : () -> i64
          %123 = func.call @cc_typep(%122, %121) : (i64, i64) -> i64
          func.call @stack_push_pointer(%123) : (i64) -> ()
          %124 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%69) : (i64) -> ()
          %125 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%125) : (i64) -> ()
          %126 = llvm.mlir.addressof @str14 : !llvm.ptr
          %127 = func.call @cc_make_function_ref_const(%126) : (!llvm.ptr) -> i64
          %128 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%127, %128) : (i64, i64) -> ()
          %129 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%69) : (i64) -> ()
          %130 = func.call @stack_pop_pointer() : () -> i64
          %131 = func.call @cc_class_of(%130) : (i64) -> i64
          func.call @stack_push_pointer(%131) : (i64) -> ()
          %132 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%69) : (i64) -> ()
          %133 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%133) : (i64) -> ()
          %134 = llvm.mlir.addressof @str15 : !llvm.ptr
          %135 = func.call @cc_make_function_ref_const(%134) : (!llvm.ptr) -> i64
          %136 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%135, %136) : (i64, i64) -> ()
          %137 = func.call @stack_pop_pointer() : () -> i64
          %138 = func.call @cc_nil_value() : () -> i64
          %139 = func.call @cc_errorp(%95) : (i64) -> i64
          %140 = arith.cmpi ne, %139, %138 : i64
          %141 = arith.cmpi eq, %138, %138 : i64
          %142 = arith.andi %140, %141 : i1
          %143 = scf.if %142 -> (i64) {
            scf.yield %95 : i64
          } else {
            scf.yield %138 : i64
          }
          %144 = func.call @cc_errorp(%96) : (i64) -> i64
          %145 = arith.cmpi ne, %144, %138 : i64
          %146 = arith.cmpi eq, %143, %138 : i64
          %147 = arith.andi %145, %146 : i1
          %148 = scf.if %147 -> (i64) {
            scf.yield %96 : i64
          } else {
            scf.yield %143 : i64
          }
          %149 = func.call @cc_errorp(%110) : (i64) -> i64
          %150 = arith.cmpi ne, %149, %138 : i64
          %151 = arith.cmpi eq, %148, %138 : i64
          %152 = arith.andi %150, %151 : i1
          %153 = scf.if %152 -> (i64) {
            scf.yield %110 : i64
          } else {
            scf.yield %148 : i64
          }
          %154 = func.call @cc_errorp(%124) : (i64) -> i64
          %155 = arith.cmpi ne, %154, %138 : i64
          %156 = arith.cmpi eq, %153, %138 : i64
          %157 = arith.andi %155, %156 : i1
          %158 = scf.if %157 -> (i64) {
            scf.yield %124 : i64
          } else {
            scf.yield %153 : i64
          }
          %159 = func.call @cc_errorp(%129) : (i64) -> i64
          %160 = arith.cmpi ne, %159, %138 : i64
          %161 = arith.cmpi eq, %158, %138 : i64
          %162 = arith.andi %160, %161 : i1
          %163 = scf.if %162 -> (i64) {
            scf.yield %129 : i64
          } else {
            scf.yield %158 : i64
          }
          %164 = func.call @cc_errorp(%132) : (i64) -> i64
          %165 = arith.cmpi ne, %164, %138 : i64
          %166 = arith.cmpi eq, %163, %138 : i64
          %167 = arith.andi %165, %166 : i1
          %168 = scf.if %167 -> (i64) {
            scf.yield %132 : i64
          } else {
            scf.yield %163 : i64
          }
          %169 = func.call @cc_errorp(%137) : (i64) -> i64
          %170 = arith.cmpi ne, %169, %138 : i64
          %171 = arith.cmpi eq, %168, %138 : i64
          %172 = arith.andi %170, %171 : i1
          %173 = scf.if %172 -> (i64) {
            scf.yield %137 : i64
          } else {
            scf.yield %168 : i64
          }
          %174 = arith.cmpi ne, %173, %138 : i64
          scf.if %174 {
            func.call @stack_push_pointer(%173) : (i64) -> ()
          } else {
            %175 = func.call @cc_nil_value() : () -> i64
            func.call @stack_push_pointer(%175) : (i64) -> ()
            func.call @stack_push_pointer(%137) : (i64) -> ()
            %176 = func.call @stack_pop_pointer() : () -> i64
            %177 = func.call @stack_pop_pointer() : () -> i64
            %178 = func.call @cc_cons(%176, %177) : (i64, i64) -> i64
            func.call @stack_push_pointer(%178) : (i64) -> ()
            func.call @stack_push_pointer(%132) : (i64) -> ()
            %179 = func.call @stack_pop_pointer() : () -> i64
            %180 = func.call @stack_pop_pointer() : () -> i64
            %181 = func.call @cc_cons(%179, %180) : (i64, i64) -> i64
            func.call @stack_push_pointer(%181) : (i64) -> ()
            func.call @stack_push_pointer(%129) : (i64) -> ()
            %182 = func.call @stack_pop_pointer() : () -> i64
            %183 = func.call @stack_pop_pointer() : () -> i64
            %184 = func.call @cc_cons(%182, %183) : (i64, i64) -> i64
            func.call @stack_push_pointer(%184) : (i64) -> ()
            func.call @stack_push_pointer(%124) : (i64) -> ()
            %185 = func.call @stack_pop_pointer() : () -> i64
            %186 = func.call @stack_pop_pointer() : () -> i64
            %187 = func.call @cc_cons(%185, %186) : (i64, i64) -> i64
            func.call @stack_push_pointer(%187) : (i64) -> ()
            func.call @stack_push_pointer(%110) : (i64) -> ()
            %188 = func.call @stack_pop_pointer() : () -> i64
            %189 = func.call @stack_pop_pointer() : () -> i64
            %190 = func.call @cc_cons(%188, %189) : (i64, i64) -> i64
            func.call @stack_push_pointer(%190) : (i64) -> ()
            func.call @stack_push_pointer(%96) : (i64) -> ()
            %191 = func.call @stack_pop_pointer() : () -> i64
            %192 = func.call @stack_pop_pointer() : () -> i64
            %193 = func.call @cc_cons(%191, %192) : (i64, i64) -> i64
            func.call @stack_push_pointer(%193) : (i64) -> ()
            func.call @stack_push_pointer(%95) : (i64) -> ()
            %194 = func.call @stack_pop_pointer() : () -> i64
            %195 = func.call @stack_pop_pointer() : () -> i64
            %196 = func.call @cc_cons(%194, %195) : (i64, i64) -> i64
            func.call @stack_push_pointer(%196) : (i64) -> ()
          }
          %197 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %197 : i64
        } else {
          scf.yield %64 : i64
        }
        scf.yield %84 : i64
      } else {
        scf.yield %64 : i64
      }
      func.call @stack_push_pointer(%68) : (i64) -> ()
      %198 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %198 : i64
    }
    func.call @stack_push_pointer(%29) : (i64) -> ()
    %199 = func.call @cc_set_symbol_value(%22, %23) : (i64, i64) -> i64
    %200 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%200) : (i64) -> ()
    %201 = func.call @stack_pop_pointer() : () -> i64
    %202 = func.call @cc_nil_value() : () -> i64
    %203 = func.call @cc_nil_value() : () -> i64
    %204 = func.call @cc_errorp(%202) : (i64) -> i64
    %205 = arith.cmpi ne, %204, %203 : i64
    %206 = scf.if %205 -> (i64) {
      scf.yield %202 : i64
    } else {
      %207 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%207) : (i64) -> ()
      %208 = func.call @stack_pop_pointer() : () -> i64
      %209 = llvm.mlir.addressof @str16 : !llvm.ptr
      %210 = arith.constant 11 : i64
      %211 = func.call @cc_make_string(%209, %210) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%211) : (i64) -> ()
      %212 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%201) : (i64) -> ()
      %213 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%208) : (i64) -> ()
      func.call @stack_push_pointer(%212) : (i64) -> ()
      func.call @stack_push_pointer(%213) : (i64) -> ()
      %214 = llvm.mlir.addressof @str17 : !llvm.ptr
      %215 = func.call @cc_make_function_ref_const(%214) : (!llvm.ptr) -> i64
      %216 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%215, %216) : (i64, i64) -> ()
      %217 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %217 : i64
    }
    func.call @stack_push_pointer(%206) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("COPY-READTABLE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str2("COMMON-LISP:*READTABLE*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str3("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str4("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str5("Z\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str6("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str7("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str8("READER\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str9("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str10("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("ERROR\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str13("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str14("TYPE-OF\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str15("WRITE-TO-STRING\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str16("rubout=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str17("FORMAT\00") : !llvm.array<7 x i8>
}
