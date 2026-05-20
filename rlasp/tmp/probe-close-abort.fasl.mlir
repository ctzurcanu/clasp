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
      %29 = arith.constant 11 : i64
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
      func.call @stack_push_pointer(%42) : (i64) -> ()
      %43 = func.call @stack_pop_pointer() : () -> i64
      %44 = llvm.mlir.addressof @str4 : !llvm.ptr
      %45 = arith.constant 17 : i64
      %46 = func.call @cc_make_string(%44, %45) : (!llvm.ptr, i64) -> i64
      %47 = llvm.mlir.addressof @str5 : !llvm.ptr
      %48 = arith.constant 7 : i64
      %49 = func.call @cc_make_string(%47, %48) : (!llvm.ptr, i64) -> i64
      %50 = func.call @cc_intern(%46, %49) : (i64, i64) -> i64
      %51 = func.call @cc_nil_value() : () -> i64
      %52 = func.call @cc_cons(%50, %51) : (i64, i64) -> i64
      %53 = func.call @cc_values_pack(%52) : (i64) -> i64
      func.call @stack_push_pointer(%50) : (i64) -> ()
      %54 = func.call @stack_pop_pointer() : () -> i64
      %55 = llvm.mlir.addressof @str6 : !llvm.ptr
      %56 = arith.constant 6 : i64
      %57 = func.call @cc_make_string(%55, %56) : (!llvm.ptr, i64) -> i64
      %58 = llvm.mlir.addressof @str7 : !llvm.ptr
      %59 = arith.constant 7 : i64
      %60 = func.call @cc_make_string(%58, %59) : (!llvm.ptr, i64) -> i64
      %61 = func.call @cc_intern(%57, %60) : (i64, i64) -> i64
      %62 = func.call @cc_nil_value() : () -> i64
      %63 = func.call @cc_cons(%61, %62) : (i64, i64) -> i64
      %64 = func.call @cc_values_pack(%63) : (i64) -> i64
      func.call @stack_push_pointer(%61) : (i64) -> ()
      %65 = func.call @stack_pop_pointer() : () -> i64
      %66 = llvm.mlir.addressof @str8 : !llvm.ptr
      %67 = arith.constant 9 : i64
      %68 = func.call @cc_make_string(%66, %67) : (!llvm.ptr, i64) -> i64
      %69 = llvm.mlir.addressof @str9 : !llvm.ptr
      %70 = arith.constant 7 : i64
      %71 = func.call @cc_make_string(%69, %70) : (!llvm.ptr, i64) -> i64
      %72 = func.call @cc_intern(%68, %71) : (i64, i64) -> i64
      %73 = func.call @cc_nil_value() : () -> i64
      %74 = func.call @cc_cons(%72, %73) : (i64, i64) -> i64
      %75 = func.call @cc_values_pack(%74) : (i64) -> i64
      func.call @stack_push_pointer(%72) : (i64) -> ()
      %76 = func.call @stack_pop_pointer() : () -> i64
      %77 = llvm.mlir.addressof @str10 : !llvm.ptr
      %78 = arith.constant 6 : i64
      %79 = func.call @cc_make_string(%77, %78) : (!llvm.ptr, i64) -> i64
      %80 = llvm.mlir.addressof @str11 : !llvm.ptr
      %81 = arith.constant 7 : i64
      %82 = func.call @cc_make_string(%80, %81) : (!llvm.ptr, i64) -> i64
      %83 = func.call @cc_intern(%79, %82) : (i64, i64) -> i64
      %84 = func.call @cc_nil_value() : () -> i64
      %85 = func.call @cc_cons(%83, %84) : (i64, i64) -> i64
      %86 = func.call @cc_values_pack(%85) : (i64) -> i64
      func.call @stack_push_pointer(%83) : (i64) -> ()
      %87 = func.call @stack_pop_pointer() : () -> i64
      %88 = func.call @cc_nil_value() : () -> i64
      %89 = func.call @cc_errorp(%43) : (i64) -> i64
      %90 = arith.cmpi ne, %89, %88 : i64
      %91 = arith.cmpi eq, %88, %88 : i64
      %92 = arith.andi %90, %91 : i1
      %93 = scf.if %92 -> (i64) {
        scf.yield %43 : i64
      } else {
        scf.yield %88 : i64
      }
      %94 = func.call @cc_errorp(%54) : (i64) -> i64
      %95 = arith.cmpi ne, %94, %88 : i64
      %96 = arith.cmpi eq, %93, %88 : i64
      %97 = arith.andi %95, %96 : i1
      %98 = scf.if %97 -> (i64) {
        scf.yield %54 : i64
      } else {
        scf.yield %93 : i64
      }
      %99 = func.call @cc_errorp(%65) : (i64) -> i64
      %100 = arith.cmpi ne, %99, %88 : i64
      %101 = arith.cmpi eq, %98, %88 : i64
      %102 = arith.andi %100, %101 : i1
      %103 = scf.if %102 -> (i64) {
        scf.yield %65 : i64
      } else {
        scf.yield %98 : i64
      }
      %104 = func.call @cc_errorp(%76) : (i64) -> i64
      %105 = arith.cmpi ne, %104, %88 : i64
      %106 = arith.cmpi eq, %103, %88 : i64
      %107 = arith.andi %105, %106 : i1
      %108 = scf.if %107 -> (i64) {
        scf.yield %76 : i64
      } else {
        scf.yield %103 : i64
      }
      %109 = func.call @cc_errorp(%87) : (i64) -> i64
      %110 = arith.cmpi ne, %109, %88 : i64
      %111 = arith.cmpi eq, %108, %88 : i64
      %112 = arith.andi %110, %111 : i1
      %113 = scf.if %112 -> (i64) {
        scf.yield %87 : i64
      } else {
        scf.yield %108 : i64
      }
      %114 = arith.cmpi ne, %113, %88 : i64
      scf.if %114 {
        func.call @stack_push_pointer(%113) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%43) : (i64) -> ()
        func.call @stack_push_pointer(%54) : (i64) -> ()
        func.call @stack_push_pointer(%65) : (i64) -> ()
        func.call @stack_push_pointer(%76) : (i64) -> ()
        func.call @stack_push_pointer(%87) : (i64) -> ()
        %115 = llvm.mlir.addressof @str12 : !llvm.ptr
        %116 = func.call @cc_make_function_ref_const(%115) : (!llvm.ptr) -> i64
        %117 = arith.constant 5 : i64
        func.call @cc_funcall_stack(%116, %117) : (i64, i64) -> ()
      }
      %118 = func.call @stack_pop_pointer() : () -> i64
      %119 = arith.constant 3 : i64
      func.call @stack_push_fixnum(%119) : (i64) -> ()
      %120 = func.call @stack_pop_pointer() : () -> i64
      %121 = llvm.mlir.addressof @str13 : !llvm.ptr
      %122 = arith.constant 12 : i64
      %123 = func.call @cc_make_string(%121, %122) : (!llvm.ptr, i64) -> i64
      %124 = llvm.mlir.addressof @str14 : !llvm.ptr
      %125 = arith.constant 7 : i64
      %126 = func.call @cc_make_string(%124, %125) : (!llvm.ptr, i64) -> i64
      %127 = func.call @cc_intern(%123, %126) : (i64, i64) -> i64
      %128 = func.call @cc_nil_value() : () -> i64
      %129 = func.call @cc_cons(%127, %128) : (i64, i64) -> i64
      %130 = func.call @cc_values_pack(%129) : (i64) -> i64
      func.call @stack_push_pointer(%127) : (i64) -> ()
      %131 = func.call @stack_pop_pointer() : () -> i64
      %132 = llvm.mlir.addressof @str15 : !llvm.ptr
      %133 = arith.constant 9 : i64
      %134 = func.call @cc_make_string(%132, %133) : (!llvm.ptr, i64) -> i64
      %135 = llvm.mlir.addressof @str16 : !llvm.ptr
      %136 = arith.constant 11 : i64
      %137 = func.call @cc_make_string(%135, %136) : (!llvm.ptr, i64) -> i64
      %138 = func.call @cc_intern(%134, %137) : (i64, i64) -> i64
      %139 = func.call @cc_nil_value() : () -> i64
      %140 = func.call @cc_cons(%138, %139) : (i64, i64) -> i64
      %141 = func.call @cc_values_pack(%140) : (i64) -> i64
      func.call @stack_push_pointer(%138) : (i64) -> ()
      %142 = func.call @stack_pop_pointer() : () -> i64
      %143 = func.call @cc_nil_value() : () -> i64
      %144 = func.call @cc_errorp(%120) : (i64) -> i64
      %145 = arith.cmpi ne, %144, %143 : i64
      %146 = arith.cmpi eq, %143, %143 : i64
      %147 = arith.andi %145, %146 : i1
      %148 = scf.if %147 -> (i64) {
        scf.yield %120 : i64
      } else {
        scf.yield %143 : i64
      }
      %149 = func.call @cc_errorp(%131) : (i64) -> i64
      %150 = arith.cmpi ne, %149, %143 : i64
      %151 = arith.cmpi eq, %148, %143 : i64
      %152 = arith.andi %150, %151 : i1
      %153 = scf.if %152 -> (i64) {
        scf.yield %131 : i64
      } else {
        scf.yield %148 : i64
      }
      %154 = func.call @cc_errorp(%142) : (i64) -> i64
      %155 = arith.cmpi ne, %154, %143 : i64
      %156 = arith.cmpi eq, %153, %143 : i64
      %157 = arith.andi %155, %156 : i1
      %158 = scf.if %157 -> (i64) {
        scf.yield %142 : i64
      } else {
        scf.yield %153 : i64
      }
      %159 = arith.cmpi ne, %158, %143 : i64
      scf.if %159 {
        func.call @stack_push_pointer(%158) : (i64) -> ()
      } else {
        func.call @stack_push_pointer(%120) : (i64) -> ()
        func.call @stack_push_pointer(%131) : (i64) -> ()
        func.call @stack_push_pointer(%142) : (i64) -> ()
        %160 = llvm.mlir.addressof @str17 : !llvm.ptr
        %161 = func.call @cc_make_function_ref_const(%160) : (!llvm.ptr) -> i64
        %162 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%161, %162) : (i64, i64) -> ()
      }
      %163 = func.call @stack_pop_pointer() : () -> i64
      %164 = func.call @cc_nil_value() : () -> i64
      %165 = func.call @cc_nil_value() : () -> i64
      %166 = func.call @cc_errorp(%164) : (i64) -> i64
      %167 = arith.cmpi ne, %166, %165 : i64
      %168:2 = scf.if %167 -> (i64, i64) {
        scf.yield %164, %118 : i64, i64
      } else {
        %169 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%169) : (i64) -> ()
        %170 = func.call @stack_pop_pointer() : () -> i64
        %171 = llvm.mlir.addressof @str18 : !llvm.ptr
        %172 = arith.constant 9 : i64
        %173 = func.call @cc_make_string(%171, %172) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%173) : (i64) -> ()
        %174 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%42) : (i64) -> ()
        %175 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%170) : (i64) -> ()
        func.call @stack_push_pointer(%174) : (i64) -> ()
        func.call @stack_push_pointer(%175) : (i64) -> ()
        %176 = llvm.mlir.addressof @str19 : !llvm.ptr
        %177 = func.call @cc_make_function_ref_const(%176) : (!llvm.ptr) -> i64
        %178 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%177, %178) : (i64, i64) -> ()
        %179 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %179, %118 : i64, i64
      }
      %180 = func.call @cc_nil_value() : () -> i64
      %181 = func.call @cc_errorp(%168#0) : (i64) -> i64
      %182 = arith.cmpi ne, %181, %180 : i64
      %183:2 = scf.if %182 -> (i64, i64) {
        scf.yield %168#0, %168#1 : i64, i64
      } else {
        %184 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%184) : (i64) -> ()
        %185 = func.call @stack_pop_pointer() : () -> i64
        %186 = llvm.mlir.addressof @str20 : !llvm.ptr
        %187 = arith.constant 10 : i64
        %188 = func.call @cc_make_string(%186, %187) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%188) : (i64) -> ()
        %189 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%168#1) : (i64) -> ()
        %190 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%185) : (i64) -> ()
        func.call @stack_push_pointer(%189) : (i64) -> ()
        func.call @stack_push_pointer(%190) : (i64) -> ()
        %191 = llvm.mlir.addressof @str21 : !llvm.ptr
        %192 = func.call @cc_make_function_ref_const(%191) : (!llvm.ptr) -> i64
        %193 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%192, %193) : (i64, i64) -> ()
        %194 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %194, %168#1 : i64, i64
      }
      %195 = func.call @cc_nil_value() : () -> i64
      %196 = func.call @cc_errorp(%183#0) : (i64) -> i64
      %197 = arith.cmpi ne, %196, %195 : i64
      %198:2 = scf.if %197 -> (i64, i64) {
        scf.yield %183#0, %183#1 : i64, i64
      } else {
        %199 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%199) : (i64) -> ()
        %200 = func.call @stack_pop_pointer() : () -> i64
        %201 = llvm.mlir.addressof @str22 : !llvm.ptr
        %202 = arith.constant 11 : i64
        %203 = func.call @cc_make_string(%201, %202) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%203) : (i64) -> ()
        %204 = func.call @stack_pop_pointer() : () -> i64
        %205 = llvm.mlir.addressof @str23 : !llvm.ptr
        %206 = arith.constant 3 : i64
        %207 = func.call @cc_make_string(%205, %206) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%207) : (i64) -> ()
        %208 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%183#1) : (i64) -> ()
        %209 = func.call @stack_pop_pointer() : () -> i64
        %210 = func.call @cc_nil_value() : () -> i64
        %211 = func.call @cc_errorp(%208) : (i64) -> i64
        %212 = arith.cmpi ne, %211, %210 : i64
        %213 = arith.cmpi eq, %210, %210 : i64
        %214 = arith.andi %212, %213 : i1
        %215 = scf.if %214 -> (i64) {
          scf.yield %208 : i64
        } else {
          scf.yield %210 : i64
        }
        %216 = func.call @cc_errorp(%209) : (i64) -> i64
        %217 = arith.cmpi ne, %216, %210 : i64
        %218 = arith.cmpi eq, %215, %210 : i64
        %219 = arith.andi %217, %218 : i1
        %220 = scf.if %219 -> (i64) {
          scf.yield %209 : i64
        } else {
          scf.yield %215 : i64
        }
        %221 = arith.cmpi ne, %220, %210 : i64
        scf.if %221 {
          func.call @stack_push_pointer(%220) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%208) : (i64) -> ()
          func.call @stack_push_pointer(%209) : (i64) -> ()
          %222 = llvm.mlir.addressof @str24 : !llvm.ptr
          %223 = func.call @cc_make_function_ref_const(%222) : (!llvm.ptr) -> i64
          %224 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%223, %224) : (i64, i64) -> ()
        }
        %225 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%200) : (i64) -> ()
        func.call @stack_push_pointer(%204) : (i64) -> ()
        func.call @stack_push_pointer(%225) : (i64) -> ()
        %226 = llvm.mlir.addressof @str25 : !llvm.ptr
        %227 = func.call @cc_make_function_ref_const(%226) : (!llvm.ptr) -> i64
        %228 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%227, %228) : (i64, i64) -> ()
        %229 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %229, %183#1 : i64, i64
      }
      %230 = func.call @cc_nil_value() : () -> i64
      %231 = func.call @cc_errorp(%198#0) : (i64) -> i64
      %232 = arith.cmpi ne, %231, %230 : i64
      %233:2 = scf.if %232 -> (i64, i64) {
        scf.yield %198#0, %198#1 : i64, i64
      } else {
        %234 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%234) : (i64) -> ()
        %235 = func.call @stack_pop_pointer() : () -> i64
        %236 = llvm.mlir.addressof @str26 : !llvm.ptr
        %237 = arith.constant 11 : i64
        %238 = func.call @cc_make_string(%236, %237) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%238) : (i64) -> ()
        %239 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%198#1) : (i64) -> ()
        %240 = func.call @stack_pop_pointer() : () -> i64
        %241 = func.call @cc_nil_value() : () -> i64
        %242 = func.call @cc_errorp(%240) : (i64) -> i64
        %243 = arith.cmpi ne, %242, %241 : i64
        %244 = arith.cmpi eq, %241, %241 : i64
        %245 = arith.andi %243, %244 : i1
        %246 = scf.if %245 -> (i64) {
          scf.yield %240 : i64
        } else {
          scf.yield %241 : i64
        }
        %247 = arith.cmpi ne, %246, %241 : i64
        scf.if %247 {
          func.call @stack_push_pointer(%246) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%240) : (i64) -> ()
          %248 = llvm.mlir.addressof @str27 : !llvm.ptr
          %249 = func.call @cc_make_function_ref_const(%248) : (!llvm.ptr) -> i64
          %250 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%249, %250) : (i64, i64) -> ()
        }
        %251 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%235) : (i64) -> ()
        func.call @stack_push_pointer(%239) : (i64) -> ()
        func.call @stack_push_pointer(%251) : (i64) -> ()
        %252 = llvm.mlir.addressof @str28 : !llvm.ptr
        %253 = func.call @cc_make_function_ref_const(%252) : (!llvm.ptr) -> i64
        %254 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%253, %254) : (i64, i64) -> ()
        %255 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %255, %198#1 : i64, i64
      }
      %256 = func.call @cc_nil_value() : () -> i64
      %257 = func.call @cc_errorp(%233#0) : (i64) -> i64
      %258 = arith.cmpi ne, %257, %256 : i64
      %259:2 = scf.if %258 -> (i64, i64) {
        scf.yield %233#0, %233#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%42) : (i64) -> ()
        %260 = func.call @stack_pop_pointer() : () -> i64
        %261 = llvm.mlir.addressof @str29 : !llvm.ptr
        %262 = arith.constant 17 : i64
        %263 = func.call @cc_make_string(%261, %262) : (!llvm.ptr, i64) -> i64
        %264 = llvm.mlir.addressof @str30 : !llvm.ptr
        %265 = arith.constant 7 : i64
        %266 = func.call @cc_make_string(%264, %265) : (!llvm.ptr, i64) -> i64
        %267 = func.call @cc_intern(%263, %266) : (i64, i64) -> i64
        %268 = func.call @cc_nil_value() : () -> i64
        %269 = func.call @cc_cons(%267, %268) : (i64, i64) -> i64
        %270 = func.call @cc_values_pack(%269) : (i64) -> i64
        func.call @stack_push_pointer(%267) : (i64) -> ()
        %271 = func.call @stack_pop_pointer() : () -> i64
        %272 = llvm.mlir.addressof @str31 : !llvm.ptr
        %273 = arith.constant 6 : i64
        %274 = func.call @cc_make_string(%272, %273) : (!llvm.ptr, i64) -> i64
        %275 = llvm.mlir.addressof @str32 : !llvm.ptr
        %276 = arith.constant 7 : i64
        %277 = func.call @cc_make_string(%275, %276) : (!llvm.ptr, i64) -> i64
        %278 = func.call @cc_intern(%274, %277) : (i64, i64) -> i64
        %279 = func.call @cc_nil_value() : () -> i64
        %280 = func.call @cc_cons(%278, %279) : (i64, i64) -> i64
        %281 = func.call @cc_values_pack(%280) : (i64) -> i64
        func.call @stack_push_pointer(%278) : (i64) -> ()
        %282 = func.call @stack_pop_pointer() : () -> i64
        %283 = llvm.mlir.addressof @str33 : !llvm.ptr
        %284 = arith.constant 9 : i64
        %285 = func.call @cc_make_string(%283, %284) : (!llvm.ptr, i64) -> i64
        %286 = llvm.mlir.addressof @str34 : !llvm.ptr
        %287 = arith.constant 7 : i64
        %288 = func.call @cc_make_string(%286, %287) : (!llvm.ptr, i64) -> i64
        %289 = func.call @cc_intern(%285, %288) : (i64, i64) -> i64
        %290 = func.call @cc_nil_value() : () -> i64
        %291 = func.call @cc_cons(%289, %290) : (i64, i64) -> i64
        %292 = func.call @cc_values_pack(%291) : (i64) -> i64
        func.call @stack_push_pointer(%289) : (i64) -> ()
        %293 = func.call @stack_pop_pointer() : () -> i64
        %294 = llvm.mlir.addressof @str35 : !llvm.ptr
        %295 = arith.constant 9 : i64
        %296 = func.call @cc_make_string(%294, %295) : (!llvm.ptr, i64) -> i64
        %297 = llvm.mlir.addressof @str36 : !llvm.ptr
        %298 = arith.constant 7 : i64
        %299 = func.call @cc_make_string(%297, %298) : (!llvm.ptr, i64) -> i64
        %300 = func.call @cc_intern(%296, %299) : (i64, i64) -> i64
        %301 = func.call @cc_nil_value() : () -> i64
        %302 = func.call @cc_cons(%300, %301) : (i64, i64) -> i64
        %303 = func.call @cc_values_pack(%302) : (i64) -> i64
        func.call @stack_push_pointer(%300) : (i64) -> ()
        %304 = func.call @stack_pop_pointer() : () -> i64
        %305 = llvm.mlir.addressof @str37 : !llvm.ptr
        %306 = arith.constant 9 : i64
        %307 = func.call @cc_make_string(%305, %306) : (!llvm.ptr, i64) -> i64
        %308 = llvm.mlir.addressof @str38 : !llvm.ptr
        %309 = arith.constant 7 : i64
        %310 = func.call @cc_make_string(%308, %309) : (!llvm.ptr, i64) -> i64
        %311 = func.call @cc_intern(%307, %310) : (i64, i64) -> i64
        %312 = func.call @cc_nil_value() : () -> i64
        %313 = func.call @cc_cons(%311, %312) : (i64, i64) -> i64
        %314 = func.call @cc_values_pack(%313) : (i64) -> i64
        func.call @stack_push_pointer(%311) : (i64) -> ()
        %315 = func.call @stack_pop_pointer() : () -> i64
        %316 = llvm.mlir.addressof @str39 : !llvm.ptr
        %317 = arith.constant 6 : i64
        %318 = func.call @cc_make_string(%316, %317) : (!llvm.ptr, i64) -> i64
        %319 = llvm.mlir.addressof @str40 : !llvm.ptr
        %320 = arith.constant 7 : i64
        %321 = func.call @cc_make_string(%319, %320) : (!llvm.ptr, i64) -> i64
        %322 = func.call @cc_intern(%318, %321) : (i64, i64) -> i64
        %323 = func.call @cc_nil_value() : () -> i64
        %324 = func.call @cc_cons(%322, %323) : (i64, i64) -> i64
        %325 = func.call @cc_values_pack(%324) : (i64) -> i64
        func.call @stack_push_pointer(%322) : (i64) -> ()
        %326 = func.call @stack_pop_pointer() : () -> i64
        %327 = func.call @cc_nil_value() : () -> i64
        %328 = func.call @cc_errorp(%260) : (i64) -> i64
        %329 = arith.cmpi ne, %328, %327 : i64
        %330 = arith.cmpi eq, %327, %327 : i64
        %331 = arith.andi %329, %330 : i1
        %332 = scf.if %331 -> (i64) {
          scf.yield %260 : i64
        } else {
          scf.yield %327 : i64
        }
        %333 = func.call @cc_errorp(%271) : (i64) -> i64
        %334 = arith.cmpi ne, %333, %327 : i64
        %335 = arith.cmpi eq, %332, %327 : i64
        %336 = arith.andi %334, %335 : i1
        %337 = scf.if %336 -> (i64) {
          scf.yield %271 : i64
        } else {
          scf.yield %332 : i64
        }
        %338 = func.call @cc_errorp(%282) : (i64) -> i64
        %339 = arith.cmpi ne, %338, %327 : i64
        %340 = arith.cmpi eq, %337, %327 : i64
        %341 = arith.andi %339, %340 : i1
        %342 = scf.if %341 -> (i64) {
          scf.yield %282 : i64
        } else {
          scf.yield %337 : i64
        }
        %343 = func.call @cc_errorp(%293) : (i64) -> i64
        %344 = arith.cmpi ne, %343, %327 : i64
        %345 = arith.cmpi eq, %342, %327 : i64
        %346 = arith.andi %344, %345 : i1
        %347 = scf.if %346 -> (i64) {
          scf.yield %293 : i64
        } else {
          scf.yield %342 : i64
        }
        %348 = func.call @cc_errorp(%304) : (i64) -> i64
        %349 = arith.cmpi ne, %348, %327 : i64
        %350 = arith.cmpi eq, %347, %327 : i64
        %351 = arith.andi %349, %350 : i1
        %352 = scf.if %351 -> (i64) {
          scf.yield %304 : i64
        } else {
          scf.yield %347 : i64
        }
        %353 = func.call @cc_errorp(%315) : (i64) -> i64
        %354 = arith.cmpi ne, %353, %327 : i64
        %355 = arith.cmpi eq, %352, %327 : i64
        %356 = arith.andi %354, %355 : i1
        %357 = scf.if %356 -> (i64) {
          scf.yield %315 : i64
        } else {
          scf.yield %352 : i64
        }
        %358 = func.call @cc_errorp(%326) : (i64) -> i64
        %359 = arith.cmpi ne, %358, %327 : i64
        %360 = arith.cmpi eq, %357, %327 : i64
        %361 = arith.andi %359, %360 : i1
        %362 = scf.if %361 -> (i64) {
          scf.yield %326 : i64
        } else {
          scf.yield %357 : i64
        }
        %363 = arith.cmpi ne, %362, %327 : i64
        scf.if %363 {
          func.call @stack_push_pointer(%362) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%260) : (i64) -> ()
          func.call @stack_push_pointer(%271) : (i64) -> ()
          func.call @stack_push_pointer(%282) : (i64) -> ()
          func.call @stack_push_pointer(%293) : (i64) -> ()
          func.call @stack_push_pointer(%304) : (i64) -> ()
          func.call @stack_push_pointer(%315) : (i64) -> ()
          func.call @stack_push_pointer(%326) : (i64) -> ()
          %364 = llvm.mlir.addressof @str41 : !llvm.ptr
          %365 = func.call @cc_make_function_ref_const(%364) : (!llvm.ptr) -> i64
          %366 = arith.constant 7 : i64
          func.call @cc_funcall_stack(%365, %366) : (i64, i64) -> ()
        }
        %367 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%367) : (i64) -> ()
        %368 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %368, %367 : i64, i64
      }
      %369 = func.call @cc_nil_value() : () -> i64
      %370 = func.call @cc_errorp(%259#0) : (i64) -> i64
      %371 = arith.cmpi ne, %370, %369 : i64
      %372:2 = scf.if %371 -> (i64, i64) {
        scf.yield %259#0, %259#1 : i64, i64
      } else {
        %373 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%373) : (i64) -> ()
        %374 = func.call @stack_pop_pointer() : () -> i64
        %375 = llvm.mlir.addressof @str42 : !llvm.ptr
        %376 = arith.constant 10 : i64
        %377 = func.call @cc_make_string(%375, %376) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%377) : (i64) -> ()
        %378 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%259#1) : (i64) -> ()
        %379 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%374) : (i64) -> ()
        func.call @stack_push_pointer(%378) : (i64) -> ()
        func.call @stack_push_pointer(%379) : (i64) -> ()
        %380 = llvm.mlir.addressof @str43 : !llvm.ptr
        %381 = func.call @cc_make_function_ref_const(%380) : (!llvm.ptr) -> i64
        %382 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%381, %382) : (i64, i64) -> ()
        %383 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %383, %259#1 : i64, i64
      }
      %384 = func.call @cc_nil_value() : () -> i64
      %385 = func.call @cc_errorp(%372#0) : (i64) -> i64
      %386 = arith.cmpi ne, %385, %384 : i64
      %387:2 = scf.if %386 -> (i64, i64) {
        scf.yield %372#0, %372#1 : i64, i64
      } else {
        %388 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%388) : (i64) -> ()
        %389 = func.call @stack_pop_pointer() : () -> i64
        %390 = llvm.mlir.addressof @str44 : !llvm.ptr
        %391 = arith.constant 11 : i64
        %392 = func.call @cc_make_string(%390, %391) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%392) : (i64) -> ()
        %393 = func.call @stack_pop_pointer() : () -> i64
        %394 = llvm.mlir.addressof @str45 : !llvm.ptr
        %395 = arith.constant 3 : i64
        %396 = func.call @cc_make_string(%394, %395) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%396) : (i64) -> ()
        %397 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%372#1) : (i64) -> ()
        %398 = func.call @stack_pop_pointer() : () -> i64
        %399 = func.call @cc_nil_value() : () -> i64
        %400 = func.call @cc_errorp(%397) : (i64) -> i64
        %401 = arith.cmpi ne, %400, %399 : i64
        %402 = arith.cmpi eq, %399, %399 : i64
        %403 = arith.andi %401, %402 : i1
        %404 = scf.if %403 -> (i64) {
          scf.yield %397 : i64
        } else {
          scf.yield %399 : i64
        }
        %405 = func.call @cc_errorp(%398) : (i64) -> i64
        %406 = arith.cmpi ne, %405, %399 : i64
        %407 = arith.cmpi eq, %404, %399 : i64
        %408 = arith.andi %406, %407 : i1
        %409 = scf.if %408 -> (i64) {
          scf.yield %398 : i64
        } else {
          scf.yield %404 : i64
        }
        %410 = arith.cmpi ne, %409, %399 : i64
        scf.if %410 {
          func.call @stack_push_pointer(%409) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%397) : (i64) -> ()
          func.call @stack_push_pointer(%398) : (i64) -> ()
          %411 = llvm.mlir.addressof @str46 : !llvm.ptr
          %412 = func.call @cc_make_function_ref_const(%411) : (!llvm.ptr) -> i64
          %413 = arith.constant 2 : i64
          func.call @cc_funcall_stack(%412, %413) : (i64, i64) -> ()
        }
        %414 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%389) : (i64) -> ()
        func.call @stack_push_pointer(%393) : (i64) -> ()
        func.call @stack_push_pointer(%414) : (i64) -> ()
        %415 = llvm.mlir.addressof @str47 : !llvm.ptr
        %416 = func.call @cc_make_function_ref_const(%415) : (!llvm.ptr) -> i64
        %417 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%416, %417) : (i64, i64) -> ()
        %418 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %418, %372#1 : i64, i64
      }
      %419 = func.call @cc_nil_value() : () -> i64
      %420 = func.call @cc_errorp(%387#0) : (i64) -> i64
      %421 = arith.cmpi ne, %420, %419 : i64
      %422:2 = scf.if %421 -> (i64, i64) {
        scf.yield %387#0, %387#1 : i64, i64
      } else {
        %423 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%423) : (i64) -> ()
        %424 = func.call @stack_pop_pointer() : () -> i64
        %425 = llvm.mlir.addressof @str48 : !llvm.ptr
        %426 = arith.constant 11 : i64
        %427 = func.call @cc_make_string(%425, %426) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%427) : (i64) -> ()
        %428 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%387#1) : (i64) -> ()
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
          %437 = llvm.mlir.addressof @str49 : !llvm.ptr
          %438 = func.call @cc_make_function_ref_const(%437) : (!llvm.ptr) -> i64
          %439 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%438, %439) : (i64, i64) -> ()
        }
        %440 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%424) : (i64) -> ()
        func.call @stack_push_pointer(%428) : (i64) -> ()
        func.call @stack_push_pointer(%440) : (i64) -> ()
        %441 = llvm.mlir.addressof @str50 : !llvm.ptr
        %442 = func.call @cc_make_function_ref_const(%441) : (!llvm.ptr) -> i64
        %443 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%442, %443) : (i64, i64) -> ()
        %444 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %444, %387#1 : i64, i64
      }
      %445 = func.call @cc_nil_value() : () -> i64
      %446 = func.call @cc_errorp(%422#0) : (i64) -> i64
      %447 = arith.cmpi ne, %446, %445 : i64
      %448:2 = scf.if %447 -> (i64, i64) {
        scf.yield %422#0, %422#1 : i64, i64
      } else {
        func.call @stack_push_pointer(%42) : (i64) -> ()
        %449 = func.call @stack_pop_pointer() : () -> i64
        %450 = llvm.mlir.addressof @str51 : !llvm.ptr
        %451 = arith.constant 9 : i64
        %452 = func.call @cc_make_string(%450, %451) : (!llvm.ptr, i64) -> i64
        %453 = llvm.mlir.addressof @str52 : !llvm.ptr
        %454 = arith.constant 7 : i64
        %455 = func.call @cc_make_string(%453, %454) : (!llvm.ptr, i64) -> i64
        %456 = func.call @cc_intern(%452, %455) : (i64, i64) -> i64
        %457 = func.call @cc_nil_value() : () -> i64
        %458 = func.call @cc_cons(%456, %457) : (i64, i64) -> i64
        %459 = func.call @cc_values_pack(%458) : (i64) -> i64
        func.call @stack_push_pointer(%456) : (i64) -> ()
        %460 = func.call @stack_pop_pointer() : () -> i64
        %461 = llvm.mlir.addressof @str53 : !llvm.ptr
        %462 = arith.constant 5 : i64
        %463 = func.call @cc_make_string(%461, %462) : (!llvm.ptr, i64) -> i64
        %464 = llvm.mlir.addressof @str54 : !llvm.ptr
        %465 = arith.constant 7 : i64
        %466 = func.call @cc_make_string(%464, %465) : (!llvm.ptr, i64) -> i64
        %467 = func.call @cc_intern(%463, %466) : (i64, i64) -> i64
        %468 = func.call @cc_nil_value() : () -> i64
        %469 = func.call @cc_cons(%467, %468) : (i64, i64) -> i64
        %470 = func.call @cc_values_pack(%469) : (i64) -> i64
        func.call @stack_push_pointer(%467) : (i64) -> ()
        %471 = func.call @stack_pop_pointer() : () -> i64
        %472 = func.call @cc_nil_value() : () -> i64
        %473 = func.call @cc_errorp(%449) : (i64) -> i64
        %474 = arith.cmpi ne, %473, %472 : i64
        %475 = arith.cmpi eq, %472, %472 : i64
        %476 = arith.andi %474, %475 : i1
        %477 = scf.if %476 -> (i64) {
          scf.yield %449 : i64
        } else {
          scf.yield %472 : i64
        }
        %478 = func.call @cc_errorp(%460) : (i64) -> i64
        %479 = arith.cmpi ne, %478, %472 : i64
        %480 = arith.cmpi eq, %477, %472 : i64
        %481 = arith.andi %479, %480 : i1
        %482 = scf.if %481 -> (i64) {
          scf.yield %460 : i64
        } else {
          scf.yield %477 : i64
        }
        %483 = func.call @cc_errorp(%471) : (i64) -> i64
        %484 = arith.cmpi ne, %483, %472 : i64
        %485 = arith.cmpi eq, %482, %472 : i64
        %486 = arith.andi %484, %485 : i1
        %487 = scf.if %486 -> (i64) {
          scf.yield %471 : i64
        } else {
          scf.yield %482 : i64
        }
        %488 = arith.cmpi ne, %487, %472 : i64
        scf.if %488 {
          func.call @stack_push_pointer(%487) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%449) : (i64) -> ()
          func.call @stack_push_pointer(%460) : (i64) -> ()
          func.call @stack_push_pointer(%471) : (i64) -> ()
          %489 = llvm.mlir.addressof @str55 : !llvm.ptr
          %490 = func.call @cc_make_function_ref_const(%489) : (!llvm.ptr) -> i64
          %491 = arith.constant 3 : i64
          func.call @cc_funcall_stack(%490, %491) : (i64, i64) -> ()
        }
        %492 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%492) : (i64) -> ()
        %493 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %493, %492 : i64, i64
      }
      %494 = func.call @cc_nil_value() : () -> i64
      %495 = func.call @cc_errorp(%448#0) : (i64) -> i64
      %496 = arith.cmpi ne, %495, %494 : i64
      %497:2 = scf.if %496 -> (i64, i64) {
        scf.yield %448#0, %448#1 : i64, i64
      } else {
        %498 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%498) : (i64) -> ()
        %499 = func.call @stack_pop_pointer() : () -> i64
        %500 = llvm.mlir.addressof @str56 : !llvm.ptr
        %501 = arith.constant 10 : i64
        %502 = func.call @cc_make_string(%500, %501) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%502) : (i64) -> ()
        %503 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%448#1) : (i64) -> ()
        %504 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%499) : (i64) -> ()
        func.call @stack_push_pointer(%503) : (i64) -> ()
        func.call @stack_push_pointer(%504) : (i64) -> ()
        %505 = llvm.mlir.addressof @str57 : !llvm.ptr
        %506 = func.call @cc_make_function_ref_const(%505) : (!llvm.ptr) -> i64
        %507 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%506, %507) : (i64, i64) -> ()
        %508 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %508, %448#1 : i64, i64
      }
      %509 = func.call @cc_nil_value() : () -> i64
      %510 = func.call @cc_errorp(%497#0) : (i64) -> i64
      %511 = arith.cmpi ne, %510, %509 : i64
      %512:2 = scf.if %511 -> (i64, i64) {
        scf.yield %497#0, %497#1 : i64, i64
      } else {
        %513 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%513) : (i64) -> ()
        %514 = func.call @stack_pop_pointer() : () -> i64
        %515 = llvm.mlir.addressof @str58 : !llvm.ptr
        %516 = arith.constant 12 : i64
        %517 = func.call @cc_make_string(%515, %516) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%517) : (i64) -> ()
        %518 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%163) : (i64) -> ()
        %519 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%497#1) : (i64) -> ()
        %520 = func.call @stack_pop_pointer() : () -> i64
        %521 = llvm.mlir.addressof @str59 : !llvm.ptr
        %522 = arith.constant 5 : i64
        %523 = func.call @cc_make_string(%521, %522) : (!llvm.ptr, i64) -> i64
        %524 = llvm.mlir.addressof @str60 : !llvm.ptr
        %525 = arith.constant 7 : i64
        %526 = func.call @cc_make_string(%524, %525) : (!llvm.ptr, i64) -> i64
        %527 = func.call @cc_intern(%523, %526) : (i64, i64) -> i64
        %528 = func.call @cc_nil_value() : () -> i64
        %529 = func.call @cc_cons(%527, %528) : (i64, i64) -> i64
        %530 = func.call @cc_values_pack(%529) : (i64) -> i64
        func.call @stack_push_pointer(%527) : (i64) -> ()
        %531 = func.call @stack_pop_pointer() : () -> i64
        %532 = arith.constant 0 : i64
        func.call @stack_push_fixnum(%532) : (i64) -> ()
        %533 = func.call @stack_pop_pointer() : () -> i64
        %534 = llvm.mlir.addressof @str61 : !llvm.ptr
        %535 = arith.constant 3 : i64
        %536 = func.call @cc_make_string(%534, %535) : (!llvm.ptr, i64) -> i64
        %537 = llvm.mlir.addressof @str62 : !llvm.ptr
        %538 = arith.constant 7 : i64
        %539 = func.call @cc_make_string(%537, %538) : (!llvm.ptr, i64) -> i64
        %540 = func.call @cc_intern(%536, %539) : (i64, i64) -> i64
        %541 = func.call @cc_nil_value() : () -> i64
        %542 = func.call @cc_cons(%540, %541) : (i64, i64) -> i64
        %543 = func.call @cc_values_pack(%542) : (i64) -> i64
        func.call @stack_push_pointer(%540) : (i64) -> ()
        %544 = func.call @stack_pop_pointer() : () -> i64
        %545 = arith.constant 3 : i64
        func.call @stack_push_fixnum(%545) : (i64) -> ()
        %546 = func.call @stack_pop_pointer() : () -> i64
        %547 = func.call @cc_nil_value() : () -> i64
        %548 = func.call @cc_errorp(%519) : (i64) -> i64
        %549 = arith.cmpi ne, %548, %547 : i64
        %550 = arith.cmpi eq, %547, %547 : i64
        %551 = arith.andi %549, %550 : i1
        %552 = scf.if %551 -> (i64) {
          scf.yield %519 : i64
        } else {
          scf.yield %547 : i64
        }
        %553 = func.call @cc_errorp(%520) : (i64) -> i64
        %554 = arith.cmpi ne, %553, %547 : i64
        %555 = arith.cmpi eq, %552, %547 : i64
        %556 = arith.andi %554, %555 : i1
        %557 = scf.if %556 -> (i64) {
          scf.yield %520 : i64
        } else {
          scf.yield %552 : i64
        }
        %558 = func.call @cc_errorp(%531) : (i64) -> i64
        %559 = arith.cmpi ne, %558, %547 : i64
        %560 = arith.cmpi eq, %557, %547 : i64
        %561 = arith.andi %559, %560 : i1
        %562 = scf.if %561 -> (i64) {
          scf.yield %531 : i64
        } else {
          scf.yield %557 : i64
        }
        %563 = func.call @cc_errorp(%533) : (i64) -> i64
        %564 = arith.cmpi ne, %563, %547 : i64
        %565 = arith.cmpi eq, %562, %547 : i64
        %566 = arith.andi %564, %565 : i1
        %567 = scf.if %566 -> (i64) {
          scf.yield %533 : i64
        } else {
          scf.yield %562 : i64
        }
        %568 = func.call @cc_errorp(%544) : (i64) -> i64
        %569 = arith.cmpi ne, %568, %547 : i64
        %570 = arith.cmpi eq, %567, %547 : i64
        %571 = arith.andi %569, %570 : i1
        %572 = scf.if %571 -> (i64) {
          scf.yield %544 : i64
        } else {
          scf.yield %567 : i64
        }
        %573 = func.call @cc_errorp(%546) : (i64) -> i64
        %574 = arith.cmpi ne, %573, %547 : i64
        %575 = arith.cmpi eq, %572, %547 : i64
        %576 = arith.andi %574, %575 : i1
        %577 = scf.if %576 -> (i64) {
          scf.yield %546 : i64
        } else {
          scf.yield %572 : i64
        }
        %578 = arith.cmpi ne, %577, %547 : i64
        scf.if %578 {
          func.call @stack_push_pointer(%577) : (i64) -> ()
        } else {
          %579 = func.call @cc_nil_value() : () -> i64
          %580 = func.call @cc_cons(%546, %579) : (i64, i64) -> i64
          %581 = func.call @cc_cons(%544, %580) : (i64, i64) -> i64
          %582 = func.call @cc_cons(%533, %581) : (i64, i64) -> i64
          %583 = func.call @cc_cons(%531, %582) : (i64, i64) -> i64
          %584 = func.call @cc_cons(%520, %583) : (i64, i64) -> i64
          %585 = func.call @cc_cons(%519, %584) : (i64, i64) -> i64
          func.call @stack_push_pointer(%585) : (i64) -> ()
          func.call @cc_read_sequence_stack() : () -> ()
        }
        %586 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%514) : (i64) -> ()
        func.call @stack_push_pointer(%518) : (i64) -> ()
        func.call @stack_push_pointer(%586) : (i64) -> ()
        %587 = llvm.mlir.addressof @str63 : !llvm.ptr
        %588 = func.call @cc_make_function_ref_const(%587) : (!llvm.ptr) -> i64
        %589 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%588, %589) : (i64, i64) -> ()
        %590 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %590, %497#1 : i64, i64
      }
      %591 = func.call @cc_nil_value() : () -> i64
      %592 = func.call @cc_errorp(%512#0) : (i64) -> i64
      %593 = arith.cmpi ne, %592, %591 : i64
      %594:2 = scf.if %593 -> (i64, i64) {
        scf.yield %512#0, %512#1 : i64, i64
      } else {
        %595 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%595) : (i64) -> ()
        %596 = func.call @stack_pop_pointer() : () -> i64
        %597 = llvm.mlir.addressof @str64 : !llvm.ptr
        %598 = arith.constant 11 : i64
        %599 = func.call @cc_make_string(%597, %598) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%599) : (i64) -> ()
        %600 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%163) : (i64) -> ()
        %601 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%596) : (i64) -> ()
        func.call @stack_push_pointer(%600) : (i64) -> ()
        func.call @stack_push_pointer(%601) : (i64) -> ()
        %602 = llvm.mlir.addressof @str65 : !llvm.ptr
        %603 = func.call @cc_make_function_ref_const(%602) : (!llvm.ptr) -> i64
        %604 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%603, %604) : (i64, i64) -> ()
        %605 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %605, %512#1 : i64, i64
      }
      %606 = func.call @cc_nil_value() : () -> i64
      %607 = func.call @cc_errorp(%594#0) : (i64) -> i64
      %608 = arith.cmpi ne, %607, %606 : i64
      %609:2 = scf.if %608 -> (i64, i64) {
        scf.yield %594#0, %594#1 : i64, i64
      } else {
        %610 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%610) : (i64) -> ()
        %611 = func.call @stack_pop_pointer() : () -> i64
        %612 = llvm.mlir.addressof @str66 : !llvm.ptr
        %613 = arith.constant 11 : i64
        %614 = func.call @cc_make_string(%612, %613) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%614) : (i64) -> ()
        %615 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%594#1) : (i64) -> ()
        %616 = func.call @stack_pop_pointer() : () -> i64
        %617 = func.call @cc_nil_value() : () -> i64
        %618 = func.call @cc_errorp(%616) : (i64) -> i64
        %619 = arith.cmpi ne, %618, %617 : i64
        %620 = arith.cmpi eq, %617, %617 : i64
        %621 = arith.andi %619, %620 : i1
        %622 = scf.if %621 -> (i64) {
          scf.yield %616 : i64
        } else {
          scf.yield %617 : i64
        }
        %623 = arith.cmpi ne, %622, %617 : i64
        scf.if %623 {
          func.call @stack_push_pointer(%622) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%616) : (i64) -> ()
          %624 = llvm.mlir.addressof @str67 : !llvm.ptr
          %625 = func.call @cc_make_function_ref_const(%624) : (!llvm.ptr) -> i64
          %626 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%625, %626) : (i64, i64) -> ()
        }
        %627 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%611) : (i64) -> ()
        func.call @stack_push_pointer(%615) : (i64) -> ()
        func.call @stack_push_pointer(%627) : (i64) -> ()
        %628 = llvm.mlir.addressof @str68 : !llvm.ptr
        %629 = func.call @cc_make_function_ref_const(%628) : (!llvm.ptr) -> i64
        %630 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%629, %630) : (i64, i64) -> ()
        %631 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %631, %594#1 : i64, i64
      }
      %632 = func.call @cc_nil_value() : () -> i64
      %633 = func.call @cc_errorp(%609#0) : (i64) -> i64
      %634 = arith.cmpi ne, %633, %632 : i64
      %635:2 = scf.if %634 -> (i64, i64) {
        scf.yield %609#0, %609#1 : i64, i64
      } else {
        %636 = func.call @cc_t_value() : () -> i64
        func.call @stack_push_pointer(%636) : (i64) -> ()
        %637 = func.call @stack_pop_pointer() : () -> i64
        %638 = llvm.mlir.addressof @str69 : !llvm.ptr
        %639 = arith.constant 11 : i64
        %640 = func.call @cc_make_string(%638, %639) : (!llvm.ptr, i64) -> i64
        func.call @stack_push_pointer(%640) : (i64) -> ()
        %641 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%42) : (i64) -> ()
        %642 = func.call @stack_pop_pointer() : () -> i64
        %643 = func.call @cc_nil_value() : () -> i64
        %644 = func.call @cc_errorp(%642) : (i64) -> i64
        %645 = arith.cmpi ne, %644, %643 : i64
        %646 = arith.cmpi eq, %643, %643 : i64
        %647 = arith.andi %645, %646 : i1
        %648 = scf.if %647 -> (i64) {
          scf.yield %642 : i64
        } else {
          scf.yield %643 : i64
        }
        %649 = arith.cmpi ne, %648, %643 : i64
        scf.if %649 {
          func.call @stack_push_pointer(%648) : (i64) -> ()
        } else {
          func.call @stack_push_pointer(%642) : (i64) -> ()
          %650 = llvm.mlir.addressof @str70 : !llvm.ptr
          %651 = func.call @cc_make_function_ref_const(%650) : (!llvm.ptr) -> i64
          %652 = arith.constant 1 : i64
          func.call @cc_funcall_stack(%651, %652) : (i64, i64) -> ()
        }
        %653 = func.call @stack_pop_pointer() : () -> i64
        func.call @stack_push_pointer(%637) : (i64) -> ()
        func.call @stack_push_pointer(%641) : (i64) -> ()
        func.call @stack_push_pointer(%653) : (i64) -> ()
        %654 = llvm.mlir.addressof @str71 : !llvm.ptr
        %655 = func.call @cc_make_function_ref_const(%654) : (!llvm.ptr) -> i64
        %656 = arith.constant 3 : i64
        func.call @cc_funcall_stack(%655, %656) : (i64, i64) -> ()
        %657 = func.call @stack_pop_pointer() : () -> i64
        scf.yield %657, %609#1 : i64, i64
      }
      func.call @stack_push_pointer(%635#0) : (i64) -> ()
      %658 = func.call @stack_pop_pointer() : () -> i64
      scf.yield %658 : i64
    }
    func.call @stack_push_pointer(%27) : (i64) -> ()
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("CLASP-TESTS\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str2("close-abort\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str3("core:mkstemp\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str4("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str5("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str6("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str7("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str8("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str9("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str10("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str11("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str12("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str13("ELEMENT-TYPE\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str14("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str15("CHARACTER\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str16("COMMON-LISP\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str17("MAKE-ARRAY\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str18("name=~a~%\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str19("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str20("open1=~a~%\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str21("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str22("write1=~a~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str23("foo\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str24("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str25("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str26("close1=~a~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str27("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str28("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str29("IF-DOES-NOT-EXIST\00") : !llvm.array<18 x i8>
  llvm.mlir.global private constant @str30("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str31("CREATE\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str32("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str33("IF-EXISTS\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str34("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str35("SUPERSEDE\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str36("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str37("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str38("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str39("OUTPUT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str41("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str42("open2=~a~%\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str43("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str44("write2=~a~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str45("bar\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str46("WRITE-STRING\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str47("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str48("close2=~a~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str49("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str50("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str51("DIRECTION\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str52("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str53("INPUT\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str54("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str55("OPEN\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str56("open3=~a~%\00") : !llvm.array<11 x i8>
  llvm.mlir.global private constant @str57("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str58("readseq=~a~%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str59("START\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str60("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str61("END\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str62("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str63("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str64("buffer=~a~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str65("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str66("close3=~a~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str67("CLOSE\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str68("FORMAT\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str69("delete=~a~%\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str70("DELETE-FILE\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str71("FORMAT\00") : !llvm.array<7 x i8>
}
