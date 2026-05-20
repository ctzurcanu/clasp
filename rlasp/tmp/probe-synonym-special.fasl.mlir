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
      %16 = func.call @cc_nil_value() : () -> i64
      %17 = func.call @cc_intern(%15, %16) : (i64, i64) -> i64
      %18 = func.call @cc_nil_value() : () -> i64
      %19 = func.call @cc_cons(%17, %18) : (i64, i64) -> i64
      %20 = func.call @cc_values_pack(%19) : (i64) -> i64
      func.call @stack_push_pointer(%17) : (i64) -> ()
      %21 = func.call @stack_pop_pointer() : () -> i64
      %22 = func.call @cc_in_package(%21) : (i64) -> i64
      func.call @stack_push_pointer(%22) : (i64) -> ()
      %23 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %23 : i64
    }
    %24 = func.call @cc_nil_value() : () -> i64
    %25 = func.call @cc_errorp(%12) : (i64) -> i64
    %26 = arith.cmpi ne, %25, %24 : i64
    %27 = scf.if %26 -> (i64) {
      scf.yield %12 : i64
    } else {
      %28 = llvm.mlir.addressof @str2 : !llvm.ptr
      %29 = arith.constant 21 : i64
      %30 = func.call @cc_make_string(%28, %29) : (!llvm.ptr, i64) -> i64
      func.call @stack_push_pointer(%30) : (i64) -> ()
      %31 = func.call @stack_pop_pointer() : () -> i64
      %32 = func.call @cc_nil_value() : () -> i64
      %33 = func.call @cc_errorp(%31) : (i64) -> i64
      %34 = arith.cmpi ne, %33, %32 : i64
      %35 = arith.cmpi eq, %32, %32 : i64
      %36 = arith.andi %34, %35 : i1
      %37 = scf.if %36 -> (i64) {
        scf.yield %31 : i64
      } else {
        scf.yield %32 : i64
      }
      %38 = arith.cmpi ne, %37, %32 : i64
      scf.if %38 {
        func.call @stack_push_pointer(%37) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%31) : (i64) -> ()
        %39 = llvm.mlir.addressof @str3 : !llvm.ptr
        %40 = func.call @cc_make_function_ref_const(%39) : (!llvm.ptr) -> i64
        %41 = arith.constant 1 : i64
        func.call @cc_funcall_stack(%40, %41) : (i64, i64) -> ()
      }
      %42 = func.call @stack_pop_pointer() : () -> i64
      %43 = func.call @cc_nil_value() : () -> i64
      %44 = func.call @cc_nil_value() : () -> i64
      %45 = func.call @cc_errorp(%43) : (i64) -> i64
      %46 = arith.cmpi ne, %45, %44 : i64
      %47 = scf.if %46 -> (i64) {
        scf.yield %43 : i64
      } else {
        %48 = func.call @cc_nil_value() : () -> i64
        %49 = func.call @cc_nil_value() : () -> i64
        %50 = func.call @cc_errorp(%48) : (i64) -> i64
        %51 = arith.cmpi ne, %50, %49 : i64
        %52 = scf.if %51 -> (i64) {
          scf.yield %48 : i64
        } else {
          func.call @stack_push_pointer(%42) : (i64) -> ()
          %53 = func.call @stack_pop_pointer() : () -> i64
          %54 = llvm.mlir.addressof @str4 : !llvm.ptr
          %55 = arith.constant 17 : i64
          %56 = func.call @cc_make_string(%54, %55) : (!llvm.ptr, i64) -> i64
          %57 = llvm.mlir.addressof @str5 : !llvm.ptr
          %58 = arith.constant 7 : i64
          %59 = func.call @cc_make_string(%57, %58) : (!llvm.ptr, i64) -> i64
          %60 = func.call @cc_intern(%56, %59) : (i64, i64) -> i64
          %61 = func.call @cc_nil_value() : () -> i64
          %62 = func.call @cc_cons(%60, %61) : (i64, i64) -> i64
          %63 = func.call @cc_values_pack(%62) : (i64) -> i64
          func.call @stack_push_pointer(%60) : (i64) -> ()
          %64 = func.call @stack_pop_pointer() : () -> i64
          %65 = llvm.mlir.addressof @str6 : !llvm.ptr
          %66 = arith.constant 6 : i64
          %67 = func.call @cc_make_string(%65, %66) : (!llvm.ptr, i64) -> i64
          %68 = llvm.mlir.addressof @str7 : !llvm.ptr
          %69 = arith.constant 7 : i64
          %70 = func.call @cc_make_string(%68, %69) : (!llvm.ptr, i64) -> i64
          %71 = func.call @cc_intern(%67, %70) : (i64, i64) -> i64
          %72 = func.call @cc_nil_value() : () -> i64
          %73 = func.call @cc_cons(%71, %72) : (i64, i64) -> i64
          %74 = func.call @cc_values_pack(%73) : (i64) -> i64
          func.call @stack_push_pointer(%71) : (i64) -> ()
          %75 = func.call @stack_pop_pointer() : () -> i64
          %76 = llvm.mlir.addressof @str8 : !llvm.ptr
          %77 = arith.constant 9 : i64
          %78 = func.call @cc_make_string(%76, %77) : (!llvm.ptr, i64) -> i64
          %79 = llvm.mlir.addressof @str9 : !llvm.ptr
          %80 = arith.constant 7 : i64
          %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
          %82 = func.call @cc_intern(%78, %81) : (i64, i64) -> i64
          %83 = func.call @cc_nil_value() : () -> i64
          %84 = func.call @cc_cons(%82, %83) : (i64, i64) -> i64
          %85 = func.call @cc_values_pack(%84) : (i64) -> i64
          func.call @stack_push_pointer(%82) : (i64) -> ()
          %86 = func.call @stack_pop_pointer() : () -> i64
          %87 = llvm.mlir.addressof @str10 : !llvm.ptr
          %88 = arith.constant 9 : i64
          %89 = func.call @cc_make_string(%87, %88) : (!llvm.ptr, i64) -> i64
          %90 = llvm.mlir.addressof @str11 : !llvm.ptr
          %91 = arith.constant 7 : i64
          %92 = func.call @cc_make_string(%90, %91) : (!llvm.ptr, i64) -> i64
          %93 = func.call @cc_intern(%89, %92) : (i64, i64) -> i64
          %94 = func.call @cc_nil_value() : () -> i64
          %95 = func.call @cc_cons(%93, %94) : (i64, i64) -> i64
          %96 = func.call @cc_values_pack(%95) : (i64) -> i64
          func.call @stack_push_pointer(%93) : (i64) -> ()
          %97 = func.call @stack_pop_pointer() : () -> i64
          %98 = llvm.mlir.addressof @str12 : !llvm.ptr
          %99 = arith.constant 9 : i64
          %100 = func.call @cc_make_string(%98, %99) : (!llvm.ptr, i64) -> i64
          %101 = llvm.mlir.addressof @str13 : !llvm.ptr
          %102 = arith.constant 7 : i64
          %103 = func.call @cc_make_string(%101, %102) : (!llvm.ptr, i64) -> i64
          %104 = func.call @cc_intern(%100, %103) : (i64, i64) -> i64
          %105 = func.call @cc_nil_value() : () -> i64
          %106 = func.call @cc_cons(%104, %105) : (i64, i64) -> i64
          %107 = func.call @cc_values_pack(%106) : (i64) -> i64
          func.call @stack_push_pointer(%104) : (i64) -> ()
          %108 = func.call @stack_pop_pointer() : () -> i64
          %109 = llvm.mlir.addressof @str14 : !llvm.ptr
          %110 = arith.constant 6 : i64
          %111 = func.call @cc_make_string(%109, %110) : (!llvm.ptr, i64) -> i64
          %112 = llvm.mlir.addressof @str15 : !llvm.ptr
          %113 = arith.constant 7 : i64
          %114 = func.call @cc_make_string(%112, %113) : (!llvm.ptr, i64) -> i64
          %115 = func.call @cc_intern(%111, %114) : (i64, i64) -> i64
          %116 = func.call @cc_nil_value() : () -> i64
          %117 = func.call @cc_cons(%115, %116) : (i64, i64) -> i64
          %118 = func.call @cc_values_pack(%117) : (i64) -> i64
          func.call @stack_push_pointer(%115) : (i64) -> ()
          %119 = func.call @stack_pop_pointer() : () -> i64
          %120 = llvm.mlir.addressof @str16 : !llvm.ptr
          %121 = arith.constant 12 : i64
          %122 = func.call @cc_make_string(%120, %121) : (!llvm.ptr, i64) -> i64
          %123 = llvm.mlir.addressof @str17 : !llvm.ptr
          %124 = arith.constant 7 : i64
          %125 = func.call @cc_make_string(%123, %124) : (!llvm.ptr, i64) -> i64
          %126 = func.call @cc_intern(%122, %125) : (i64, i64) -> i64
          %127 = func.call @cc_nil_value() : () -> i64
          %128 = func.call @cc_cons(%126, %127) : (i64, i64) -> i64
          %129 = func.call @cc_values_pack(%128) : (i64) -> i64
          func.call @stack_push_pointer(%126) : (i64) -> ()
          %130 = func.call @stack_pop_pointer() : () -> i64
          %131 = llvm.mlir.addressof @str18 : !llvm.ptr
          %132 = arith.constant 13 : i64
          %133 = func.call @cc_make_string(%131, %132) : (!llvm.ptr, i64) -> i64
          %134 = llvm.mlir.addressof @str19 : !llvm.ptr
          %135 = arith.constant 11 : i64
          %136 = func.call @cc_make_string(%134, %135) : (!llvm.ptr, i64) -> i64
          %137 = func.call @cc_intern(%133, %136) : (i64, i64) -> i64
          %138 = func.call @cc_nil_value() : () -> i64
          %139 = func.call @cc_cons(%137, %138) : (i64, i64) -> i64
          %140 = func.call @cc_values_pack(%139) : (i64) -> i64
          func.call @stack_push_pointer(%137) : (i64) -> ()
          %141 = arith.constant 8 : i64
          func.call @stack_push_fixnum(%141) : (i64) -> ()
          func.call @stack_push_nil() : () -> ()
          %142 = func.call @stack_pop_pointer() : () -> i64
          %143 = func.call @stack_pop_pointer() : () -> i64
          %144 = func.call @cc_cons(%143, %142) : (i64, i64) -> i64
          func.call @stack_push_pointer(%144) : (i64) -> ()
          %145 = func.call @stack_pop_pointer() : () -> i64
          %146 = func.call @stack_pop_pointer() : () -> i64
          %147 = func.call @cc_cons(%146, %145) : (i64, i64) -> i64
          func.call @stack_push_pointer(%147) : (i64) -> ()
          %148 = func.call @stack_pop_pointer() : () -> i64
          %149 = func.call @cc_nil_value() : () -> i64
          %150 = func.call @cc_errorp(%53) : (i64) -> i64
          %151 = arith.cmpi ne, %150, %149 : i64
          %152 = arith.cmpi eq, %149, %149 : i64
          %153 = arith.andi %151, %152 : i1
          %154 = scf.if %153 -> (i64) {
            scf.yield %53 : i64
          } else {
            scf.yield %149 : i64
          }
          %155 = func.call @cc_errorp(%64) : (i64) -> i64
          %156 = arith.cmpi ne, %155, %149 : i64
          %157 = arith.cmpi eq, %154, %149 : i64
          %158 = arith.andi %156, %157 : i1
          %159 = scf.if %158 -> (i64) {
            scf.yield %64 : i64
          } else {
            scf.yield %154 : i64
          }
          %160 = func.call @cc_errorp(%75) : (i64) -> i64
          %161 = arith.cmpi ne, %160, %149 : i64
          %162 = arith.cmpi eq, %159, %149 : i64
          %163 = arith.andi %161, %162 : i1
          %164 = scf.if %163 -> (i64) {
            scf.yield %75 : i64
          } else {
            scf.yield %159 : i64
          }
          %165 = func.call @cc_errorp(%86) : (i64) -> i64
          %166 = arith.cmpi ne, %165, %149 : i64
          %167 = arith.cmpi eq, %164, %149 : i64
          %168 = arith.andi %166, %167 : i1
          %169 = scf.if %168 -> (i64) {
            scf.yield %86 : i64
          } else {
            scf.yield %164 : i64
          }
          %170 = func.call @cc_errorp(%97) : (i64) -> i64
          %171 = arith.cmpi ne, %170, %149 : i64
          %172 = arith.cmpi eq, %169, %149 : i64
          %173 = arith.andi %171, %172 : i1
          %174 = scf.if %173 -> (i64) {
            scf.yield %97 : i64
          } else {
            scf.yield %169 : i64
          }
          %175 = func.call @cc_errorp(%108) : (i64) -> i64
          %176 = arith.cmpi ne, %175, %149 : i64
          %177 = arith.cmpi eq, %174, %149 : i64
          %178 = arith.andi %176, %177 : i1
          %179 = scf.if %178 -> (i64) {
            scf.yield %108 : i64
          } else {
            scf.yield %174 : i64
          }
          %180 = func.call @cc_errorp(%119) : (i64) -> i64
          %181 = arith.cmpi ne, %180, %149 : i64
          %182 = arith.cmpi eq, %179, %149 : i64
          %183 = arith.andi %181, %182 : i1
          %184 = scf.if %183 -> (i64) {
            scf.yield %119 : i64
          } else {
            scf.yield %179 : i64
          }
          %185 = func.call @cc_errorp(%130) : (i64) -> i64
          %186 = arith.cmpi ne, %185, %149 : i64
          %187 = arith.cmpi eq, %184, %149 : i64
          %188 = arith.andi %186, %187 : i1
          %189 = scf.if %188 -> (i64) {
            scf.yield %130 : i64
          } else {
            scf.yield %184 : i64
          }
          %190 = func.call @cc_errorp(%148) : (i64) -> i64
          %191 = arith.cmpi ne, %190, %149 : i64
          %192 = arith.cmpi eq, %189, %149 : i64
          %193 = arith.andi %191, %192 : i1
          %194 = scf.if %193 -> (i64) {
            scf.yield %148 : i64
          } else {
            scf.yield %189 : i64
          }
          %195 = arith.cmpi ne, %194, %149 : i64
          scf.if %195 {
            func.call @stack_push_pointer(%194) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%53) : (i64) -> ()
            func.call @stack_push_pointer(%64) : (i64) -> ()
            func.call @stack_push_pointer(%75) : (i64) -> ()
            func.call @stack_push_pointer(%86) : (i64) -> ()
            func.call @stack_push_pointer(%97) : (i64) -> ()
            func.call @stack_push_pointer(%108) : (i64) -> ()
            func.call @stack_push_pointer(%119) : (i64) -> ()
            func.call @stack_push_pointer(%130) : (i64) -> ()
            func.call @stack_push_pointer(%148) : (i64) -> ()
            %196 = llvm.mlir.addressof @str20 : !llvm.ptr
            %197 = func.call @cc_make_function_ref_const(%196) : (!llvm.ptr) -> i64
            %198 = arith.constant 9 : i64
            func.call @cc_funcall_stack(%197, %198) : (i64, i64) -> ()
          }
          %199 = func.call @stack_pop_pointer() : () -> i64
          %200 = llvm.mlir.addressof @str21 : !llvm.ptr
          %201 = arith.constant 6 : i64
          %202 = func.call @cc_make_symbol(%200, %201) : (!llvm.ptr, i64) -> i64
          %203 = func.call @cc_symbol_value(%202) : (i64) -> i64
          %204 = func.call @cc_set_symbol_value(%202, %199) : (i64, i64) -> i64
          %205 = func.call @cc_nil_value() : () -> i64
          %206 = func.call @cc_nil_value() : () -> i64
          %207 = func.call @cc_errorp(%205) : (i64) -> i64
          %208 = arith.cmpi ne, %207, %206 : i64
          %209 = scf.if %208 -> (i64) {
            scf.yield %205 : i64
          } else {
            %210 = func.call @cc_nil_value() : () -> i64
            %211 = func.call @cc_nil_value() : () -> i64
            %212 = func.call @cc_errorp(%210) : (i64) -> i64
            %213 = arith.cmpi ne, %212, %211 : i64
            %214 = scf.if %213 -> (i64) {
              scf.yield %210 : i64
            } else {
              %215 = func.call @cc_t_value() : () -> i64
              func.call @stack_push_pointer(%215) : (i64) -> ()
              %216 = func.call @stack_pop_pointer() : () -> i64
              %217 = llvm.mlir.addressof @str22 : !llvm.ptr
              %218 = arith.constant 30 : i64
              %219 = func.call @cc_make_string(%217, %218) : (!llvm.ptr, i64) -> i64
              func.call @stack_push_pointer(%219) : (i64) -> ()
              %220 = func.call @stack_pop_pointer() : () -> i64
              %221 = llvm.mlir.addressof @str23 : !llvm.ptr
              %222 = arith.constant 6 : i64
              %223 = func.call @cc_make_string(%221, %222) : (!llvm.ptr, i64) -> i64
              %224 = func.call @cc_nil_value() : () -> i64
              %225 = func.call @cc_intern(%223, %224) : (i64, i64) -> i64
              %226 = func.call @cc_nil_value() : () -> i64
              %227 = func.call @cc_cons(%225, %226) : (i64, i64) -> i64
              %228 = func.call @cc_values_pack(%227) : (i64) -> i64
              func.call @stack_push_pointer(%225) : (i64) -> ()
              %229 = func.call @stack_pop_pointer() : () -> i64
              %230 = func.call @cc_nil_value() : () -> i64
              %231 = func.call @cc_errorp(%229) : (i64) -> i64
              %232 = arith.cmpi ne, %231, %230 : i64
              %233 = arith.cmpi eq, %230, %230 : i64
              %234 = arith.andi %232, %233 : i1
              %235 = scf.if %234 -> (i64) {
                scf.yield %229 : i64
              } else {
                scf.yield %230 : i64
              }
              %236 = arith.cmpi ne, %235, %230 : i64
              scf.if %236 {
                func.call @stack_push_pointer(%235) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%229) : (i64) -> ()
                %237 = llvm.mlir.addressof @str24 : !llvm.ptr
                %238 = func.call @cc_make_function_ref_const(%237) : (!llvm.ptr) -> i64
                %239 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%238, %239) : (i64, i64) -> ()
              }
              %240 = func.call @stack_pop_pointer() : () -> i64
              %241 = llvm.mlir.addressof @str25 : !llvm.ptr
              %242 = arith.constant 6 : i64
              %243 = func.call @cc_make_string(%241, %242) : (!llvm.ptr, i64) -> i64
              %244 = func.call @cc_nil_value() : () -> i64
              %245 = func.call @cc_intern(%243, %244) : (i64, i64) -> i64
              %246 = func.call @cc_nil_value() : () -> i64
              %247 = func.call @cc_cons(%245, %246) : (i64, i64) -> i64
              %248 = func.call @cc_values_pack(%247) : (i64) -> i64
              func.call @stack_push_pointer(%245) : (i64) -> ()
              %249 = func.call @stack_pop_pointer() : () -> i64
              %250 = func.call @cc_symbol_value(%249) : (i64) -> i64
              func.call @stack_push_pointer(%250) : (i64) -> ()
              %251 = func.call @stack_pop_pointer() : () -> i64
              %252 = llvm.mlir.addressof @str26 : !llvm.ptr
              %253 = arith.constant 6 : i64
              %254 = func.call @cc_make_string(%252, %253) : (!llvm.ptr, i64) -> i64
              %255 = func.call @cc_nil_value() : () -> i64
              %256 = func.call @cc_intern(%254, %255) : (i64, i64) -> i64
              %257 = func.call @cc_nil_value() : () -> i64
              %258 = func.call @cc_cons(%256, %257) : (i64, i64) -> i64
              %259 = func.call @cc_values_pack(%258) : (i64) -> i64
              func.call @stack_push_pointer(%256) : (i64) -> ()
              %260 = func.call @stack_pop_pointer() : () -> i64
              %261 = func.call @cc_nil_value() : () -> i64
              %262 = func.call @cc_errorp(%260) : (i64) -> i64
              %263 = arith.cmpi ne, %262, %261 : i64
              %264 = arith.cmpi eq, %261, %261 : i64
              %265 = arith.andi %263, %264 : i1
              %266 = scf.if %265 -> (i64) {
                scf.yield %260 : i64
              } else {
                scf.yield %261 : i64
              }
              %267 = arith.cmpi ne, %266, %261 : i64
              scf.if %267 {
                func.call @stack_push_pointer(%266) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%260) : (i64) -> ()
                %268 = llvm.mlir.addressof @str27 : !llvm.ptr
                %269 = func.call @cc_make_function_ref_const(%268) : (!llvm.ptr) -> i64
                %270 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%269, %270) : (i64, i64) -> ()
              }
              %271 = func.call @stack_pop_pointer() : () -> i64
              func.call @stack_push_pointer(%216) : (i64) -> ()
              func.call @stack_push_pointer(%220) : (i64) -> ()
              func.call @stack_push_pointer(%240) : (i64) -> ()
              func.call @stack_push_pointer(%251) : (i64) -> ()
              func.call @stack_push_pointer(%271) : (i64) -> ()
              %272 = llvm.mlir.addressof @str28 : !llvm.ptr
              %273 = func.call @cc_make_function_ref_const(%272) : (!llvm.ptr) -> i64
              %274 = arith.constant 5 : i64
              func.call @cc_funcall_stack(%273, %274) : (i64, i64) -> ()
              %275 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %275 : i64
            }
            %276 = func.call @cc_nil_value() : () -> i64
            %277 = func.call @cc_errorp(%214) : (i64) -> i64
            %278 = arith.cmpi ne, %277, %276 : i64
            %279 = scf.if %278 -> (i64) {
              scf.yield %214 : i64
            } else {
              %280 = arith.constant 33 : i64
              func.call @stack_push_fixnum(%280) : (i64) -> ()
              %281 = func.call @stack_pop_pointer() : () -> i64
              %282 = llvm.mlir.addressof @str29 : !llvm.ptr
              %283 = arith.constant 6 : i64
              %284 = func.call @cc_make_string(%282, %283) : (!llvm.ptr, i64) -> i64
              %285 = func.call @cc_nil_value() : () -> i64
              %286 = func.call @cc_intern(%284, %285) : (i64, i64) -> i64
              %287 = func.call @cc_nil_value() : () -> i64
              %288 = func.call @cc_cons(%286, %287) : (i64, i64) -> i64
              %289 = func.call @cc_values_pack(%288) : (i64) -> i64
              func.call @stack_push_pointer(%286) : (i64) -> ()
              %290 = func.call @stack_pop_pointer() : () -> i64
              %291 = func.call @cc_nil_value() : () -> i64
              %292 = func.call @cc_errorp(%290) : (i64) -> i64
              %293 = arith.cmpi ne, %292, %291 : i64
              %294 = arith.cmpi eq, %291, %291 : i64
              %295 = arith.andi %293, %294 : i1
              %296 = scf.if %295 -> (i64) {
                scf.yield %290 : i64
              } else {
                scf.yield %291 : i64
              }
              %297 = arith.cmpi ne, %296, %291 : i64
              scf.if %297 {
                func.call @stack_push_pointer(%296) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%290) : (i64) -> ()
                %298 = llvm.mlir.addressof @str30 : !llvm.ptr
                %299 = func.call @cc_make_function_ref_const(%298) : (!llvm.ptr) -> i64
                %300 = arith.constant 1 : i64
                func.call @cc_funcall_stack(%299, %300) : (i64, i64) -> ()
              }
              %301 = func.call @stack_pop_pointer() : () -> i64
              %302 = func.call @cc_nil_value() : () -> i64
              %303 = func.call @cc_errorp(%281) : (i64) -> i64
              %304 = arith.cmpi ne, %303, %302 : i64
              %305 = arith.cmpi eq, %302, %302 : i64
              %306 = arith.andi %304, %305 : i1
              %307 = scf.if %306 -> (i64) {
                scf.yield %281 : i64
              } else {
                scf.yield %302 : i64
              }
              %308 = func.call @cc_errorp(%301) : (i64) -> i64
              %309 = arith.cmpi ne, %308, %302 : i64
              %310 = arith.cmpi eq, %307, %302 : i64
              %311 = arith.andi %309, %310 : i1
              %312 = scf.if %311 -> (i64) {
                scf.yield %301 : i64
              } else {
                scf.yield %307 : i64
              }
              %313 = arith.cmpi ne, %312, %302 : i64
              scf.if %313 {
                func.call @stack_push_pointer(%312) : (i64) -> ()
              } else {
                func.call @stack_push_pointer(%281) : (i64) -> ()
                func.call @stack_push_pointer(%301) : (i64) -> ()
                %314 = llvm.mlir.addressof @str31 : !llvm.ptr
                %315 = func.call @cc_make_function_ref_const(%314) : (!llvm.ptr) -> i64
                %316 = arith.constant 2 : i64
                func.call @cc_funcall_stack(%315, %316) : (i64, i64) -> ()
              }
              %317 = func.call @stack_pop_pointer() : () -> i64
              scf.yield %317 : i64
            }
            func.call @stack_push_pointer(%279) : (i64) -> ()
            %318 = func.call @stack_pop_pointer() : () -> i64
            %319 = func.call @cc_multiple_value_list(%318) : (i64) -> i64
            %320 = llvm.mlir.addressof @str32 : !llvm.ptr
            %321 = arith.constant 6 : i64
            %322 = func.call @cc_make_string(%320, %321) : (!llvm.ptr, i64) -> i64
            %323 = func.call @cc_nil_value() : () -> i64
            %324 = func.call @cc_intern(%322, %323) : (i64, i64) -> i64
            %325 = func.call @cc_nil_value() : () -> i64
            %326 = func.call @cc_cons(%324, %325) : (i64, i64) -> i64
            %327 = func.call @cc_values_pack(%326) : (i64) -> i64
            %328 = func.call @cc_symbol_value(%324) : (i64) -> i64
            func.call @stack_push_pointer(%328) : (i64) -> ()
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
              %337 = llvm.mlir.addressof @str33 : !llvm.ptr
              %338 = func.call @cc_make_function_ref_const(%337) : (!llvm.ptr) -> i64
              %339 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%338, %339) : (i64, i64) -> ()
            }
            %340 = func.call @stack_depth() : () -> i64
            %341 = arith.constant 0 : i64
            %342 = arith.cmpi sgt, %340, %341 : i64
            scf.if %342 {
              %343 = func.call @stack_pop_pointer() : () -> i64
            }
            %344 = func.call @cc_values_pack(%319) : (i64) -> i64
            func.call @stack_push_pointer(%344) : (i64) -> ()
            %345 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %345 : i64
          }
          func.call @stack_push_pointer(%209) : (i64) -> ()
          %346 = func.call @cc_set_symbol_value(%202, %203) : (i64, i64) -> i64
          %347 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %347 : i64
        }
        %348 = func.call @cc_nil_value() : () -> i64
        %349 = func.call @cc_errorp(%52) : (i64) -> i64
        %350 = arith.cmpi ne, %349, %348 : i64
        %351 = scf.if %350 -> (i64) {
          scf.yield %52 : i64
        } else {
          func.call @stack_push_pointer(%42) : (i64) -> ()
          %352 = func.call @stack_pop_pointer() : () -> i64
          %353 = llvm.mlir.addressof @str34 : !llvm.ptr
          %354 = arith.constant 9 : i64
          %355 = func.call @cc_make_string(%353, %354) : (!llvm.ptr, i64) -> i64
          %356 = llvm.mlir.addressof @str35 : !llvm.ptr
          %357 = arith.constant 7 : i64
          %358 = func.call @cc_make_string(%356, %357) : (!llvm.ptr, i64) -> i64
          %359 = func.call @cc_intern(%355, %358) : (i64, i64) -> i64
          %360 = func.call @cc_nil_value() : () -> i64
          %361 = func.call @cc_cons(%359, %360) : (i64, i64) -> i64
          %362 = func.call @cc_values_pack(%361) : (i64) -> i64
          func.call @stack_push_pointer(%359) : (i64) -> ()
          %363 = func.call @stack_pop_pointer() : () -> i64
          %364 = llvm.mlir.addressof @str36 : !llvm.ptr
          %365 = arith.constant 5 : i64
          %366 = func.call @cc_make_string(%364, %365) : (!llvm.ptr, i64) -> i64
          %367 = llvm.mlir.addressof @str37 : !llvm.ptr
          %368 = arith.constant 7 : i64
          %369 = func.call @cc_make_string(%367, %368) : (!llvm.ptr, i64) -> i64
          %370 = func.call @cc_intern(%366, %369) : (i64, i64) -> i64
          %371 = func.call @cc_nil_value() : () -> i64
          %372 = func.call @cc_cons(%370, %371) : (i64, i64) -> i64
          %373 = func.call @cc_values_pack(%372) : (i64) -> i64
          func.call @stack_push_pointer(%370) : (i64) -> ()
          %374 = func.call @stack_pop_pointer() : () -> i64
          %375 = llvm.mlir.addressof @str38 : !llvm.ptr
          %376 = arith.constant 12 : i64
          %377 = func.call @cc_make_string(%375, %376) : (!llvm.ptr, i64) -> i64
          %378 = llvm.mlir.addressof @str39 : !llvm.ptr
          %379 = arith.constant 7 : i64
          %380 = func.call @cc_make_string(%378, %379) : (!llvm.ptr, i64) -> i64
          %381 = func.call @cc_intern(%377, %380) : (i64, i64) -> i64
          %382 = func.call @cc_nil_value() : () -> i64
          %383 = func.call @cc_cons(%381, %382) : (i64, i64) -> i64
          %384 = func.call @cc_values_pack(%383) : (i64) -> i64
          func.call @stack_push_pointer(%381) : (i64) -> ()
          %385 = func.call @stack_pop_pointer() : () -> i64
          %386 = llvm.mlir.addressof @str40 : !llvm.ptr
          %387 = arith.constant 13 : i64
          %388 = func.call @cc_make_string(%386, %387) : (!llvm.ptr, i64) -> i64
          %389 = llvm.mlir.addressof @str41 : !llvm.ptr
          %390 = arith.constant 11 : i64
          %391 = func.call @cc_make_string(%389, %390) : (!llvm.ptr, i64) -> i64
          %392 = func.call @cc_intern(%388, %391) : (i64, i64) -> i64
          %393 = func.call @cc_nil_value() : () -> i64
          %394 = func.call @cc_cons(%392, %393) : (i64, i64) -> i64
          %395 = func.call @cc_values_pack(%394) : (i64) -> i64
          func.call @stack_push_pointer(%392) : (i64) -> ()
          %396 = arith.constant 8 : i64
          func.call @stack_push_fixnum(%396) : (i64) -> ()
          func.call @stack_push_nil() : () -> ()
          %397 = func.call @stack_pop_pointer() : () -> i64
          %398 = func.call @stack_pop_pointer() : () -> i64
          %399 = func.call @cc_cons(%398, %397) : (i64, i64) -> i64
          func.call @stack_push_pointer(%399) : (i64) -> ()
          %400 = func.call @stack_pop_pointer() : () -> i64
          %401 = func.call @stack_pop_pointer() : () -> i64
          %402 = func.call @cc_cons(%401, %400) : (i64, i64) -> i64
          func.call @stack_push_pointer(%402) : (i64) -> ()
          %403 = func.call @stack_pop_pointer() : () -> i64
          %404 = func.call @cc_nil_value() : () -> i64
          %405 = func.call @cc_errorp(%352) : (i64) -> i64
          %406 = arith.cmpi ne, %405, %404 : i64
          %407 = arith.cmpi eq, %404, %404 : i64
          %408 = arith.andi %406, %407 : i1
          %409 = scf.if %408 -> (i64) {
            scf.yield %352 : i64
          } else {
            scf.yield %404 : i64
          }
          %410 = func.call @cc_errorp(%363) : (i64) -> i64
          %411 = arith.cmpi ne, %410, %404 : i64
          %412 = arith.cmpi eq, %409, %404 : i64
          %413 = arith.andi %411, %412 : i1
          %414 = scf.if %413 -> (i64) {
            scf.yield %363 : i64
          } else {
            scf.yield %409 : i64
          }
          %415 = func.call @cc_errorp(%374) : (i64) -> i64
          %416 = arith.cmpi ne, %415, %404 : i64
          %417 = arith.cmpi eq, %414, %404 : i64
          %418 = arith.andi %416, %417 : i1
          %419 = scf.if %418 -> (i64) {
            scf.yield %374 : i64
          } else {
            scf.yield %414 : i64
          }
          %420 = func.call @cc_errorp(%385) : (i64) -> i64
          %421 = arith.cmpi ne, %420, %404 : i64
          %422 = arith.cmpi eq, %419, %404 : i64
          %423 = arith.andi %421, %422 : i1
          %424 = scf.if %423 -> (i64) {
            scf.yield %385 : i64
          } else {
            scf.yield %419 : i64
          }
          %425 = func.call @cc_errorp(%403) : (i64) -> i64
          %426 = arith.cmpi ne, %425, %404 : i64
          %427 = arith.cmpi eq, %424, %404 : i64
          %428 = arith.andi %426, %427 : i1
          %429 = scf.if %428 -> (i64) {
            scf.yield %403 : i64
          } else {
            scf.yield %424 : i64
          }
          %430 = arith.cmpi ne, %429, %404 : i64
          scf.if %430 {
            func.call @stack_push_pointer(%429) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%352) : (i64) -> ()
            func.call @stack_push_pointer(%363) : (i64) -> ()
            func.call @stack_push_pointer(%374) : (i64) -> ()
            func.call @stack_push_pointer(%385) : (i64) -> ()
            func.call @stack_push_pointer(%403) : (i64) -> ()
            %431 = llvm.mlir.addressof @str42 : !llvm.ptr
            %432 = func.call @cc_make_function_ref_const(%431) : (!llvm.ptr) -> i64
            %433 = arith.constant 5 : i64
            func.call @cc_funcall_stack(%432, %433) : (i64, i64) -> ()
          }
          %434 = func.call @stack_pop_pointer() : () -> i64
          %435 = llvm.mlir.addressof @str43 : !llvm.ptr
          %436 = arith.constant 6 : i64
          %437 = func.call @cc_make_symbol(%435, %436) : (!llvm.ptr, i64) -> i64
          %438 = func.call @cc_symbol_value(%437) : (i64) -> i64
          %439 = func.call @cc_set_symbol_value(%437, %434) : (i64, i64) -> i64
          %440 = func.call @cc_nil_value() : () -> i64
          %441 = func.call @cc_nil_value() : () -> i64
          %442 = func.call @cc_errorp(%440) : (i64) -> i64
          %443 = arith.cmpi ne, %442, %441 : i64
          %444 = scf.if %443 -> (i64) {
            scf.yield %440 : i64
          } else {
            %445 = func.call @cc_t_value() : () -> i64
            func.call @stack_push_pointer(%445) : (i64) -> ()
            %446 = func.call @stack_pop_pointer() : () -> i64
            %447 = llvm.mlir.addressof @str44 : !llvm.ptr
            %448 = arith.constant 9 : i64
            %449 = func.call @cc_make_string(%447, %448) : (!llvm.ptr, i64) -> i64
            func.call @stack_push_pointer(%449) : (i64) -> ()
            %450 = func.call @stack_pop_pointer() : () -> i64
            %451 = llvm.mlir.addressof @str45 : !llvm.ptr
            %452 = arith.constant 6 : i64
            %453 = func.call @cc_make_string(%451, %452) : (!llvm.ptr, i64) -> i64
            %454 = func.call @cc_nil_value() : () -> i64
            %455 = func.call @cc_intern(%453, %454) : (i64, i64) -> i64
            %456 = func.call @cc_nil_value() : () -> i64
            %457 = func.call @cc_cons(%455, %456) : (i64, i64) -> i64
            %458 = func.call @cc_values_pack(%457) : (i64) -> i64
            func.call @stack_push_pointer(%455) : (i64) -> ()
            %459 = func.call @stack_pop_pointer() : () -> i64
            %460 = func.call @cc_nil_value() : () -> i64
            %461 = func.call @cc_errorp(%459) : (i64) -> i64
            %462 = arith.cmpi ne, %461, %460 : i64
            %463 = arith.cmpi eq, %460, %460 : i64
            %464 = arith.andi %462, %463 : i1
            %465 = scf.if %464 -> (i64) {
              scf.yield %459 : i64
            } else {
              scf.yield %460 : i64
            }
            %466 = arith.cmpi ne, %465, %460 : i64
            scf.if %466 {
              func.call @stack_push_pointer(%465) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%459) : (i64) -> ()
              %467 = llvm.mlir.addressof @str46 : !llvm.ptr
              %468 = func.call @cc_make_function_ref_const(%467) : (!llvm.ptr) -> i64
              %469 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%468, %469) : (i64, i64) -> ()
            }
            %470 = func.call @stack_pop_pointer() : () -> i64
            %471 = func.call @cc_nil_value() : () -> i64
            %472 = func.call @cc_errorp(%470) : (i64) -> i64
            %473 = arith.cmpi ne, %472, %471 : i64
            %474 = arith.cmpi eq, %471, %471 : i64
            %475 = arith.andi %473, %474 : i1
            %476 = scf.if %475 -> (i64) {
              scf.yield %470 : i64
            } else {
              scf.yield %471 : i64
            }
            %477 = arith.cmpi ne, %476, %471 : i64
            scf.if %477 {
              func.call @stack_push_pointer(%476) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%470) : (i64) -> ()
              %478 = llvm.mlir.addressof @str47 : !llvm.ptr
              %479 = func.call @cc_make_function_ref_const(%478) : (!llvm.ptr) -> i64
              %480 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%479, %480) : (i64, i64) -> ()
            }
            %481 = func.call @stack_pop_pointer() : () -> i64
            func.call @stack_push_pointer(%446) : (i64) -> ()
            func.call @stack_push_pointer(%450) : (i64) -> ()
            func.call @stack_push_pointer(%481) : (i64) -> ()
            %482 = llvm.mlir.addressof @str48 : !llvm.ptr
            %483 = func.call @cc_make_function_ref_const(%482) : (!llvm.ptr) -> i64
            %484 = arith.constant 3 : i64
            func.call @cc_funcall_stack(%483, %484) : (i64, i64) -> ()
            %485 = func.call @stack_pop_pointer() : () -> i64
            %486 = func.call @cc_multiple_value_list(%485) : (i64) -> i64
            %487 = llvm.mlir.addressof @str49 : !llvm.ptr
            %488 = arith.constant 6 : i64
            %489 = func.call @cc_make_string(%487, %488) : (!llvm.ptr, i64) -> i64
            %490 = func.call @cc_nil_value() : () -> i64
            %491 = func.call @cc_intern(%489, %490) : (i64, i64) -> i64
            %492 = func.call @cc_nil_value() : () -> i64
            %493 = func.call @cc_cons(%491, %492) : (i64, i64) -> i64
            %494 = func.call @cc_values_pack(%493) : (i64) -> i64
            %495 = func.call @cc_symbol_value(%491) : (i64) -> i64
            func.call @stack_push_pointer(%495) : (i64) -> ()
            %496 = func.call @stack_pop_pointer() : () -> i64
            %497 = func.call @cc_nil_value() : () -> i64
            %498 = func.call @cc_errorp(%496) : (i64) -> i64
            %499 = arith.cmpi ne, %498, %497 : i64
            %500 = arith.cmpi eq, %497, %497 : i64
            %501 = arith.andi %499, %500 : i1
            %502 = scf.if %501 -> (i64) {
              scf.yield %496 : i64
            } else {
              scf.yield %497 : i64
            }
            %503 = arith.cmpi ne, %502, %497 : i64
            scf.if %503 {
              func.call @stack_push_pointer(%502) : (i64) -> ()
            } else {
              func.call @stack_push_pointer(%496) : (i64) -> ()
              %504 = llvm.mlir.addressof @str50 : !llvm.ptr
              %505 = func.call @cc_make_function_ref_const(%504) : (!llvm.ptr) -> i64
              %506 = arith.constant 1 : i64
              func.call @cc_funcall_stack(%505, %506) : (i64, i64) -> ()
            }
            %507 = func.call @stack_depth() : () -> i64
            %508 = arith.constant 0 : i64
            %509 = arith.cmpi sgt, %507, %508 : i64
            scf.if %509 {
              %510 = func.call @stack_pop_pointer() : () -> i64
            }
            %511 = func.call @cc_values_pack(%486) : (i64) -> i64
            func.call @stack_push_pointer(%511) : (i64) -> ()
            %512 = func.call @stack_pop_pointer() : () -> i64
            scf.yield %512 : i64
          }
          func.call @stack_push_pointer(%444) : (i64) -> ()
          %513 = func.call @cc_set_symbol_value(%437, %438) : (i64, i64) -> i64
          %514 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %514 : i64
        }
        func.call @stack_push_pointer(%351) : (i64) -> ()
        %515 = func.call @stack_pop_pointer() : () -> i64
        %516 = func.call @cc_multiple_value_list(%515) : (i64) -> i64
        %517 = func.call @cc_push_ignore_errors_trap() : () -> i64
        %518 = func.call @cc_nil_value() : () -> i64
        %519 = func.call @cc_nil_value() : () -> i64
        %520 = func.call @cc_errorp(%518) : (i64) -> i64
        %521 = arith.cmpi ne, %520, %519 : i64
        %522 = scf.if %521 -> (i64) {
          scf.yield %518 : i64
        } else {
          func.call @stack_push_pointer(%42) : (i64) -> ()
          %523 = func.call @stack_pop_pointer() : () -> i64
          %524 = func.call @cc_nil_value() : () -> i64
          %525 = func.call @cc_errorp(%523) : (i64) -> i64
          %526 = arith.cmpi ne, %525, %524 : i64
          %527 = arith.cmpi eq, %524, %524 : i64
          %528 = arith.andi %526, %527 : i1
          %529 = scf.if %528 -> (i64) {
            scf.yield %523 : i64
          } else {
            scf.yield %524 : i64
          }
          %530 = arith.cmpi ne, %529, %524 : i64
          scf.if %530 {
            func.call @stack_push_pointer(%529) : (i64) -> ()
          } else {
            func.call @stack_push_pointer(%523) : (i64) -> ()
            %531 = llvm.mlir.addressof @str51 : !llvm.ptr
            %532 = func.call @cc_make_function_ref_const(%531) : (!llvm.ptr) -> i64
            %533 = arith.constant 1 : i64
            func.call @cc_funcall_stack(%532, %533) : (i64, i64) -> ()
          }
          %534 = func.call @stack_pop_pointer() : () -> i64
          scf.yield %534 : i64
        }
        func.call @stack_push_pointer(%522) : (i64) -> ()
        %535 = func.call @stack_pop_pointer() : () -> i64
        %536 = func.call @cc_pop_ignore_errors_trap() : () -> i64
        %537 = func.call @cc_errorp(%535) : (i64) -> i64
        %538 = func.call @cc_nil_value() : () -> i64
        %539 = arith.cmpi ne, %537, %538 : i64
        scf.if %539 {
          %540 = func.call @cc_condition_value(%535) : (i64) -> i64
          %541 = func.call @cc_values2(%538, %540) : (i64, i64) -> i64
          func.call @stack_push_pointer(%541) : (i64) -> ()
        } else {
          %542 = func.call @cc_multiple_value_list(%535) : (i64) -> i64
          %543 = func.call @cc_values_pack(%542) : (i64) -> i64
          func.call @stack_push_pointer(%543) : (i64) -> ()
        }
        %544 = func.call @stack_depth() : () -> i64
        %545 = arith.constant 0 : i64
        %546 = arith.cmpi sgt, %544, %545 : i64
        scf.if %546 {
          %547 = func.call @stack_pop_pointer() : () -> i64
        }
        %548 = func.call @cc_values_pack(%516) : (i64) -> i64
        func.call @stack_push_pointer(%548) : (i64) -> ()
        %549 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %549 : i64
      }
      func.call @stack_push_pointer(%47) : (i64) -> ()
      %550 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %550 : i64
    }
    func.call @stack_push_pointer(%27) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str2("probe-synonym-special\00") : !llvm.array<22 x i8>
  llvm.mlir.global private constant @str3("core:mkstemp\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str4("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str5("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str6("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str7("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str9("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str10("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str11("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str12("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str13("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str14("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str15("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str16("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str17("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str18("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str19("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str20("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str21("mearts\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("boundp=~s value=~s stream=~s~%\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str23("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str24("BOUNDP\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str25("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str26("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str27("MAKE-SYNONYM-STREAM\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str28("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str29("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str30("MAKE-SYNONYM-STREAM\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str31("WRITE-BYTE\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str32("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str33("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str34("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str35("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str36("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str37("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str38("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str39("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str40("UNSIGNED-BYTE\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str41("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str42("open\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str43("mearts\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str44("read=~s~%\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str45("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str46("MAKE-SYNONYM-STREAM\00") : !llvm.array<20 x i8>
  llvm.mlir.global private constant @str47("READ-BYTE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str48("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str49("MEARTS\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str50("close\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str51("DELETE-FILE\00") : !llvm.array<12 x i8>
}
