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
    %8 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%8) : (i64) -> ()
    %9 = func.call @stack_pop_pointer() : () -> i64
    %10 = llvm.mlir.addressof @str1 : !llvm.ptr
    %11 = arith.constant 10 : i64
    %12 = func.call @cc_make_string(%10, %11) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%12) : (i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    %14 = arith.constant 8 : i64
    %15 = func.call @cc_box_character(%14) : (i64) -> i64
    func.call @stack_push_pointer(%15) : (i64) -> ()
    %16 = func.call @stack_pop_pointer() : () -> i64
    %17 = arith.constant 9 : i64
    %18 = func.call @cc_box_character(%17) : (i64) -> i64
    func.call @stack_push_pointer(%18) : (i64) -> ()
    %19 = func.call @stack_pop_pointer() : () -> i64
    %20 = arith.constant 10 : i64
    %21 = func.call @cc_box_character(%20) : (i64) -> i64
    func.call @stack_push_pointer(%21) : (i64) -> ()
    %22 = func.call @stack_pop_pointer() : () -> i64
    %23 = arith.constant 10 : i64
    %24 = func.call @cc_box_character(%23) : (i64) -> i64
    func.call @stack_push_pointer(%24) : (i64) -> ()
    %25 = func.call @stack_pop_pointer() : () -> i64
    %26 = arith.constant 12 : i64
    %27 = func.call @cc_box_character(%26) : (i64) -> i64
    func.call @stack_push_pointer(%27) : (i64) -> ()
    %28 = func.call @stack_pop_pointer() : () -> i64
    %29 = arith.constant 13 : i64
    %30 = func.call @cc_box_character(%29) : (i64) -> i64
    func.call @stack_push_pointer(%30) : (i64) -> ()
    %31 = func.call @stack_pop_pointer() : () -> i64
    %32 = arith.constant 32 : i64
    %33 = func.call @cc_box_character(%32) : (i64) -> i64
    func.call @stack_push_pointer(%33) : (i64) -> ()
    %34 = func.call @stack_pop_pointer() : () -> i64
    %35 = arith.constant 127 : i64
    %36 = func.call @cc_box_character(%35) : (i64) -> i64
    func.call @stack_push_pointer(%36) : (i64) -> ()
    %37 = func.call @stack_pop_pointer() : () -> i64
    %38 = func.call @cc_nil_value() : () -> i64
    %39 = func.call @cc_errorp(%16) : (i64) -> i64
    %40 = arith.cmpi ne, %39, %38 : i64
    %41 = arith.cmpi eq, %38, %38 : i64
    %42 = arith.andi %40, %41 : i1
    %43 = scf.if %42 -> (i64) {
      scf.yield %16 : i64
    } else {
      scf.yield %38 : i64
    }
    %44 = func.call @cc_errorp(%19) : (i64) -> i64
    %45 = arith.cmpi ne, %44, %38 : i64
    %46 = arith.cmpi eq, %43, %38 : i64
    %47 = arith.andi %45, %46 : i1
    %48 = scf.if %47 -> (i64) {
      scf.yield %19 : i64
    } else {
      scf.yield %43 : i64
    }
    %49 = func.call @cc_errorp(%22) : (i64) -> i64
    %50 = arith.cmpi ne, %49, %38 : i64
    %51 = arith.cmpi eq, %48, %38 : i64
    %52 = arith.andi %50, %51 : i1
    %53 = scf.if %52 -> (i64) {
      scf.yield %22 : i64
    } else {
      scf.yield %48 : i64
    }
    %54 = func.call @cc_errorp(%25) : (i64) -> i64
    %55 = arith.cmpi ne, %54, %38 : i64
    %56 = arith.cmpi eq, %53, %38 : i64
    %57 = arith.andi %55, %56 : i1
    %58 = scf.if %57 -> (i64) {
      scf.yield %25 : i64
    } else {
      scf.yield %53 : i64
    }
    %59 = func.call @cc_errorp(%28) : (i64) -> i64
    %60 = arith.cmpi ne, %59, %38 : i64
    %61 = arith.cmpi eq, %58, %38 : i64
    %62 = arith.andi %60, %61 : i1
    %63 = scf.if %62 -> (i64) {
      scf.yield %28 : i64
    } else {
      scf.yield %58 : i64
    }
    %64 = func.call @cc_errorp(%31) : (i64) -> i64
    %65 = arith.cmpi ne, %64, %38 : i64
    %66 = arith.cmpi eq, %63, %38 : i64
    %67 = arith.andi %65, %66 : i1
    %68 = scf.if %67 -> (i64) {
      scf.yield %31 : i64
    } else {
      scf.yield %63 : i64
    }
    %69 = func.call @cc_errorp(%34) : (i64) -> i64
    %70 = arith.cmpi ne, %69, %38 : i64
    %71 = arith.cmpi eq, %68, %38 : i64
    %72 = arith.andi %70, %71 : i1
    %73 = scf.if %72 -> (i64) {
      scf.yield %34 : i64
    } else {
      scf.yield %68 : i64
    }
    %74 = func.call @cc_errorp(%37) : (i64) -> i64
    %75 = arith.cmpi ne, %74, %38 : i64
    %76 = arith.cmpi eq, %73, %38 : i64
    %77 = arith.andi %75, %76 : i1
    %78 = scf.if %77 -> (i64) {
      scf.yield %37 : i64
    } else {
      scf.yield %73 : i64
    }
    %79 = arith.cmpi ne, %78, %38 : i64
    scf.if %79 {
      func.call @stack_push_pointer(%78) : (i64) -> ()
    } else {
      %80 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%80) : (i64) -> ()
      func.call @stack_push_pointer(%37) : (i64) -> ()
      %81 = func.call @stack_pop_pointer() : () -> i64
      %82 = func.call @stack_pop_pointer() : () -> i64
      %83 = func.call @cc_cons(%81, %82) : (i64, i64) -> i64
      func.call @stack_push_pointer(%83) : (i64) -> ()
      func.call @stack_push_pointer(%34) : (i64) -> ()
      %84 = func.call @stack_pop_pointer() : () -> i64
      %85 = func.call @stack_pop_pointer() : () -> i64
      %86 = func.call @cc_cons(%84, %85) : (i64, i64) -> i64
      func.call @stack_push_pointer(%86) : (i64) -> ()
      func.call @stack_push_pointer(%31) : (i64) -> ()
      %87 = func.call @stack_pop_pointer() : () -> i64
      %88 = func.call @stack_pop_pointer() : () -> i64
      %89 = func.call @cc_cons(%87, %88) : (i64, i64) -> i64
      func.call @stack_push_pointer(%89) : (i64) -> ()
      func.call @stack_push_pointer(%28) : (i64) -> ()
      %90 = func.call @stack_pop_pointer() : () -> i64
      %91 = func.call @stack_pop_pointer() : () -> i64
      %92 = func.call @cc_cons(%90, %91) : (i64, i64) -> i64
      func.call @stack_push_pointer(%92) : (i64) -> ()
      func.call @stack_push_pointer(%25) : (i64) -> ()
      %93 = func.call @stack_pop_pointer() : () -> i64
      %94 = func.call @stack_pop_pointer() : () -> i64
      %95 = func.call @cc_cons(%93, %94) : (i64, i64) -> i64
      func.call @stack_push_pointer(%95) : (i64) -> ()
      func.call @stack_push_pointer(%22) : (i64) -> ()
      %96 = func.call @stack_pop_pointer() : () -> i64
      %97 = func.call @stack_pop_pointer() : () -> i64
      %98 = func.call @cc_cons(%96, %97) : (i64, i64) -> i64
      func.call @stack_push_pointer(%98) : (i64) -> ()
      func.call @stack_push_pointer(%19) : (i64) -> ()
      %99 = func.call @stack_pop_pointer() : () -> i64
      %100 = func.call @stack_pop_pointer() : () -> i64
      %101 = func.call @cc_cons(%99, %100) : (i64, i64) -> i64
      func.call @stack_push_pointer(%101) : (i64) -> ()
      func.call @stack_push_pointer(%16) : (i64) -> ()
      %102 = func.call @stack_pop_pointer() : () -> i64
      %103 = func.call @stack_pop_pointer() : () -> i64
      %104 = func.call @cc_cons(%102, %103) : (i64, i64) -> i64
      func.call @stack_push_pointer(%104) : (i64) -> ()
    }
    %105 = func.call @stack_pop_pointer() : () -> i64
    %106 = func.call @cc_nil_value() : () -> i64
    %107 = func.call @cc_nil_value() : () -> i64
    %108 = func.call @cc_errorp(%106) : (i64) -> i64
    %109 = arith.cmpi ne, %108, %107 : i64
    %110 = scf.if %109 -> (i64) {
      scf.yield %106 : i64
    } else {
      %198 = llvm.mlir.addressof @str9 : !llvm.ptr
      %199 = arith.constant 30 : i64
      %200 = func.call @cc_make_symbol(%198, %199) : (!llvm.ptr, i64) -> i64
      %201 = func.call @cc_persistent_root_value(%200) : (i64) -> i64
      func.call @stack_push_pointer(%201) : (i64) -> ()
      %202 = arith.constant 274034180751360 : i64
      %203 = arith.constant 1 : i64
      %204 = func.call @cc_make_closure(%202, %203) : (i64, i64) -> i64
      func.call @stack_push_pointer(%204) : (i64) -> ()
      %205 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%105) : (i64) -> ()
      %206 = func.call @stack_pop_pointer() : () -> i64
      %207 = func.call @cc_nil_value() : () -> i64
      %208 = func.call @cc_errorp(%205) : (i64) -> i64
      %209 = arith.cmpi ne, %208, %207 : i64
      %210 = arith.cmpi eq, %207, %207 : i64
      %211 = arith.andi %209, %210 : i1
      %212 = scf.if %211 -> (i64) {
        scf.yield %205 : i64
      } else {
        scf.yield %207 : i64
      }
      %213 = func.call @cc_errorp(%206) : (i64) -> i64
      %214 = arith.cmpi ne, %213, %207 : i64
      %215 = arith.cmpi eq, %212, %207 : i64
      %216 = arith.andi %214, %215 : i1
      %217 = scf.if %216 -> (i64) {
        scf.yield %206 : i64
      } else {
        scf.yield %212 : i64
      }
      %218 = arith.cmpi ne, %217, %207 : i64
      scf.if %218 {
        func.call @stack_push_pointer(%217) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%205) : (i64) -> ()
        func.call @stack_push_pointer(%206) : (i64) -> ()
        %219 = llvm.mlir.addressof @str10 : !llvm.ptr
        %220 = func.call @cc_make_function_ref_const(%219) : (!llvm.ptr) -> i64
        %221 = arith.constant 2 : i64
        func.call @cc_funcall_stack(%220, %221) : (i64, i64) -> ()
      }
      %222 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %222 : i64
    }
    func.call @stack_push_pointer(%110) : (i64) -> ()
    %223 = func.call @stack_pop_pointer() : () -> i64
    %224 = func.call @cc_nil_value() : () -> i64
    %225 = func.call @cc_nil_value() : () -> i64
    %226 = func.call @cc_errorp(%224) : (i64) -> i64
    %227 = arith.cmpi ne, %226, %225 : i64
    %228 = scf.if %227 -> (i64) {
      scf.yield %224 : i64
    } else {
      func.call @stack_push_pointer(%223) : (i64) -> ()
      %229 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      %230 = func.call @stack_pop_pointer() : () -> i64
      %231 = func.call @cc_car(%230) : (i64) -> i64
      func.call @stack_push_pointer(%231) : (i64) -> ()
      %232 = llvm.mlir.addressof @str11 : !llvm.ptr
      %233 = arith.constant 12 : i64
      %234 = func.call @cc_make_string(%232, %233) : (!llvm.ptr, i64) -> i64
      %235 = llvm.mlir.addressof @str12 : !llvm.ptr
      %236 = arith.constant 11 : i64
      %237 = func.call @cc_make_string(%235, %236) : (!llvm.ptr, i64) -> i64
      %238 = func.call @cc_intern(%234, %237) : (i64, i64) -> i64
      %239 = func.call @cc_nil_value() : () -> i64
      %240 = func.call @cc_cons(%238, %239) : (i64, i64) -> i64
      %241 = func.call @cc_values_pack(%240) : (i64) -> i64
      func.call @stack_push_pointer(%238) : (i64) -> ()
      %242 = func.call @stack_pop_pointer() : () -> i64
      %243 = func.call @stack_pop_pointer() : () -> i64
      %244 = func.call @cc_typep(%243, %242) : (i64, i64) -> i64
      func.call @stack_push_pointer(%244) : (i64) -> ()
      %245 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      %246 = func.call @stack_pop_pointer() : () -> i64
      %247 = func.call @cc_nil_value() : () -> i64
      %248 = func.call @cc_errorp(%246) : (i64) -> i64
      %249 = arith.cmpi ne, %248, %247 : i64
      %250 = arith.cmpi eq, %247, %247 : i64
      %251 = arith.andi %249, %250 : i1
      %252 = scf.if %251 -> (i64) {
        scf.yield %246 : i64
      } else {
        scf.yield %247 : i64
      }
      %253 = arith.cmpi ne, %252, %247 : i64
      scf.if %253 {
        func.call @stack_push_pointer(%252) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%246) : (i64) -> ()
        %254 = llvm.mlir.addressof @str13 : !llvm.ptr
        %255 = func.call @cc_make_function_ref_const(%254) : (!llvm.ptr) -> i64
        %256 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%255, %256) : (i64, i64) -> ()
      }
      %257 = llvm.mlir.addressof @str14 : !llvm.ptr
      %258 = arith.constant 12 : i64
      %259 = func.call @cc_make_string(%257, %258) : (!llvm.ptr, i64) -> i64
      %260 = llvm.mlir.addressof @str15 : !llvm.ptr
      %261 = arith.constant 11 : i64
      %262 = func.call @cc_make_string(%260, %261) : (!llvm.ptr, i64) -> i64
      %263 = func.call @cc_intern(%259, %262) : (i64, i64) -> i64
      %264 = func.call @cc_nil_value() : () -> i64
      %265 = func.call @cc_cons(%263, %264) : (i64, i64) -> i64
      %266 = func.call @cc_values_pack(%265) : (i64) -> i64
      func.call @stack_push_pointer(%263) : (i64) -> ()
      %267 = func.call @stack_pop_pointer() : () -> i64
      %268 = func.call @stack_pop_pointer() : () -> i64
      %269 = func.call @cc_typep(%268, %267) : (i64, i64) -> i64
      func.call @stack_push_pointer(%269) : (i64) -> ()
      %270 = func.call @stack_pop_pointer() : () -> i64
      %271 = func.call @cc_nil_value() : () -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      %272 = func.call @stack_pop_pointer() : () -> i64
      %273 = func.call @cc_car(%272) : (i64) -> i64
      func.call @stack_push_pointer(%273) : (i64) -> ()
      %274 = llvm.mlir.addressof @str16 : !llvm.ptr
      %275 = arith.constant 12 : i64
      %276 = func.call @cc_make_string(%274, %275) : (!llvm.ptr, i64) -> i64
      %277 = llvm.mlir.addressof @str17 : !llvm.ptr
      %278 = arith.constant 11 : i64
      %279 = func.call @cc_make_string(%277, %278) : (!llvm.ptr, i64) -> i64
      %280 = func.call @cc_intern(%276, %279) : (i64, i64) -> i64
      %281 = func.call @cc_nil_value() : () -> i64
      %282 = func.call @cc_cons(%280, %281) : (i64, i64) -> i64
      %283 = func.call @cc_values_pack(%282) : (i64) -> i64
      func.call @stack_push_pointer(%280) : (i64) -> ()
      %284 = func.call @stack_pop_pointer() : () -> i64
      %285 = func.call @stack_pop_pointer() : () -> i64
      %286 = func.call @cc_typep(%285, %284) : (i64, i64) -> i64
      func.call @stack_push_pointer(%286) : (i64) -> ()
      %287 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%223) : (i64) -> ()
      %288 = func.call @stack_pop_pointer() : () -> i64
      %289 = func.call @cc_nil_value() : () -> i64
      %290 = func.call @cc_errorp(%288) : (i64) -> i64
      %291 = arith.cmpi ne, %290, %289 : i64
      %292 = arith.cmpi eq, %289, %289 : i64
      %293 = arith.andi %291, %292 : i1
      %294 = scf.if %293 -> (i64) {
        scf.yield %288 : i64
      } else {
        scf.yield %289 : i64
      }
      %295 = arith.cmpi ne, %294, %289 : i64
      scf.if %295 {
        func.call @stack_push_pointer(%294) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%288) : (i64) -> ()
        %296 = llvm.mlir.addressof @str18 : !llvm.ptr
        %297 = func.call @cc_make_function_ref_const(%296) : (!llvm.ptr) -> i64
        %298 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%297, %298) : (i64, i64) -> ()
      }
      %299 = llvm.mlir.addressof @str19 : !llvm.ptr
      %300 = arith.constant 12 : i64
      %301 = func.call @cc_make_string(%299, %300) : (!llvm.ptr, i64) -> i64
      %302 = llvm.mlir.addressof @str20 : !llvm.ptr
      %303 = arith.constant 11 : i64
      %304 = func.call @cc_make_string(%302, %303) : (!llvm.ptr, i64) -> i64
      %305 = func.call @cc_intern(%301, %304) : (i64, i64) -> i64
      %306 = func.call @cc_nil_value() : () -> i64
      %307 = func.call @cc_cons(%305, %306) : (i64, i64) -> i64
      %308 = func.call @cc_values_pack(%307) : (i64) -> i64
      func.call @stack_push_pointer(%305) : (i64) -> ()
      %309 = func.call @stack_pop_pointer() : () -> i64
      %310 = func.call @stack_pop_pointer() : () -> i64
      %311 = func.call @cc_typep(%310, %309) : (i64, i64) -> i64
      func.call @stack_push_pointer(%311) : (i64) -> ()
      %312 = func.call @stack_pop_pointer() : () -> i64
      %313 = func.call @cc_cons(%312, %271) : (i64, i64) -> i64
      %314 = func.call @cc_cons(%287, %313) : (i64, i64) -> i64
      %315 = func.call @cc_and(%314) : (i64) -> i64
      func.call @stack_push_pointer(%315) : (i64) -> ()
      %316 = func.call @stack_pop_pointer() : () -> i64
      %317 = func.call @cc_nil_value() : () -> i64
      %318 = func.call @cc_errorp(%229) : (i64) -> i64
      %319 = arith.cmpi ne, %318, %317 : i64
      %320 = arith.cmpi eq, %317, %317 : i64
      %321 = arith.andi %319, %320 : i1
      %322 = scf.if %321 -> (i64) {
        scf.yield %229 : i64
      } else {
        scf.yield %317 : i64
      }
      %323 = func.call @cc_errorp(%245) : (i64) -> i64
      %324 = arith.cmpi ne, %323, %317 : i64
      %325 = arith.cmpi eq, %322, %317 : i64
      %326 = arith.andi %324, %325 : i1
      %327 = scf.if %326 -> (i64) {
        scf.yield %245 : i64
      } else {
        scf.yield %322 : i64
      }
      %328 = func.call @cc_errorp(%270) : (i64) -> i64
      %329 = arith.cmpi ne, %328, %317 : i64
      %330 = arith.cmpi eq, %327, %317 : i64
      %331 = arith.andi %329, %330 : i1
      %332 = scf.if %331 -> (i64) {
        scf.yield %270 : i64
      } else {
        scf.yield %327 : i64
      }
      %333 = func.call @cc_errorp(%316) : (i64) -> i64
      %334 = arith.cmpi ne, %333, %317 : i64
      %335 = arith.cmpi eq, %332, %317 : i64
      %336 = arith.andi %334, %335 : i1
      %337 = scf.if %336 -> (i64) {
        scf.yield %316 : i64
      } else {
        scf.yield %332 : i64
      }
      %338 = arith.cmpi ne, %337, %317 : i64
      scf.if %338 {
        func.call @stack_push_pointer(%337) : (i64) -> ()
      } else {
        %339 = func.call @cc_nil_value() : () -> i64
        func.call @stack_push_pointer(%339) : (i64) -> ()
        func.call @stack_push_pointer(%316) : (i64) -> ()
        %340 = func.call @stack_pop_pointer() : () -> i64
        %341 = func.call @stack_pop_pointer() : () -> i64
        %342 = func.call @cc_cons(%340, %341) : (i64, i64) -> i64
        func.call @stack_push_pointer(%342) : (i64) -> ()
        func.call @stack_push_pointer(%270) : (i64) -> ()
        %343 = func.call @stack_pop_pointer() : () -> i64
        %344 = func.call @stack_pop_pointer() : () -> i64
        %345 = func.call @cc_cons(%343, %344) : (i64, i64) -> i64
        func.call @stack_push_pointer(%345) : (i64) -> ()
        func.call @stack_push_pointer(%245) : (i64) -> ()
        %346 = func.call @stack_pop_pointer() : () -> i64
        %347 = func.call @stack_pop_pointer() : () -> i64
        %348 = func.call @cc_cons(%346, %347) : (i64, i64) -> i64
        func.call @stack_push_pointer(%348) : (i64) -> ()
        func.call @stack_push_pointer(%229) : (i64) -> ()
        %349 = func.call @stack_pop_pointer() : () -> i64
        %350 = func.call @stack_pop_pointer() : () -> i64
        %351 = func.call @cc_cons(%349, %350) : (i64, i64) -> i64
        func.call @stack_push_pointer(%351) : (i64) -> ()
      }
      %352 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %352 : i64
    }
    func.call @stack_push_pointer(%228) : (i64) -> ()
    %353 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%9) : (i64) -> ()
    func.call @stack_push_pointer(%13) : (i64) -> ()
    func.call @stack_push_pointer(%353) : (i64) -> ()
    %354 = llvm.mlir.addressof @str21 : !llvm.ptr
    %355 = func.call @cc_make_function_ref_const(%354) : (!llvm.ptr) -> i64
    %356 = arith.constant 3 : i64
    func.call @cc_funcall_stack(%355, %356) : (i64, i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__lambda_274034180751360"() {
    %111 = func.call @stack_pop_pointer() : () -> i64
    %112 = func.call @stack_pop_pointer() : () -> i64
    %113 = func.call @cc_nil_value() : () -> i64
    %114 = func.call @cc_nil_value() : () -> i64
    %115 = func.call @cc_errorp(%113) : (i64) -> i64
    %116 = arith.cmpi ne, %115, %114 : i64
    %117 = scf.if %116 -> (i64) {
      scf.yield %113 : i64
    } else {
      func.call @stack_push_nil() : () -> ()
      %118 = func.call @stack_pop_pointer() : () -> i64
      %119 = func.call @cc_nil_value() : () -> i64
      %120 = func.call @cc_errorp(%118) : (i64) -> i64
      %121 = arith.cmpi ne, %120, %119 : i64
      %122 = arith.cmpi eq, %119, %119 : i64
      %123 = arith.andi %121, %122 : i1
      %124 = scf.if %123 -> (i64) {
        scf.yield %118 : i64
      } else {
        scf.yield %119 : i64
      }
      %125 = arith.cmpi ne, %124, %119 : i64
      scf.if %125 {
        func.call @stack_push_pointer(%124) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%118) : (i64) -> ()
        %126 = llvm.mlir.addressof @str2 : !llvm.ptr
        %127 = func.call @cc_make_function_ref_const(%126) : (!llvm.ptr) -> i64
        %128 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%127, %128) : (i64, i64) -> ()
      }
      %129 = func.call @stack_pop_pointer() : () -> i64
      %130 = llvm.mlir.addressof @str3 : !llvm.ptr
      %131 = arith.constant 23 : i64
      %132 = func.call @cc_make_symbol(%130, %131) : (!llvm.ptr, i64) -> i64
      %133 = func.call @cc_symbol_value(%132) : (i64) -> i64
      %134 = func.call @cc_set_symbol_value(%132, %129) : (i64, i64) -> i64
      %135 = func.call @cc_nil_value() : () -> i64
      %136 = func.call @cc_nil_value() : () -> i64
      %137 = func.call @cc_errorp(%135) : (i64) -> i64
      %138 = arith.cmpi ne, %137, %136 : i64
      %139 = scf.if %138 -> (i64) {
        scf.yield %135 : i64
      } else {
        %140 = llvm.mlir.addressof @str4 : !llvm.ptr
        %141 = arith.constant 6 : i64
        %142 = func.call @cc_make_string(%140, %141) : (!llvm.ptr, i64) -> i64
        %143 = llvm.mlir.addressof @str5 : !llvm.ptr
        %144 = arith.constant 11 : i64
        %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
        %146 = func.call @cc_intern(%142, %145) : (i64, i64) -> i64
        %147 = func.call @cc_nil_value() : () -> i64
        %148 = func.call @cc_cons(%146, %147) : (i64, i64) -> i64
        %149 = func.call @cc_values_pack(%148) : (i64) -> i64
        func.call @stack_push_pointer(%146) : (i64) -> ()
        %150 = func.call @stack_pop_pointer() : () -> i64
        %151 = func.call @cc_nil_value() : () -> i64
        %152 = llvm.mlir.addressof @str6 : !llvm.ptr
        %153 = arith.constant 1 : i64
        %154 = func.call @cc_make_string(%152, %153) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%154) : (i64) -> ()
        %155 = func.call @stack_pop_pointer() : () -> i64
        %156 = func.call @cc_cons(%155, %151) : (i64, i64) -> i64
        func.call @stack_push_pointer(%111) : (i64) -> ()
        %157 = func.call @stack_pop_pointer() : () -> i64
        %158 = func.call @cc_string(%157) : (i64) -> i64
        func.call @stack_push_pointer(%158) : (i64) -> ()
        %159 = func.call @stack_pop_pointer() : () -> i64
        %160 = func.call @cc_cons(%159, %156) : (i64, i64) -> i64
        %161 = func.call @cc_concatenate(%150, %160) : (i64, i64) -> i64
        func.call @stack_push_pointer(%161) : (i64) -> ()
        %162 = func.call @stack_pop_pointer() : () -> i64
        %163 = func.call @cc_nil_value() : () -> i64
        %164 = func.call @cc_errorp(%162) : (i64) -> i64
        %165 = arith.cmpi ne, %164, %163 : i64
        %166 = arith.cmpi eq, %163, %163 : i64
        %167 = arith.andi %165, %166 : i1
        %168 = scf.if %167 -> (i64) {
          scf.yield %162 : i64
        } else {
          scf.yield %163 : i64
        }
        %169 = arith.cmpi ne, %168, %163 : i64
        scf.if %169 {
          func.call @stack_push_pointer(%168) : (i64) -> ()
        } else {
          %170 = func.call @cc_nil_value() : () -> i64
          %171 = func.call @cc_cons(%162, %170) : (i64, i64) -> i64
          func.call @stack_push_pointer(%171) : (i64) -> ()
          func.call @cc_read_from_string_stack() : () -> ()
        }
        %172 = func.call @stack_pop_pointer() : () -> i64
        %173 = func.call @cc_errorp(%172) : (i64) -> i64
        %174 = func.call @cc_nil_value() : () -> i64
        %175 = arith.cmpi ne, %173, %174 : i64
        %176 = scf.if %175 -> (i64) {
          %177 = func.call @cc_condition_value(%172) : (i64) -> i64
          %178 = llvm.mlir.addressof @str7 : !llvm.ptr
          %179 = arith.constant 12 : i64
          %180 = func.call @cc_make_string(%178, %179) : (!llvm.ptr, i64) -> i64
          %181 = llvm.mlir.addressof @str8 : !llvm.ptr
          %182 = arith.constant 11 : i64
          %183 = func.call @cc_make_string(%181, %182) : (!llvm.ptr, i64) -> i64
          %184 = func.call @cc_intern(%180, %183) : (i64, i64) -> i64
          %185 = func.call @cc_nil_value() : () -> i64
          %186 = func.call @cc_cons(%184, %185) : (i64, i64) -> i64
          %187 = func.call @cc_values_pack(%186) : (i64) -> i64
          func.call @stack_push_pointer(%184) : (i64) -> ()
          %188 = func.call @stack_pop_pointer() : () -> i64
          %189 = func.call @cc_typep(%177, %188) : (i64, i64) -> i64
          %190 = func.call @cc_nil_value() : () -> i64
          %191 = arith.cmpi ne, %189, %190 : i64
          %192 = scf.if %191 -> (i64) {
            func.call @stack_push_pointer(%177) : (i64) -> ()
            %193 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %193 : i64
          } else {
            scf.yield %172 : i64
          }
          scf.yield %192 : i64
        } else {
          scf.yield %172 : i64
        }
        func.call @stack_push_pointer(%176) : (i64) -> ()
        %194 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %194 : i64
      }
      func.call @stack_push_pointer(%139) : (i64) -> ()
      %195 = func.call @cc_set_symbol_value(%132, %133) : (i64, i64) -> i64
      %196 = func.call @stack_pop_pointer() : () -> i64
      func.call @stack_push_pointer(%196) : (i64) -> ()
      %197 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %197 : i64
    }
    func.call @stack_push_pointer(%117) : (i64) -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("trait=~S~%\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str2("COPY-READTABLE\00") : !llvm.array<15 x i8>
  llvm.mlir.global private constant @str3("COMMON-LISP:*READTABLE*\00") : !llvm.array<24 x i8>
  llvm.mlir.global private constant @str4("STRING\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str5("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str6("Z\00") : !llvm.array<2 x i8>
  llvm.mlir.global private constant @str7("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str8("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str9("#:%%DYN-CELL-274034180751361-E\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str10("MAPCAR\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str11("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str12("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str13("EIGHTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str14("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str15("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str17("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str18("EIGHTH\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str19("READER-ERROR\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str20("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str21("FORMAT\00") : !llvm.array<7 x i8>
}
