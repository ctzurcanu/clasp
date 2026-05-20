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
      %14 = arith.constant 11 : i64
      %15 = func.call @cc_make_string(%13, %14) : (!llvm.ptr, i64) -> i64
      %16 = llvm.mlir.addressof @str2 : !llvm.ptr
      %17 = arith.constant 7 : i64
      %18 = func.call @cc_make_string(%16, %17) : (!llvm.ptr, i64) -> i64
      %19 = func.call @cc_intern(%15, %18) : (i64, i64) -> i64
      %20 = func.call @cc_nil_value() : () -> i64
      %21 = func.call @cc_cons(%19, %20) : (i64, i64) -> i64
      %22 = func.call @cc_values_pack(%21) : (i64) -> i64
      func.call @stack_push_pointer(%19) : (i64) -> ()
      %23 = func.call @stack_pop_pointer() : () -> i64
      %24 = func.call @cc_in_package(%23) : (i64) -> i64
      func.call @stack_push_pointer(%24) : (i64) -> ()
      %25 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %25 : i64
    }
    %26 = func.call @cc_nil_value() : () -> i64
    %27 = func.call @cc_errorp(%12) : (i64) -> i64
    %28 = arith.cmpi ne, %27, %26 : i64
    %29 = scf.if %28 -> (i64) {
      scf.yield %12 : i64
    } else {
      %30 = func.call @cc_push_ignore_errors_trap() : () -> i64
      %31 = func.call @cc_nil_value() : () -> i64
      %32 = func.call @cc_nil_value() : () -> i64
      %33 = func.call @cc_errorp(%31) : (i64) -> i64
      %34 = arith.cmpi ne, %33, %32 : i64
      %35 = scf.if %34 -> (i64) {
        scf.yield %31 : i64
      } else {
        %36 = llvm.mlir.addressof @str3 : !llvm.ptr
        %37 = arith.constant 11 : i64
        %38 = func.call @cc_make_string(%36, %37) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%38) : (i64) -> ()
        %39 = func.call @stack_pop_pointer() : () -> i64
        %40 = func.call @cc_nil_value() : () -> i64
        %41 = func.call @cc_errorp(%39) : (i64) -> i64
        %42 = arith.cmpi ne, %41, %40 : i64
        %43 = arith.cmpi eq, %40, %40 : i64
        %44 = arith.andi %42, %43 : i1
        %45 = scf.if %44 -> (i64) {
          scf.yield %39 : i64
        } else {
          scf.yield %40 : i64
        }
        %46 = arith.cmpi ne, %45, %40 : i64
        scf.if %46 {
          func.call @stack_push_pointer(%45) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%39) : (i64) -> ()
          %47 = llvm.mlir.addressof @str4 : !llvm.ptr
          %48 = func.call @cc_make_function_ref_const(%47) : (!llvm.ptr) -> i64
          %49 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%48, %49) : (i64, i64) -> ()
        }
        %50 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%50) : (i64) -> ()
        %51 = func.call @stack_pop_pointer() : () -> i64
        %52 = llvm.mlir.addressof @str5 : !llvm.ptr
        %53 = arith.constant 17 : i64
        %54 = func.call @cc_make_string(%52, %53) : (!llvm.ptr, i64) -> i64
        %55 = llvm.mlir.addressof @str6 : !llvm.ptr
        %56 = arith.constant 7 : i64
        %57 = func.call @cc_make_string(%55, %56) : (!llvm.ptr, i64) -> i64
        %58 = func.call @cc_intern(%54, %57) : (i64, i64) -> i64
        %59 = func.call @cc_nil_value() : () -> i64
        %60 = func.call @cc_cons(%58, %59) : (i64, i64) -> i64
        %61 = func.call @cc_values_pack(%60) : (i64) -> i64
        func.call @stack_push_pointer(%58) : (i64) -> ()
        %62 = func.call @stack_pop_pointer() : () -> i64
        %63 = llvm.mlir.addressof @str7 : !llvm.ptr
        %64 = arith.constant 6 : i64
        %65 = func.call @cc_make_string(%63, %64) : (!llvm.ptr, i64) -> i64
        %66 = llvm.mlir.addressof @str8 : !llvm.ptr
        %67 = arith.constant 7 : i64
        %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
        %69 = func.call @cc_intern(%65, %68) : (i64, i64) -> i64
        %70 = func.call @cc_nil_value() : () -> i64
        %71 = func.call @cc_cons(%69, %70) : (i64, i64) -> i64
        %72 = func.call @cc_values_pack(%71) : (i64) -> i64
        func.call @stack_push_pointer(%69) : (i64) -> ()
        %73 = func.call @stack_pop_pointer() : () -> i64
        %74 = llvm.mlir.addressof @str9 : !llvm.ptr
        %75 = arith.constant 9 : i64
        %76 = func.call @cc_make_string(%74, %75) : (!llvm.ptr, i64) -> i64
        %77 = llvm.mlir.addressof @str10 : !llvm.ptr
        %78 = arith.constant 7 : i64
        %79 = func.call @cc_make_string(%77, %78) : (!llvm.ptr, i64) -> i64
        %80 = func.call @cc_intern(%76, %79) : (i64, i64) -> i64
        %81 = func.call @cc_nil_value() : () -> i64
        %82 = func.call @cc_cons(%80, %81) : (i64, i64) -> i64
        %83 = func.call @cc_values_pack(%82) : (i64) -> i64
        func.call @stack_push_pointer(%80) : (i64) -> ()
        %84 = func.call @stack_pop_pointer() : () -> i64
        %85 = llvm.mlir.addressof @str11 : !llvm.ptr
        %86 = arith.constant 6 : i64
        %87 = func.call @cc_make_string(%85, %86) : (!llvm.ptr, i64) -> i64
        %88 = llvm.mlir.addressof @str12 : !llvm.ptr
        %89 = arith.constant 7 : i64
        %90 = func.call @cc_make_string(%88, %89) : (!llvm.ptr, i64) -> i64
        %91 = func.call @cc_intern(%87, %90) : (i64, i64) -> i64
        %92 = func.call @cc_nil_value() : () -> i64
        %93 = func.call @cc_cons(%91, %92) : (i64, i64) -> i64
        %94 = func.call @cc_values_pack(%93) : (i64) -> i64
        func.call @stack_push_pointer(%91) : (i64) -> ()
        %95 = func.call @stack_pop_pointer() : () -> i64
        %96 = func.call @cc_nil_value() : () -> i64
        %97 = func.call @cc_errorp(%51) : (i64) -> i64
        %98 = arith.cmpi ne, %97, %96 : i64
        %99 = arith.cmpi eq, %96, %96 : i64
        %100 = arith.andi %98, %99 : i1
        %101 = scf.if %100 -> (i64) {
          scf.yield %51 : i64
        } else {
          scf.yield %96 : i64
        }
        %102 = func.call @cc_errorp(%62) : (i64) -> i64
        %103 = arith.cmpi ne, %102, %96 : i64
        %104 = arith.cmpi eq, %101, %96 : i64
        %105 = arith.andi %103, %104 : i1
        %106 = scf.if %105 -> (i64) {
          scf.yield %62 : i64
        } else {
          scf.yield %101 : i64
        }
        %107 = func.call @cc_errorp(%73) : (i64) -> i64
        %108 = arith.cmpi ne, %107, %96 : i64
        %109 = arith.cmpi eq, %106, %96 : i64
        %110 = arith.andi %108, %109 : i1
        %111 = scf.if %110 -> (i64) {
          scf.yield %73 : i64
        } else {
          scf.yield %106 : i64
        }
        %112 = func.call @cc_errorp(%84) : (i64) -> i64
        %113 = arith.cmpi ne, %112, %96 : i64
        %114 = arith.cmpi eq, %111, %96 : i64
        %115 = arith.andi %113, %114 : i1
        %116 = scf.if %115 -> (i64) {
          scf.yield %84 : i64
        } else {
          scf.yield %111 : i64
        }
        %117 = func.call @cc_errorp(%95) : (i64) -> i64
        %118 = arith.cmpi ne, %117, %96 : i64
        %119 = arith.cmpi eq, %116, %96 : i64
        %120 = arith.andi %118, %119 : i1
        %121 = scf.if %120 -> (i64) {
          scf.yield %95 : i64
        } else {
          scf.yield %116 : i64
        }
        %122 = arith.cmpi ne, %121, %96 : i64
        scf.if %122 {
          func.call @stack_push_pointer(%121) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%51) : (i64) -> ()
          func.call @stack_push_pointer(%62) : (i64) -> ()
          func.call @stack_push_pointer(%73) : (i64) -> ()
          func.call @stack_push_pointer(%84) : (i64) -> ()
          func.call @stack_push_pointer(%95) : (i64) -> ()
          %123 = llvm.mlir.addressof @str13 : !llvm.ptr
          %124 = func.call @cc_make_function_ref_const(%123) : (!llvm.ptr) -> i64
          %125 = arith.constant 5 : i64
          func.call @cc_funcall_stack(%124, %125) : (i64, i64) -> ()
        }
        %126 = func.call @stack_pop_pointer() : () -> i64
        %127 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%127) : (i64) -> ()
        %128 = func.call @stack_pop_pointer() : () -> i64
        %129 = llvm.mlir.addressof @str14 : !llvm.ptr
        %130 = arith.constant 12 : i64
        %131 = func.call @cc_make_string(%129, %130) : (!llvm.ptr, i64) -> i64
        %132 = llvm.mlir.addressof @str15 : !llvm.ptr
        %133 = arith.constant 7 : i64
        %134 = func.call @cc_make_string(%132, %133) : (!llvm.ptr, i64) -> i64
        %135 = func.call @cc_intern(%131, %134) : (i64, i64) -> i64
        %136 = func.call @cc_nil_value() : () -> i64
        %137 = func.call @cc_cons(%135, %136) : (i64, i64) -> i64
        %138 = func.call @cc_values_pack(%137) : (i64) -> i64
        func.call @stack_push_pointer(%135) : (i64) -> ()
        %139 = func.call @stack_pop_pointer() : () -> i64
        %140 = llvm.mlir.addressof @str16 : !llvm.ptr
        %141 = arith.constant 9 : i64
        %142 = func.call @cc_make_string(%140, %141) : (!llvm.ptr, i64) -> i64
        %143 = llvm.mlir.addressof @str17 : !llvm.ptr
        %144 = arith.constant 11 : i64
        %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
        %146 = func.call @cc_intern(%142, %145) : (i64, i64) -> i64
        %147 = func.call @cc_nil_value() : () -> i64
        %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
        %149 = func.call @cc_values_pack(%148) : (i64) -> i64
        func.call @stack_push_pointer(%146) : (i64) -> ()
        %150 = func.call @stack_pop_pointer() : () -> i64
        %151 = func.call @cc_nil_value() : () -> i64
        %152 = func.call @cc_errorp(%128) : (i64) -> i64
        %153 = arith.cmpi ne, %152, %151 : i64
        %154 = arith.cmpi eq, %151, %151 : i64
        %155 = arith.andi %153, %154 : i1
        %156 = scf.if %155 -> (i64) {
          scf.yield %128 : i64
        } else {
          scf.yield %151 : i64
        }
        %157 = func.call @cc_errorp(%139) : (i64) -> i64
        %158 = arith.cmpi ne, %157, %151 : i64
        %159 = arith.cmpi eq, %156, %151 : i64
        %160 = arith.andi %158, %159 : i1
        %161 = scf.if %160 -> (i64) {
          scf.yield %139 : i64
        } else {
          scf.yield %156 : i64
        }
        %162 = func.call @cc_errorp(%150) : (i64) -> i64
        %163 = arith.cmpi ne, %162, %151 : i64
        %164 = arith.cmpi eq, %161, %151 : i64
        %165 = arith.andi %163, %164 : i1
        %166 = scf.if %165 -> (i64) {
          scf.yield %150 : i64
        } else {
          scf.yield %161 : i64
        }
        %167 = arith.cmpi ne, %166, %151 : i64
        scf.if %167 {
          func.call @stack_push_pointer(%166) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%128) : (i64) -> ()
          func.call @stack_push_pointer(%139) : (i64) -> ()
          func.call @stack_push_pointer(%150) : (i64) -> ()
          %168 = llvm.mlir.addressof @str18 : !llvm.ptr
          %169 = func.call @cc_make_function_ref_const(%168) : (!llvm.ptr) -> i64
          %170 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%169, %170) : (i64, i64) -> ()
        }
        %171 = func.call @stack_pop_pointer() : () -> i64
        %172 = func.call @cc_nil_value() : () -> i64
        %173 = func.call @cc_nil_value() : () -> i64
        %174 = func.call @cc_errorp(%172) : (i64) -> i64
        %175 = arith.cmpi ne, %174, %173 : i64
        %176:2 = scf.if %175 -> (i64, i64) {
          scf.yield %172, %126 : i64, i64
        } else {
          %177 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%177) : (i64) -> ()
          %178 = func.call @stack_pop_pointer() : () -> i64
          %179 = llvm.mlir.addressof @str19 : !llvm.ptr
          %180 = arith.constant 9 : i64
          %181 = func.call @cc_make_string(%179, %180) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%181) : (i64) -> ()
          %182 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%50) : (i64) -> ()
          %183 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%178) : (i64) -> ()
          func.call @stack_push_pointer(%182) : (i64) -> ()
          func.call @stack_push_pointer(%183) : (i64) -> ()
          %184 = llvm.mlir.addressof @str20 : !llvm.ptr
          %185 = func.call @cc_make_function_ref_const(%184) : (!llvm.ptr) -> i64
          %186 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%185, %186) : (i64, i64) -> ()
          %187 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %187, %126 : i64, i64
        }
        %188 = func.call @cc_nil_value() : () -> i64
        %189 = func.call @cc_errorp(%176#0) : (i64) -> i64
        %190 = arith.cmpi ne, %189, %188 : i64
        %191:2 = scf.if %190 -> (i64, i64) {
          scf.yield %176#0, %176#1 : i64, i64
        } else {
          %192 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%192) : (i64) -> ()
          %193 = func.call @stack_pop_pointer() : () -> i64
          %194 = llvm.mlir.addressof @str21 : !llvm.ptr
          %195 = arith.constant 10 : i64
          %196 = func.call @cc_make_string(%194, %195) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%196) : (i64) -> ()
          %197 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%176#1) : (i64) -> ()
          %198 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%193) : (i64) -> ()
          func.call @stack_push_pointer(%197) : (i64) -> ()
          func.call @stack_push_pointer(%198) : (i64) -> ()
          %199 = llvm.mlir.addressof @str22 : !llvm.ptr
          %200 = func.call @cc_make_function_ref_const(%199) : (!llvm.ptr) -> i64
          %201 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%200, %201) : (i64, i64) -> ()
          %202 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %202, %176#1 : i64, i64
        }
        %203 = func.call @cc_nil_value() : () -> i64
        %204 = func.call @cc_errorp(%191#0) : (i64) -> i64
        %205 = arith.cmpi ne, %204, %203 : i64
        %206:2 = scf.if %205 -> (i64, i64) {
          scf.yield %191#0, %191#1 : i64, i64
        } else {
          %207 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%207) : (i64) -> ()
          %208 = func.call @stack_pop_pointer() : () -> i64
          %209 = llvm.mlir.addressof @str23 : !llvm.ptr
          %210 = arith.constant 11 : i64
          %211 = func.call @cc_make_string(%209, %210) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%211) : (i64) -> ()
          %212 = func.call @stack_pop_pointer() : () -> i64
          %213 = llvm.mlir.addressof @str24 : !llvm.ptr
          %214 = arith.constant 3 : i64
          %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%215) : (i64) -> ()
          %216 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%191#1) : (i64) -> ()
          %217 = func.call @stack_pop_pointer() : () -> i64
          %218 = func.call @cc_nil_value() : () -> i64
          %219 = func.call @cc_errorp(%216) : (i64) -> i64
          %220 = arith.cmpi ne, %219, %218 : i64
          %221 = arith.cmpi eq, %218, %218 : i64
          %222 = arith.andi %220, %221 : i1
          %223 = scf.if %222 -> (i64) {
            scf.yield %216 : i64
          } else {
            scf.yield %218 : i64
          }
          %224 = func.call @cc_errorp(%217) : (i64) -> i64
          %225 = arith.cmpi ne, %224, %218 : i64
          %226 = arith.cmpi eq, %223, %218 : i64
          %227 = arith.andi %225, %226 : i1
          %228 = scf.if %227 -> (i64) {
            scf.yield %217 : i64
          } else {
            scf.yield %223 : i64
          }
          %229 = arith.cmpi ne, %228, %218 : i64
          scf.if %229 {
            func.call @stack_push_pointer(%228) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%216) : (i64) -> ()
            func.call @stack_push_pointer(%217) : (i64) -> ()
            %230 = llvm.mlir.addressof @str25 : !llvm.ptr
            %231 = func.call @cc_make_function_ref_const(%230) : (!llvm.ptr) -> i64
            %232 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%231, %232) : (i64, i64) -> ()
          }
          %233 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%208) : (i64) -> ()
          func.call @stack_push_pointer(%212) : (i64) -> ()
          func.call @stack_push_pointer(%233) : (i64) -> ()
          %234 = llvm.mlir.addressof @str26 : !llvm.ptr
          %235 = func.call @cc_make_function_ref_const(%234) : (!llvm.ptr) -> i64
          %236 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%235, %236) : (i64, i64) -> ()
          %237 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %237, %191#1 : i64, i64
        }
        %238 = func.call @cc_nil_value() : () -> i64
        %239 = func.call @cc_errorp(%206#0) : (i64) -> i64
        %240 = arith.cmpi ne, %239, %238 : i64
        %241:2 = scf.if %240 -> (i64, i64) {
          scf.yield %206#0, %206#1 : i64, i64
        } else {
          %242 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%242) : (i64) -> ()
          %243 = func.call @stack_pop_pointer() : () -> i64
          %244 = llvm.mlir.addressof @str27 : !llvm.ptr
          %245 = arith.constant 11 : i64
          %246 = func.call @cc_make_string(%244, %245) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%246) : (i64) -> ()
          %247 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%206#1) : (i64) -> ()
          %248 = func.call @stack_pop_pointer() : () -> i64
          %249 = func.call @cc_nil_value() : () -> i64
          %250 = func.call @cc_errorp(%248) : (i64) -> i64
          %251 = arith.cmpi ne, %250, %249 : i64
          %252 = arith.cmpi eq, %249, %249 : i64
          %253 = arith.andi %251, %252 : i1
          %254 = scf.if %253 -> (i64) {
            scf.yield %248 : i64
          } else {
            scf.yield %249 : i64
          }
          %255 = arith.cmpi ne, %254, %249 : i64
          scf.if %255 {
            func.call @stack_push_pointer(%254) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%248) : (i64) -> ()
            %256 = llvm.mlir.addressof @str28 : !llvm.ptr
            %257 = func.call @cc_make_function_ref_const(%256) : (!llvm.ptr) -> i64
            %258 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%257, %258) : (i64, i64) -> ()
          }
          %259 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%243) : (i64) -> ()
          func.call @stack_push_pointer(%247) : (i64) -> ()
          func.call @stack_push_pointer(%259) : (i64) -> ()
          %260 = llvm.mlir.addressof @str29 : !llvm.ptr
          %261 = func.call @cc_make_function_ref_const(%260) : (!llvm.ptr) -> i64
          %262 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%261, %262) : (i64, i64) -> ()
          %263 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %263, %206#1 : i64, i64
        }
        %264 = func.call @cc_nil_value() : () -> i64
        %265 = func.call @cc_errorp(%241#0) : (i64) -> i64
        %266 = arith.cmpi ne, %265, %264 : i64
        %267:2 = scf.if %266 -> (i64, i64) {
          scf.yield %241#0, %241#1 : i64, i64
        } else {
          func.call @stack_push_pointer(%50) : (i64) -> ()
          %268 = func.call @stack_pop_pointer() : () -> i64
          %269 = llvm.mlir.addressof @str30 : !llvm.ptr
          %270 = arith.constant 17 : i64
          %271 = func.call @cc_make_string(%269, %270) : (!llvm.ptr, i64) -> i64
          %272 = llvm.mlir.addressof @str31 : !llvm.ptr
          %273 = arith.constant 7 : i64
          %274 = func.call @cc_make_string(%272, %273) : (!llvm.ptr, i64) -> i64
          %275 = func.call @cc_intern(%271, %274) : (i64, i64) -> i64
          %276 = func.call @cc_nil_value() : () -> i64
          %277 = func.call @cc_cons(%275, %276) : (i64, i64) -> i64
          %278 = func.call @cc_values_pack(%277) : (i64) -> i64
          func.call @stack_push_pointer(%275) : (i64) -> ()
          %279 = func.call @stack_pop_pointer() : () -> i64
          %280 = llvm.mlir.addressof @str32 : !llvm.ptr
          %281 = arith.constant 6 : i64
          %282 = func.call @cc_make_string(%280, %281) : (!llvm.ptr, i64) -> i64
          %283 = llvm.mlir.addressof @str33 : !llvm.ptr
          %284 = arith.constant 7 : i64
          %285 = func.call @cc_make_string(%283, %284) : (!llvm.ptr, i64) -> i64
          %286 = func.call @cc_intern(%282, %285) : (i64, i64) -> i64
          %287 = func.call @cc_nil_value() : () -> i64
          %288 = func.call @cc_cons(%286, %287) : (i64, i64) -> i64
          %289 = func.call @cc_values_pack(%288) : (i64) -> i64
          func.call @stack_push_pointer(%286) : (i64) -> ()
          %290 = func.call @stack_pop_pointer() : () -> i64
          %291 = llvm.mlir.addressof @str34 : !llvm.ptr
          %292 = arith.constant 9 : i64
          %293 = func.call @cc_make_string(%291, %292) : (!llvm.ptr, i64) -> i64
          %294 = llvm.mlir.addressof @str35 : !llvm.ptr
          %295 = arith.constant 7 : i64
          %296 = func.call @cc_make_string(%294, %295) : (!llvm.ptr, i64) -> i64
          %297 = func.call @cc_intern(%293, %296) : (i64, i64) -> i64
          %298 = func.call @cc_nil_value() : () -> i64
          %299 = func.call @cc_cons(%297, %298) : (i64, i64) -> i64
          %300 = func.call @cc_values_pack(%299) : (i64) -> i64
          func.call @stack_push_pointer(%297) : (i64) -> ()
          %301 = func.call @stack_pop_pointer() : () -> i64
          %302 = llvm.mlir.addressof @str36 : !llvm.ptr
          %303 = arith.constant 9 : i64
          %304 = func.call @cc_make_string(%302, %303) : (!llvm.ptr, i64) -> i64
          %305 = llvm.mlir.addressof @str37 : !llvm.ptr
          %306 = arith.constant 7 : i64
          %307 = func.call @cc_make_string(%305, %306) : (!llvm.ptr, i64) -> i64
          %308 = func.call @cc_intern(%304, %307) : (i64, i64) -> i64
          %309 = func.call @cc_nil_value() : () -> i64
          %310 = func.call @cc_cons(%308, %309) : (i64, i64) -> i64
          %311 = func.call @cc_values_pack(%310) : (i64) -> i64
          func.call @stack_push_pointer(%308) : (i64) -> ()
          %312 = func.call @stack_pop_pointer() : () -> i64
          %313 = llvm.mlir.addressof @str38 : !llvm.ptr
          %314 = arith.constant 9 : i64
          %315 = func.call @cc_make_string(%313, %314) : (!llvm.ptr, i64) -> i64
          %316 = llvm.mlir.addressof @str39 : !llvm.ptr
          %317 = arith.constant 7 : i64
          %318 = func.call @cc_make_string(%316, %317) : (!llvm.ptr, i64) -> i64
          %319 = func.call @cc_intern(%315, %318) : (i64, i64) -> i64
          %320 = func.call @cc_nil_value() : () -> i64
          %321 = func.call @cc_cons(%319, %320) : (i64, i64) -> i64
          %322 = func.call @cc_values_pack(%321) : (i64) -> i64
          func.call @stack_push_pointer(%319) : (i64) -> ()
          %323 = func.call @stack_pop_pointer() : () -> i64
          %324 = llvm.mlir.addressof @str40 : !llvm.ptr
          %325 = arith.constant 6 : i64
          %326 = func.call @cc_make_string(%324, %325) : (!llvm.ptr, i64) -> i64
          %327 = llvm.mlir.addressof @str41 : !llvm.ptr
          %328 = arith.constant 7 : i64
          %329 = func.call @cc_make_string(%327, %328) : (!llvm.ptr, i64) -> i64
          %330 = func.call @cc_intern(%326, %329) : (i64, i64) -> i64
          %331 = func.call @cc_nil_value() : () -> i64
          %332 = func.call @cc_cons(%330, %331) : (i64, i64) -> i64
          %333 = func.call @cc_values_pack(%332) : (i64) -> i64
          func.call @stack_push_pointer(%330) : (i64) -> ()
          %334 = func.call @stack_pop_pointer() : () -> i64
          %335 = func.call @cc_nil_value() : () -> i64
          %336 = func.call @cc_errorp(%268) : (i64) -> i64
          %337 = arith.cmpi ne, %336, %335 : i64
          %338 = arith.cmpi eq, %335, %335 : i64
          %339 = arith.andi %337, %338 : i1
          %340 = scf.if %339 -> (i64) {
            scf.yield %268 : i64
          } else {
            scf.yield %335 : i64
          }
          %341 = func.call @cc_errorp(%279) : (i64) -> i64
          %342 = arith.cmpi ne, %341, %335 : i64
          %343 = arith.cmpi eq, %340, %335 : i64
          %344 = arith.andi %342, %343 : i1
          %345 = scf.if %344 -> (i64) {
            scf.yield %279 : i64
          } else {
            scf.yield %340 : i64
          }
          %346 = func.call @cc_errorp(%290) : (i64) -> i64
          %347 = arith.cmpi ne, %346, %335 : i64
          %348 = arith.cmpi eq, %345, %335 : i64
          %349 = arith.andi %347, %348 : i1
          %350 = scf.if %349 -> (i64) {
            scf.yield %290 : i64
          } else {
            scf.yield %345 : i64
          }
          %351 = func.call @cc_errorp(%301) : (i64) -> i64
          %352 = arith.cmpi ne, %351, %335 : i64
          %353 = arith.cmpi eq, %350, %335 : i64
          %354 = arith.andi %352, %353 : i1
          %355 = scf.if %354 -> (i64) {
            scf.yield %301 : i64
          } else {
            scf.yield %350 : i64
          }
          %356 = func.call @cc_errorp(%312) : (i64) -> i64
          %357 = arith.cmpi ne, %356, %335 : i64
          %358 = arith.cmpi eq, %355, %335 : i64
          %359 = arith.andi %357, %358 : i1
          %360 = scf.if %359 -> (i64) {
            scf.yield %312 : i64
          } else {
            scf.yield %355 : i64
          }
          %361 = func.call @cc_errorp(%323) : (i64) -> i64
          %362 = arith.cmpi ne, %361, %335 : i64
          %363 = arith.cmpi eq, %360, %335 : i64
          %364 = arith.andi %362, %363 : i1
          %365 = scf.if %364 -> (i64) {
            scf.yield %323 : i64
          } else {
            scf.yield %360 : i64
          }
          %366 = func.call @cc_errorp(%334) : (i64) -> i64
          %367 = arith.cmpi ne, %366, %335 : i64
          %368 = arith.cmpi eq, %365, %335 : i64
          %369 = arith.andi %367, %368 : i1
          %370 = scf.if %369 -> (i64) {
            scf.yield %334 : i64
          } else {
            scf.yield %365 : i64
          }
          %371 = arith.cmpi ne, %370, %335 : i64
          scf.if %371 {
            func.call @stack_push_pointer(%370) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%268) : (i64) -> ()
            func.call @stack_push_pointer(%279) : (i64) -> ()
            func.call @stack_push_pointer(%290) : (i64) -> ()
            func.call @stack_push_pointer(%301) : (i64) -> ()
            func.call @stack_push_pointer(%312) : (i64) -> ()
            func.call @stack_push_pointer(%323) : (i64) -> ()
            func.call @stack_push_pointer(%334) : (i64) -> ()
            %372 = llvm.mlir.addressof @str42 : !llvm.ptr
            %373 = func.call @cc_make_function_ref_const(%372) : (!llvm.ptr) -> i64
            %374 = arith.constant 7 : i64
            func.call @cc_funcall_stack(%373, %374) : (i64, i64) -> ()
          }
          %375 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%375) : (i64) -> ()
          %376 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %376, %375 : i64, i64
        }
        %377 = func.call @cc_nil_value() : () -> i64
        %378 = func.call @cc_errorp(%267#0) : (i64) -> i64
        %379 = arith.cmpi ne, %378, %377 : i64
        %380:2 = scf.if %379 -> (i64, i64) {
          scf.yield %267#0, %267#1 : i64, i64
        } else {
          %381 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%381) : (i64) -> ()
          %382 = func.call @stack_pop_pointer() : () -> i64
          %383 = llvm.mlir.addressof @str43 : !llvm.ptr
          %384 = arith.constant 10 : i64
          %385 = func.call @cc_make_string(%383, %384) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%385) : (i64) -> ()
          %386 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%267#1) : (i64) -> ()
          %387 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%382) : (i64) -> ()
          func.call @stack_push_pointer(%386) : (i64) -> ()
          func.call @stack_push_pointer(%387) : (i64) -> ()
          %388 = llvm.mlir.addressof @str44 : !llvm.ptr
          %389 = func.call @cc_make_function_ref_const(%388) : (!llvm.ptr) -> i64
          %390 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%389, %390) : (i64, i64) -> ()
          %391 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %391, %267#1 : i64, i64
        }
        %392 = func.call @cc_nil_value() : () -> i64
        %393 = func.call @cc_errorp(%380#0) : (i64) -> i64
        %394 = arith.cmpi ne, %393, %392 : i64
        %395:2 = scf.if %394 -> (i64, i64) {
          scf.yield %380#0, %380#1 : i64, i64
        } else {
          %396 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%396) : (i64) -> ()
          %397 = func.call @stack_pop_pointer() : () -> i64
          %398 = llvm.mlir.addressof @str45 : !llvm.ptr
          %399 = arith.constant 11 : i64
          %400 = func.call @cc_make_string(%398, %399) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%400) : (i64) -> ()
          %401 = func.call @stack_pop_pointer() : () -> i64
          %402 = llvm.mlir.addressof @str46 : !llvm.ptr
          %403 = arith.constant 3 : i64
          %404 = func.call @cc_make_string(%402, %403) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%404) : (i64) -> ()
          %405 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%380#1) : (i64) -> ()
          %406 = func.call @stack_pop_pointer() : () -> i64
          %407 = func.call @cc_nil_value() : () -> i64
          %408 = func.call @cc_errorp(%405) : (i64) -> i64
          %409 = arith.cmpi ne, %408, %407 : i64
          %410 = arith.cmpi eq, %407, %407 : i64
          %411 = arith.andi %409, %410 : i1
          %412 = scf.if %411 -> (i64) {
            scf.yield %405 : i64
          } else {
            scf.yield %407 : i64
          }
          %413 = func.call @cc_errorp(%406) : (i64) -> i64
          %414 = arith.cmpi ne, %413, %407 : i64
          %415 = arith.cmpi eq, %412, %407 : i64
          %416 = arith.andi %414, %415 : i1
          %417 = scf.if %416 -> (i64) {
            scf.yield %406 : i64
          } else {
            scf.yield %412 : i64
          }
          %418 = arith.cmpi ne, %417, %407 : i64
          scf.if %418 {
            func.call @stack_push_pointer(%417) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%405) : (i64) -> ()
            func.call @stack_push_pointer(%406) : (i64) -> ()
            %419 = llvm.mlir.addressof @str47 : !llvm.ptr
            %420 = func.call @cc_make_function_ref_const(%419) : (!llvm.ptr) -> i64
            %421 = arith.constant 2 : i64
            func.call @cc_funcall_stack(%420, %421) : (i64, i64) -> ()
          }
          %422 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%397) : (i64) -> ()
          func.call @stack_push_pointer(%401) : (i64) -> ()
          func.call @stack_push_pointer(%422) : (i64) -> ()
          %423 = llvm.mlir.addressof @str48 : !llvm.ptr
          %424 = func.call @cc_make_function_ref_const(%423) : (!llvm.ptr) -> i64
          %425 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%424, %425) : (i64, i64) -> ()
          %426 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %426, %380#1 : i64, i64
        }
        %427 = func.call @cc_nil_value() : () -> i64
        %428 = func.call @cc_errorp(%395#0) : (i64) -> i64
        %429 = arith.cmpi ne, %428, %427 : i64
        %430:2 = scf.if %429 -> (i64, i64) {
          scf.yield %395#0, %395#1 : i64, i64
        } else {
          %431 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%431) : (i64) -> ()
          %432 = func.call @stack_pop_pointer() : () -> i64
          %433 = llvm.mlir.addressof @str49 : !llvm.ptr
          %434 = arith.constant 11 : i64
          %435 = func.call @cc_make_string(%433, %434) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%435) : (i64) -> ()
          %436 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%395#1) : (i64) -> ()
          %437 = func.call @stack_pop_pointer() : () -> i64
          %438 = func.call @cc_nil_value() : () -> i64
          %439 = func.call @cc_errorp(%437) : (i64) -> i64
          %440 = arith.cmpi ne, %439, %438 : i64
          %441 = arith.cmpi eq, %438, %438 : i64
          %442 = arith.andi %440, %441 : i1
          %443 = scf.if %442 -> (i64) {
            scf.yield %437 : i64
          } else {
            scf.yield %438 : i64
          }
          %444 = arith.cmpi ne, %443, %438 : i64
          scf.if %444 {
            func.call @stack_push_pointer(%443) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%437) : (i64) -> ()
            %445 = llvm.mlir.addressof @str50 : !llvm.ptr
            %446 = func.call @cc_make_function_ref_const(%445) : (!llvm.ptr) -> i64
            %447 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%446, %447) : (i64, i64) -> ()
          }
          %448 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%432) : (i64) -> ()
          func.call @stack_push_pointer(%436) : (i64) -> ()
          func.call @stack_push_pointer(%448) : (i64) -> ()
          %449 = llvm.mlir.addressof @str51 : !llvm.ptr
          %450 = func.call @cc_make_function_ref_const(%449) : (!llvm.ptr) -> i64
          %451 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%450, %451) : (i64, i64) -> ()
          %452 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %452, %395#1 : i64, i64
        }
        %453 = func.call @cc_nil_value() : () -> i64
        %454 = func.call @cc_errorp(%430#0) : (i64) -> i64
        %455 = arith.cmpi ne, %454, %453 : i64
        %456:2 = scf.if %455 -> (i64, i64) {
          scf.yield %430#0, %430#1 : i64, i64
        } else {
          func.call @stack_push_pointer(%50) : (i64) -> ()
          %457 = func.call @stack_pop_pointer() : () -> i64
          %458 = llvm.mlir.addressof @str52 : !llvm.ptr
          %459 = arith.constant 9 : i64
          %460 = func.call @cc_make_string(%458, %459) : (!llvm.ptr, i64) -> i64
          %461 = llvm.mlir.addressof @str53 : !llvm.ptr
          %462 = arith.constant 7 : i64
          %463 = func.call @cc_make_string(%461, %462) : (!llvm.ptr, i64) -> i64
          %464 = func.call @cc_intern(%460, %463) : (i64, i64) -> i64
          %465 = func.call @cc_nil_value() : () -> i64
          %466 = func.call @cc_cons(%464, %465) : (i64, i64) -> i64
          %467 = func.call @cc_values_pack(%466) : (i64) -> i64
          func.call @stack_push_pointer(%464) : (i64) -> ()
          %468 = func.call @stack_pop_pointer() : () -> i64
          %469 = llvm.mlir.addressof @str54 : !llvm.ptr
          %470 = arith.constant 5 : i64
          %471 = func.call @cc_make_string(%469, %470) : (!llvm.ptr, i64) -> i64
          %472 = llvm.mlir.addressof @str55 : !llvm.ptr
          %473 = arith.constant 7 : i64
          %474 = func.call @cc_make_string(%472, %473) : (!llvm.ptr, i64) -> i64
          %475 = func.call @cc_intern(%471, %474) : (i64, i64) -> i64
          %476 = func.call @cc_nil_value() : () -> i64
          %477 = func.call @cc_cons(%475, %476) : (i64, i64) -> i64
          %478 = func.call @cc_values_pack(%477) : (i64) -> i64
          func.call @stack_push_pointer(%475) : (i64) -> ()
          %479 = func.call @stack_pop_pointer() : () -> i64
          %480 = func.call @cc_nil_value() : () -> i64
          %481 = func.call @cc_errorp(%457) : (i64) -> i64
          %482 = arith.cmpi ne, %481, %480 : i64
          %483 = arith.cmpi eq, %480, %480 : i64
          %484 = arith.andi %482, %483 : i1
          %485 = scf.if %484 -> (i64) {
            scf.yield %457 : i64
          } else {
            scf.yield %480 : i64
          }
          %486 = func.call @cc_errorp(%468) : (i64) -> i64
          %487 = arith.cmpi ne, %486, %480 : i64
          %488 = arith.cmpi eq, %485, %480 : i64
          %489 = arith.andi %487, %488 : i1
          %490 = scf.if %489 -> (i64) {
            scf.yield %468 : i64
          } else {
            scf.yield %485 : i64
          }
          %491 = func.call @cc_errorp(%479) : (i64) -> i64
          %492 = arith.cmpi ne, %491, %480 : i64
          %493 = arith.cmpi eq, %490, %480 : i64
          %494 = arith.andi %492, %493 : i1
          %495 = scf.if %494 -> (i64) {
            scf.yield %479 : i64
          } else {
            scf.yield %490 : i64
          }
          %496 = arith.cmpi ne, %495, %480 : i64
          scf.if %496 {
            func.call @stack_push_pointer(%495) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%457) : (i64) -> ()
            func.call @stack_push_pointer(%468) : (i64) -> ()
            func.call @stack_push_pointer(%479) : (i64) -> ()
            %497 = llvm.mlir.addressof @str56 : !llvm.ptr
            %498 = func.call @cc_make_function_ref_const(%497) : (!llvm.ptr) -> i64
            %499 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%498, %499) : (i64, i64) -> ()
          }
          %500 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%500) : (i64) -> ()
          %501 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %501, %500 : i64, i64
        }
        %502 = func.call @cc_nil_value() : () -> i64
        %503 = func.call @cc_errorp(%456#0) : (i64) -> i64
        %504 = arith.cmpi ne, %503, %502 : i64
        %505:2 = scf.if %504 -> (i64, i64) {
          scf.yield %456#0, %456#1 : i64, i64
        } else {
          %506 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%506) : (i64) -> ()
          %507 = func.call @stack_pop_pointer() : () -> i64
          %508 = llvm.mlir.addressof @str57 : !llvm.ptr
          %509 = arith.constant 10 : i64
          %510 = func.call @cc_make_string(%508, %509) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%510) : (i64) -> ()
          %511 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%456#1) : (i64) -> ()
          %512 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%507) : (i64) -> ()
          func.call @stack_push_pointer(%511) : (i64) -> ()
          func.call @stack_push_pointer(%512) : (i64) -> ()
          %513 = llvm.mlir.addressof @str58 : !llvm.ptr
          %514 = func.call @cc_make_function_ref_const(%513) : (!llvm.ptr) -> i64
          %515 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%514, %515) : (i64, i64) -> ()
          %516 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %516, %456#1 : i64, i64
        }
        %517 = func.call @cc_nil_value() : () -> i64
        %518 = func.call @cc_errorp(%505#0) : (i64) -> i64
        %519 = arith.cmpi ne, %518, %517 : i64
        %520:2 = scf.if %519 -> (i64, i64) {
          scf.yield %505#0, %505#1 : i64, i64
        } else {
          %521 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%521) : (i64) -> ()
          %522 = func.call @stack_pop_pointer() : () -> i64
          %523 = llvm.mlir.addressof @str59 : !llvm.ptr
          %524 = arith.constant 12 : i64
          %525 = func.call @cc_make_string(%523, %524) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%525) : (i64) -> ()
          %526 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%171) : (i64) -> ()
          %527 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%505#1) : (i64) -> ()
          %528 = func.call @stack_pop_pointer() : () -> i64
          %529 = llvm.mlir.addressof @str60 : !llvm.ptr
          %530 = arith.constant 5 : i64
          %531 = func.call @cc_make_string(%529, %530) : (!llvm.ptr, i64) -> i64
          %532 = llvm.mlir.addressof @str61 : !llvm.ptr
          %533 = arith.constant 7 : i64
          %534 = func.call @cc_make_string(%532, %533) : (!llvm.ptr, i64) -> i64
          %535 = func.call @cc_intern(%531, %534) : (i64, i64) -> i64
          %536 = func.call @cc_nil_value() : () -> i64
          %537 = func.call @cc_cons(%535, %536) : (i64, i64) -> i64
          %538 = func.call @cc_values_pack(%537) : (i64) -> i64
          func.call @stack_push_pointer(%535) : (i64) -> ()
          %539 = func.call @stack_pop_pointer() : () -> i64
          %540 = arith.constant 0 : i64
          func.call @stack_push_fixnum(%540) : (i64) -> ()
          %541 = func.call @stack_pop_pointer() : () -> i64
          %542 = llvm.mlir.addressof @str62 : !llvm.ptr
          %543 = arith.constant 3 : i64
          %544 = func.call @cc_make_string(%542, %543) : (!llvm.ptr, i64) -> i64
          %545 = llvm.mlir.addressof @str63 : !llvm.ptr
          %546 = arith.constant 7 : i64
          %547 = func.call @cc_make_string(%545, %546) : (!llvm.ptr, i64) -> i64
          %548 = func.call @cc_intern(%544, %547) : (i64, i64) -> i64
          %549 = func.call @cc_nil_value() : () -> i64
          %550 = func.call @cc_cons(%548, %549) : (i64, i64) -> i64
          %551 = func.call @cc_values_pack(%550) : (i64) -> i64
          func.call @stack_push_pointer(%548) : (i64) -> ()
          %552 = func.call @stack_pop_pointer() : () -> i64
          %553 = arith.constant 3 : i64
          func.call @stack_push_fixnum(%553) : (i64) -> ()
          %554 = func.call @stack_pop_pointer() : () -> i64
          %555 = func.call @cc_nil_value() : () -> i64
          %556 = func.call @cc_errorp(%527) : (i64) -> i64
          %557 = arith.cmpi ne, %556, %555 : i64
          %558 = arith.cmpi eq, %555, %555 : i64
          %559 = arith.andi %557, %558 : i1
          %560 = scf.if %559 -> (i64) {
            scf.yield %527 : i64
          } else {
            scf.yield %555 : i64
          }
          %561 = func.call @cc_errorp(%528) : (i64) -> i64
          %562 = arith.cmpi ne, %561, %555 : i64
          %563 = arith.cmpi eq, %560, %555 : i64
          %564 = arith.andi %562, %563 : i1
          %565 = scf.if %564 -> (i64) {
            scf.yield %528 : i64
          } else {
            scf.yield %560 : i64
          }
          %566 = func.call @cc_errorp(%539) : (i64) -> i64
          %567 = arith.cmpi ne, %566, %555 : i64
          %568 = arith.cmpi eq, %565, %555 : i64
          %569 = arith.andi %567, %568 : i1
          %570 = scf.if %569 -> (i64) {
            scf.yield %539 : i64
          } else {
            scf.yield %565 : i64
          }
          %571 = func.call @cc_errorp(%541) : (i64) -> i64
          %572 = arith.cmpi ne, %571, %555 : i64
          %573 = arith.cmpi eq, %570, %555 : i64
          %574 = arith.andi %572, %573 : i1
          %575 = scf.if %574 -> (i64) {
            scf.yield %541 : i64
          } else {
            scf.yield %570 : i64
          }
          %576 = func.call @cc_errorp(%552) : (i64) -> i64
          %577 = arith.cmpi ne, %576, %555 : i64
          %578 = arith.cmpi eq, %575, %555 : i64
          %579 = arith.andi %577, %578 : i1
          %580 = scf.if %579 -> (i64) {
            scf.yield %552 : i64
          } else {
            scf.yield %575 : i64
          }
          %581 = func.call @cc_errorp(%554) : (i64) -> i64
          %582 = arith.cmpi ne, %581, %555 : i64
          %583 = arith.cmpi eq, %580, %555 : i64
          %584 = arith.andi %582, %583 : i1
          %585 = scf.if %584 -> (i64) {
            scf.yield %554 : i64
          } else {
            scf.yield %580 : i64
          }
          %586 = arith.cmpi ne, %585, %555 : i64
          scf.if %586 {
            func.call @stack_push_pointer(%585) : (i64) -> ()
          } else {
            %587 = func.call @cc_nil_value() : () -> i64
            %588 = func.call @cc_cons(%554, %587) : (i64, i64) -> i64
            %589 = func.call @cc_cons(%552, %588) : (i64, i64) -> i64
            %590 = func.call @cc_cons(%541, %589) : (i64, i64) -> i64
            %591 = func.call @cc_cons(%539, %590) : (i64, i64) -> i64
            %592 = func.call @cc_cons(%528, %591) : (i64, i64) -> i64
            %593 = func.call @cc_cons(%527, %592) : (i64, i64) -> i64
            func.call @stack_push_pointer(%593) : (i64) -> ()
            func.call @cc_read_sequence_stack() : () -> ()
          }
          %594 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%522) : (i64) -> ()
          func.call @stack_push_pointer(%526) : (i64) -> ()
          func.call @stack_push_pointer(%594) : (i64) -> ()
          %595 = llvm.mlir.addressof @str64 : !llvm.ptr
          %596 = func.call @cc_make_function_ref_const(%595) : (!llvm.ptr) -> i64
          %597 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%596, %597) : (i64, i64) -> ()
          %598 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %598, %505#1 : i64, i64
        }
        %599 = func.call @cc_nil_value() : () -> i64
        %600 = func.call @cc_errorp(%520#0) : (i64) -> i64
        %601 = arith.cmpi ne, %600, %599 : i64
        %602:2 = scf.if %601 -> (i64, i64) {
          scf.yield %520#0, %520#1 : i64, i64
        } else {
          %603 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%603) : (i64) -> ()
          %604 = func.call @stack_pop_pointer() : () -> i64
          %605 = llvm.mlir.addressof @str65 : !llvm.ptr
          %606 = arith.constant 11 : i64
          %607 = func.call @cc_make_string(%605, %606) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%607) : (i64) -> ()
          %608 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%171) : (i64) -> ()
          %609 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%604) : (i64) -> ()
          func.call @stack_push_pointer(%608) : (i64) -> ()
          func.call @stack_push_pointer(%609) : (i64) -> ()
          %610 = llvm.mlir.addressof @str66 : !llvm.ptr
          %611 = func.call @cc_make_function_ref_const(%610) : (!llvm.ptr) -> i64
          %612 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%611, %612) : (i64, i64) -> ()
          %613 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %613, %520#1 : i64, i64
        }
        %614 = func.call @cc_nil_value() : () -> i64
        %615 = func.call @cc_errorp(%602#0) : (i64) -> i64
        %616 = arith.cmpi ne, %615, %614 : i64
        %617:2 = scf.if %616 -> (i64, i64) {
          scf.yield %602#0, %602#1 : i64, i64
        } else {
          %618 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%618) : (i64) -> ()
          %619 = func.call @stack_pop_pointer() : () -> i64
          %620 = llvm.mlir.addressof @str67 : !llvm.ptr
          %621 = arith.constant 11 : i64
          %622 = func.call @cc_make_string(%620, %621) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%622) : (i64) -> ()
          %623 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%602#1) : (i64) -> ()
          %624 = func.call @stack_pop_pointer() : () -> i64
          %625 = func.call @cc_nil_value() : () -> i64
          %626 = func.call @cc_errorp(%624) : (i64) -> i64
          %627 = arith.cmpi ne, %626, %625 : i64
          %628 = arith.cmpi eq, %625, %625 : i64
          %629 = arith.andi %627, %628 : i1
          %630 = scf.if %629 -> (i64) {
            scf.yield %624 : i64
          } else {
            scf.yield %625 : i64
          }
          %631 = arith.cmpi ne, %630, %625 : i64
          scf.if %631 {
            func.call @stack_push_pointer(%630) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%624) : (i64) -> ()
            %632 = llvm.mlir.addressof @str68 : !llvm.ptr
            %633 = func.call @cc_make_function_ref_const(%632) : (!llvm.ptr) -> i64
            %634 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%633, %634) : (i64, i64) -> ()
          }
          %635 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%619) : (i64) -> ()
          func.call @stack_push_pointer(%623) : (i64) -> ()
          func.call @stack_push_pointer(%635) : (i64) -> ()
          %636 = llvm.mlir.addressof @str69 : !llvm.ptr
          %637 = func.call @cc_make_function_ref_const(%636) : (!llvm.ptr) -> i64
          %638 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%637, %638) : (i64, i64) -> ()
          %639 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %639, %602#1 : i64, i64
        }
        %640 = func.call @cc_nil_value() : () -> i64
        %641 = func.call @cc_errorp(%617#0) : (i64) -> i64
        %642 = arith.cmpi ne, %641, %640 : i64
        %643:2 = scf.if %642 -> (i64, i64) {
          scf.yield %617#0, %617#1 : i64, i64
        } else {
          %644 = func.call @cc_t_value() : () -> i64
          func.call @stack_push_pointer(%644) : (i64) -> ()
          %645 = func.call @stack_pop_pointer() : () -> i64
          %646 = llvm.mlir.addressof @str70 : !llvm.ptr
          %647 = arith.constant 11 : i64
          %648 = func.call @cc_make_string(%646, %647) : (!llvm.ptr, i64) -> i64
          func.call @stack_push_pointer(%648) : (i64) -> ()
          %649 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%50) : (i64) -> ()
          %650 = func.call @stack_pop_pointer() : () -> i64
          %651 = func.call @cc_nil_value() : () -> i64
          %652 = func.call @cc_errorp(%650) : (i64) -> i64
          %653 = arith.cmpi ne, %652, %651 : i64
          %654 = arith.cmpi eq, %651, %651 : i64
          %655 = arith.andi %653, %654 : i1
          %656 = scf.if %655 -> (i64) {
            scf.yield %650 : i64
          } else {
            scf.yield %651 : i64
          }
          %657 = arith.cmpi ne, %656, %651 : i64
          scf.if %657 {
            func.call @stack_push_pointer(%656) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%650) : (i64) -> ()
            %658 = llvm.mlir.addressof @str71 : !llvm.ptr
            %659 = func.call @cc_make_function_ref_const(%658) : (!llvm.ptr) -> i64
            %660 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%659, %660) : (i64, i64) -> ()
          }
          %661 = func.call @stack_pop_pointer() : () -> i64
          func.call @stack_push_pointer(%645) : (i64) -> ()
          func.call @stack_push_pointer(%649) : (i64) -> ()
          func.call @stack_push_pointer(%661) : (i64) -> ()
          %662 = llvm.mlir.addressof @str72 : !llvm.ptr
          %663 = func.call @cc_make_function_ref_const(%662) : (!llvm.ptr) -> i64
          %664 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%663, %664) : (i64, i64) -> ()
          %665 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %665, %617#1 : i64, i64
        }
        %666 = func.call @cc_nil_value() : () -> i64
        %667 = func.call @cc_errorp(%643#0) : (i64) -> i64
        %668 = arith.cmpi ne, %667, %666 : i64
        %669:2 = scf.if %668 -> (i64, i64) {
          scf.yield %643#0, %643#1 : i64, i64
        } else {
          func.call @stack_push_pointer(%171) : (i64) -> ()
          %670 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %670, %643#1 : i64, i64
        }
        func.call @stack_push_pointer(%669#0) : (i64) -> ()
        %671 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %671 : i64
      }
      func.call @stack_push_pointer(%35) : (i64) -> ()
      %672 = func.call @stack_pop_pointer() : () -> i64
      %673 = func.call @cc_pop_ignore_errors_trap() : () -> i64
      %674 = func.call @cc_errorp(%672) : (i64) -> i64
      %675 = func.call @cc_nil_value() : () -> i64
      %676 = arith.cmpi ne, %674, %675 : i64
      scf.if %676 {
        %677 = func.call @cc_condition_value(%672) : (i64) -> i64
        %678 = func.call @cc_values2(%675, %677) : (i64, i64) -> i64
        func.call @stack_push_pointer(%678) : (i64) -> ()
      } else {
        %679 = func.call @cc_multiple_value_list(%672) : (i64) -> i64
        %680 = func.call @cc_values_pack(%679) : (i64) -> i64
        func.call @stack_push_pointer(%680) : (i64) -> ()
      }
      %681 = func.call @stack_pop_pointer() : () -> i64
      %682 = func.call @cc_nil_value() : () -> i64
      %683 = func.call @cc_nil_value() : () -> i64
      %684 = func.call @cc_errorp(%682) : (i64) -> i64
      %685 = arith.cmpi ne, %684, %683 : i64
      %686 = scf.if %685 -> (i64) {
        scf.yield %682 : i64
      } else {
        %687 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%687) : (i64) -> ()
        %688 = func.call @stack_pop_pointer() : () -> i64
        %689 = llvm.mlir.addressof @str73 : !llvm.ptr
        %690 = arith.constant 11 : i64
        %691 = func.call @cc_make_string(%689, %690) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%691) : (i64) -> ()
        %692 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%681) : (i64) -> ()
        %693 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%688) : (i64) -> ()
        func.call @stack_push_pointer(%692) : (i64) -> ()
        func.call @stack_push_pointer(%693) : (i64) -> ()
        %694 = llvm.mlir.addressof @str74 : !llvm.ptr
        %695 = func.call @cc_make_function_ref_const(%694) : (!llvm.ptr) -> i64
        %696 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%695, %696) : (i64, i64) -> ()
        %697 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %697 : i64
      }
      func.call @stack_push_pointer(%686) : (i64) -> ()
      %698 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %698 : i64
    }
    func.call @stack_push_pointer(%29) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str2("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str3("close-abort\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str4("core:mkstemp\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str5("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str6("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str7("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str8("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str9("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str10("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str11("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str12("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str13("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str14("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str19("name=~S~%\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str20("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str21("open1=~S~%\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str22("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str23("write1=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("foo\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str25("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str26("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str27("close1=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str28("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str29("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str30("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str31("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str35("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str37("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str38("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str39("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str40("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str41("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str42("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str43("open2=~S~%\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str44("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str45("write2=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str46("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str47("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str48("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str49("close2=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str50("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str51("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str52("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str53("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str54("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str55("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str56("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str57("open3=~S~%\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str58("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str59("readseq=~S~%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str60("START\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str61("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str62("END\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str63("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str64("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str65("buffer=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str66("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str67("close3=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str68("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str69("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str70("delete=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str72("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str73("result=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str74("FORMAT\00") : !llvm.array<7 x i8>
}
