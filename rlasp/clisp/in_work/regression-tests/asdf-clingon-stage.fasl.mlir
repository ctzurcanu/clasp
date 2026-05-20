module {
  func.func private @cc_char_reader_roundtrip(i64) -> i64
  func.func private @cc_char_name_roundtrip_truth(i64) -> i64
  func.func private @cc_char_reader_roundtrip_truth(i64) -> i64
  func.func private @cc_collect_bad_char_reader_roundtrips() -> i64
  func.func private @cc_collect_bad_char_name_roundtrips() -> i64
  func.func private @cc_cas_car(i64, i64, i64) -> i64
  func.func private @cc_cas_cdr(i64, i64, i64) -> i64
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
    %11 = arith.constant 3 : i64
    %12 = func.call @cc_make_string(%10, %11) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%12) : (i64) -> ()
    %13 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%9) : (i64) -> ()
    func.call @stack_push_pointer(%13) : (i64) -> ()
    %14 = llvm.mlir.addressof @str2 : !llvm.ptr
    %15 = func.call @cc_make_function_ref_const(%14) : (!llvm.ptr) -> i64
    %16 = arith.constant 2 : i64
    func.call @cc_funcall_stack(%15, %16) : (i64, i64) -> ()
    %17 = func.call @stack_depth() : () -> i64
    %18 = arith.constant 0 : i64
    %19 = arith.cmpi sgt, %17, %18 : i64
    scf.if %19 {
      %20 = func.call @stack_pop_pointer() : () -> i64
    }
    %21 = func.call @cc_nil_value() : () -> i64
    %22 = arith.cmpi ne, %21, %21 : i64
    scf.if %22 {
      func.call @stack_push_pointer(%21) : (i64) -> ()
    } else {
      %23 = llvm.mlir.addressof @str3 : !llvm.ptr
      %24 = func.call @cc_make_function_ref_const(%23) : (!llvm.ptr) -> i64
      %25 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%24, %25) : (i64, i64) -> ()
    }
    %26 = func.call @stack_depth() : () -> i64
    %27 = arith.constant 0 : i64
    %28 = arith.cmpi sgt, %26, %27 : i64
    scf.if %28 {
      %29 = func.call @stack_pop_pointer() : () -> i64
    }
    %30 = llvm.mlir.addressof @str4 : !llvm.ptr
    %31 = arith.constant 93 : i64
    %32 = func.call @cc_make_string(%30, %31) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%32) : (i64) -> ()
    %33 = func.call @stack_pop_pointer() : () -> i64
    %34 = func.call @cc_nil_value() : () -> i64
    %35 = func.call @cc_cons(%33, %34) : (i64, i64) -> i64
    %36 = func.call @cc_load_stack(%35) : (i64) -> i64
    func.call @stack_push_pointer(%36) : (i64) -> ()
    %37 = func.call @stack_depth() : () -> i64
    %38 = arith.constant 0 : i64
    %39 = arith.cmpi sgt, %37, %38 : i64
    scf.if %39 {
      %40 = func.call @stack_pop_pointer() : () -> i64
    }
    %41 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%41) : (i64) -> ()
    %42 = func.call @stack_pop_pointer() : () -> i64
    %43 = llvm.mlir.addressof @str5 : !llvm.ptr
    %44 = arith.constant 3 : i64
    %45 = func.call @cc_make_string(%43, %44) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%45) : (i64) -> ()
    %46 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%42) : (i64) -> ()
    func.call @stack_push_pointer(%46) : (i64) -> ()
    %47 = llvm.mlir.addressof @str6 : !llvm.ptr
    %48 = func.call @cc_make_function_ref_const(%47) : (!llvm.ptr) -> i64
    %49 = arith.constant 2 : i64
    func.call @cc_funcall_stack(%48, %49) : (i64, i64) -> ()
    %50 = func.call @stack_depth() : () -> i64
    %51 = arith.constant 0 : i64
    %52 = arith.cmpi sgt, %50, %51 : i64
    scf.if %52 {
      %53 = func.call @stack_pop_pointer() : () -> i64
    }
    %54 = func.call @cc_nil_value() : () -> i64
    %55 = arith.cmpi ne, %54, %54 : i64
    scf.if %55 {
      func.call @stack_push_pointer(%54) : (i64) -> ()
    } else {
      %56 = llvm.mlir.addressof @str7 : !llvm.ptr
      %57 = func.call @cc_make_function_ref_const(%56) : (!llvm.ptr) -> i64
      %58 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%57, %58) : (i64, i64) -> ()
    }
    %59 = func.call @stack_depth() : () -> i64
    %60 = arith.constant 0 : i64
    %61 = arith.cmpi sgt, %59, %60 : i64
    scf.if %61 {
      %62 = func.call @stack_pop_pointer() : () -> i64
    }
    %63 = llvm.mlir.addressof @str8 : !llvm.ptr
    %64 = arith.constant 4 : i64
    %65 = func.call @cc_make_string(%63, %64) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%65) : (i64) -> ()
    %66 = func.call @stack_pop_pointer() : () -> i64
    %67 = func.call @cc_nil_value() : () -> i64
    %68 = func.call @cc_errorp(%66) : (i64) -> i64
    %69 = arith.cmpi ne, %68, %67 : i64
    %70 = arith.cmpi eq, %67, %67 : i64
    %71 = arith.andi %69, %70 : i1
    %72 = scf.if %71 -> (i64) {
      scf.yield %66 : i64
    } else {
      scf.yield %67 : i64
    }
    %73 = arith.cmpi ne, %72, %67 : i64
    scf.if %73 {
      func.call @stack_push_pointer(%72) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%66) : (i64) -> ()
      %74 = llvm.mlir.addressof @str9 : !llvm.ptr
      %75 = func.call @cc_make_function_ref_const(%74) : (!llvm.ptr) -> i64
      %76 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%75, %76) : (i64, i64) -> ()
    }
    %77 = func.call @stack_pop_pointer() : () -> i64
    %78 = func.call @cc_nil_value() : () -> i64
    %79 = llvm.mlir.addressof @str10 : !llvm.ptr
    %80 = arith.constant 26 : i64
    %81 = func.call @cc_make_string(%79, %80) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%81) : (i64) -> ()
    %82 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%77) : (i64) -> ()
    %83 = func.call @stack_pop_pointer() : () -> i64
    %84 = func.call @cc_nil_value() : () -> i64
    %85 = func.call @cc_errorp(%82) : (i64) -> i64
    %86 = arith.cmpi ne, %85, %84 : i64
    %87 = arith.cmpi eq, %84, %84 : i64
    %88 = arith.andi %86, %87 : i1
    %89 = scf.if %88 -> (i64) {
      scf.yield %82 : i64
    } else {
      scf.yield %84 : i64
    }
    %90 = func.call @cc_errorp(%83) : (i64) -> i64
    %91 = arith.cmpi ne, %90, %84 : i64
    %92 = arith.cmpi eq, %89, %84 : i64
    %93 = arith.andi %91, %92 : i1
    %94 = scf.if %93 -> (i64) {
      scf.yield %83 : i64
    } else {
      scf.yield %89 : i64
    }
    %95 = arith.cmpi ne, %94, %84 : i64
    scf.if %95 {
      func.call @stack_push_pointer(%94) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%82) : (i64) -> ()
      func.call @stack_push_pointer(%83) : (i64) -> ()
      %96 = llvm.mlir.addressof @str11 : !llvm.ptr
      %97 = func.call @cc_make_function_ref_const(%96) : (!llvm.ptr) -> i64
      %98 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%97, %98) : (i64, i64) -> ()
    }
    %99 = func.call @stack_pop_pointer() : () -> i64
    %100 = llvm.mlir.addressof @str12 : !llvm.ptr
    %101 = arith.constant 39 : i64
    %102 = func.call @cc_make_string(%100, %101) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%102) : (i64) -> ()
    %103 = func.call @stack_pop_pointer() : () -> i64
    %104 = func.call @cc_nil_value() : () -> i64
    %105 = func.call @cc_errorp(%103) : (i64) -> i64
    %106 = arith.cmpi ne, %105, %104 : i64
    %107 = arith.cmpi eq, %104, %104 : i64
    %108 = arith.andi %106, %107 : i1
    %109 = scf.if %108 -> (i64) {
      scf.yield %103 : i64
    } else {
      scf.yield %104 : i64
    }
    %110 = arith.cmpi ne, %109, %104 : i64
    scf.if %110 {
      func.call @stack_push_pointer(%109) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%103) : (i64) -> ()
      %111 = llvm.mlir.addressof @str13 : !llvm.ptr
      %112 = func.call @cc_make_function_ref_const(%111) : (!llvm.ptr) -> i64
      %113 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%112, %113) : (i64, i64) -> ()
    }
    %114 = func.call @stack_pop_pointer() : () -> i64
    %115 = func.call @cc_cons(%114, %78) : (i64, i64) -> i64
    %116 = func.call @cc_cons(%99, %115) : (i64, i64) -> i64
    %117 = func.call @cc_or(%116) : (i64) -> i64
    func.call @stack_push_pointer(%117) : (i64) -> ()
    %118 = func.call @stack_pop_pointer() : () -> i64
    %119 = func.call @cc_nil_value() : () -> i64
    %120 = llvm.mlir.addressof @str14 : !llvm.ptr
    %121 = arith.constant 11 : i64
    %122 = func.call @cc_make_string(%120, %121) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%122) : (i64) -> ()
    %123 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%77) : (i64) -> ()
    %124 = func.call @stack_pop_pointer() : () -> i64
    %125 = func.call @cc_nil_value() : () -> i64
    %126 = func.call @cc_errorp(%123) : (i64) -> i64
    %127 = arith.cmpi ne, %126, %125 : i64
    %128 = arith.cmpi eq, %125, %125 : i64
    %129 = arith.andi %127, %128 : i1
    %130 = scf.if %129 -> (i64) {
      scf.yield %123 : i64
    } else {
      scf.yield %125 : i64
    }
    %131 = func.call @cc_errorp(%124) : (i64) -> i64
    %132 = arith.cmpi ne, %131, %125 : i64
    %133 = arith.cmpi eq, %130, %125 : i64
    %134 = arith.andi %132, %133 : i1
    %135 = scf.if %134 -> (i64) {
      scf.yield %124 : i64
    } else {
      scf.yield %130 : i64
    }
    %136 = arith.cmpi ne, %135, %125 : i64
    scf.if %136 {
      func.call @stack_push_pointer(%135) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%123) : (i64) -> ()
      func.call @stack_push_pointer(%124) : (i64) -> ()
      %137 = llvm.mlir.addressof @str15 : !llvm.ptr
      %138 = func.call @cc_make_function_ref_const(%137) : (!llvm.ptr) -> i64
      %139 = arith.constant 2 : i64
      func.call @cc_funcall_stack(%138, %139) : (i64, i64) -> ()
    }
    %140 = func.call @stack_pop_pointer() : () -> i64
    %141 = llvm.mlir.addressof @str16 : !llvm.ptr
    %142 = arith.constant 24 : i64
    %143 = func.call @cc_make_string(%141, %142) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%143) : (i64) -> ()
    %144 = func.call @stack_pop_pointer() : () -> i64
    %145 = func.call @cc_nil_value() : () -> i64
    %146 = func.call @cc_errorp(%144) : (i64) -> i64
    %147 = arith.cmpi ne, %146, %145 : i64
    %148 = arith.cmpi eq, %145, %145 : i64
    %149 = arith.andi %147, %148 : i1
    %150 = scf.if %149 -> (i64) {
      scf.yield %144 : i64
    } else {
      scf.yield %145 : i64
    }
    %151 = arith.cmpi ne, %150, %145 : i64
    scf.if %151 {
      func.call @stack_push_pointer(%150) : (i64) -> ()
    } else {
      func.call @stack_push_pointer(%144) : (i64) -> ()
      %152 = llvm.mlir.addressof @str17 : !llvm.ptr
      %153 = func.call @cc_make_function_ref_const(%152) : (!llvm.ptr) -> i64
      %154 = arith.constant 1 : i64
      func.call @cc_funcall_stack(%153, %154) : (i64, i64) -> ()
    }
    %155 = func.call @stack_pop_pointer() : () -> i64
    %156 = func.call @cc_cons(%155, %119) : (i64, i64) -> i64
    %157 = func.call @cc_cons(%140, %156) : (i64, i64) -> i64
    %158 = func.call @cc_or(%157) : (i64) -> i64
    func.call @stack_push_pointer(%158) : (i64) -> ()
    %159 = func.call @stack_pop_pointer() : () -> i64
    %160 = llvm.mlir.addressof @str18 : !llvm.ptr
    %161 = arith.constant 15 : i64
    %162 = func.call @cc_make_string(%160, %161) : (!llvm.ptr, i64) -> i64
    %163 = llvm.mlir.addressof @str19 : !llvm.ptr
    %164 = arith.constant 7 : i64
    %165 = func.call @cc_make_string(%163, %164) : (!llvm.ptr, i64) -> i64
    %166 = func.call @cc_intern(%162, %165) : (i64, i64) -> i64
    %167 = func.call @cc_nil_value() : () -> i64
    %168 = func.call @cc_cons(%166, %167) : (i64, i64) -> i64
    %169 = func.call @cc_values_pack(%168) : (i64) -> i64
    func.call @stack_push_pointer(%166) : (i64) -> ()
    %170 = llvm.mlir.addressof @str20 : !llvm.ptr
    %171 = arith.constant 4 : i64
    %172 = func.call @cc_make_string(%170, %171) : (!llvm.ptr, i64) -> i64
    %173 = llvm.mlir.addressof @str21 : !llvm.ptr
    %174 = arith.constant 7 : i64
    %175 = func.call @cc_make_string(%173, %174) : (!llvm.ptr, i64) -> i64
    %176 = func.call @cc_intern(%172, %175) : (i64, i64) -> i64
    %177 = func.call @cc_nil_value() : () -> i64
    %178 = func.call @cc_cons(%176, %177) : (i64, i64) -> i64
    %179 = func.call @cc_values_pack(%178) : (i64) -> i64
    func.call @stack_push_pointer(%176) : (i64) -> ()
    %180 = llvm.mlir.addressof @str22 : !llvm.ptr
    %181 = arith.constant 88 : i64
    %182 = func.call @cc_make_string(%180, %181) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%182) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %183 = func.call @stack_pop_pointer() : () -> i64
    %184 = func.call @stack_pop_pointer() : () -> i64
    %185 = func.call @cc_cons(%184, %183) : (i64, i64) -> i64
    func.call @stack_push_pointer(%185) : (i64) -> ()
    %186 = func.call @stack_pop_pointer() : () -> i64
    %187 = func.call @stack_pop_pointer() : () -> i64
    %188 = func.call @cc_cons(%187, %186) : (i64, i64) -> i64
    func.call @stack_push_pointer(%188) : (i64) -> ()
    %189 = llvm.mlir.addressof @str23 : !llvm.ptr
    %190 = arith.constant 4 : i64
    %191 = func.call @cc_make_string(%189, %190) : (!llvm.ptr, i64) -> i64
    %192 = llvm.mlir.addressof @str24 : !llvm.ptr
    %193 = arith.constant 7 : i64
    %194 = func.call @cc_make_string(%192, %193) : (!llvm.ptr, i64) -> i64
    %195 = func.call @cc_intern(%191, %194) : (i64, i64) -> i64
    %196 = func.call @cc_nil_value() : () -> i64
    %197 = func.call @cc_cons(%195, %196) : (i64, i64) -> i64
    %198 = func.call @cc_values_pack(%197) : (i64) -> i64
    func.call @stack_push_pointer(%195) : (i64) -> ()
    %199 = llvm.mlir.addressof @str25 : !llvm.ptr
    %200 = arith.constant 108 : i64
    %201 = func.call @cc_make_string(%199, %200) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%201) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %202 = func.call @stack_pop_pointer() : () -> i64
    %203 = func.call @stack_pop_pointer() : () -> i64
    %204 = func.call @cc_cons(%203, %202) : (i64, i64) -> i64
    func.call @stack_push_pointer(%204) : (i64) -> ()
    %205 = func.call @stack_pop_pointer() : () -> i64
    %206 = func.call @stack_pop_pointer() : () -> i64
    %207 = func.call @cc_cons(%206, %205) : (i64, i64) -> i64
    func.call @stack_push_pointer(%207) : (i64) -> ()
    %208 = llvm.mlir.addressof @str26 : !llvm.ptr
    %209 = arith.constant 30 : i64
    %210 = func.call @cc_make_string(%208, %209) : (!llvm.ptr, i64) -> i64
    %211 = llvm.mlir.addressof @str27 : !llvm.ptr
    %212 = arith.constant 7 : i64
    %213 = func.call @cc_make_string(%211, %212) : (!llvm.ptr, i64) -> i64
    %214 = func.call @cc_intern(%210, %213) : (i64, i64) -> i64
    %215 = func.call @cc_nil_value() : () -> i64
    %216 = func.call @cc_cons(%214, %215) : (i64, i64) -> i64
    %217 = func.call @cc_values_pack(%216) : (i64) -> i64
    func.call @stack_push_pointer(%214) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    %218 = func.call @stack_pop_pointer() : () -> i64
    %219 = func.call @stack_pop_pointer() : () -> i64
    %220 = func.call @cc_cons(%219, %218) : (i64, i64) -> i64
    func.call @stack_push_pointer(%220) : (i64) -> ()
    %221 = func.call @stack_pop_pointer() : () -> i64
    %222 = func.call @stack_pop_pointer() : () -> i64
    %223 = func.call @cc_cons(%222, %221) : (i64, i64) -> i64
    func.call @stack_push_pointer(%223) : (i64) -> ()
    %224 = func.call @stack_pop_pointer() : () -> i64
    %225 = func.call @stack_pop_pointer() : () -> i64
    %226 = func.call @cc_cons(%225, %224) : (i64, i64) -> i64
    func.call @stack_push_pointer(%226) : (i64) -> ()
    %227 = func.call @stack_pop_pointer() : () -> i64
    %228 = func.call @stack_pop_pointer() : () -> i64
    %229 = func.call @cc_cons(%228, %227) : (i64, i64) -> i64
    func.call @stack_push_pointer(%229) : (i64) -> ()
    func.call @stack_push_pointer(%118) : (i64) -> ()
    %230 = func.call @stack_pop_pointer() : () -> i64
    %231 = arith.constant 1 : i64
    func.call @cc_funcall_stack(%230, %231) : (i64, i64) -> ()
    %232 = func.call @stack_depth() : () -> i64
    %233 = arith.constant 0 : i64
    %234 = arith.cmpi sgt, %232, %233 : i64
    scf.if %234 {
      %235 = func.call @stack_pop_pointer() : () -> i64
    }
    %236 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%236) : (i64) -> ()
    %237 = func.call @stack_pop_pointer() : () -> i64
    %238 = llvm.mlir.addressof @str28 : !llvm.ptr
    %239 = arith.constant 3 : i64
    %240 = func.call @cc_make_string(%238, %239) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%240) : (i64) -> ()
    %241 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%237) : (i64) -> ()
    func.call @stack_push_pointer(%241) : (i64) -> ()
    %242 = llvm.mlir.addressof @str29 : !llvm.ptr
    %243 = func.call @cc_make_function_ref_const(%242) : (!llvm.ptr) -> i64
    %244 = arith.constant 2 : i64
    func.call @cc_funcall_stack(%243, %244) : (i64, i64) -> ()
    %245 = func.call @stack_depth() : () -> i64
    %246 = arith.constant 0 : i64
    %247 = arith.cmpi sgt, %245, %246 : i64
    scf.if %247 {
      %248 = func.call @stack_pop_pointer() : () -> i64
    }
    %249 = func.call @cc_nil_value() : () -> i64
    %250 = arith.cmpi ne, %249, %249 : i64
    scf.if %250 {
      func.call @stack_push_pointer(%249) : (i64) -> ()
    } else {
      %251 = llvm.mlir.addressof @str30 : !llvm.ptr
      %252 = func.call @cc_make_function_ref_const(%251) : (!llvm.ptr) -> i64
      %253 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%252, %253) : (i64, i64) -> ()
    }
    %254 = func.call @stack_depth() : () -> i64
    %255 = arith.constant 0 : i64
    %256 = arith.cmpi sgt, %254, %255 : i64
    scf.if %256 {
      %257 = func.call @stack_pop_pointer() : () -> i64
    }
    %258 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%258) : (i64) -> ()
    %259 = func.call @stack_pop_pointer() : () -> i64
    %260 = llvm.mlir.addressof @str31 : !llvm.ptr
    %261 = arith.constant 9 : i64
    %262 = func.call @cc_make_string(%260, %261) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%262) : (i64) -> ()
    %263 = func.call @stack_pop_pointer() : () -> i64
    %264 = llvm.mlir.addressof @str32 : !llvm.ptr
    %265 = arith.constant 4 : i64
    %266 = func.call @cc_make_string(%264, %265) : (!llvm.ptr, i64) -> i64
    %267 = llvm.mlir.addressof @str33 : !llvm.ptr
    %268 = arith.constant 7 : i64
    %269 = func.call @cc_make_string(%267, %268) : (!llvm.ptr, i64) -> i64
    %270 = func.call @cc_intern(%266, %269) : (i64, i64) -> i64
    %271 = func.call @cc_nil_value() : () -> i64
    %272 = func.call @cc_cons(%270, %271) : (i64, i64) -> i64
    %273 = func.call @cc_values_pack(%272) : (i64) -> i64
    func.call @stack_push_pointer(%270) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    func.call @stack_push_pointer(%159) : (i64) -> ()
    %274 = func.call @stack_pop_pointer() : () -> i64
    %275 = arith.constant 2 : i64
    func.call @cc_funcall_stack(%274, %275) : (i64, i64) -> ()
    %276 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%259) : (i64) -> ()
    func.call @stack_push_pointer(%263) : (i64) -> ()
    func.call @stack_push_pointer(%276) : (i64) -> ()
    %277 = llvm.mlir.addressof @str34 : !llvm.ptr
    %278 = func.call @cc_make_function_ref_const(%277) : (!llvm.ptr) -> i64
    %279 = arith.constant 3 : i64
    func.call @cc_funcall_stack(%278, %279) : (i64, i64) -> ()
    %280 = func.call @stack_depth() : () -> i64
    %281 = arith.constant 0 : i64
    %282 = arith.cmpi sgt, %280, %281 : i64
    scf.if %282 {
      %283 = func.call @stack_pop_pointer() : () -> i64
    }
    %284 = func.call @cc_nil_value() : () -> i64
    %285 = arith.cmpi ne, %284, %284 : i64
    scf.if %285 {
      func.call @stack_push_pointer(%284) : (i64) -> ()
    } else {
      %286 = llvm.mlir.addressof @str35 : !llvm.ptr
      %287 = func.call @cc_make_function_ref_const(%286) : (!llvm.ptr) -> i64
      %288 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%287, %288) : (i64, i64) -> ()
    }
    %289 = func.call @stack_depth() : () -> i64
    %290 = arith.constant 0 : i64
    %291 = arith.cmpi sgt, %289, %290 : i64
    scf.if %291 {
      %292 = func.call @stack_pop_pointer() : () -> i64
    }
    %293 = func.call @cc_t_value() : () -> i64
    func.call @stack_push_pointer(%293) : (i64) -> ()
    %294 = func.call @stack_pop_pointer() : () -> i64
    %295 = llvm.mlir.addressof @str36 : !llvm.ptr
    %296 = arith.constant 12 : i64
    %297 = func.call @cc_make_string(%295, %296) : (!llvm.ptr, i64) -> i64
    func.call @stack_push_pointer(%297) : (i64) -> ()
    %298 = func.call @stack_pop_pointer() : () -> i64
    %299 = llvm.mlir.addressof @str37 : !llvm.ptr
    %300 = arith.constant 7 : i64
    %301 = func.call @cc_make_string(%299, %300) : (!llvm.ptr, i64) -> i64
    %302 = llvm.mlir.addressof @str38 : !llvm.ptr
    %303 = arith.constant 7 : i64
    %304 = func.call @cc_make_string(%302, %303) : (!llvm.ptr, i64) -> i64
    %305 = func.call @cc_intern(%301, %304) : (i64, i64) -> i64
    %306 = func.call @cc_nil_value() : () -> i64
    %307 = func.call @cc_cons(%305, %306) : (i64, i64) -> i64
    %308 = func.call @cc_values_pack(%307) : (i64) -> i64
    func.call @stack_push_pointer(%305) : (i64) -> ()
    func.call @stack_push_nil() : () -> ()
    func.call @stack_push_pointer(%159) : (i64) -> ()
    %309 = func.call @stack_pop_pointer() : () -> i64
    %310 = arith.constant 2 : i64
    func.call @cc_funcall_stack(%309, %310) : (i64, i64) -> ()
    %311 = func.call @stack_pop_pointer() : () -> i64
    func.call @stack_push_pointer(%294) : (i64) -> ()
    func.call @stack_push_pointer(%298) : (i64) -> ()
    func.call @stack_push_pointer(%311) : (i64) -> ()
    %312 = llvm.mlir.addressof @str39 : !llvm.ptr
    %313 = func.call @cc_make_function_ref_const(%312) : (!llvm.ptr) -> i64
    %314 = arith.constant 3 : i64
    func.call @cc_funcall_stack(%313, %314) : (i64, i64) -> ()
    %315 = func.call @stack_depth() : () -> i64
    %316 = arith.constant 0 : i64
    %317 = arith.cmpi sgt, %315, %316 : i64
    scf.if %317 {
      %318 = func.call @stack_pop_pointer() : () -> i64
    }
    %319 = func.call @cc_nil_value() : () -> i64
    %320 = arith.cmpi ne, %319, %319 : i64
    scf.if %320 {
      func.call @stack_push_pointer(%319) : (i64) -> ()
    } else {
      %321 = llvm.mlir.addressof @str40 : !llvm.ptr
      %322 = func.call @cc_make_function_ref_const(%321) : (!llvm.ptr) -> i64
      %323 = arith.constant 0 : i64
      func.call @cc_funcall_stack(%322, %323) : (i64, i64) -> ()
    }
    func.call @cc_runtime_debug_stack_pop_name() : () -> ()
    func.return
  }
  llvm.mlir.global private constant @str0("__MAIN\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str1("A~%\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str2("format\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str3("finish-output\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str4("/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/modules/asdf/build/asdf.lisp\00") : !llvm.array<94 x i8>
  llvm.mlir.global private constant @str5("B~%\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str6("format\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str7("finish-output\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str8("ASDF\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str9("find-package\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str10("INITIALIZE-SOURCE-REGISTRY\00") : !llvm.array<27 x i8>
  llvm.mlir.global private constant @str11("find-symbol\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str12("Missing ASDF:INITIALIZE-SOURCE-REGISTRY\00") : !llvm.array<40 x i8>
  llvm.mlir.global private constant @str13("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str14("FIND-SYSTEM\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str15("find-symbol\00") : !llvm.array<12 x i8>
  llvm.mlir.global private constant @str16("Missing ASDF:FIND-SYSTEM\00") : !llvm.array<25 x i8>
  llvm.mlir.global private constant @str17("error\00") : !llvm.array<6 x i8>
  llvm.mlir.global private constant @str18("SOURCE-REGISTRY\00") : !llvm.array<16 x i8>
  llvm.mlir.global private constant @str19("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str20("TREE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str21("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str22("/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/modules/clingon-master/\00") : !llvm.array<89 x i8>
  llvm.mlir.global private constant @str23("TREE\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str24("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str25("/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work/modules/quicklisp/dists/quicklisp/software/\00") : !llvm.array<109 x i8>
  llvm.mlir.global private constant @str26("IGNORE-INHERITED-CONFIGURATION\00") : !llvm.array<31 x i8>
  llvm.mlir.global private constant @str27("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str28("C~%\00") : !llvm.array<4 x i8>
  llvm.mlir.global private constant @str29("format\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str30("finish-output\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str31("UIOP=~S~%\00") : !llvm.array<10 x i8>
  llvm.mlir.global private constant @str32("UIOP\00") : !llvm.array<5 x i8>
  llvm.mlir.global private constant @str33("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str34("format\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str35("finish-output\00") : !llvm.array<14 x i8>
  llvm.mlir.global private constant @str36("CLINGON=~S~%\00") : !llvm.array<13 x i8>
  llvm.mlir.global private constant @str37("CLINGON\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str38("KEYWORD\00") : !llvm.array<8 x i8>
  llvm.mlir.global private constant @str39("format\00") : !llvm.array<7 x i8>
  llvm.mlir.global private constant @str40("finish-output\00") : !llvm.array<14 x i8>
}
