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
    %8 = arith.constant 9 : i64
    func.call @stack_push_fixnum(%8) : (i64) -> ()
    %9 = func.call @stack_pop_pointer() : () -> i64
    %10 = llvm.mlir.addressof @str1 : !llvm.ptr
    %11 = arith.constant 13 : i64
    %12 = func.call @cc_make_string(%10, %11) : (!llvm.ptr, i64) -> i64
    %13 = llvm.mlir.addressof @str2 : !llvm.ptr
    %14 = arith.constant 11 : i64
    %15 = func.call @cc_make_string(%13, %14) : (!llvm.ptr, i64) -> i64
    %16 = func.call @cc_intern(%12, %15) : (i64, i64) -> i64
    %17 = func.call @cc_nil_value() : () -> i64
    %18 = func.call @cc_cons(%16, %17) : (i64, i64) -> i64
    %19 = func.call @cc_values_pack(%18) : (i64) -> i64
    func.call @stack_push_pointer(%16) : (i64) -> ()
    func.call @stack_push_pointer(%9) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %20 = func.call @stack_pop_pointer() : () -> i64
    %21 = func.call @stack_pop_pointer() : () -> i64
    %22 = func.call @cc_cons(%21, %20) : (i64, i64) -> i64
    func.call @stack_push_pointer(%22) : (i64) -> ()
    %23 = func.call @stack_pop_pointer() : () -> i64
    %24 = func.call @stack_pop_pointer() : () -> i64
    %25 = func.call @cc_cons(%24, %23) : (i64, i64) -> i64
    func.call @stack_push_pointer(%25) : (i64) -> ()
    %26 = func.call @stack_pop_pointer() : () -> i64
    %27 = arith.constant 0 : i64
    func.call @stack_push_fixnum(%27) : (i64) -> ()
    %28 = func.call @stack_pop_pointer() : () -> i64
    %29 = arith.constant 1 : i64
    func.call @stack_push_fixnum(%29) : (i64) -> ()
    %30 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%9) : (i64) -> ()
    %31 = func.call @stack_pop_pointer() : () -> i64
    %32 = func.call @cc_nil_value() : () -> i64
    %33 = func.call @cc_errorp(%30) : (i64) -> i64
    %34 = arith.cmpi ne, %33, %32 : i64
    %35 = arith.cmpi eq, %32, %32 : i64
    %36 = arith.andi %34, %35 : i1
    %37 = scf.if %36 -> (i64) {
      scf.yield %30 : i64
    } else {
      scf.yield %32 : i64
    }
    %38 = func.call @cc_errorp(%31) : (i64) -> i64
    %39 = arith.cmpi ne, %38, %32 : i64
    %40 = arith.cmpi eq, %37, %32 : i64
    %41 = arith.andi %39, %40 : i1
    %42 = scf.if %41 -> (i64) {
      scf.yield %31 : i64
    } else {
      scf.yield %37 : i64
    }
    %43 = arith.cmpi ne, %42, %32 : i64
    scf.if %43 {
      func.call @stack_push_pointer(%42) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%30) : (i64) -> ()
      func.call @stack_push_pointer(%31) : (i64) -> ()
      %44 = llvm.mlir.addressof @str3 : !llvm.ptr
      %45 = func.call @cc_make_function_ref_const(%44) : (!llvm.ptr) -> i64
      %46 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%45, %46) : (i64, i64) -> ()
    }
    %47 = func.call @stack_pop_pointer() : () -> i64
    %48 = arith.constant 5 : i64
    func.call @stack_push_fixnum(%48) : (i64) -> ()
    %49 = func.call @stack_pop_pointer() : () -> i64
    %51 = arith.constant 3 : i64
    %50 = arith.andi %47, %51 : i64
    %52 = arith.constant 0 : i64
    %53 = arith.cmpi eq, %50, %52 : i64
    %55 = arith.constant 3 : i64
    %54 = arith.andi %49, %55 : i64
    %56 = arith.constant 0 : i64
    %57 = arith.cmpi eq, %54, %56 : i64
    %58 = arith.andi %53, %57 : i1
    %59 = scf.if %58 -> (i64) {
      %60 = arith.constant 2 : i64
      %61 = arith.shrsi %47, %60 : i64
      %62 = arith.constant 2 : i64
      %63 = arith.shrsi %49, %62 : i64
      %64 = arith.subi %61, %63 : i64
      %65 = arith.constant -2305843009213693952 : i64
      %66 = arith.constant 2305843009213693951 : i64
      %67 = arith.cmpi sge, %64, %65 : i64
      %68 = arith.cmpi sle, %64, %66 : i64
      %69 = arith.andi %67, %68 : i1
      %70 = scf.if %69 -> (i64) {
        %71 = arith.constant 2 : i64
        %72 = arith.shli %64, %71 : i64
        scf.yield %72 : i64
      } else {
        %73 = func.call @cc_sub(%47, %49) : (i64, i64) -> i64
        scf.yield %73 : i64
      }
      scf.yield %70 : i64
    } else {
      %74 = func.call @cc_sub(%47, %49) : (i64, i64) -> i64
      scf.yield %74 : i64
    }
    func.call @stack_push_pointer(%59) : (i64) -> ()
    %75 = func.call @stack_pop_pointer() : () -> i64
    %76 = func.call @cc_nil_value() : () -> i64
    %77 = func.call @cc_errorp(%28) : (i64) -> i64
    %78 = arith.cmpi ne, %77, %76 : i64
    %79 = arith.cmpi eq, %76, %76 : i64
    %80 = arith.andi %78, %79 : i1
    %81 = scf.if %80 -> (i64) {
      scf.yield %28 : i64
    } else {
      scf.yield %76 : i64
    }
    %82 = func.call @cc_errorp(%75) : (i64) -> i64
    %83 = arith.cmpi ne, %82, %76 : i64
    %84 = arith.cmpi eq, %81, %76 : i64
    %85 = arith.andi %83, %84 : i1
    %86 = scf.if %85 -> (i64) {
      scf.yield %75 : i64
    } else {
      scf.yield %81 : i64
    }
    %87 = arith.cmpi ne, %86, %76 : i64
    scf.if %87 {
      func.call @stack_push_pointer(%86) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%28) : (i64) -> ()
      func.call @stack_push_pointer(%75) : (i64) -> ()
      %88 = llvm.mlir.addressof @str4 : !llvm.ptr
      %89 = func.call @cc_make_function_ref_const(%88) : (!llvm.ptr) -> i64
      %90 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%89, %90) : (i64, i64) -> ()
    }
    %91 = func.call @stack_pop_pointer() : () -> i64
    %92 = llvm.mlir.addressof @str5 : !llvm.ptr
    %93 = arith.constant 7 : i64
    %94 = func.call @cc_make_string(%92, %93) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%94) : (i64) -> ()
    %95 = func.call @stack_pop_pointer() : () -> i64
    %96 = llvm.mlir.addressof @str6 : !llvm.ptr
    %97 = arith.constant 9 : i64
    %98 = func.call @cc_make_string(%96, %97) : (!llvm.ptr, i64) -> i64
    %99 = llvm.mlir.addressof @str7 : !llvm.ptr
    %100 = arith.constant 7 : i64
    %101 = func.call @cc_make_string(%99, %100) : (!llvm.ptr, i64) -> i64
    %102 = func.call @cc_intern(%98, %101) : (i64, i64) -> i64
    %103 = func.call @cc_nil_value() : () -> i64
    %104 = func.call @cc_cons(%102, %103) : (i64, i64) -> i64
    %105 = func.call @cc_values_pack(%104) : (i64) -> i64
    func.call @stack_push_pointer(%102) : (i64) -> ()
    %106 = func.call @stack_pop_pointer() : () -> i64
    %107 = llvm.mlir.addressof @str8 : !llvm.ptr
    %108 = arith.constant 6 : i64
    %109 = func.call @cc_make_string(%107, %108) : (!llvm.ptr, i64) -> i64
    %110 = llvm.mlir.addressof @str9 : !llvm.ptr
    %111 = arith.constant 7 : i64
    %112 = func.call @cc_make_string(%110, %111) : (!llvm.ptr, i64) -> i64
    %113 = func.call @cc_intern(%109, %112) : (i64, i64) -> i64
    %114 = func.call @cc_nil_value() : () -> i64
    %115 = func.call @cc_cons(%113, %114) : (i64, i64) -> i64
    %116 = func.call @cc_values_pack(%115) : (i64) -> i64
    func.call @stack_push_pointer(%113) : (i64) -> ()
    %117 = func.call @stack_pop_pointer() : () -> i64
    %118 = llvm.mlir.addressof @str10 : !llvm.ptr
    %119 = arith.constant 9 : i64
    %120 = func.call @cc_make_string(%118, %119) : (!llvm.ptr, i64) -> i64
    %121 = llvm.mlir.addressof @str11 : !llvm.ptr
    %122 = arith.constant 7 : i64
    %123 = func.call @cc_make_string(%121, %122) : (!llvm.ptr, i64) -> i64
    %124 = func.call @cc_intern(%120, %123) : (i64, i64) -> i64
    %125 = func.call @cc_nil_value() : () -> i64
    %126 = func.call @cc_cons(%124, %125) : (i64, i64) -> i64
    %127 = func.call @cc_values_pack(%126) : (i64) -> i64
    func.call @stack_push_pointer(%124) : (i64) -> ()
    %128 = func.call @stack_pop_pointer() : () -> i64
    %129 = llvm.mlir.addressof @str12 : !llvm.ptr
    %130 = arith.constant 9 : i64
    %131 = func.call @cc_make_string(%129, %130) : (!llvm.ptr, i64) -> i64
    %132 = llvm.mlir.addressof @str13 : !llvm.ptr
    %133 = arith.constant 7 : i64
    %134 = func.call @cc_make_string(%132, %133) : (!llvm.ptr, i64) -> i64
    %135 = func.call @cc_intern(%131, %134) : (i64, i64) -> i64
    %136 = func.call @cc_nil_value() : () -> i64
    %137 = func.call @cc_cons(%135, %136) : (i64, i64) -> i64
    %138 = func.call @cc_values_pack(%137) : (i64) -> i64
    func.call @stack_push_pointer(%135) : (i64) -> ()
    %139 = func.call @stack_pop_pointer() : () -> i64
    %140 = llvm.mlir.addressof @str14 : !llvm.ptr
    %141 = arith.constant 12 : i64
    %142 = func.call @cc_make_string(%140, %141) : (!llvm.ptr, i64) -> i64
    %143 = llvm.mlir.addressof @str15 : !llvm.ptr
    %144 = arith.constant 7 : i64
    %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
    %146 = func.call @cc_intern(%142, %145) : (i64, i64) -> i64
    %147 = func.call @cc_nil_value() : () -> i64
    %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
    %149 = func.call @cc_values_pack(%148) : (i64) -> i64
    func.call @stack_push_pointer(%146) : (i64) -> ()
    %150 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%26) : (i64) -> ()
    %151 = func.call @stack_pop_pointer() : () -> i64
    %152 = func.call @cc_nil_value() : () -> i64
    %153 = func.call @cc_errorp(%95) : (i64) -> i64
    %154 = arith.cmpi ne, %153, %152 : i64
    %155 = arith.cmpi eq, %152, %152 : i64
    %156 = arith.andi %154, %155 : i1
    %157 = scf.if %156 -> (i64) {
      scf.yield %95 : i64
    } else {
      scf.yield %152 : i64
    }
    %158 = func.call @cc_errorp(%106) : (i64) -> i64
    %159 = arith.cmpi ne, %158, %152 : i64
    %160 = arith.cmpi eq, %157, %152 : i64
    %161 = arith.andi %159, %160 : i1
    %162 = scf.if %161 -> (i64) {
      scf.yield %106 : i64
    } else {
      scf.yield %157 : i64
    }
    %163 = func.call @cc_errorp(%117) : (i64) -> i64
    %164 = arith.cmpi ne, %163, %152 : i64
    %165 = arith.cmpi eq, %162, %152 : i64
    %166 = arith.andi %164, %165 : i1
    %167 = scf.if %166 -> (i64) {
      scf.yield %117 : i64
    } else {
      scf.yield %162 : i64
    }
    %168 = func.call @cc_errorp(%128) : (i64) -> i64
    %169 = arith.cmpi ne, %168, %152 : i64
    %170 = arith.cmpi eq, %167, %152 : i64
    %171 = arith.andi %169, %170 : i1
    %172 = scf.if %171 -> (i64) {
      scf.yield %128 : i64
    } else {
      scf.yield %167 : i64
    }
    %173 = func.call @cc_errorp(%139) : (i64) -> i64
    %174 = arith.cmpi ne, %173, %152 : i64
    %175 = arith.cmpi eq, %172, %152 : i64
    %176 = arith.andi %174, %175 : i1
    %177 = scf.if %176 -> (i64) {
      scf.yield %139 : i64
    } else {
      scf.yield %172 : i64
    }
    %178 = func.call @cc_errorp(%150) : (i64) -> i64
    %179 = arith.cmpi ne, %178, %152 : i64
    %180 = arith.cmpi eq, %177, %152 : i64
    %181 = arith.andi %179, %180 : i1
    %182 = scf.if %181 -> (i64) {
      scf.yield %150 : i64
    } else {
      scf.yield %177 : i64
    }
    %183 = func.call @cc_errorp(%151) : (i64) -> i64
    %184 = arith.cmpi ne, %183, %152 : i64
    %185 = arith.cmpi eq, %182, %152 : i64
    %186 = arith.andi %184, %185 : i1
    %187 = scf.if %186 -> (i64) {
      scf.yield %151 : i64
    } else {
      scf.yield %182 : i64
    }
    %188 = arith.cmpi ne, %187, %152 : i64
    scf.if %188 {
      func.call @stack_push_pointer(%187) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%95) : (i64) -> ()
      func.call @stack_push_pointer(%106) : (i64) -> ()
      func.call @stack_push_pointer(%117) : (i64) -> ()
      func.call @stack_push_pointer(%128) : (i64) -> ()
      func.call @stack_push_pointer(%139) : (i64) -> ()
      func.call @stack_push_pointer(%150) : (i64) -> ()
      func.call @stack_push_pointer(%151) : (i64) -> ()
      %189 = llvm.mlir.addressof @str16 : !llvm.ptr
      %190 = func.call @cc_make_function_ref_const(%189) : (!llvm.ptr) -> i64
      %191 = arith.constant 7 : i64
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
      %198 = arith.constant 17 : i64
      func.call @stack_push_fixnum(%198) : (i64) -> ()
      %199 = func.call @stack_pop_pointer() : () -> i64
      %200 = arith.constant 0 : i64
      func.call @stack_push_fixnum(%200) : (i64) -> ()
      %201 = func.call @stack_pop_pointer() : () -> i64
      %202 = func.call @cc_nil_value() : () -> i64
      %203 = func.call @cc_nil_value() : () -> i64
      %204 = func.call @cc_errorp(%202) : (i64) -> i64
      %205 = arith.cmpi ne, %204, %203 : i64
      %206 = scf.if %205 -> (i64) {
        scf.yield %202 : i64
      } else {
        %207 = func.call @cc_nil_value() : () -> i64
        %208 = llvm.mlir.addressof @str17 : !llvm.ptr
        %209 = arith.constant 37 : i64
        %210 = func.call @cc_make_symbol(%208, %209) : (!llvm.ptr, i64) -> i64
        %211 = func.call @cc_set_symbol_value(%210, %207) : (i64, i64) -> i64
        %212 = llvm.mlir.addressof @str18 : !llvm.ptr
        %213 = arith.constant 38 : i64
        %214 = func.call @cc_make_symbol(%212, %213) : (!llvm.ptr, i64) -> i64
        %215 = func.call @cc_set_symbol_value(%214, %207) : (i64, i64) -> i64
        %216 = llvm.mlir.addressof @str19 : !llvm.ptr
        %217 = arith.constant 39 : i64
        %218 = func.call @cc_make_symbol(%216, %217) : (!llvm.ptr, i64) -> i64
        %219 = func.call @cc_set_symbol_value(%218, %207) : (i64, i64) -> i64
        %220:1 = scf.while (%arg0 = %201) : (i64) -> (i64) {
          func.call @stack_push_pointer(%arg0) : (i64) -> ()
          %221 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%199) : (i64) -> ()
          %222 = func.call @stack_pop_pointer() : () -> i64
          %223 = arith.constant 1 : i1
          %225 = arith.constant 3 : i64
          %224 = arith.andi %221, %225 : i64
          %226 = arith.constant 0 : i64
          %227 = arith.cmpi eq, %224, %226 : i64
          %229 = arith.constant 3 : i64
          %228 = arith.andi %222, %229 : i64
          %230 = arith.constant 0 : i64
          %231 = arith.cmpi eq, %228, %230 : i64
          %232 = arith.andi %227, %231 : i1
          %233 = scf.if %232 -> (i1) {
            %234 = arith.constant 2 : i64
            %235 = arith.shrsi %221, %234 : i64
            %236 = arith.constant 2 : i64
            %237 = arith.shrsi %222, %236 : i64
            %238 = arith.cmpi slt, %235, %237 : i64
            scf.yield %238 : i1
          } else {
            %239 = func.call @cc_lt(%221, %222) : (i64, i64) -> i64
            %240 = func.call @cc_nil_value() : () -> i64
            %241 = arith.cmpi ne, %239, %240 : i64
            scf.yield %241 : i1
          }
          %242 = arith.andi %223, %233 : i1
          %243 = func.call @cc_nil_value() : () -> i64
          %244 = func.call @cc_t_value() : () -> i64
          %245 = scf.if %242 -> (i64) {
            scf.yield %244 : i64
          } else {
            scf.yield %243 : i64
          }
          func.call @stack_push_pointer(%245) : (i64) -> ()
          %246 = func.call @stack_pop_pointer() : () -> i64
          %247 = func.call @cc_nil_value() : () -> i64
          %248 = arith.cmpi ne, %246, %247 : i64
          scf.condition(%248) %arg0 : i64
        } do {
          ^bb0(%249: i64):
          func.call @stack_push_pointer(%91) : (i64) -> ()
          %250 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%192) : (i64) -> ()
          %251 = func.call @stack_pop_pointer() : () -> i64
          %252 = func.call @cc_nil_value() : () -> i64
          %253 = func.call @cc_errorp(%250) : (i64) -> i64
          %254 = arith.cmpi ne, %253, %252 : i64
          %255 = arith.cmpi eq, %252, %252 : i64
          %256 = arith.andi %254, %255 : i1
          %257 = scf.if %256 -> (i64) {
            scf.yield %250 : i64
          } else {
            scf.yield %252 : i64
          }
          %258 = func.call @cc_errorp(%251) : (i64) -> i64
          %259 = arith.cmpi ne, %258, %252 : i64
          %260 = arith.cmpi eq, %257, %252 : i64
          %261 = arith.andi %259, %260 : i1
          %262 = scf.if %261 -> (i64) {
            scf.yield %251 : i64
          } else {
            scf.yield %257 : i64
          }
          %263 = arith.cmpi ne, %262, %252 : i64
          scf.if %263 {
            func.call @stack_push_pointer(%262) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%250) : (i64) -> ()
            func.call @stack_push_pointer(%251) : (i64) -> ()
            %264 = llvm.mlir.addressof @str20 : !llvm.ptr
            %265 = func.call @cc_make_function_ref_const(%264) : (!llvm.ptr) -> i64
            %266 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%265, %266) : (i64, i64) -> ()
          }
          %267 = func.call @stack_depth() : () -> i64
          %268 = arith.constant 0 : i64
          %269 = arith.cmpi sgt, %267, %268 : i64
          scf.if %269 {
            %270 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%249) : (i64) -> ()
          %271 = func.call @stack_pop_pointer() : () -> i64
          %272 = arith.constant 1 : i64
          func.call @stack_push_fixnum(%272) : (i64) -> ()
          %273 = func.call @stack_pop_pointer() : () -> i64
          %275 = arith.constant 3 : i64
          %274 = arith.andi %271, %275 : i64
          %276 = arith.constant 0 : i64
          %277 = arith.cmpi eq, %274, %276 : i64
          %279 = arith.constant 3 : i64
          %278 = arith.andi %273, %279 : i64
          %280 = arith.constant 0 : i64
          %281 = arith.cmpi eq, %278, %280 : i64
          %282 = arith.andi %277, %281 : i1
          %283 = scf.if %282 -> (i64) {
            %284 = arith.constant 2 : i64
            %285 = arith.shrsi %271, %284 : i64
            %286 = arith.constant 2 : i64
            %287 = arith.shrsi %273, %286 : i64
            %288 = arith.addi %285, %287 : i64
            %289 = arith.constant -2305843009213693952 : i64
            %290 = arith.constant 2305843009213693951 : i64
            %291 = arith.cmpi sge, %288, %289 : i64
            %292 = arith.cmpi sle, %288, %290 : i64
            %293 = arith.andi %291, %292 : i1
            %294 = scf.if %293 -> (i64) {
              %295 = arith.constant 2 : i64
              %296 = arith.shli %288, %295 : i64
              scf.yield %296 : i64
            } else {
              %297 = func.call @cc_add(%271, %273) : (i64, i64) -> i64
              scf.yield %297 : i64
            }
            scf.yield %294 : i64
          } else {
            %298 = func.call @cc_add(%271, %273) : (i64, i64) -> i64
            scf.yield %298 : i64
          }
          func.call @stack_push_pointer(%283) : (i64) -> ()
          %299 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%299) : (i64) -> ()
          %300 = func.call @stack_depth() : () -> i64
          %301 = arith.constant 0 : i64
          %302 = arith.cmpi sgt, %300, %301 : i64
          scf.if %302 {
            %303 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %299 : i64
        }
        func.call @stack_push_nil() : () -> ()
        %304 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_nil() : () -> ()
        %305 = func.call @stack_pop_pointer() : () -> i64
        %306 = func.call @cc_multiple_value_list(%305) : (i64) -> i64
        %307 = llvm.mlir.addressof @str21 : !llvm.ptr
        %308 = arith.constant 37 : i64
        %309 = func.call @cc_make_symbol(%307, %308) : (!llvm.ptr, i64) -> i64
        %310 = func.call @cc_symbol_value(%309) : (i64) -> i64
        %311 = llvm.mlir.addressof @str22 : !llvm.ptr
        %312 = arith.constant 38 : i64
        %313 = func.call @cc_make_symbol(%311, %312) : (!llvm.ptr, i64) -> i64
        %314 = func.call @cc_symbol_value(%313) : (i64) -> i64
        %315 = llvm.mlir.addressof @str23 : !llvm.ptr
        %316 = arith.constant 39 : i64
        %317 = func.call @cc_make_symbol(%315, %316) : (!llvm.ptr, i64) -> i64
        %318 = func.call @cc_symbol_value(%317) : (i64) -> i64
        %319 = func.call @cc_nil_value() : () -> i64
        %320 = arith.cmpi ne, %310, %319 : i64
        %321 = scf.if %320 -> (i64) {
          scf.yield %318 : i64
        } else {
          scf.yield %306 : i64
        }
        %322 = func.call @cc_values_pack(%321) : (i64) -> i64
        func.call @stack_push_pointer(%322) : (i64) -> ()
        %323 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %323 : i64
      }
      func.call @stack_push_pointer(%206) : (i64) -> ()
      %324 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %324 : i64
    }
    %325 = func.call @cc_nil_value() : () -> i64
    %326 = func.call @cc_errorp(%197) : (i64) -> i64
    %327 = arith.cmpi ne, %326, %325 : i64
    %328 = scf.if %327 -> (i64) {
      scf.yield %197 : i64
    } else {
      func.call @stack_push_pointer(%192) : (i64) -> ()
      %329 = func.call @stack_pop_pointer() : () -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_errorp(%329) : (i64) -> i64
      %332 = arith.cmpi ne, %331, %330 : i64
      %333 = arith.cmpi eq, %330, %330 : i64
      %334 = arith.andi %332, %333 : i1
      %335 = scf.if %334 -> (i64) {
        scf.yield %329 : i64
      } else {
        scf.yield %330 : i64
      }
      %336 = arith.cmpi ne, %335, %330 : i64
      scf.if %336 {
        func.call @stack_push_pointer(%335) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%329) : (i64) -> ()
        %337 = llvm.mlir.addressof @str24 : !llvm.ptr
        %338 = func.call @cc_make_function_ref_const(%337) : (!llvm.ptr) -> i64
        %339 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%338, %339) : (i64, i64) -> ()
      }
      %340 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %340 : i64
    }
    %341 = func.call @cc_nil_value() : () -> i64
    %342 = func.call @cc_errorp(%328) : (i64) -> i64
    %343 = arith.cmpi ne, %342, %341 : i64
    %344 = scf.if %343 -> (i64) {
      scf.yield %328 : i64
    } else {
      %345 = llvm.mlir.addressof @str25 : !llvm.ptr
      %346 = arith.constant 7 : i64
      %347 = func.call @cc_make_string(%345, %346) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%347) : (i64) -> ()
      %348 = func.call @stack_pop_pointer() : () -> i64
      %349 = llvm.mlir.addressof @str26 : !llvm.ptr
      %350 = arith.constant 9 : i64
      %351 = func.call @cc_make_string(%349, %350) : (!llvm.ptr, i64) -> i64
      %352 = llvm.mlir.addressof @str27 : !llvm.ptr
      %353 = arith.constant 7 : i64
      %354 = func.call @cc_make_string(%352, %353) : (!llvm.ptr, i64) -> i64
      %355 = func.call @cc_intern(%351, %354) : (i64, i64) -> i64
      %356 = func.call @cc_nil_value() : () -> i64
      %357 = func.call @cc_cons(%355, %356) : (i64, i64) -> i64
      %358 = func.call @cc_values_pack(%357) : (i64) -> i64
      func.call @stack_push_pointer(%355) : (i64) -> ()
      %359 = func.call @stack_pop_pointer() : () -> i64
      %360 = llvm.mlir.addressof @str28 : !llvm.ptr
      %361 = arith.constant 5 : i64
      %362 = func.call @cc_make_string(%360, %361) : (!llvm.ptr, i64) -> i64
      %363 = llvm.mlir.addressof @str29 : !llvm.ptr
      %364 = arith.constant 7 : i64
      %365 = func.call @cc_make_string(%363, %364) : (!llvm.ptr, i64) -> i64
      %366 = func.call @cc_intern(%362, %365) : (i64, i64) -> i64
      %367 = func.call @cc_nil_value() : () -> i64
      %368 = func.call @cc_cons(%366, %367) : (i64, i64) -> i64
      %369 = func.call @cc_values_pack(%368) : (i64) -> i64
      func.call @stack_push_pointer(%366) : (i64) -> ()
      %370 = func.call @stack_pop_pointer() : () -> i64
      %371 = llvm.mlir.addressof @str30 : !llvm.ptr
      %372 = arith.constant 12 : i64
      %373 = func.call @cc_make_string(%371, %372) : (!llvm.ptr, i64) -> i64
      %374 = llvm.mlir.addressof @str31 : !llvm.ptr
      %375 = arith.constant 7 : i64
      %376 = func.call @cc_make_string(%374, %375) : (!llvm.ptr, i64) -> i64
      %377 = func.call @cc_intern(%373, %376) : (i64, i64) -> i64
      %378 = func.call @cc_nil_value() : () -> i64
      %379 = func.call @cc_cons(%377, %378) : (i64, i64) -> i64
      %380 = func.call @cc_values_pack(%379) : (i64) -> i64
      func.call @stack_push_pointer(%377) : (i64) -> ()
      %381 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%26) : (i64) -> ()
      %382 = func.call @stack_pop_pointer() : () -> i64
      %383 = func.call @cc_nil_value() : () -> i64
      %384 = func.call @cc_errorp(%348) : (i64) -> i64
      %385 = arith.cmpi ne, %384, %383 : i64
      %386 = arith.cmpi eq, %383, %383 : i64
      %387 = arith.andi %385, %386 : i1
      %388 = scf.if %387 -> (i64) {
        scf.yield %348 : i64
      } else {
        scf.yield %383 : i64
      }
      %389 = func.call @cc_errorp(%359) : (i64) -> i64
      %390 = arith.cmpi ne, %389, %383 : i64
      %391 = arith.cmpi eq, %388, %383 : i64
      %392 = arith.andi %390, %391 : i1
      %393 = scf.if %392 -> (i64) {
        scf.yield %359 : i64
      } else {
        scf.yield %388 : i64
      }
      %394 = func.call @cc_errorp(%370) : (i64) -> i64
      %395 = arith.cmpi ne, %394, %383 : i64
      %396 = arith.cmpi eq, %393, %383 : i64
      %397 = arith.andi %395, %396 : i1
      %398 = scf.if %397 -> (i64) {
        scf.yield %370 : i64
      } else {
        scf.yield %393 : i64
      }
      %399 = func.call @cc_errorp(%381) : (i64) -> i64
      %400 = arith.cmpi ne, %399, %383 : i64
      %401 = arith.cmpi eq, %398, %383 : i64
      %402 = arith.andi %400, %401 : i1
      %403 = scf.if %402 -> (i64) {
        scf.yield %381 : i64
      } else {
        scf.yield %398 : i64
      }
      %404 = func.call @cc_errorp(%382) : (i64) -> i64
      %405 = arith.cmpi ne, %404, %383 : i64
      %406 = arith.cmpi eq, %403, %383 : i64
      %407 = arith.andi %405, %406 : i1
      %408 = scf.if %407 -> (i64) {
        scf.yield %382 : i64
      } else {
        scf.yield %403 : i64
      }
      %409 = arith.cmpi ne, %408, %383 : i64
      scf.if %409 {
        func.call @stack_push_pointer(%408) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%348) : (i64) -> ()
        func.call @stack_push_pointer(%359) : (i64) -> ()
        func.call @stack_push_pointer(%370) : (i64) -> ()
        func.call @stack_push_pointer(%381) : (i64) -> ()
        func.call @stack_push_pointer(%382) : (i64) -> ()
        %410 = llvm.mlir.addressof @str32 : !llvm.ptr
        %411 = func.call @cc_make_function_ref_const(%410) : (!llvm.ptr) -> i64
        %412 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%411, %412) : (i64, i64) -> ()
      }
      %413 = func.call @stack_pop_pointer() : () -> i64
      %414 = func.call @cc_nil_value() : () -> i64
      %415 = func.call @cc_nil_value() : () -> i64
      %416 = func.call @cc_errorp(%414) : (i64) -> i64
      %417 = arith.cmpi ne, %416, %415 : i64
      %418 = scf.if %417 -> (i64) {
        scf.yield %414 : i64
      } else {
        %419 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%419) : (i64) -> ()
        %420 = func.call @stack_pop_pointer() : () -> i64
        %421 = llvm.mlir.addressof @str33 : !llvm.ptr
        %422 = arith.constant 55 : i64
        %423 = func.call @cc_make_string(%421, %422) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%423) : (i64) -> ()
        %424 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%413) : (i64) -> ()
        %425 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%413) : (i64) -> ()
        %426 = func.call @stack_pop_pointer() : () -> i64
        %427 = func.call @cc_streamp(%426) : (i64) -> i64
        func.call @stack_push_pointer(%427) : (i64) -> ()
        %428 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%413) : (i64) -> ()
        %429 = func.call @stack_pop_pointer() : () -> i64
        %430 = func.call @cc_nil_value() : () -> i64
        %431 = func.call @cc_errorp(%429) : (i64) -> i64
        %432 = arith.cmpi ne, %431, %430 : i64
        %433 = arith.cmpi eq, %430, %430 : i64
        %434 = arith.andi %432, %433 : i1
        %435 = scf.if %434 -> (i64) {
          scf.yield %429 : i64
        } else {
          scf.yield %430 : i64
        }
        %436 = arith.cmpi ne, %435, %430 : i64
        scf.if %436 {
          func.call @stack_push_pointer(%435) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%429) : (i64) -> ()
          %437 = llvm.mlir.addressof @str34 : !llvm.ptr
          %438 = func.call @cc_make_function_ref_const(%437) : (!llvm.ptr) -> i64
          %439 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%438, %439) : (i64, i64) -> ()
        }
        %440 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%413) : (i64) -> ()
        %441 = func.call @stack_pop_pointer() : () -> i64
        %442 = func.call @cc_nil_value() : () -> i64
        %443 = func.call @cc_errorp(%441) : (i64) -> i64
        %444 = arith.cmpi ne, %443, %442 : i64
        %445 = arith.cmpi eq, %442, %442 : i64
        %446 = arith.andi %444, %445 : i1
        %447 = scf.if %446 -> (i64) {
          scf.yield %441 : i64
        } else {
          scf.yield %442 : i64
        }
        %448 = arith.cmpi ne, %447, %442 : i64
        scf.if %448 {
          func.call @stack_push_pointer(%447) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%441) : (i64) -> ()
          %449 = llvm.mlir.addressof @str35 : !llvm.ptr
          %450 = func.call @cc_make_function_ref_const(%449) : (!llvm.ptr) -> i64
          %451 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%450, %451) : (i64, i64) -> ()
        }
        %452 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%413) : (i64) -> ()
        %453 = func.call @stack_pop_pointer() : () -> i64
        %454 = func.call @cc_nil_value() : () -> i64
        %455 = func.call @cc_errorp(%453) : (i64) -> i64
        %456 = arith.cmpi ne, %455, %454 : i64
        %457 = arith.cmpi eq, %454, %454 : i64
        %458 = arith.andi %456, %457 : i1
        %459 = scf.if %458 -> (i64) {
          scf.yield %453 : i64
        } else {
          scf.yield %454 : i64
        }
        %460 = arith.cmpi ne, %459, %454 : i64
        scf.if %460 {
          func.call @stack_push_pointer(%459) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%453) : (i64) -> ()
          %461 = llvm.mlir.addressof @str36 : !llvm.ptr
          %462 = func.call @cc_make_function_ref_const(%461) : (!llvm.ptr) -> i64
          %463 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%462, %463) : (i64, i64) -> ()
        }
        %464 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%413) : (i64) -> ()
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
          %473 = llvm.mlir.addressof @str37 : !llvm.ptr
          %474 = func.call @cc_make_function_ref_const(%473) : (!llvm.ptr) -> i64
          %475 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%474, %475) : (i64, i64) -> ()
        }
        %476 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%91) : (i64) -> ()
        %477 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%26) : (i64) -> ()
        %478 = func.call @stack_pop_pointer() : () -> i64
        %479 = func.call @cc_nil_value() : () -> i64
        %480 = func.call @cc_errorp(%464) : (i64) -> i64
        %481 = arith.cmpi ne, %480, %479 : i64
        %482 = arith.cmpi eq, %479, %479 : i64
        %483 = arith.andi %481, %482 : i1
        %484 = scf.if %483 -> (i64) {
          scf.yield %464 : i64
        } else {
          scf.yield %479 : i64
        }
        %485 = func.call @cc_errorp(%476) : (i64) -> i64
        %486 = arith.cmpi ne, %485, %479 : i64
        %487 = arith.cmpi eq, %484, %479 : i64
        %488 = arith.andi %486, %487 : i1
        %489 = scf.if %488 -> (i64) {
          scf.yield %476 : i64
        } else {
          scf.yield %484 : i64
        }
        %490 = func.call @cc_errorp(%477) : (i64) -> i64
        %491 = arith.cmpi ne, %490, %479 : i64
        %492 = arith.cmpi eq, %489, %479 : i64
        %493 = arith.andi %491, %492 : i1
        %494 = scf.if %493 -> (i64) {
          scf.yield %477 : i64
        } else {
          scf.yield %489 : i64
        }
        %495 = func.call @cc_errorp(%478) : (i64) -> i64
        %496 = arith.cmpi ne, %495, %479 : i64
        %497 = arith.cmpi eq, %494, %479 : i64
        %498 = arith.andi %496, %497 : i1
        %499 = scf.if %498 -> (i64) {
          scf.yield %478 : i64
        } else {
          scf.yield %494 : i64
        }
        %500 = arith.cmpi ne, %499, %479 : i64
        scf.if %500 {
          func.call @stack_push_pointer(%499) : (i64) -> ()
        } else {
          %501 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%501) : (i64) -> ()
          func.call @stack_push_pointer(%478) : (i64) -> ()
          %502 = func.call @stack_pop_pointer() : () -> i64
          %503 = func.call @stack_pop_pointer() : () -> i64
          %504 = func.call @cc_cons(%502, %503) : (i64, i64) -> i64
          func.call @stack_push_pointer(%504) : (i64) -> ()
          func.call @stack_push_pointer(%477) : (i64) -> ()
          %505 = func.call @stack_pop_pointer() : () -> i64
          %506 = func.call @stack_pop_pointer() : () -> i64
          %507 = func.call @cc_cons(%505, %506) : (i64, i64) -> i64
          func.call @stack_push_pointer(%507) : (i64) -> ()
          func.call @stack_push_pointer(%476) : (i64) -> ()
          %508 = func.call @stack_pop_pointer() : () -> i64
          %509 = func.call @stack_pop_pointer() : () -> i64
          %510 = func.call @cc_cons(%508, %509) : (i64, i64) -> i64
          func.call @stack_push_pointer(%510) : (i64) -> ()
          func.call @stack_push_pointer(%464) : (i64) -> ()
          %511 = func.call @stack_pop_pointer() : () -> i64
          %512 = func.call @stack_pop_pointer() : () -> i64
          %513 = func.call @cc_cons(%511, %512) : (i64, i64) -> i64
          func.call @stack_push_pointer(%513) : (i64) -> ()
        }
        %514 = func.call @stack_pop_pointer() : () -> i64
        %515 = func.call @cc_car(%514) : (i64) -> i64
        func.call @stack_push_pointer(%515) : (i64) -> ()
        %516 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%420) : (i64) -> ()
        func.call @stack_push_pointer(%424) : (i64) -> ()
        func.call @stack_push_pointer(%425) : (i64) -> ()
        func.call @stack_push_pointer(%428) : (i64) -> ()
        func.call @stack_push_pointer(%440) : (i64) -> ()
        func.call @stack_push_pointer(%452) : (i64) -> ()
        func.call @stack_push_pointer(%516) : (i64) -> ()
        %517 = llvm.mlir.addressof @str38 : !llvm.ptr
        %518 = func.call @cc_make_function_ref_const(%517) : (!llvm.ptr) -> i64
        %519 = arith.constant 7 : i64
        func.call @cc_funcall_stack(%518, %519) : (i64, i64) -> ()
        %520 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %520 : i64
      }
      %521 = func.call @cc_nil_value() : () -> i64
      %522 = func.call @cc_errorp(%418) : (i64) -> i64
      %523 = arith.cmpi ne, %522, %521 : i64
      %524 = scf.if %523 -> (i64) {
        scf.yield %418 : i64
      } else {
        func.call @stack_push_pointer(%413) : (i64) -> ()
        %525 = func.call @stack_pop_pointer() : () -> i64
        %526 = func.call @cc_nil_value() : () -> i64
        %527 = func.call @cc_errorp(%525) : (i64) -> i64
        %528 = arith.cmpi ne, %527, %526 : i64
        %529 = arith.cmpi eq, %526, %526 : i64
        %530 = arith.andi %528, %529 : i1
        %531 = scf.if %530 -> (i64) {
          scf.yield %525 : i64
        } else {
          scf.yield %526 : i64
        }
        %532 = arith.cmpi ne, %531, %526 : i64
        scf.if %532 {
          func.call @stack_push_pointer(%531) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%525) : (i64) -> ()
          %533 = llvm.mlir.addressof @str39 : !llvm.ptr
          %534 = func.call @cc_make_function_ref_const(%533) : (!llvm.ptr) -> i64
          %535 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%534, %535) : (i64, i64) -> ()
        }
        %536 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %536 : i64
      }
      func.call @stack_push_pointer(%524) : (i64) -> ()
      %537 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %537 : i64
    }
    func.call @stack_push_pointer(%344) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str2("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str3("ASH\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str4("MAX\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str5("tmp.dat\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str6("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str7("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str9("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str10("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str11("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str12("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str13("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str14("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETFLAG_59289003622400*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str18("*__MLIR_BLOCK_RETVALUE_59289003622400*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETMVLIST_59289003622400*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str20("WRITE-BYTE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETFLAG_59289003622400*\00") : !llvm.array<38 x i8>
  llvm.mlir.global private constant @str22("*__MLIR_BLOCK_RETVALUE_59289003622400*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str23("*__MLIR_BLOCK_RETMVLIST_59289003622400*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str24("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str25("tmp.dat\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str26("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str27("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str29("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str30("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str31("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str33("stream=~S streamp=~S file-length=~S elem=~S result=~S~%\00") : !llvm.array<56 x i8>
  llvm.mlir.global private constant @str34("FILE-LENGTH\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str35("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str36("FILE-LENGTH\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("STREAM-ELEMENT-TYPE\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str38("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str39("CLOSE\00") : !llvm.array<6 x i8>
}
