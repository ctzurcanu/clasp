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
  func.func @"%FN%show-listen"() {
    %0 = llvm.mlir.addressof @str0 : !llvm.ptr
    %1 = arith.constant 11 : i64
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
    %22 = arith.constant 1 : i64
    %23 = func.call @cc_make_string(%21, %22) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%23) : (i64) -> ()
    %24 = func.call @stack_pop_pointer() : () -> i64
    %25 = func.call @cc_make_string_input_stream(%24) : (i64) -> i64
    %26 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%26) : (i64) -> ()
    %27 = func.call @stack_pop_pointer() : () -> i64
    %28 = llvm.mlir.addressof @str5 : !llvm.ptr
    %29 = arith.constant 12 : i64
    %30 = func.call @cc_make_string(%28, %29) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%30) : (i64) -> ()
    %31 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%25) : (i64) -> ()
    %32 = func.call @stack_pop_pointer() : () -> i64
    %33 = func.call @cc_nil_value() : () -> i64
    %34 = func.call @cc_errorp(%32) : (i64) -> i64
    %35 = arith.cmpi ne, %34, %33 : i64
    %36 = arith.cmpi eq, %33, %33 : i64
    %37 = arith.andi %35, %36 : i1
    %38 = scf.if %37 -> (i64) {
      scf.yield %32 : i64
    } else {
      scf.yield %33 : i64
    }
    %39 = arith.cmpi ne, %38, %33 : i64
    scf.if %39 {
      func.call @stack_push_pointer(%38) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%32) : (i64) -> ()
      %40 = llvm.mlir.addressof @str6 : !llvm.ptr
      %41 = func.call @cc_make_function_ref_const(%40) : (!llvm.ptr) -> i64
      %42 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%41, %42) : (i64, i64) -> ()
    }
    %43 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%25) : (i64) -> ()
    %44 = func.call @stack_pop_pointer() : () -> i64
    %45 = func.call @cc_nil_value() : () -> i64
    %46 = func.call @cc_errorp(%44) : (i64) -> i64
    %47 = arith.cmpi ne, %46, %45 : i64
    %48 = arith.cmpi eq, %45, %45 : i64
    %49 = arith.andi %47, %48 : i1
    %50 = scf.if %49 -> (i64) {
      scf.yield %44 : i64
    } else {
      scf.yield %45 : i64
    }
    %51 = arith.cmpi ne, %50, %45 : i64
    scf.if %51 {
      func.call @stack_push_pointer(%50) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%44) : (i64) -> ()
      %52 = llvm.mlir.addressof @str7 : !llvm.ptr
      %53 = func.call @cc_make_function_ref_const(%52) : (!llvm.ptr) -> i64
      %54 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%53, %54) : (i64, i64) -> ()
    }
    %55 = func.call @stack_pop_pointer() : () -> i64
    %56 = arith.constant 120 : i64
    %57 = func.call @cc_box_character(%56) : (i64) -> i64
    func.call @stack_push_pointer(%57) : (i64) -> ()
    %58 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%25) : (i64) -> ()
    %59 = func.call @stack_pop_pointer() : () -> i64
    %60 = func.call @cc_nil_value() : () -> i64
    %61 = func.call @cc_errorp(%58) : (i64) -> i64
    %62 = arith.cmpi ne, %61, %60 : i64
    %63 = arith.cmpi eq, %60, %60 : i64
    %64 = arith.andi %62, %63 : i1
    %65 = scf.if %64 -> (i64) {
      scf.yield %58 : i64
    } else {
      scf.yield %60 : i64
    }
    %66 = func.call @cc_errorp(%59) : (i64) -> i64
    %67 = arith.cmpi ne, %66, %60 : i64
    %68 = arith.cmpi eq, %65, %60 : i64
    %69 = arith.andi %67, %68 : i1
    %70 = scf.if %69 -> (i64) {
      scf.yield %59 : i64
    } else {
      scf.yield %65 : i64
    }
    %71 = arith.cmpi ne, %70, %60 : i64
    scf.if %71 {
      func.call @stack_push_pointer(%70) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%58) : (i64) -> ()
      func.call @stack_push_pointer(%59) : (i64) -> ()
      %72 = llvm.mlir.addressof @str8 : !llvm.ptr
      %73 = func.call @cc_make_function_ref_const(%72) : (!llvm.ptr) -> i64
      %74 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%73, %74) : (i64, i64) -> ()
    }
    %75 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%25) : (i64) -> ()
    %76 = func.call @stack_pop_pointer() : () -> i64
    %77 = func.call @cc_nil_value() : () -> i64
    %78 = func.call @cc_errorp(%76) : (i64) -> i64
    %79 = arith.cmpi ne, %78, %77 : i64
    %80 = arith.cmpi eq, %77, %77 : i64
    %81 = arith.andi %79, %80 : i1
    %82 = scf.if %81 -> (i64) {
      scf.yield %76 : i64
    } else {
      scf.yield %77 : i64
    }
    %83 = arith.cmpi ne, %82, %77 : i64
    scf.if %83 {
      func.call @stack_push_pointer(%82) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%76) : (i64) -> ()
      %84 = llvm.mlir.addressof @str9 : !llvm.ptr
      %85 = func.call @cc_make_function_ref_const(%84) : (!llvm.ptr) -> i64
      %86 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%85, %86) : (i64, i64) -> ()
    }
    %87 = func.call @stack_pop_pointer() : () -> i64
    %88 = func.call @cc_nil_value() : () -> i64
    %89 = func.call @cc_cons(%87, %88) : (i64, i64) -> i64
    %90 = func.call @cc_not(%89) : (i64) -> i64
    func.call @stack_push_pointer(%90) : (i64) -> ()
    %91 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%25) : (i64) -> ()
    %92 = func.call @stack_pop_pointer() : () -> i64
    %93 = func.call @cc_nil_value() : () -> i64
    %94 = func.call @cc_errorp(%92) : (i64) -> i64
    %95 = arith.cmpi ne, %94, %93 : i64
    %96 = arith.cmpi eq, %93, %93 : i64
    %97 = arith.andi %95, %96 : i1
    %98 = scf.if %97 -> (i64) {
      scf.yield %92 : i64
    } else {
      scf.yield %93 : i64
    }
    %99 = arith.cmpi ne, %98, %93 : i64
    scf.if %99 {
      func.call @stack_push_pointer(%98) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%92) : (i64) -> ()
      %100 = llvm.mlir.addressof @str10 : !llvm.ptr
      %101 = func.call @cc_make_function_ref_const(%100) : (!llvm.ptr) -> i64
      %102 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%101, %102) : (i64, i64) -> ()
    }
    %103 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %104 = func.call @stack_pop_pointer() : () -> i64
    %105 = func.call @cc_cons(%103, %104) : (i64, i64) -> i64
    func.call @stack_push_pointer(%105) : (i64) -> ()
    %106 = func.call @stack_pop_pointer() : () -> i64
    %107 = func.call @cc_cons(%91, %106) : (i64, i64) -> i64
    func.call @stack_push_pointer(%107) : (i64) -> ()
    %108 = func.call @stack_pop_pointer() : () -> i64
    %109 = func.call @cc_cons(%75, %108) : (i64, i64) -> i64
    func.call @stack_push_pointer(%109) : (i64) -> ()
    %110 = func.call @stack_pop_pointer() : () -> i64
    %111 = func.call @cc_cons(%55, %110) : (i64, i64) -> i64
    func.call @stack_push_pointer(%111) : (i64) -> ()
    %112 = func.call @stack_pop_pointer() : () -> i64
    %113 = func.call @cc_cons(%43, %112) : (i64, i64) -> i64
    func.call @stack_push_pointer(%113) : (i64) -> ()
    %114 = func.call @stack_pop_pointer() : () -> i64
    %115 = func.call @cc_values_pack(%114) : (i64) -> i64
    func.call @stack_push_pointer(%115) : (i64) -> ()
    %116 = func.call @stack_pop_pointer() : () -> i64
    %117 = func.call @cc_errorp(%116) : (i64) -> i64
    %118 = func.call @cc_nil_value() : () -> i64
    %119 = arith.cmpi ne, %117, %118 : i64
    scf.if %119 {
      func.call @stack_push_pointer(%116) : (i64) -> ()
    } else {
      %120 = func.call @cc_multiple_value_list(%116) : (i64) -> i64
      func.call @stack_push_pointer(%120) : (i64) -> ()
    }
    %121 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%27) : (i64) -> ()
    func.call @stack_push_pointer(%31) : (i64) -> ()
    func.call @stack_push_pointer(%121) : (i64) -> ()
    %122 = llvm.mlir.addressof @str11 : !llvm.ptr
    %123 = func.call @cc_make_function_ref_const(%122) : (!llvm.ptr) -> i64
    %124 = arith.constant 3 : i64
    func.call @cc_funcall_stack(%123, %124) : (i64, i64) -> ()
    %125 = func.call @stack_pop_pointer() : () -> i64
    %126 = llvm.mlir.addressof @str12 : !llvm.ptr
    %127 = arith.constant 3 : i64
    %128 = func.call @cc_make_string(%126, %127) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%128) : (i64) -> ()
    %129 = func.call @stack_pop_pointer() : () -> i64
    %130 = func.call @cc_make_string_input_stream(%129) : (i64) -> i64
    %131 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%131) : (i64) -> ()
    %132 = func.call @stack_pop_pointer() : () -> i64
    %133 = llvm.mlir.addressof @str13 : !llvm.ptr
    %134 = arith.constant 12 : i64
    %135 = func.call @cc_make_string(%133, %134) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%135) : (i64) -> ()
    %136 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%130) : (i64) -> ()
    %137 = func.call @stack_pop_pointer() : () -> i64
    %138 = func.call @cc_nil_value() : () -> i64
    %139 = func.call @cc_errorp(%137) : (i64) -> i64
    %140 = arith.cmpi ne, %139, %138 : i64
    %141 = arith.cmpi eq, %138, %138 : i64
    %142 = arith.andi %140, %141 : i1
    %143 = scf.if %142 -> (i64) {
      scf.yield %137 : i64
    } else {
      scf.yield %138 : i64
    }
    %144 = arith.cmpi ne, %143, %138 : i64
    scf.if %144 {
      func.call @stack_push_pointer(%143) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%137) : (i64) -> ()
      %145 = llvm.mlir.addressof @str14 : !llvm.ptr
      %146 = func.call @cc_make_function_ref_const(%145) : (!llvm.ptr) -> i64
      %147 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%146, %147) : (i64, i64) -> ()
    }
    %148 = func.call @stack_pop_pointer() : () -> i64
    %149 = func.call @cc_nil_value() : () -> i64
    %150 = func.call @cc_cons(%148, %149) : (i64, i64) -> i64
    %151 = func.call @cc_not(%150) : (i64) -> i64
    func.call @stack_push_pointer(%151) : (i64) -> ()
    %152 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %153 = func.call @stack_pop_pointer() : () -> i64
    %154 = func.call @cc_nil_value() : () -> i64
    %155 = func.call @cc_errorp(%153) : (i64) -> i64
    %156 = arith.cmpi ne, %155, %154 : i64
    %157 = scf.if %156 -> (i64) {
      scf.yield %153 : i64
    } else {
      %158 = func.call @cc_nil_value() : () -> i64
      %159 = llvm.mlir.addressof @str15 : !llvm.ptr
      %160 = arith.constant 38 : i64
      %161 = func.call @cc_make_symbol(%159, %160) : (!llvm.ptr, i64) -> i64
      %162 = func.call @cc_set_symbol_value(%161, %158) : (i64, i64) -> i64
      %163 = llvm.mlir.addressof @str16 : !llvm.ptr
      %164 = arith.constant 39 : i64
      %165 = func.call @cc_make_symbol(%163, %164) : (!llvm.ptr, i64) -> i64
      %166 = func.call @cc_set_symbol_value(%165, %158) : (i64, i64) -> i64
      %167 = llvm.mlir.addressof @str17 : !llvm.ptr
      %168 = arith.constant 40 : i64
      %169 = func.call @cc_make_symbol(%167, %168) : (!llvm.ptr, i64) -> i64
      %170 = func.call @cc_set_symbol_value(%169, %158) : (i64, i64) -> i64
      %171 = func.call @cc_nil_value() : () -> i64
      %172 = func.call @cc_nil_value() : () -> i64
      %173 = func.call @cc_errorp(%171) : (i64) -> i64
      %174 = arith.cmpi ne, %173, %172 : i64
      %175 = scf.if %174 -> (i64) {
        scf.yield %171 : i64
      } else {
        func.call @stack_push_pointer(%130) : (i64) -> ()
        %176 = func.call @stack_pop_pointer() : () -> i64
        %177 = func.call @cc_nil_value() : () -> i64
        %178 = func.call @cc_errorp(%176) : (i64) -> i64
        %179 = arith.cmpi ne, %178, %177 : i64
        %180 = arith.cmpi eq, %177, %177 : i64
        %181 = arith.andi %179, %180 : i1
        %182 = scf.if %181 -> (i64) {
          scf.yield %176 : i64
        } else {
          scf.yield %177 : i64
        }
        %183 = arith.cmpi ne, %182, %177 : i64
        scf.if %183 {
          func.call @stack_push_pointer(%182) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%176) : (i64) -> ()
          %184 = llvm.mlir.addressof @str18 : !llvm.ptr
          %185 = func.call @cc_make_function_ref_const(%184) : (!llvm.ptr) -> i64
          %186 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%185, %186) : (i64, i64) -> ()
        }
        %187 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %187 : i64
      }
      func.call @stack_push_pointer(%175) : (i64) -> ()
      %188 = func.call @stack_pop_pointer() : () -> i64
      %189 = func.call @cc_multiple_value_list(%188) : (i64) -> i64
      %190 = llvm.mlir.addressof @str19 : !llvm.ptr
      %191 = arith.constant 38 : i64
      %192 = func.call @cc_make_symbol(%190, %191) : (!llvm.ptr, i64) -> i64
      %193 = func.call @cc_symbol_value(%192) : (i64) -> i64
      %194 = llvm.mlir.addressof @str20 : !llvm.ptr
      %195 = arith.constant 39 : i64
      %196 = func.call @cc_make_symbol(%194, %195) : (!llvm.ptr, i64) -> i64
      %197 = func.call @cc_symbol_value(%196) : (i64) -> i64
      %198 = llvm.mlir.addressof @str21 : !llvm.ptr
      %199 = arith.constant 40 : i64
      %200 = func.call @cc_make_symbol(%198, %199) : (!llvm.ptr, i64) -> i64
      %201 = func.call @cc_symbol_value(%200) : (i64) -> i64
      %202 = func.call @cc_nil_value() : () -> i64
      %203 = arith.cmpi ne, %193, %202 : i64
      %204 = scf.if %203 -> (i64) {
        scf.yield %201 : i64
      } else {
        scf.yield %189 : i64
      }
      %205 = func.call @cc_values_pack(%204) : (i64) -> i64
      func.call @stack_push_pointer(%205) : (i64) -> ()
      %206 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %206 : i64
    }
    func.call @stack_push_pointer(%157) : (i64) -> ()
    %207 = func.call @stack_pop_pointer() : () -> i64
    %208 = func.call @cc_errorp(%207) : (i64) -> i64
    %209 = func.call @cc_nil_value() : () -> i64
    %210 = arith.cmpi ne, %208, %209 : i64
    %211 = scf.if %210 -> (i64) {
      %212 = func.call @cc_condition_value(%207) : (i64) -> i64
      %213 = llvm.mlir.addressof @str22 : !llvm.ptr
      %214 = arith.constant 11 : i64
      %215 = func.call @cc_make_string(%213, %214) : (!llvm.ptr, i64) -> i64
      %216 = llvm.mlir.addressof @str23 : !llvm.ptr
      %217 = arith.constant 11 : i64
      %218 = func.call @cc_make_string(%216, %217) : (!llvm.ptr, i64) -> i64
      %219 = func.call @cc_intern(%215, %218) : (i64, i64) -> i64
      %220 = func.call @cc_nil_value() : () -> i64
      %221 = func.call @cc_cons(%219, %220) : (i64, i64) -> i64
      %222 = func.call @cc_values_pack(%221) : (i64) -> i64
      func.call @stack_push_pointer(%219) : (i64) -> ()
      %223 = func.call @stack_pop_pointer() : () -> i64
      %224 = func.call @cc_typep(%212, %223) : (i64, i64) -> i64
      %225 = func.call @cc_nil_value() : () -> i64
      %226 = arith.cmpi ne, %224, %225 : i64
      %227 = scf.if %226 -> (i64) {
        func.call @stack_push_pointer(%130) : (i64) -> ()
        %228 = func.call @stack_pop_pointer() : () -> i64
        %229 = func.call @cc_nil_value() : () -> i64
        %230 = func.call @cc_errorp(%228) : (i64) -> i64
        %231 = arith.cmpi ne, %230, %229 : i64
        %232 = arith.cmpi eq, %229, %229 : i64
        %233 = arith.andi %231, %232 : i1
        %234 = scf.if %233 -> (i64) {
          scf.yield %228 : i64
        } else {
          scf.yield %229 : i64
        }
        %235 = arith.cmpi ne, %234, %229 : i64
        scf.if %235 {
          func.call @stack_push_pointer(%234) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%228) : (i64) -> ()
          %236 = llvm.mlir.addressof @str24 : !llvm.ptr
          %237 = func.call @cc_make_function_ref_const(%236) : (!llvm.ptr) -> i64
          %238 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%237, %238) : (i64, i64) -> ()
        }
        %239 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %239 : i64
      } else {
        scf.yield %207 : i64
      }
      scf.yield %227 : i64
    } else {
      scf.yield %207 : i64
    }
    func.call @stack_push_pointer(%211) : (i64) -> ()
    %240 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_nil() : () -> ()
    %241 = func.call @stack_pop_pointer() : () -> i64
    %242 = func.call @cc_cons(%240, %241) : (i64, i64) -> i64
    func.call @stack_push_pointer(%242) : (i64) -> ()
    %243 = func.call @stack_pop_pointer() : () -> i64
    %244 = func.call @cc_cons(%152, %243) : (i64, i64) -> i64
    func.call @stack_push_pointer(%244) : (i64) -> ()
    %245 = func.call @stack_pop_pointer() : () -> i64
    %246 = func.call @cc_values_pack(%245) : (i64) -> i64
    func.call @stack_push_pointer(%246) : (i64) -> ()
    %247 = func.call @stack_pop_pointer() : () -> i64
    %248 = func.call @cc_errorp(%247) : (i64) -> i64
    %249 = func.call @cc_nil_value() : () -> i64
    %250 = arith.cmpi ne, %248, %249 : i64
    scf.if %250 {
      func.call @stack_push_pointer(%247) : (i64) -> ()
    } else {
      %251 = func.call @cc_multiple_value_list(%247) : (i64) -> i64
      func.call @stack_push_pointer(%251) : (i64) -> ()
    }
    %252 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%132) : (i64) -> ()
    func.call @stack_push_pointer(%136) : (i64) -> ()
    func.call @stack_push_pointer(%252) : (i64) -> ()
    %253 = llvm.mlir.addressof @str25 : !llvm.ptr
    %254 = func.call @cc_make_function_ref_const(%253) : (!llvm.ptr) -> i64
    %255 = arith.constant 3 : i64
    func.call @cc_funcall_stack(%254, %255) : (i64, i64) -> ()
    %256 = func.call @stack_pop_pointer() : () -> i64
    %257 = func.call @cc_multiple_value_list(%256) : (i64) -> i64
    %258 = llvm.mlir.addressof @str26 : !llvm.ptr
    %259 = arith.constant 38 : i64
    %260 = func.call @cc_make_symbol(%258, %259) : (!llvm.ptr, i64) -> i64
    %261 = func.call @cc_symbol_value(%260) : (i64) -> i64
    %262 = llvm.mlir.addressof @str27 : !llvm.ptr
    %263 = arith.constant 39 : i64
    %264 = func.call @cc_make_symbol(%262, %263) : (!llvm.ptr, i64) -> i64
    %265 = func.call @cc_symbol_value(%264) : (i64) -> i64
    %266 = llvm.mlir.addressof @str28 : !llvm.ptr
    %267 = arith.constant 40 : i64
    %268 = func.call @cc_make_symbol(%266, %267) : (!llvm.ptr, i64) -> i64
    %269 = func.call @cc_symbol_value(%268) : (i64) -> i64
    %270 = func.call @cc_nil_value() : () -> i64
    %271 = arith.cmpi ne, %261, %270 : i64
    %272 = scf.if %271 -> (i64) {
      scf.yield %269 : i64
    } else {
      scf.yield %257 : i64
    }
    %273 = func.call @cc_values_pack(%272) : (i64) -> i64
    func.call @stack_push_pointer(%273) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %274 = llvm.mlir.addressof @str29 : !llvm.ptr
    %275 = arith.constant 6 : i64
    %276 = func.call @cc_make_string(%274, %275) : (!llvm.ptr, i64) -> i64
    %277 = func.call @cc_nil_value() : () -> i64
    %278 = func.call @cc_intern(%276, %277) : (i64, i64) -> i64
    %279 = func.call @cc_nil_value() : () -> i64
    %280 = func.call @cc_cons(%278, %279) : (i64, i64) -> i64
    %281 = func.call @cc_values_pack(%280) : (i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%278) : (i64) -> ()
    %282 = func.call @cc_nil_value() : () -> i64
    %283 = func.call @cc_nil_value() : () -> i64
    %284 = func.call @cc_errorp(%282) : (i64) -> i64
    %285 = arith.cmpi ne, %284, %283 : i64
    %286 = scf.if %285 -> (i64) {
      scf.yield %282 : i64
    } else {
      %287 = llvm.mlir.addressof @str30 : !llvm.ptr
      %288 = arith.constant 11 : i64
      %289 = func.call @cc_make_string(%287, %288) : (!llvm.ptr, i64) -> i64
      %290 = llvm.mlir.addressof @str31 : !llvm.ptr
      %291 = arith.constant 7 : i64
      %292 = func.call @cc_make_string(%290, %291) : (!llvm.ptr, i64) -> i64
      %293 = func.call @cc_intern(%289, %292) : (i64, i64) -> i64
      %294 = func.call @cc_nil_value() : () -> i64
      %295 = func.call @cc_cons(%293, %294) : (i64, i64) -> i64
      %296 = func.call @cc_values_pack(%295) : (i64) -> i64
      func.call @stack_push_pointer(%293) : (i64) -> ()
      %297 = func.call @stack_pop_pointer() : () -> i64
      %298 = func.call @cc_in_package(%297) : (i64) -> i64
      func.call @stack_push_pointer(%298) : (i64) -> ()
      %299 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %299 : i64
    }
    %300 = func.call @cc_nil_value() : () -> i64
    %301 = func.call @cc_errorp(%286) : (i64) -> i64
    %302 = arith.cmpi ne, %301, %300 : i64
    %303 = scf.if %302 -> (i64) {
      scf.yield %286 : i64
    } else {
      %304 = llvm.mlir.addressof @str32 : !llvm.ptr
      %305 = func.call @cc_make_function_ref_const(%304) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%305) : (i64) -> ()
      %306 = func.call @stack_pop_pointer() : () -> i64
      %307 = llvm.mlir.addressof @str33 : !llvm.ptr
      %308 = arith.constant 11 : i64
      %309 = func.call @cc_make_string(%307, %308) : (!llvm.ptr, i64) -> i64
      %310 = llvm.mlir.addressof @str34 : !llvm.ptr
      %311 = arith.constant 15 : i64
      %312 = func.call @cc_make_string(%310, %311) : (!llvm.ptr, i64) -> i64
      %313 = func.call @cc_intern(%309, %312) : (i64, i64) -> i64
      %314 = func.call @cc_nil_value() : () -> i64
      %315 = func.call @cc_cons(%313, %314) : (i64, i64) -> i64
      %316 = func.call @cc_values_pack(%315) : (i64) -> i64
      %317 = func.call @cc_set_symbol_value(%313, %306) : (i64, i64) -> i64
      func.call @stack_push_pointer(%306) : (i64) -> ()
      %318 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %318 : i64
    }
    %319 = func.call @cc_nil_value() : () -> i64
    %320 = func.call @cc_errorp(%303) : (i64) -> i64
    %321 = arith.cmpi ne, %320, %319 : i64
    %322 = scf.if %321 -> (i64) {
      scf.yield %303 : i64
    } else {
      %323 = llvm.mlir.addressof @str35 : !llvm.ptr
      %324 = func.call @cc_make_function_ref_const(%323) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%324) : (i64) -> ()
      %325 = func.call @stack_pop_pointer() : () -> i64
      %326 = llvm.mlir.addressof @str36 : !llvm.ptr
      %327 = arith.constant 11 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = llvm.mlir.addressof @str37 : !llvm.ptr
      %330 = arith.constant 15 : i64
      %331 = func.call @cc_make_string(%329, %330) : (!llvm.ptr, i64) -> i64
      %332 = func.call @cc_intern(%328, %331) : (i64, i64) -> i64
      %333 = func.call @cc_nil_value() : () -> i64
      %334 = func.call @cc_cons(%332, %333) : (i64, i64) -> i64
      %335 = func.call @cc_values_pack(%334) : (i64) -> i64
      %336 = func.call @cc_set_symbol_value(%332, %325) : (i64, i64) -> i64
      func.call @stack_push_pointer(%325) : (i64) -> ()
      %337 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %337 : i64
    }
    %338 = func.call @cc_nil_value() : () -> i64
    %339 = func.call @cc_errorp(%322) : (i64) -> i64
    %340 = arith.cmpi ne, %339, %338 : i64
    %341 = scf.if %340 -> (i64) {
      scf.yield %322 : i64
    } else {
      %342 = llvm.mlir.addressof @str38 : !llvm.ptr
      %343 = func.call @cc_make_function_ref_const(%342) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%343) : (i64) -> ()
      %344 = func.call @stack_pop_pointer() : () -> i64
      %345 = llvm.mlir.addressof @str39 : !llvm.ptr
      %346 = arith.constant 11 : i64
      %347 = func.call @cc_make_string(%345, %346) : (!llvm.ptr, i64) -> i64
      %348 = llvm.mlir.addressof @str40 : !llvm.ptr
      %349 = arith.constant 15 : i64
      %350 = func.call @cc_make_string(%348, %349) : (!llvm.ptr, i64) -> i64
      %351 = func.call @cc_intern(%347, %350) : (i64, i64) -> i64
      %352 = func.call @cc_nil_value() : () -> i64
      %353 = func.call @cc_cons(%351, %352) : (i64, i64) -> i64
      %354 = func.call @cc_values_pack(%353) : (i64) -> i64
      %355 = func.call @cc_set_symbol_value(%351, %344) : (i64, i64) -> i64
      func.call @stack_push_pointer(%344) : (i64) -> ()
      %356 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %356 : i64
    }
    %357 = func.call @cc_nil_value() : () -> i64
    %358 = func.call @cc_errorp(%341) : (i64) -> i64
    %359 = arith.cmpi ne, %358, %357 : i64
    %360 = scf.if %359 -> (i64) {
      scf.yield %341 : i64
    } else {
      %361 = llvm.mlir.addressof @str41 : !llvm.ptr
      %362 = func.call @cc_make_function_ref_const(%361) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%362) : (i64) -> ()
      %363 = func.call @stack_pop_pointer() : () -> i64
      %364 = llvm.mlir.addressof @str42 : !llvm.ptr
      %365 = arith.constant 11 : i64
      %366 = func.call @cc_make_string(%364, %365) : (!llvm.ptr, i64) -> i64
      %367 = llvm.mlir.addressof @str43 : !llvm.ptr
      %368 = arith.constant 15 : i64
      %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
      %370 = func.call @cc_intern(%366, %369) : (i64, i64) -> i64
      %371 = func.call @cc_nil_value() : () -> i64
      %372 = func.call @cc_cons(%370, %371) : (i64, i64) -> i64
      %373 = func.call @cc_values_pack(%372) : (i64) -> i64
      %374 = func.call @cc_set_symbol_value(%370, %363) : (i64, i64) -> i64
      func.call @stack_push_pointer(%363) : (i64) -> ()
      %375 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %375 : i64
    }
    %376 = func.call @cc_nil_value() : () -> i64
    %377 = func.call @cc_errorp(%360) : (i64) -> i64
    %378 = arith.cmpi ne, %377, %376 : i64
    %379 = scf.if %378 -> (i64) {
      scf.yield %360 : i64
    } else {
      %380 = func.call @cc_nil_value() : () -> i64
      %381 = arith.cmpi ne, %380, %380 : i64
      scf.if %381 {
        func.call @stack_push_pointer(%380) : (i64) -> ()
      } else {
        %382 = llvm.mlir.addressof @str44 : !llvm.ptr
        %383 = func.call @cc_make_function_ref_const(%382) : (!llvm.ptr) -> i64
        %384 = arith.constant 0 : i64
        func.call @cc_funcall_stack(%383, %384) : (i64, i64) -> ()
      }
      %385 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %385 : i64
    }
    func.call @stack_push_pointer(%379) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("SHOW-LISTEN\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str1("*__MLIR_BLOCK_RETFLAG_184856046731264*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETVALUE_184856046731264*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETMVLIST_184856046731264*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str4("x\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str5("listen2=~S~%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str6("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str7("LISTEN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str8("UNREAD-CHAR\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str9("LISTEN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str10("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str11("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str12("xxx\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str13("listen3=~S~%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str14("LISTEN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str15("*__MLIR_BLOCK_RETFLAG_184856046731265*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str16("*__MLIR_BLOCK_RETVALUE_184856046731265*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str17("*__MLIR_BLOCK_RETMVLIST_184856046731265*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str18("READ-CHAR\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str19("*__MLIR_BLOCK_RETFLAG_184856046731265*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str20("*__MLIR_BLOCK_RETVALUE_184856046731265*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str21("*__MLIR_BLOCK_RETMVLIST_184856046731265*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str22("END-OF-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str24("LISTEN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str26("*__MLIR_BLOCK_RETFLAG_184856046731264*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str27("*__MLIR_BLOCK_RETVALUE_184856046731264*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str28("*__MLIR_BLOCK_RETMVLIST_184856046731264*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str29("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str30("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str31("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str32("%FN%show-listen\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str33("SHOW-LISTEN\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str34("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str35("%FN%show-listen\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str36("SHOW-LISTEN\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str37("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str38("%FN%show-listen\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str39("SHOW-LISTEN\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str40("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str41("%FN%show-listen\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str42("SHOW-LISTEN\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str43("%FN%CLASP-TESTS\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str44("%FN%show-listen\00") : !llvm.array<16 x i8>
}
