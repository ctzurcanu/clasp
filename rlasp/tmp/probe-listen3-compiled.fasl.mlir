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
    %9 = arith.constant 3 : i64
    %10 = func.call @cc_make_string(%8, %9) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%10) : (i64) -> ()
    %11 = func.call @stack_pop_pointer() : () -> i64
    %12 = func.call @cc_make_string_input_stream(%11) : (i64) -> i64
    func.call @stack_push_pointer(%12) : (i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = func.call @cc_nil_value() : () -> i64
    %15 = func.call @cc_errorp(%13) : (i64) -> i64
    %16 = arith.cmpi ne, %15, %14 : i64
    %17 = arith.cmpi eq, %14, %14 : i64
    %18 = arith.andi %16, %17 : i1
    %19 = scf.if %18 -> (i64) {
      scf.yield %13 : i64
    } else {
      scf.yield %14 : i64
    }
    %20 = arith.cmpi ne, %19, %14 : i64
    scf.if %20 {
      func.call @stack_push_pointer(%19) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%13) : (i64) -> ()
      %21 = llvm.mlir.addressof @str2 : !llvm.ptr
      %22 = func.call @cc_make_function_ref_const(%21) : (!llvm.ptr) -> i64
      %23 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%22, %23) : (i64, i64) -> ()
    }
    %24 = func.call @stack_pop_pointer() : () -> i64
    %25 = func.call @cc_nil_value() : () -> i64
    %26 = func.call @cc_cons(%24, %25) : (i64, i64) -> i64
    %27 = func.call @cc_not(%26) : (i64) -> i64
    func.call @stack_push_pointer(%27) : (i64) -> ()
    %28 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %29 = func.call @stack_pop_pointer() : () -> i64
    %30 = func.call @cc_nil_value() : () -> i64
    %31 = func.call @cc_errorp(%29) : (i64) -> i64
    %32 = arith.cmpi ne, %31, %30 : i64
    %33 = scf.if %32 -> (i64) {
      scf.yield %29 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %34 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %35 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_nil() : () -> ()
      %36 = func.call @stack_pop_pointer() : () -> i64
      %37 = func.call @cc_nil_value() : () -> i64
      %38 = func.call @cc_nil_value() : () -> i64
      %39 = func.call @cc_errorp(%37) : (i64) -> i64
      %40 = arith.cmpi ne, %39, %38 : i64
      %41 = scf.if %40 -> (i64) {
        scf.yield %37 : i64
      } else {
        %42 = func.call @cc_nil_value() : () -> i64
        %43 = llvm.mlir.addressof @str3 : !llvm.ptr
        %44 = arith.constant 38 : i64
        %45 = func.call @cc_make_symbol(%43, %44) : (!llvm.ptr, i64) -> i64
        %46 = func.call @cc_set_symbol_value(%45, %42) : (i64, i64) -> i64
        %47 = llvm.mlir.addressof @str4 : !llvm.ptr
        %48 = arith.constant 39 : i64
        %49 = func.call @cc_make_symbol(%47, %48) : (!llvm.ptr, i64) -> i64
        %50 = func.call @cc_set_symbol_value(%49, %42) : (i64, i64) -> i64
        %51 = llvm.mlir.addressof @str5 : !llvm.ptr
        %52 = arith.constant 40 : i64
        %53 = func.call @cc_make_symbol(%51, %52) : (!llvm.ptr, i64) -> i64
        %54 = func.call @cc_set_symbol_value(%53, %42) : (i64, i64) -> i64
        %55:3 = scf.while (%arg0 = %36, %arg1 = %35, %arg2 = %34) : (i64, i64, i64) -> (i64, i64, i64) {
          %56 = func.call @cc_nil_value() : () -> i64
          func.call @stack_push_pointer(%arg2) : (i64) -> ()
          %57 = func.call @stack_pop_pointer() : () -> i64
          %58 = func.call @cc_nil_value() : () -> i64
          %59 = func.call @cc_cons(%57, %58) : (i64, i64) -> i64
          %60 = func.call @cc_not(%59) : (i64) -> i64
          func.call @stack_push_pointer(%60) : (i64) -> ()
          %61 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%arg1) : (i64) -> ()
          %62 = func.call @stack_pop_pointer() : () -> i64
          %63 = func.call @cc_nil_value() : () -> i64
          %64 = func.call @cc_cons(%62, %63) : (i64, i64) -> i64
          %65 = func.call @cc_not(%64) : (i64) -> i64
          func.call @stack_push_pointer(%65) : (i64) -> ()
          %66 = func.call @stack_pop_pointer() : () -> i64
          %67 = func.call @cc_cons(%66, %56) : (i64, i64) -> i64
          %68 = func.call @cc_cons(%61, %67) : (i64, i64) -> i64
          %69 = func.call @cc_and(%68) : (i64) -> i64
          func.call @stack_push_pointer(%69) : (i64) -> ()
          %70 = func.call @stack_pop_pointer() : () -> i64
          %71 = func.call @cc_nil_value() : () -> i64
          %72 = arith.cmpi ne, %70, %71 : i64
          scf.condition(%72) %arg0, %arg1, %arg2 : i64, i64, i64
        } do {
          ^bb0(%73: i64, %74: i64, %75: i64):
          %76 = func.call @cc_nil_value() : () -> i64
          %77 = func.call @cc_nil_value() : () -> i64
          %78 = func.call @cc_errorp(%76) : (i64) -> i64
          %79 = arith.cmpi ne, %78, %77 : i64
          %80 = scf.if %79 -> (i64) {
            scf.yield %76 : i64
          } else {
            func.call @stack_push_pointer(%12) : (i64) -> ()
            %81 = func.call @stack_pop_pointer() : () -> i64
            %82 = func.call @cc_nil_value() : () -> i64
            %83 = func.call @cc_errorp(%81) : (i64) -> i64
            %84 = arith.cmpi ne, %83, %82 : i64
            %85 = arith.cmpi eq, %82, %82 : i64
            %86 = arith.andi %84, %85 : i1
            %87 = scf.if %86 -> (i64) {
              scf.yield %81 : i64
            } else {
              scf.yield %82 : i64
            }
            %88 = arith.cmpi ne, %87, %82 : i64
            scf.if %88 {
              func.call @stack_push_pointer(%87) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%81) : (i64) -> ()
              %89 = llvm.mlir.addressof @str6 : !llvm.ptr
              %90 = func.call @cc_make_function_ref_const(%89) : (!llvm.ptr) -> i64
              %91 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%90, %91) : (i64, i64) -> ()
            }
            %92 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %92 : i64
          }
          func.call @stack_push_pointer(%80) : (i64) -> ()
          %93 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%93) : (i64) -> ()
          %94 = func.call @stack_depth() : () -> i64
          %95 = arith.constant 0 : i64
          %96 = arith.cmpi sgt, %94, %95 : i64
          scf.if %96 {
            %97 = func.call @stack_pop_pointer() : () -> i64
          }
          func.call @stack_push_pointer(%93) : (i64) -> ()
          %98 = func.call @stack_pop_pointer() : () -> i64
          %99 = func.call @cc_errorp(%98) : (i64) -> i64
          func.call @stack_push_pointer(%99) : (i64) -> ()
          %100 = func.call @stack_pop_pointer() : () -> i64
          %101 = func.call @cc_nil_value() : () -> i64
          %102 = arith.cmpi ne, %100, %101 : i64
          %103:2 = scf.if %102 -> (i64, i64) {
            %104 = func.call @cc_nil_value() : () -> i64
            %105 = func.call @cc_nil_value() : () -> i64
            %106 = func.call @cc_errorp(%104) : (i64) -> i64
            %107 = arith.cmpi ne, %106, %105 : i64
            %108:3 = scf.if %107 -> (i64, i64, i64) {
              scf.yield %104, %75, %74 : i64, i64, i64
            } else {
              func.call @stack_push_pointer(%93) : (i64) -> ()
              %109 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%109) : (i64) -> ()
              %110 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %110, %75, %109 : i64, i64, i64
            }
            %111 = func.call @cc_nil_value() : () -> i64
            %112 = func.call @cc_errorp(%108#0) : (i64) -> i64
            %113 = arith.cmpi ne, %112, %111 : i64
            %114:3 = scf.if %113 -> (i64, i64, i64) {
              scf.yield %108#0, %108#1, %108#2 : i64, i64, i64
            } else {
              %115 = func.call @cc_t_value() : () -> i64
              func.call @stack_push_pointer(%115) : (i64) -> ()
              %116 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%116) : (i64) -> ()
              %117 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %117, %116, %108#2 : i64, i64, i64
            }
            func.call @stack_push_pointer(%114#0) : (i64) -> ()
            %118 = func.call @stack_depth() : () -> i64
            %119 = arith.constant 0 : i64
            %120 = arith.cmpi sgt, %118, %119 : i64
            scf.if %120 {
              %121 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %114#2, %114#1 : i64, i64
          } else {
            func.call @stack_push_nil() : () -> ()
            %122 = func.call @stack_depth() : () -> i64
            %123 = arith.constant 0 : i64
            %124 = arith.cmpi sgt, %122, %123 : i64
            scf.if %124 {
              %125 = func.call @stack_pop_pointer() : () -> i64
            }
            scf.yield %74, %75 : i64, i64
          }
          func.call @stack_push_nil() : () -> ()
          %126 = func.call @stack_depth() : () -> i64
          %127 = arith.constant 0 : i64
          %128 = arith.cmpi sgt, %126, %127 : i64
          scf.if %128 {
            %129 = func.call @stack_pop_pointer() : () -> i64
          }
          scf.yield %93, %103#0, %103#1 : i64, i64, i64
        }
        func.call @stack_push_nil() : () -> ()
        %130 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%55#1) : (i64) -> ()
        %131 = func.call @stack_pop_pointer() : () -> i64
        %132 = func.call @cc_nil_value() : () -> i64
        %133 = arith.cmpi ne, %131, %132 : i64
        scf.if %133 {
          func.call @stack_push_pointer(%55#1) : (i64) -> ()
        } else {
          func.call @stack_push_nil() : () -> ()
        }
        %134 = func.call @stack_pop_pointer() : () -> i64
        %135 = func.call @cc_multiple_value_list(%134) : (i64) -> i64
        %136 = llvm.mlir.addressof @str7 : !llvm.ptr
        %137 = arith.constant 38 : i64
        %138 = func.call @cc_make_symbol(%136, %137) : (!llvm.ptr, i64) -> i64
        %139 = func.call @cc_symbol_value(%138) : (i64) -> i64
        %140 = llvm.mlir.addressof @str8 : !llvm.ptr
        %141 = arith.constant 39 : i64
        %142 = func.call @cc_make_symbol(%140, %141) : (!llvm.ptr, i64) -> i64
        %143 = func.call @cc_symbol_value(%142) : (i64) -> i64
        %144 = llvm.mlir.addressof @str9 : !llvm.ptr
        %145 = arith.constant 40 : i64
        %146 = func.call @cc_make_symbol(%144, %145) : (!llvm.ptr, i64) -> i64
        %147 = func.call @cc_symbol_value(%146) : (i64) -> i64
        %148 = func.call @cc_nil_value() : () -> i64
        %149 = arith.cmpi ne, %139, %148 : i64
        %150 = scf.if %149 -> (i64) {
          scf.yield %147 : i64
        } else {
          scf.yield %135 : i64
        }
        %151 = func.call @cc_values_pack(%150) : (i64) -> i64
        func.call @stack_push_pointer(%151) : (i64) -> ()
        %152 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %152 : i64
      }
      func.call @stack_push_pointer(%41) : (i64) -> ()
      %153 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %153 : i64
    }
    func.call @stack_push_pointer(%33) : (i64) -> ()
    %154 = func.call @stack_pop_pointer() : () -> i64
    %155 = func.call @cc_errorp(%154) : (i64) -> i64
    %156 = func.call @cc_nil_value() : () -> i64
    %157 = arith.cmpi ne, %155, %156 : i64
    %158 = scf.if %157 -> (i64) {
      %159 = func.call @cc_condition_value(%154) : (i64) -> i64
      %160 = llvm.mlir.addressof @str10 : !llvm.ptr
      %161 = arith.constant 11 : i64
      %162 = func.call @cc_make_string(%160, %161) : (!llvm.ptr, i64) -> i64
      %163 = llvm.mlir.addressof @str11 : !llvm.ptr
      %164 = arith.constant 11 : i64
      %165 = func.call @cc_make_string(%163, %164) : (!llvm.ptr, i64) -> i64
      %166 = func.call @cc_intern(%162, %165) : (i64, i64) -> i64
      %167 = func.call @cc_nil_value() : () -> i64
      %168 = func.call @cc_cons(%166, %167) : (i64, i64) -> i64
      %169 = func.call @cc_values_pack(%168) : (i64) -> i64
      func.call @stack_push_pointer(%166) : (i64) -> ()
      %170 = func.call @stack_pop_pointer() : () -> i64
      %171 = func.call @cc_typep(%159, %170) : (i64, i64) -> i64
      %172 = func.call @cc_nil_value() : () -> i64
      %173 = arith.cmpi ne, %171, %172 : i64
      %174 = scf.if %173 -> (i64) {
        func.call @stack_push_pointer(%12) : (i64) -> ()
        %175 = func.call @stack_pop_pointer() : () -> i64
        %176 = func.call @cc_nil_value() : () -> i64
        %177 = func.call @cc_errorp(%175) : (i64) -> i64
        %178 = arith.cmpi ne, %177, %176 : i64
        %179 = arith.cmpi eq, %176, %176 : i64
        %180 = arith.andi %178, %179 : i1
        %181 = scf.if %180 -> (i64) {
          scf.yield %175 : i64
        } else {
          scf.yield %176 : i64
        }
        %182 = arith.cmpi ne, %181, %176 : i64
        scf.if %182 {
          func.call @stack_push_pointer(%181) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%175) : (i64) -> ()
          %183 = llvm.mlir.addressof @str12 : !llvm.ptr
          %184 = func.call @cc_make_function_ref_const(%183) : (!llvm.ptr) -> i64
          %185 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%184, %185) : (i64, i64) -> ()
        }
        %186 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %186 : i64
      } else {
        scf.yield %154 : i64
      }
      scf.yield %174 : i64
    } else {
      scf.yield %154 : i64
    }
    func.call @stack_push_pointer(%158) : (i64) -> ()
    %187 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %188 = func.call @stack_pop_pointer() : () -> i64
    %189 = func.call @cc_cons(%187, %188) : (i64, i64) -> i64
    func.call @stack_push_pointer(%189) : (i64) -> ()
    %190 = func.call @stack_pop_pointer() : () -> i64
    %191 = func.call @cc_cons(%28, %190) : (i64, i64) -> i64
    func.call @stack_push_pointer(%191) : (i64) -> ()
    %192 = func.call @stack_pop_pointer() : () -> i64
    %193 = func.call @cc_values_pack(%192) : (i64) -> i64
    func.call @stack_push_pointer(%193) : (i64) -> ()
    %194 = func.call @stack_pop_pointer() : () -> i64
    %195 = func.call @cc_multiple_value_list(%194) : (i64) -> i64
    %196 = arith.constant 0 : i64
    %197 = func.call @cc_box_fixnum(%196) : (i64) -> i64
    %198 = func.call @cc_nth(%197, %195) : (i64, i64) -> i64
    %199 = arith.constant 1 : i64
    %200 = func.call @cc_box_fixnum(%199) : (i64) -> i64
    %201 = func.call @cc_nth(%200, %195) : (i64, i64) -> i64
    %202 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%202) : (i64) -> ()
    %203 = func.call @stack_pop_pointer() : () -> i64
    %204 = llvm.mlir.addressof @str13 : !llvm.ptr
    %205 = arith.constant 23 : i64
    %206 = func.call @cc_make_string(%204, %205) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%206) : (i64) -> ()
    %207 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%198) : (i64) -> ()
    %208 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%201) : (i64) -> ()
    %209 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%203) : (i64) -> ()
    func.call @stack_push_pointer(%207) : (i64) -> ()
    func.call @stack_push_pointer(%208) : (i64) -> ()
    func.call @stack_push_pointer(%209) : (i64) -> ()
    %210 = llvm.mlir.addressof @str14 : !llvm.ptr
    %211 = func.call @cc_make_function_ref_const(%210) : (!llvm.ptr) -> i64
    %212 = arith.constant 4 : i64
    func.call @cc_funcall_stack(%211, %212) : (i64, i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("xxx\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str2("LISTEN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETFLAG_171851338743808*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETVALUE_171851338743808*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str5("*__MLIR_BLOCK_RETMVLIST_171851338743808*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str6("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str7("*__MLIR_BLOCK_RETFLAG_171851338743808*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETVALUE_171851338743808*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETMVLIST_171851338743808*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str10("END-OF-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("LISTEN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str13("listen3 values: ~s ~s~%\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str14("FORMAT\00") : !llvm.array<7 x i8>
}
