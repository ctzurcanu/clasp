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
  func.func @"%FN%boole$"() {
    %0 = func.call @stack_pop_pointer() : () -> i64
    %1 = func.call @stack_pop_pointer() : () -> i64
    %2 = func.call @stack_pop_pointer() : () -> i64
    %3 = llvm.mlir.addressof @str0 : !llvm.ptr
    %4 = arith.constant 6 : i64
    %5 = func.call @cc_make_string(%3, %4) : (!llvm.ptr, i64) -> i64
    %6 = func.call @cc_nil_value() : () -> i64
    %7 = func.call @cc_intern(%5, %6) : (i64, i64) -> i64
    %8 = func.call @cc_nil_value() : () -> i64
    %9 = func.call @cc_cons(%7, %8) : (i64, i64) -> i64
    %10 = func.call @cc_values_pack(%9) : (i64) -> i64
    %11 = llvm.mlir.addressof @str1 : !llvm.ptr
    %12 = arith.constant 8 : i64
    %13 = func.call @cc_make_string(%11, %12) : (!llvm.ptr, i64) -> i64
    %14 = func.call @cc_register_function_lambda_list_metadata_raw(%7, %13) : (i64, i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%7) : (i64) -> ()
    %15 = func.call @cc_nil_value() : () -> i64
    %16 = llvm.mlir.addressof @str2 : !llvm.ptr
    %17 = arith.constant 38 : i64
    %18 = func.call @cc_make_symbol(%16, %17) : (!llvm.ptr, i64) -> i64
    %19 = func.call @cc_set_symbol_value(%18, %15) : (i64, i64) -> i64
    %20 = llvm.mlir.addressof @str3 : !llvm.ptr
    %21 = arith.constant 39 : i64
    %22 = func.call @cc_make_symbol(%20, %21) : (!llvm.ptr, i64) -> i64
    %23 = func.call @cc_set_symbol_value(%22, %15) : (i64, i64) -> i64
    %24 = llvm.mlir.addressof @str4 : !llvm.ptr
    %25 = arith.constant 40 : i64
    %26 = func.call @cc_make_symbol(%24, %25) : (!llvm.ptr, i64) -> i64
    %27 = func.call @cc_set_symbol_value(%26, %15) : (i64, i64) -> i64
    func.call @stack_push_nil() : () -> ()
    %28 = func.call @stack_pop_pointer() : () -> i64
    %29 = llvm.mlir.addressof @str5 : !llvm.ptr
    %30 = arith.constant 13 : i64
    %31 = func.call @cc_make_string(%29, %30) : (!llvm.ptr, i64) -> i64
    %32 = llvm.mlir.addressof @str6 : !llvm.ptr
    %33 = arith.constant 13 : i64
    %34 = func.call @cc_make_string(%32, %33) : (!llvm.ptr, i64) -> i64
    %35 = func.call @cc_intern(%31, %34) : (i64, i64) -> i64
    %36 = func.call @cc_nil_value() : () -> i64
    %37 = func.call @cc_cons(%35, %36) : (i64, i64) -> i64
    %38 = func.call @cc_values_pack(%37) : (i64) -> i64
    %39 = func.call @cc_symbol_value(%35) : (i64) -> i64
    func.call @stack_push_pointer(%39) : (i64) -> ()
    func.call @stack_push_pointer(%2) : (i64) -> ()
    %40 = func.call @stack_pop_pointer() : () -> i64
    %41 = func.call @stack_pop_pointer() : () -> i64
    %42 = func.call @cc_aref(%41, %40) : (i64, i64) -> i64
    func.call @stack_push_pointer(%42) : (i64) -> ()
    %43 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%1) : (i64) -> ()
    %44 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%0) : (i64) -> ()
    %45 = func.call @stack_pop_pointer() : () -> i64
    %46 = func.call @cc_nil_value() : () -> i64
    %47 = func.call @cc_errorp(%43) : (i64) -> i64
    %48 = arith.cmpi ne, %47, %46 : i64
    %49 = arith.cmpi eq, %46, %46 : i64
    %50 = arith.andi %48, %49 : i1
    %51 = scf.if %50 -> (i64) {
      scf.yield %43 : i64
    } else {
      scf.yield %46 : i64
    }
    %52 = func.call @cc_errorp(%44) : (i64) -> i64
    %53 = arith.cmpi ne, %52, %46 : i64
    %54 = arith.cmpi eq, %51, %46 : i64
    %55 = arith.andi %53, %54 : i1
    %56 = scf.if %55 -> (i64) {
      scf.yield %44 : i64
    } else {
      scf.yield %51 : i64
    }
    %57 = func.call @cc_errorp(%45) : (i64) -> i64
    %58 = arith.cmpi ne, %57, %46 : i64
    %59 = arith.cmpi eq, %56, %46 : i64
    %60 = arith.andi %58, %59 : i1
    %61 = scf.if %60 -> (i64) {
      scf.yield %45 : i64
    } else {
      scf.yield %56 : i64
    }
    %62 = arith.cmpi ne, %61, %46 : i64
    scf.if %62 {
      func.call @stack_push_pointer(%61) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%43) : (i64) -> ()
      func.call @stack_push_pointer(%44) : (i64) -> ()
      func.call @stack_push_pointer(%45) : (i64) -> ()
      %63 = llvm.mlir.addressof @str7 : !llvm.ptr
      %64 = func.call @cc_make_function_ref_const(%63) : (!llvm.ptr) -> i64
      %65 = arith.constant 3 : i64
      func.call @cc_funcall_stack(%64, %65) : (i64, i64) -> ()
    }
    %66 = func.call @stack_pop_pointer() : () -> i64
    %67 = func.call @cc_multiple_value_list(%66) : (i64) -> i64
    %68 = llvm.mlir.addressof @str8 : !llvm.ptr
    %69 = arith.constant 38 : i64
    %70 = func.call @cc_make_symbol(%68, %69) : (!llvm.ptr, i64) -> i64
    %71 = func.call @cc_symbol_value(%70) : (i64) -> i64
    %72 = llvm.mlir.addressof @str9 : !llvm.ptr
    %73 = arith.constant 39 : i64
    %74 = func.call @cc_make_symbol(%72, %73) : (!llvm.ptr, i64) -> i64
    %75 = func.call @cc_symbol_value(%74) : (i64) -> i64
    %76 = llvm.mlir.addressof @str10 : !llvm.ptr
    %77 = arith.constant 40 : i64
    %78 = func.call @cc_make_symbol(%76, %77) : (!llvm.ptr, i64) -> i64
    %79 = func.call @cc_symbol_value(%78) : (i64) -> i64
    %80 = func.call @cc_nil_value() : () -> i64
    %81 = arith.cmpi ne, %71, %80 : i64
    %82 = scf.if %81 -> (i64) {
      scf.yield %79 : i64
    } else {
      scf.yield %67 : i64
    }
    %83 = func.call @cc_values_pack(%82) : (i64) -> i64
    func.call @stack_push_pointer(%83) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  func.func @"__main"() {
    %84 = llvm.mlir.addressof @str11 : !llvm.ptr
    %85 = arith.constant 6 : i64
    %86 = func.call @cc_make_string(%84, %85) : (!llvm.ptr, i64) -> i64
    %87 = func.call @cc_nil_value() : () -> i64
    %88 = func.call @cc_intern(%86, %87) : (i64, i64) -> i64
    %89 = func.call @cc_nil_value() : () -> i64
    %90 = func.call @cc_cons(%88, %89) : (i64, i64) -> i64
    %91 = func.call @cc_values_pack(%90) : (i64) -> i64
    func.call @cc_runtime_debug_stack_push_name(%88) : (i64) -> ()
    %92 = func.call @cc_nil_value() : () -> i64
    %93 = func.call @cc_nil_value() : () -> i64
    %94 = func.call @cc_errorp(%92) : (i64) -> i64
    %95 = arith.cmpi ne, %94, %93 : i64
    %96 = scf.if %95 -> (i64) {
      scf.yield %92 : i64
    } else {
      %97 = func.call @cc_nil_value() : () -> i64
      %98 = func.call @cc_nil_value() : () -> i64
      %99 = func.call @cc_errorp(%97) : (i64) -> i64
      %100 = arith.cmpi ne, %99, %98 : i64
      %101 = scf.if %100 -> (i64) {
        scf.yield %97 : i64
      } else {
        %102 = llvm.mlir.addressof @str12 : !llvm.ptr
        %103 = arith.constant 13 : i64
        %104 = func.call @cc_make_string(%102, %103) : (!llvm.ptr, i64) -> i64
        %105 = func.call @cc_nil_value() : () -> i64
        %106 = func.call @cc_intern(%104, %105) : (i64, i64) -> i64
        %107 = func.call @cc_nil_value() : () -> i64
        %108 = func.call @cc_cons(%106, %107) : (i64, i64) -> i64
        %109 = func.call @cc_values_pack(%108) : (i64) -> i64
        func.call @stack_push_pointer(%106) : (i64) -> ()
        %110 = func.call @stack_pop_pointer() : () -> i64
        %111 = func.call @cc_nil_value() : () -> i64
        %112 = func.call @cc_errorp(%110) : (i64) -> i64
        %113 = arith.cmpi ne, %112, %111 : i64
        %114 = arith.cmpi eq, %111, %111 : i64
        %115 = arith.andi %113, %114 : i1
        %116 = scf.if %115 -> (i64) {
          scf.yield %110 : i64
        } else {
          scf.yield %111 : i64
        }
        %117 = arith.cmpi ne, %116, %111 : i64
        scf.if %117 {
          func.call @stack_push_pointer(%116) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%110) : (i64) -> ()
          %118 = llvm.mlir.addressof @str13 : !llvm.ptr
          %119 = func.call @cc_make_function_ref_const(%118) : (!llvm.ptr) -> i64
          %120 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%119, %120) : (i64, i64) -> ()
        }
        %121 = func.call @stack_pop_pointer() : () -> i64
        %122 = func.call @cc_nil_value() : () -> i64
        %123 = arith.cmpi ne, %121, %122 : i64
        scf.if %123 {
          %124 = llvm.mlir.addressof @str14 : !llvm.ptr
          %125 = arith.constant 13 : i64
          %126 = func.call @cc_make_string(%124, %125) : (!llvm.ptr, i64) -> i64
          %127 = func.call @cc_nil_value() : () -> i64
          %128 = func.call @cc_intern(%126, %127) : (i64, i64) -> i64
          %129 = func.call @cc_nil_value() : () -> i64
          %130 = func.call @cc_cons(%128, %129) : (i64, i64) -> i64
          %131 = func.call @cc_values_pack(%130) : (i64) -> i64
          func.call @stack_push_pointer(%128) : (i64) -> ()
          %132 = func.call @stack_pop_pointer() : () -> i64
          %133 = func.call @cc_nil_value() : () -> i64
          %134 = func.call @cc_errorp(%132) : (i64) -> i64
          %135 = arith.cmpi ne, %134, %133 : i64
          %136 = arith.cmpi eq, %133, %133 : i64
          %137 = arith.andi %135, %136 : i1
          %138 = scf.if %137 -> (i64) {
            scf.yield %132 : i64
          } else {
            scf.yield %133 : i64
          }
          %139 = arith.cmpi ne, %138, %133 : i64
          scf.if %139 {
            func.call @stack_push_pointer(%138) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%132) : (i64) -> ()
            %140 = llvm.mlir.addressof @str15 : !llvm.ptr
            %141 = func.call @cc_make_function_ref_const(%140) : (!llvm.ptr) -> i64
            %142 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%141, %142) : (i64, i64) -> ()
          }
        } else {
          %143 = llvm.mlir.addressof @str16 : !llvm.ptr
          %144 = arith.constant 13 : i64
          %145 = func.call @cc_make_string(%143, %144) : (!llvm.ptr, i64) -> i64
          %146 = func.call @cc_nil_value() : () -> i64
          %147 = func.call @cc_intern(%145, %146) : (i64, i64) -> i64
          %148 = func.call @cc_nil_value() : () -> i64
          %149 = func.call @cc_cons(%147, %148) : (i64, i64) -> i64
          %150 = func.call @cc_values_pack(%149) : (i64) -> i64
          func.call @stack_push_pointer(%147) : (i64) -> ()
          %151 = func.call @stack_pop_pointer() : () -> i64
          %152 = func.call @cc_nil_value() : () -> i64
          %153 = func.call @cc_errorp(%151) : (i64) -> i64
          %154 = arith.cmpi ne, %153, %152 : i64
          %155 = arith.cmpi eq, %152, %152 : i64
          %156 = arith.andi %154, %155 : i1
          %157 = scf.if %156 -> (i64) {
            scf.yield %151 : i64
          } else {
            scf.yield %152 : i64
          }
          %158 = arith.cmpi ne, %157, %152 : i64
          scf.if %158 {
            func.call @stack_push_pointer(%157) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%151) : (i64) -> ()
            %159 = llvm.mlir.addressof @str17 : !llvm.ptr
            %160 = func.call @cc_make_function_ref_const(%159) : (!llvm.ptr) -> i64
            %161 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%160, %161) : (i64, i64) -> ()
          }
        }
        %162 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %162 : i64
      }
      %163 = func.call @cc_nil_value() : () -> i64
      %164 = func.call @cc_errorp(%101) : (i64) -> i64
      %165 = arith.cmpi ne, %164, %163 : i64
      %166 = scf.if %165 -> (i64) {
        scf.yield %101 : i64
      } else {
        %167 = llvm.mlir.addressof @str18 : !llvm.ptr
        %168 = arith.constant 2 : i64
        %169 = func.call @cc_make_string(%167, %168) : (!llvm.ptr, i64) -> i64
        %170 = llvm.mlir.addressof @str19 : !llvm.ptr
        %171 = arith.constant 7 : i64
        %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
        %173 = func.call @cc_intern(%169, %172) : (i64, i64) -> i64
        %174 = func.call @cc_nil_value() : () -> i64
        %175 = func.call @cc_cons(%173, %174) : (i64, i64) -> i64
        %176 = func.call @cc_values_pack(%175) : (i64) -> i64
        func.call @stack_push_pointer(%173) : (i64) -> ()
        %177 = func.call @stack_pop_pointer() : () -> i64
        %178 = llvm.mlir.addressof @str20 : !llvm.ptr
        %179 = arith.constant 13 : i64
        %180 = func.call @cc_make_string(%178, %179) : (!llvm.ptr, i64) -> i64
        %181 = func.call @cc_nil_value() : () -> i64
        %182 = func.call @cc_intern(%180, %181) : (i64, i64) -> i64
        %183 = func.call @cc_nil_value() : () -> i64
        %184 = func.call @cc_cons(%182, %183) : (i64, i64) -> i64
        %185 = func.call @cc_values_pack(%184) : (i64) -> i64
        func.call @stack_push_pointer(%182) : (i64) -> ()
        %186 = func.call @stack_pop_pointer() : () -> i64
        %187 = func.call @cc_nil_value() : () -> i64
        %188 = func.call @cc_errorp(%177) : (i64) -> i64
        %189 = arith.cmpi ne, %188, %187 : i64
        %190 = arith.cmpi eq, %187, %187 : i64
        %191 = arith.andi %189, %190 : i1
        %192 = scf.if %191 -> (i64) {
          scf.yield %177 : i64
        } else {
          scf.yield %187 : i64
        }
        %193 = func.call @cc_errorp(%186) : (i64) -> i64
        %194 = arith.cmpi ne, %193, %187 : i64
        %195 = arith.cmpi eq, %192, %187 : i64
        %196 = arith.andi %194, %195 : i1
        %197 = scf.if %196 -> (i64) {
          scf.yield %186 : i64
        } else {
          scf.yield %192 : i64
        }
        %198 = arith.cmpi ne, %197, %187 : i64
        scf.if %198 {
          func.call @stack_push_pointer(%197) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%177) : (i64) -> ()
          func.call @stack_push_pointer(%186) : (i64) -> ()
          %199 = llvm.mlir.addressof @str21 : !llvm.ptr
          %200 = func.call @cc_make_function_ref_const(%199) : (!llvm.ptr) -> i64
          %201 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%200, %201) : (i64, i64) -> ()
        }
        %202 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %202 : i64
      }
      %203 = func.call @cc_nil_value() : () -> i64
      %204 = func.call @cc_errorp(%166) : (i64) -> i64
      %205 = arith.cmpi ne, %204, %203 : i64
      %206 = scf.if %205 -> (i64) {
        scf.yield %166 : i64
      } else {
        %207 = llvm.mlir.addressof @str22 : !llvm.ptr
        %208 = arith.constant 13 : i64
        %209 = func.call @cc_make_string(%207, %208) : (!llvm.ptr, i64) -> i64
        %210 = func.call @cc_nil_value() : () -> i64
        %211 = func.call @cc_intern(%209, %210) : (i64, i64) -> i64
        %212 = func.call @cc_nil_value() : () -> i64
        %213 = func.call @cc_cons(%211, %212) : (i64, i64) -> i64
        %214 = func.call @cc_values_pack(%213) : (i64) -> i64
        func.call @stack_push_pointer(%211) : (i64) -> ()
        %215 = func.call @stack_pop_pointer() : () -> i64
        %216 = func.call @cc_nil_value() : () -> i64
        %217 = func.call @cc_errorp(%215) : (i64) -> i64
        %218 = arith.cmpi ne, %217, %216 : i64
        %219 = arith.cmpi eq, %216, %216 : i64
        %220 = arith.andi %218, %219 : i1
        %221 = scf.if %220 -> (i64) {
          scf.yield %215 : i64
        } else {
          scf.yield %216 : i64
        }
        %222 = arith.cmpi ne, %221, %216 : i64
        scf.if %222 {
          func.call @stack_push_pointer(%221) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%215) : (i64) -> ()
          %223 = llvm.mlir.addressof @str23 : !llvm.ptr
          %224 = func.call @cc_make_function_ref_const(%223) : (!llvm.ptr) -> i64
          %225 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%224, %225) : (i64, i64) -> ()
        }
        %226 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %226 : i64
      }
      func.call @stack_push_pointer(%206) : (i64) -> ()
      %227 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %227 : i64
    }
    %228 = func.call @cc_nil_value() : () -> i64
    %229 = func.call @cc_errorp(%96) : (i64) -> i64
    %230 = arith.cmpi ne, %229, %228 : i64
    %231 = scf.if %230 -> (i64) {
      scf.yield %96 : i64
    } else {
      %232 = llvm.mlir.addressof @str24 : !llvm.ptr
      %233 = arith.constant 13 : i64
      %234 = func.call @cc_make_string(%232, %233) : (!llvm.ptr, i64) -> i64
      %235 = llvm.mlir.addressof @str25 : !llvm.ptr
      %236 = arith.constant 7 : i64
      %237 = func.call @cc_make_string(%235, %236) : (!llvm.ptr, i64) -> i64
      %238 = func.call @cc_intern(%234, %237) : (i64, i64) -> i64
      %239 = func.call @cc_nil_value() : () -> i64
      %240 = func.call @cc_cons(%238, %239) : (i64, i64) -> i64
      %241 = func.call @cc_values_pack(%240) : (i64) -> i64
      func.call @stack_push_pointer(%238) : (i64) -> ()
      %242 = func.call @stack_pop_pointer() : () -> i64
      %243 = func.call @cc_in_package(%242) : (i64) -> i64
      func.call @stack_push_pointer(%243) : (i64) -> ()
      %244 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %244 : i64
    }
    %245 = func.call @cc_nil_value() : () -> i64
    %246 = func.call @cc_errorp(%231) : (i64) -> i64
    %247 = arith.cmpi ne, %246, %245 : i64
    %248 = scf.if %247 -> (i64) {
      scf.yield %231 : i64
    } else {
      %249 = llvm.mlir.addressof @str26 : !llvm.ptr
      %250 = arith.constant 13 : i64
      %251 = func.call @cc_make_string(%249, %250) : (!llvm.ptr, i64) -> i64
      %252 = llvm.mlir.addressof @str27 : !llvm.ptr
      %253 = arith.constant 13 : i64
      %254 = func.call @cc_make_string(%252, %253) : (!llvm.ptr, i64) -> i64
      %255 = func.call @cc_intern(%251, %254) : (i64, i64) -> i64
      %256 = func.call @cc_nil_value() : () -> i64
      %257 = func.call @cc_cons(%255, %256) : (i64, i64) -> i64
      %258 = func.call @cc_values_pack(%257) : (i64) -> i64
      func.call @stack_push_pointer(%255) : (i64) -> ()
      %259 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %259 : i64
    }
    %260 = func.call @cc_nil_value() : () -> i64
    %261 = func.call @cc_errorp(%248) : (i64) -> i64
    %262 = arith.cmpi ne, %261, %260 : i64
    %263 = scf.if %262 -> (i64) {
      scf.yield %248 : i64
    } else {
      %264 = llvm.mlir.addressof @str28 : !llvm.ptr
      %265 = func.call @cc_make_function_ref_const(%264) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%265) : (i64) -> ()
      %266 = func.call @stack_pop_pointer() : () -> i64
      %267 = llvm.mlir.addressof @str29 : !llvm.ptr
      %268 = arith.constant 6 : i64
      %269 = func.call @cc_make_string(%267, %268) : (!llvm.ptr, i64) -> i64
      %270 = llvm.mlir.addressof @str30 : !llvm.ptr
      %271 = arith.constant 17 : i64
      %272 = func.call @cc_make_string(%270, %271) : (!llvm.ptr, i64) -> i64
      %273 = func.call @cc_intern(%269, %272) : (i64, i64) -> i64
      %274 = func.call @cc_nil_value() : () -> i64
      %275 = func.call @cc_cons(%273, %274) : (i64, i64) -> i64
      %276 = func.call @cc_values_pack(%275) : (i64) -> i64
      %277 = func.call @cc_set_symbol_value(%273, %266) : (i64, i64) -> i64
      func.call @stack_push_pointer(%266) : (i64) -> ()
      %278 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %278 : i64
    }
    %279 = func.call @cc_nil_value() : () -> i64
    %280 = func.call @cc_errorp(%263) : (i64) -> i64
    %281 = arith.cmpi ne, %280, %279 : i64
    %282 = scf.if %281 -> (i64) {
      scf.yield %263 : i64
    } else {
      %283 = llvm.mlir.addressof @str31 : !llvm.ptr
      %284 = func.call @cc_make_function_ref_const(%283) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%284) : (i64) -> ()
      %285 = func.call @stack_pop_pointer() : () -> i64
      %286 = llvm.mlir.addressof @str32 : !llvm.ptr
      %287 = arith.constant 6 : i64
      %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
      %289 = llvm.mlir.addressof @str33 : !llvm.ptr
      %290 = arith.constant 17 : i64
      %291 = func.call @cc_make_string(%289, %290) : (!llvm.ptr, i64) -> i64
      %292 = func.call @cc_intern(%288, %291) : (i64, i64) -> i64
      %293 = func.call @cc_nil_value() : () -> i64
      %294 = func.call @cc_cons(%292, %293) : (i64, i64) -> i64
      %295 = func.call @cc_values_pack(%294) : (i64) -> i64
      %296 = func.call @cc_set_symbol_value(%292, %285) : (i64, i64) -> i64
      func.call @stack_push_pointer(%285) : (i64) -> ()
      %297 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %297 : i64
    }
    %298 = func.call @cc_nil_value() : () -> i64
    %299 = func.call @cc_errorp(%282) : (i64) -> i64
    %300 = arith.cmpi ne, %299, %298 : i64
    %301 = scf.if %300 -> (i64) {
      scf.yield %282 : i64
    } else {
      %302 = llvm.mlir.addressof @str34 : !llvm.ptr
      %303 = func.call @cc_make_function_ref_const(%302) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%303) : (i64) -> ()
      %304 = func.call @stack_pop_pointer() : () -> i64
      %305 = llvm.mlir.addressof @str35 : !llvm.ptr
      %306 = arith.constant 6 : i64
      %307 = func.call @cc_make_string(%305, %306) : (!llvm.ptr, i64) -> i64
      %308 = llvm.mlir.addressof @str36 : !llvm.ptr
      %309 = arith.constant 17 : i64
      %310 = func.call @cc_make_string(%308, %309) : (!llvm.ptr, i64) -> i64
      %311 = func.call @cc_intern(%307, %310) : (i64, i64) -> i64
      %312 = func.call @cc_nil_value() : () -> i64
      %313 = func.call @cc_cons(%311, %312) : (i64, i64) -> i64
      %314 = func.call @cc_values_pack(%313) : (i64) -> i64
      %315 = func.call @cc_set_symbol_value(%311, %304) : (i64, i64) -> i64
      func.call @stack_push_pointer(%304) : (i64) -> ()
      %316 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %316 : i64
    }
    %317 = func.call @cc_nil_value() : () -> i64
    %318 = func.call @cc_errorp(%301) : (i64) -> i64
    %319 = arith.cmpi ne, %318, %317 : i64
    %320 = scf.if %319 -> (i64) {
      scf.yield %301 : i64
    } else {
      %321 = llvm.mlir.addressof @str37 : !llvm.ptr
      %322 = func.call @cc_make_function_ref_const(%321) : (!llvm.ptr) -> i64
      func.call @stack_push_pointer(%322) : (i64) -> ()
      %323 = func.call @stack_pop_pointer() : () -> i64
      %324 = llvm.mlir.addressof @str38 : !llvm.ptr
      %325 = arith.constant 6 : i64
      %326 = func.call @cc_make_string(%324, %325) : (!llvm.ptr, i64) -> i64
      %327 = llvm.mlir.addressof @str39 : !llvm.ptr
      %328 = arith.constant 17 : i64
      %329 = func.call @cc_make_string(%327, %328) : (!llvm.ptr, i64) -> i64
      %330 = func.call @cc_intern(%326, %329) : (i64, i64) -> i64
      %331 = func.call @cc_nil_value() : () -> i64
      %332 = func.call @cc_cons(%330, %331) : (i64, i64) -> i64
      %333 = func.call @cc_values_pack(%332) : (i64) -> i64
      %334 = func.call @cc_set_symbol_value(%330, %323) : (i64, i64) -> i64
      func.call @stack_push_pointer(%323) : (i64) -> ()
      %335 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %335 : i64
    }
    func.call @stack_push_pointer(%320) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("op\0Ai1\0Ai2\00") : !llvm.array<9 x i8>
  llvm.mlir.global private constant @str2("*__MLIR_BLOCK_RETFLAG_239118244118528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str3("*__MLIR_BLOCK_RETVALUE_239118244118528*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str4("*__MLIR_BLOCK_RETMVLIST_239118244118528*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str5("*BOOLE-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str6("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str7("BOOLE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str8("*__MLIR_BLOCK_RETFLAG_239118244118528*\00") : !llvm.array<39 x i8>
  llvm.mlir.global private constant @str9("*__MLIR_BLOCK_RETVALUE_239118244118528*\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str10("*__MLIR_BLOCK_RETMVLIST_239118244118528*\00") : !llvm.array<41 x i8>
  llvm.mlir.global private constant @str11("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str12("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str13("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str14("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str15("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str16("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str17("make-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str18("CL\00") : !llvm.array<3 x i8>
  llvm.mlir.global private constant @str19("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str20("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str21("use-package\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str22("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str23("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str24("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str25("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str26("*BOOLE-ARRAY*\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str27("ENCODING-TEST\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str28("%FN%boole$\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str29("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str30("%FN%ENCODING-TEST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str31("%FN%boole$\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str32("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str33("%FN%ENCODING-TEST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str34("%FN%boole$\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str35("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str36("%FN%ENCODING-TEST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str37("%FN%boole$\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str38("BOOLE$\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str39("%FN%ENCODING-TEST\00") : !llvm.array<18 x i8>
}
