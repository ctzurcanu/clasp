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
    %8 = arith.constant 8 : i64
    %9 = func.call @cc_box_character(%8) : (i64) -> i64
    func.call @stack_push_pointer(%9) : (i64) -> ()
    %10 = func.call @stack_pop_pointer() : () -> i64
    %11 = arith.constant 9 : i64
    %12 = func.call @cc_box_character(%11) : (i64) -> i64
    func.call @stack_push_pointer(%12) : (i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = arith.constant 10 : i64
    %15 = func.call @cc_box_character(%14) : (i64) -> i64
    func.call @stack_push_pointer(%15) : (i64) -> ()
    %16 = func.call @stack_pop_pointer() : () -> i64
    %17 = arith.constant 10 : i64
    %18 = func.call @cc_box_character(%17) : (i64) -> i64
    func.call @stack_push_pointer(%18) : (i64) -> ()
    %19 = func.call @stack_pop_pointer() : () -> i64
    %20 = arith.constant 12 : i64
    %21 = func.call @cc_box_character(%20) : (i64) -> i64
    func.call @stack_push_pointer(%21) : (i64) -> ()
    %22 = func.call @stack_pop_pointer() : () -> i64
    %23 = arith.constant 13 : i64
    %24 = func.call @cc_box_character(%23) : (i64) -> i64
    func.call @stack_push_pointer(%24) : (i64) -> ()
    %25 = func.call @stack_pop_pointer() : () -> i64
    %26 = arith.constant 32 : i64
    %27 = func.call @cc_box_character(%26) : (i64) -> i64
    func.call @stack_push_pointer(%27) : (i64) -> ()
    %28 = func.call @stack_pop_pointer() : () -> i64
    %29 = arith.constant 127 : i64
    %30 = func.call @cc_box_character(%29) : (i64) -> i64
    func.call @stack_push_pointer(%30) : (i64) -> ()
    %31 = func.call @stack_pop_pointer() : () -> i64
    %32 = func.call @cc_nil_value() : () -> i64
    %33 = func.call @cc_errorp(%10) : (i64) -> i64
    %34 = arith.cmpi ne, %33, %32 : i64
    %35 = arith.cmpi eq, %32, %32 : i64
    %36 = arith.andi %34, %35 : i1
    %37 = scf.if %36 -> (i64) {
      scf.yield %10 : i64
    } else {
      scf.yield %32 : i64
    }
    %38 = func.call @cc_errorp(%13) : (i64) -> i64
    %39 = arith.cmpi ne, %38, %32 : i64
    %40 = arith.cmpi eq, %37, %32 : i64
    %41 = arith.andi %39, %40 : i1
    %42 = scf.if %41 -> (i64) {
      scf.yield %13 : i64
    } else {
      scf.yield %37 : i64
    }
    %43 = func.call @cc_errorp(%16) : (i64) -> i64
    %44 = arith.cmpi ne, %43, %32 : i64
    %45 = arith.cmpi eq, %42, %32 : i64
    %46 = arith.andi %44, %45 : i1
    %47 = scf.if %46 -> (i64) {
      scf.yield %16 : i64
    } else {
      scf.yield %42 : i64
    }
    %48 = func.call @cc_errorp(%19) : (i64) -> i64
    %49 = arith.cmpi ne, %48, %32 : i64
    %50 = arith.cmpi eq, %47, %32 : i64
    %51 = arith.andi %49, %50 : i1
    %52 = scf.if %51 -> (i64) {
      scf.yield %19 : i64
    } else {
      scf.yield %47 : i64
    }
    %53 = func.call @cc_errorp(%22) : (i64) -> i64
    %54 = arith.cmpi ne, %53, %32 : i64
    %55 = arith.cmpi eq, %52, %32 : i64
    %56 = arith.andi %54, %55 : i1
    %57 = scf.if %56 -> (i64) {
      scf.yield %22 : i64
    } else {
      scf.yield %52 : i64
    }
    %58 = func.call @cc_errorp(%25) : (i64) -> i64
    %59 = arith.cmpi ne, %58, %32 : i64
    %60 = arith.cmpi eq, %57, %32 : i64
    %61 = arith.andi %59, %60 : i1
    %62 = scf.if %61 -> (i64) {
      scf.yield %25 : i64
    } else {
      scf.yield %57 : i64
    }
    %63 = func.call @cc_errorp(%28) : (i64) -> i64
    %64 = arith.cmpi ne, %63, %32 : i64
    %65 = arith.cmpi eq, %62, %32 : i64
    %66 = arith.andi %64, %65 : i1
    %67 = scf.if %66 -> (i64) {
      scf.yield %28 : i64
    } else {
      scf.yield %62 : i64
    }
    %68 = func.call @cc_errorp(%31) : (i64) -> i64
    %69 = arith.cmpi ne, %68, %32 : i64
    %70 = arith.cmpi eq, %67, %32 : i64
    %71 = arith.andi %69, %70 : i1
    %72 = scf.if %71 -> (i64) {
      scf.yield %31 : i64
    } else {
      scf.yield %67 : i64
    }
    %73 = arith.cmpi ne, %72, %32 : i64
    scf.if %73 {
      func.call @stack_push_pointer(%72) : (i64) -> ()
    } else {
      %74 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%74) : (i64) -> ()
      func.call @stack_push_pointer(%31) : (i64) -> ()
      %75 = func.call @stack_pop_pointer() : () -> i64
      %76 = func.call @stack_pop_pointer() : () -> i64
      %77 = func.call @cc_cons(%75, %76) : (i64, i64) -> i64
      func.call @stack_push_pointer(%77) : (i64) -> ()
      func.call @stack_push_pointer(%28) : (i64) -> ()
      %78 = func.call @stack_pop_pointer() : () -> i64
      %79 = func.call @stack_pop_pointer() : () -> i64
      %80 = func.call @cc_cons(%78, %79) : (i64, i64) -> i64
      func.call @stack_push_pointer(%80) : (i64) -> ()
      func.call @stack_push_pointer(%25) : (i64) -> ()
      %81 = func.call @stack_pop_pointer() : () -> i64
      %82 = func.call @stack_pop_pointer() : () -> i64
      %83 = func.call @cc_cons(%81, %82) : (i64, i64) -> i64
      func.call @stack_push_pointer(%83) : (i64) -> ()
      func.call @stack_push_pointer(%22) : (i64) -> ()
      %84 = func.call @stack_pop_pointer() : () -> i64
      %85 = func.call @stack_pop_pointer() : () -> i64
      %86 = func.call @cc_cons(%84, %85) : (i64, i64) -> i64
      func.call @stack_push_pointer(%86) : (i64) -> ()
      func.call @stack_push_pointer(%19) : (i64) -> ()
      %87 = func.call @stack_pop_pointer() : () -> i64
      %88 = func.call @stack_pop_pointer() : () -> i64
      %89 = func.call @cc_cons(%87, %88) : (i64, i64) -> i64
      func.call @stack_push_pointer(%89) : (i64) -> ()
      func.call @stack_push_pointer(%16) : (i64) -> ()
      %90 = func.call @stack_pop_pointer() : () -> i64
      %91 = func.call @stack_pop_pointer() : () -> i64
      %92 = func.call @cc_cons(%90, %91) : (i64, i64) -> i64
      func.call @stack_push_pointer(%92) : (i64) -> ()
      func.call @stack_push_pointer(%13) : (i64) -> ()
      %93 = func.call @stack_pop_pointer() : () -> i64
      %94 = func.call @stack_pop_pointer() : () -> i64
      %95 = func.call @cc_cons(%93, %94) : (i64, i64) -> i64
      func.call @stack_push_pointer(%95) : (i64) -> ()
      func.call @stack_push_pointer(%10) : (i64) -> ()
      %96 = func.call @stack_pop_pointer() : () -> i64
      %97 = func.call @stack_pop_pointer() : () -> i64
      %98 = func.call @cc_cons(%96, %97) : (i64, i64) -> i64
      func.call @stack_push_pointer(%98) : (i64) -> ()
    }
    %99 = func.call @stack_pop_pointer() : () -> i64
    %100 = func.call @cc_nil_value() : () -> i64
    %101 = func.call @cc_nil_value() : () -> i64
    %102 = func.call @cc_errorp(%100) : (i64) -> i64
    %103 = arith.cmpi ne, %102, %101 : i64
    %104 = scf.if %103 -> (i64) {
      scf.yield %100 : i64
    } else {
      %192 = llvm.mlir.addressof @str8 : !llvm.ptr
      %193 = arith.constant 29 : i64
      %194 = func.call @cc_make_symbol(%192, %193) : (!llvm.ptr, i64) -> i64
      %195 = func.call @cc_persistent_root_value(%194) : (i64) -> i64
      func.call @stack_push_pointer(%195) : (i64) -> ()
      %196 = arith.constant 18514110840832 : i64
      %197 = arith.constant 1 : i64
      %198 = func.call @cc_make_closure(%196, %197) : (i64, i64) -> i64
      func.call @stack_push_pointer(%198) : (i64) -> ()
      %199 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%99) : (i64) -> ()
      %200 = func.call @stack_pop_pointer() : () -> i64
      %201 = func.call @cc_nil_value() : () -> i64
      %202 = func.call @cc_errorp(%199) : (i64) -> i64
      %203 = arith.cmpi ne, %202, %201 : i64
      %204 = arith.cmpi eq, %201, %201 : i64
      %205 = arith.andi %203, %204 : i1
      %206 = scf.if %205 -> (i64) {
        scf.yield %199 : i64
      } else {
        scf.yield %201 : i64
      }
      %207 = func.call @cc_errorp(%200) : (i64) -> i64
      %208 = arith.cmpi ne, %207, %201 : i64
      %209 = arith.cmpi eq, %206, %201 : i64
      %210 = arith.andi %208, %209 : i1
      %211 = scf.if %210 -> (i64) {
        scf.yield %200 : i64
      } else {
        scf.yield %206 : i64
      }
      %212 = arith.cmpi ne, %211, %201 : i64
      scf.if %212 {
        func.call @stack_push_pointer(%211) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%199) : (i64) -> ()
        func.call @stack_push_pointer(%200) : (i64) -> ()
        %213 = llvm.mlir.addressof @str9 : !llvm.ptr
        %214 = func.call @cc_make_function_ref_const(%213) : (!llvm.ptr) -> i64
        %215 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%214, %215) : (i64, i64) -> ()
      }
      %216 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %216 : i64
    }
    func.call @stack_push_pointer(%104) : (i64) -> ()
    %217 = func.call @stack_pop_pointer() : () -> i64
    %218 = func.call @cc_nil_value() : () -> i64
    %219 = func.call @cc_nil_value() : () -> i64
    %220 = func.call @cc_errorp(%218) : (i64) -> i64
    %221 = arith.cmpi ne, %220, %219 : i64
    %222 = scf.if %221 -> (i64) {
      scf.yield %218 : i64
    } else {
      %223 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      %224 = func.call @stack_pop_pointer() : () -> i64
      %225 = llvm.mlir.addressof @str10 : !llvm.ptr
      %226 = arith.constant 11 : i64
      %227 = func.call @cc_make_string(%225, %226) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%227) : (i64) -> ()
      %228 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%217) : (i64) -> ()
      %229 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%224) : (i64) -> ()
      func.call @stack_push_pointer(%228) : (i64) -> ()
      func.call @stack_push_pointer(%229) : (i64) -> ()
      %230 = llvm.mlir.addressof @str11 : !llvm.ptr
      %231 = func.call @cc_make_function_ref_const(%230) : (!llvm.ptr) -> i64
      %232 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%231, %232) : (i64, i64) -> ()
      %233 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %233 : i64
    }
    %234 = func.call @cc_nil_value() : () -> i64
    %235 = func.call @cc_errorp(%222) : (i64) -> i64
    %236 = arith.cmpi ne, %235, %234 : i64
    %237 = scf.if %236 -> (i64) {
      scf.yield %222 : i64
    } else {
      %238 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%238) : (i64) -> ()
      %239 = func.call @stack_pop_pointer() : () -> i64
      %240 = llvm.mlir.addressof @str12 : !llvm.ptr
      %241 = arith.constant 28 : i64
      %242 = func.call @cc_make_string(%240, %241) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%242) : (i64) -> ()
      %243 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%217) : (i64) -> ()
      %244 = func.call @stack_pop_pointer() : () -> i64
      %245 = func.call @cc_car(%244) : (i64) -> i64
      func.call @stack_push_pointer(%245) : (i64) -> ()
      %246 = func.call @stack_pop_pointer() : () -> i64
      %247 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%247) : (i64) -> ()
      func.call @stack_push_pointer(%217) : (i64) -> ()
      %248 = func.call @stack_pop_pointer() : () -> i64
      %249 = func.call @stack_pop_pointer() : () -> i64
      %250 = func.call @cc_nth(%249, %248) : (i64, i64) -> i64
      func.call @stack_push_pointer(%250) : (i64) -> ()
      %251 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%217) : (i64) -> ()
      %252 = func.call @stack_pop_pointer() : () -> i64
      %253 = func.call @cc_nil_value() : () -> i64
      %254 = func.call @cc_errorp(%252) : (i64) -> i64
      %255 = arith.cmpi ne, %254, %253 : i64
      %256 = arith.cmpi eq, %253, %253 : i64
      %257 = arith.andi %255, %256 : i1
      %258 = scf.if %257 -> (i64) {
        scf.yield %252 : i64
      } else {
        scf.yield %253 : i64
      }
      %259 = arith.cmpi ne, %258, %253 : i64
      scf.if %259 {
        func.call @stack_push_pointer(%258) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%252) : (i64) -> ()
        %260 = llvm.mlir.addressof @str13 : !llvm.ptr
        %261 = func.call @cc_make_function_ref_const(%260) : (!llvm.ptr) -> i64
        %262 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%261, %262) : (i64, i64) -> ()
      }
      %263 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%239) : (i64) -> ()
      func.call @stack_push_pointer(%243) : (i64) -> ()
      func.call @stack_push_pointer(%246) : (i64) -> ()
      func.call @stack_push_pointer(%251) : (i64) -> ()
      func.call @stack_push_pointer(%263) : (i64) -> ()
      %264 = llvm.mlir.addressof @str14 : !llvm.ptr
      %265 = func.call @cc_make_function_ref_const(%264) : (!llvm.ptr) -> i64
      %266 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%265, %266) : (i64, i64) -> ()
      %267 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %267 : i64
    }
    %268 = func.call @cc_nil_value() : () -> i64
    %269 = func.call @cc_errorp(%237) : (i64) -> i64
    %270 = arith.cmpi ne, %269, %268 : i64
    %271 = scf.if %270 -> (i64) {
      scf.yield %237 : i64
    } else {
      %272 = func.call @cc_t_value() : () -> i64
      func.call @stack_push_pointer(%272) : (i64) -> ()
      %273 = func.call @stack_pop_pointer() : () -> i64
      %274 = llvm.mlir.addressof @str15 : !llvm.ptr
      %275 = arith.constant 43 : i64
      %276 = func.call @cc_make_string(%274, %275) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%276) : (i64) -> ()
      %277 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%217) : (i64) -> ()
      %278 = func.call @stack_pop_pointer() : () -> i64
      %279 = func.call @cc_car(%278) : (i64) -> i64
      func.call @stack_push_pointer(%279) : (i64) -> ()
      %280 = llvm.mlir.addressof @str16 : !llvm.ptr
      %281 = arith.constant 12 : i64
      %282 = func.call @cc_make_string(%280, %281) : (!llvm.ptr, i64) -> i64
      %283 = llvm.mlir.addressof @str17 : !llvm.ptr
      %284 = arith.constant 11 : i64
      %285 = func.call @cc_make_string(%283, %284) : (!llvm.ptr, i64) -> i64
      %286 = func.call @cc_intern(%282, %285) : (i64, i64) -> i64
      %287 = func.call @cc_nil_value() : () -> i64
      %288 = func.call @cc_cons(%286, %287) : (i64, i64) -> i64
      %289 = func.call @cc_values_pack(%288) : (i64) -> i64
      func.call @stack_push_pointer(%286) : (i64) -> ()
      %290 = func.call @stack_pop_pointer() : () -> i64
      %291 = func.call @stack_pop_pointer() : () -> i64
      %292 = func.call @cc_typep(%291, %290) : (i64, i64) -> i64
      func.call @stack_push_pointer(%292) : (i64) -> ()
      %293 = func.call @stack_pop_pointer() : () -> i64
      %294 = arith.constant 7 : i64
      func.call @stack_push_fixnum(%294) : (i64) -> ()
      func.call @stack_push_pointer(%217) : (i64) -> ()
      %295 = func.call @stack_pop_pointer() : () -> i64
      %296 = func.call @stack_pop_pointer() : () -> i64
      %297 = func.call @cc_nth(%296, %295) : (i64, i64) -> i64
      func.call @stack_push_pointer(%297) : (i64) -> ()
      %298 = llvm.mlir.addressof @str18 : !llvm.ptr
      %299 = arith.constant 12 : i64
      %300 = func.call @cc_make_string(%298, %299) : (!llvm.ptr, i64) -> i64
      %301 = llvm.mlir.addressof @str19 : !llvm.ptr
      %302 = arith.constant 11 : i64
      %303 = func.call @cc_make_string(%301, %302) : (!llvm.ptr, i64) -> i64
      %304 = func.call @cc_intern(%300, %303) : (i64, i64) -> i64
      %305 = func.call @cc_nil_value() : () -> i64
      %306 = func.call @cc_cons(%304, %305) : (i64, i64) -> i64
      %307 = func.call @cc_values_pack(%306) : (i64) -> i64
      func.call @stack_push_pointer(%304) : (i64) -> ()
      %308 = func.call @stack_pop_pointer() : () -> i64
      %309 = func.call @stack_pop_pointer() : () -> i64
      %310 = func.call @cc_typep(%309, %308) : (i64, i64) -> i64
      func.call @stack_push_pointer(%310) : (i64) -> ()
      %311 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%217) : (i64) -> ()
      %312 = func.call @stack_pop_pointer() : () -> i64
      %313 = func.call @cc_nil_value() : () -> i64
      %314 = func.call @cc_errorp(%312) : (i64) -> i64
      %315 = arith.cmpi ne, %314, %313 : i64
      %316 = arith.cmpi eq, %313, %313 : i64
      %317 = arith.andi %315, %316 : i1
      %318 = scf.if %317 -> (i64) {
        scf.yield %312 : i64
      } else {
        scf.yield %313 : i64
      }
      %319 = arith.cmpi ne, %318, %313 : i64
      scf.if %319 {
        func.call @stack_push_pointer(%318) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%312) : (i64) -> ()
        %320 = llvm.mlir.addressof @str20 : !llvm.ptr
        %321 = func.call @cc_make_function_ref_const(%320) : (!llvm.ptr) -> i64
        %322 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%321, %322) : (i64, i64) -> ()
      }
      %323 = llvm.mlir.addressof @str21 : !llvm.ptr
      %324 = arith.constant 12 : i64
      %325 = func.call @cc_make_string(%323, %324) : (!llvm.ptr, i64) -> i64
      %326 = llvm.mlir.addressof @str22 : !llvm.ptr
      %327 = arith.constant 11 : i64
      %328 = func.call @cc_make_string(%326, %327) : (!llvm.ptr, i64) -> i64
      %329 = func.call @cc_intern(%325, %328) : (i64, i64) -> i64
      %330 = func.call @cc_nil_value() : () -> i64
      %331 = func.call @cc_cons(%329, %330) : (i64, i64) -> i64
      %332 = func.call @cc_values_pack(%331) : (i64) -> i64
      func.call @stack_push_pointer(%329) : (i64) -> ()
      %333 = func.call @stack_pop_pointer() : () -> i64
      %334 = func.call @stack_pop_pointer() : () -> i64
      %335 = func.call @cc_typep(%334, %333) : (i64, i64) -> i64
      func.call @stack_push_pointer(%335) : (i64) -> ()
      %336 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%273) : (i64) -> ()
      func.call @stack_push_pointer(%277) : (i64) -> ()
      func.call @stack_push_pointer(%293) : (i64) -> ()
      func.call @stack_push_pointer(%311) : (i64) -> ()
      func.call @stack_push_pointer(%336) : (i64) -> ()
      %337 = llvm.mlir.addressof @str23 : !llvm.ptr
      %338 = func.call @cc_make_function_ref_const(%337) : (!llvm.ptr) -> i64
      %339 = arith.constant 5 : i64
      func.call @cc_funcall_stack(%338, %339) : (i64, i64) -> ()
      %340 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %340 : i64
    }
    func.call @stack_push_pointer(%271) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_18514110840832"() {
    %105 = func.call @stack_pop_pointer() : () -> i64
    %106 = func.call @stack_pop_pointer() : () -> i64
    %107 = func.call @cc_nil_value() : () -> i64
    %108 = func.call @cc_nil_value() : () -> i64
    %109 = func.call @cc_errorp(%107) : (i64) -> i64
    %110 = arith.cmpi ne, %109, %108 : i64
    %111 = scf.if %110 -> (i64) {
      scf.yield %107 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %112 = func.call @stack_pop_pointer() : () -> i64
      %113 = func.call @cc_nil_value() : () -> i64
      %114 = func.call @cc_errorp(%112) : (i64) -> i64
      %115 = arith.cmpi ne, %114, %113 : i64
      %116 = arith.cmpi eq, %113, %113 : i64
      %117 = arith.andi %115, %116 : i1
      %118 = scf.if %117 -> (i64) {
        scf.yield %112 : i64
      } else {
        scf.yield %113 : i64
      }
      %119 = arith.cmpi ne, %118, %113 : i64
      scf.if %119 {
        func.call @stack_push_pointer(%118) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%112) : (i64) -> ()
        %120 = llvm.mlir.addressof @str1 : !llvm.ptr
        %121 = func.call @cc_make_function_ref_const(%120) : (!llvm.ptr) -> i64
        %122 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%121, %122) : (i64, i64) -> ()
      }
      %123 = func.call @stack_pop_pointer() : () -> i64
      %124 = llvm.mlir.addressof @str2 : !llvm.ptr
      %125 = arith.constant 23 : i64
      %126 = func.call @cc_make_symbol(%124, %125) : (!llvm.ptr, i64) -> i64
      %127 = func.call @cc_symbol_value(%126) : (i64) -> i64
      %128 = func.call @cc_set_symbol_value(%126, %123) : (i64, i64) -> i64
      %129 = func.call @cc_nil_value() : () -> i64
      %130 = func.call @cc_nil_value() : () -> i64
      %131 = func.call @cc_errorp(%129) : (i64) -> i64
      %132 = arith.cmpi ne, %131, %130 : i64
      %133 = scf.if %132 -> (i64) {
        scf.yield %129 : i64
      } else {
        %134 = llvm.mlir.addressof @str3 : !llvm.ptr
        %135 = arith.constant 6 : i64
        %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
        %137 = llvm.mlir.addressof @str4 : !llvm.ptr
        %138 = arith.constant 11 : i64
        %139 = func.call @cc_make_string(%137, %138) : (!llvm.ptr, i64) -> i64
        %140 = func.call @cc_intern(%136, %139) : (i64, i64) -> i64
        %141 = func.call @cc_nil_value() : () -> i64
        %142 = func.call @cc_cons(%140, %141) : (i64, i64) -> i64
        %143 = func.call @cc_values_pack(%142) : (i64) -> i64
        func.call @stack_push_pointer(%140) : (i64) -> ()
        %144 = func.call @stack_pop_pointer() : () -> i64
        %145 = func.call @cc_nil_value() : () -> i64
        %146 = llvm.mlir.addressof @str5 : !llvm.ptr
        %147 = arith.constant 1 : i64
        %148 = func.call @cc_make_string(%146, %147) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%148) : (i64) -> ()
        %149 = func.call @stack_pop_pointer() : () -> i64
        %150 = func.call @cc_cons(%149, %145) : (i64, i64) -> i64
        func.call @stack_push_pointer(%105) : (i64) -> ()
        %151 = func.call @stack_pop_pointer() : () -> i64
        %152 = func.call @cc_string(%151) : (i64) -> i64
        func.call @stack_push_pointer(%152) : (i64) -> ()
        %153 = func.call @stack_pop_pointer() : () -> i64
        %154 = func.call @cc_cons(%153, %150) : (i64, i64) -> i64
        %155 = func.call @cc_concatenate(%144, %154) : (i64, i64) -> i64
        func.call @stack_push_pointer(%155) : (i64) -> ()
        %156 = func.call @stack_pop_pointer() : () -> i64
        %157 = func.call @cc_nil_value() : () -> i64
        %158 = func.call @cc_errorp(%156) : (i64) -> i64
        %159 = arith.cmpi ne, %158, %157 : i64
        %160 = arith.cmpi eq, %157, %157 : i64
        %161 = arith.andi %159, %160 : i1
        %162 = scf.if %161 -> (i64) {
          scf.yield %156 : i64
        } else {
          scf.yield %157 : i64
        }
        %163 = arith.cmpi ne, %162, %157 : i64
        scf.if %163 {
          func.call @stack_push_pointer(%162) : (i64) -> ()
        } else {
          %164 = func.call @cc_nil_value() : () -> i64
          %165 = func.call @cc_cons(%156, %164) : (i64, i64) -> i64
          func.call @stack_push_pointer(%165) : (i64) -> ()
          func.call @cc_read_from_string_stack() : () -> ()
        }
        %166 = func.call @stack_pop_pointer() : () -> i64
        %167 = func.call @cc_errorp(%166) : (i64) -> i64
        %168 = func.call @cc_nil_value() : () -> i64
        %169 = arith.cmpi ne, %167, %168 : i64
        %170 = scf.if %169 -> (i64) {
          %171 = func.call @cc_condition_value(%166) : (i64) -> i64
          %172 = llvm.mlir.addressof @str6 : !llvm.ptr
          %173 = arith.constant 12 : i64
          %174 = func.call @cc_make_string(%172, %173) : (!llvm.ptr, i64) -> i64
          %175 = llvm.mlir.addressof @str7 : !llvm.ptr
          %176 = arith.constant 11 : i64
          %177 = func.call @cc_make_string(%175, %176) : (!llvm.ptr, i64) -> i64
          %178 = func.call @cc_intern(%174, %177) : (i64, i64) -> i64
          %179 = func.call @cc_nil_value() : () -> i64
          %180 = func.call @cc_cons(%178, %179) : (i64, i64) -> i64
          %181 = func.call @cc_values_pack(%180) : (i64) -> i64
          func.call @stack_push_pointer(%178) : (i64) -> ()
          %182 = func.call @stack_pop_pointer() : () -> i64
          %183 = func.call @cc_typep(%171, %182) : (i64, i64) -> i64
          %184 = func.call @cc_nil_value() : () -> i64
          %185 = arith.cmpi ne, %183, %184 : i64
          %186 = scf.if %185 -> (i64) {
            func.call @stack_push_pointer(%171) : (i64) -> ()
            %187 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %187 : i64
          } else {
            scf.yield %166 : i64
          }
          scf.yield %186 : i64
        } else {
          scf.yield %166 : i64
        }
        func.call @stack_push_pointer(%170) : (i64) -> ()
        %188 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %188 : i64
      }
      func.call @stack_push_pointer(%133) : (i64) -> ()
      %189 = func.call @cc_set_symbol_value(%126, %127) : (i64, i64) -> i64
      %190 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%190) : (i64) -> ()
      %191 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %191 : i64
    }
    func.call @stack_push_pointer(%111) : (i64) -> ()
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
  llvm.mlir.global private constant @str8("#:%%DYN-CELL-18514110840833-E\00") : !llvm.array<30 x i8>
  llvm.mlir.global private constant @str9("MAPCAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str10("result=~S~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str11("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str12("first=~S nth7=~S eighth=~S~%\00") : !llvm.array<29 x i8>
  llvm.mlir.global private constant @str13("EIGHTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str14("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str15("type-first=~S type-nth7=~S type-eighth=~S~%\00") : !llvm.array<44 x i8>
  llvm.mlir.global private constant @str16("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str19("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("EIGHTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str21("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str22("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("FORMAT\00") : !llvm.array<7 x i8>
}
