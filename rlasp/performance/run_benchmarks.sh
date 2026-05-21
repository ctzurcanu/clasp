#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
STAMP="$(date +%Y%m%d-%H%M%S)"
LOG_DIR="${SCRIPT_DIR}/logs/${STAMP}"
mkdir -p "$LOG_DIR"

SBCL_BIN="${SBCL_BIN:-/opt/homebrew/bin/sbcl}"
CLASP_BIN="${CLASP_BIN:-/opt/homebrew/bin/clasp}"
IRLASP_BIN="${IRLASP_BIN:-/Users/christiantzurcanu/Documents/dev/clasp/rlasp/target/release/irlasp}"
AOT_SCRIPT="${AOT_SCRIPT:-/Users/christiantzurcanu/Documents/dev/clasp/rlasp/scripts/mlirbc_aot.sh}"
RUN_TIMEOUT_S="${RUN_TIMEOUT_S:-180}"
IRLASP_MEMORY_CEILING_MB="${IRLASP_MEMORY_CEILING_MB:-1024}"
IRLASP_MEMORY_CEILING_CHECK_MS="${IRLASP_MEMORY_CEILING_CHECK_MS:-100}"
RLASP_MLIR_TARGET_AOT="${RLASP_MLIR_TARGET_AOT:-1}"
BENCH_FILTER="${BENCH_FILTER:-}"
TIMEOUT_BIN=""
if command -v gtimeout >/dev/null 2>&1; then
  TIMEOUT_BIN="$(command -v gtimeout)"
elif command -v timeout >/dev/null 2>&1; then
  TIMEOUT_BIN="$(command -v timeout)"
fi

if [[ ! -x "$SBCL_BIN" ]]; then
  echo "Missing executable: SBCL_BIN=$SBCL_BIN"
  exit 2
fi
if [[ ! -x "$CLASP_BIN" ]]; then
  echo "Missing executable: CLASP_BIN=$CLASP_BIN"
  exit 2
fi
if [[ ! -x "$IRLASP_BIN" ]]; then
  echo "Missing executable: IRLASP_BIN=$IRLASP_BIN"
  exit 2
fi
if [[ ! -x "$AOT_SCRIPT" ]]; then
  echo "Missing executable: AOT_SCRIPT=$AOT_SCRIPT"
  exit 2
fi

RUN_RC=0
RUN_TIME_S="0.000000"

extract_real_time_s() {
  local time_file="$1"
  awk '/^real[[:space:]]+/ { printf "%.6f", $2; found=1 } END { if (!found) printf "0.000000" }' "$time_file"
}

float_add() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a + b) }'
}

float_div_or_na() {
  awk -v num="$1" -v den="$2" 'BEGIN {
    if (den == 0) {
      printf "NA"
    } else {
      printf "%.6f", (num / den)
    }
  }'
}

float_sub_floor_zero() {
  awk -v a="$1" -v b="$2" 'BEGIN { v=(a-b); if (v < 0) v=0; printf "%.6f", v }'
}

run_timed() {
  local stdout_file="$1"
  local stderr_file="$2"
  shift 2

  set +e
  if [[ -n "$TIMEOUT_BIN" ]]; then
    /usr/bin/time -p "$TIMEOUT_BIN" "$RUN_TIMEOUT_S" "$@" >"$stdout_file" 2>"$stderr_file"
  else
    /usr/bin/time -p "$@" >"$stdout_file" 2>"$stderr_file"
  fi
  RUN_RC=$?
  set -e
  RUN_TIME_S="$(extract_real_time_s "$stderr_file")"
}

result_line() {
  local f="$1"
  awk '/^ALGO=/{line=$0} END{if(line!="") print line}' "$f"
}

print_result_output() {
  local label="$1"
  local result="$2"
  local file="$3"
  if [[ -z "$result" ]]; then
    echo "    output: <no ALGO line>"
    return
  fi

  local len="${#result}"
  if [[ "$len" -le 240 ]]; then
    echo "    output: $result"
    return
  fi

  local head="${result[1,160]}"
  local tail="${result[-60,-1]}"
  local digest="unavailable"
  if command -v shasum >/dev/null 2>&1; then
    digest="$(printf '%s' "$result" | shasum -a 256 | awk '{print $1}')"
  elif command -v sha256sum >/dev/null 2>&1; then
    digest="$(printf '%s' "$result" | sha256sum | awk '{print $1}')"
  fi

  echo "    output: ${head} ... ${tail}"
  echo "    output_note: long output truncated for display; exact ${label} output is in $file"
  echo "    output_length_chars: $len"
  echo "    output_sha256: $digest"
}

exit_label() {
  local rc="$1"
  if [[ "$rc" -eq 0 ]]; then
    printf "success"
  else
    printf "failed"
  fi
}

match_label() {
  local bit="$1"
  if [[ "$bit" == "1" ]]; then
    printf "yes"
  else
    printf "no"
  fi
}

CSV_FILE="${LOG_DIR}/benchmark-results.csv"
echo "benchmark,args,sbcl_s,clasp_s,irlasp_interpret_s,irlasp_mlir_compile_s,irlasp_mlir_exec_s,irlasp_mlir_total_s,irlasp_aot_build_s,irlasp_aot_exec_s,irlasp_aot_total_s,sbcl_rc,clasp_rc,irlasp_interpret_rc,irlasp_mlir_compile_rc,irlasp_mlir_exec_rc,irlasp_aot_build_rc,irlasp_aot_exec_rc,cl_baseline,cl_expected_present,irlasp_interpret_match_cl,irlasp_mlir_match_cl,irlasp_aot_match_cl,result_match,relative_sbcl,relative_clasp" >"$CSV_FILE"
echo "IRLASP_MEMORY_CEILING_MB=$IRLASP_MEMORY_CEILING_MB"
echo "IRLASP_MEMORY_CEILING_CHECK_MS=$IRLASP_MEMORY_CEILING_CHECK_MS"
echo "RLASP_MLIR_TARGET_AOT=$RLASP_MLIR_TARGET_AOT"

while IFS='|' read -r bench_file bench_args_raw; do
  [[ -z "$bench_file" ]] && continue
  bench_path="${SCRIPT_DIR}/${bench_file}"
  if [[ ! -f "$bench_path" ]]; then
    echo "Missing benchmark file: $bench_path"
    exit 2
  fi

  args=()
  if [[ -n "${bench_args_raw}" ]]; then
    args=(${=bench_args_raw})
  fi

  bench_name="${bench_file%.lisp}"

  if [[ -n "$BENCH_FILTER" && ! "$bench_name" =~ $BENCH_FILTER ]]; then
    continue
  fi

  sbcl_out="${LOG_DIR}/${bench_name}.sbcl.out"
  sbcl_time="${LOG_DIR}/${bench_name}.sbcl.time"
  clasp_out="${LOG_DIR}/${bench_name}.clasp.out"
  clasp_time="${LOG_DIR}/${bench_name}.clasp.time"
  interp_out="${LOG_DIR}/${bench_name}.irlasp-interpret.out"
  interp_time="${LOG_DIR}/${bench_name}.irlasp-interpret.time"
  mlir_compile_out="${LOG_DIR}/${bench_name}.irlasp-mlir-compile.out"
  mlir_compile_time="${LOG_DIR}/${bench_name}.irlasp-mlir-compile.time"
  mlir_exec_out="${LOG_DIR}/${bench_name}.irlasp-mlir-exec.out"
  mlir_exec_time="${LOG_DIR}/${bench_name}.irlasp-mlir-exec.time"
  aot_build_out="${LOG_DIR}/${bench_name}.irlasp-aot-build.out"
  aot_build_time="${LOG_DIR}/${bench_name}.irlasp-aot-build.time"
  aot_exec_out="${LOG_DIR}/${bench_name}.irlasp-aot-exec.out"
  aot_exec_time="${LOG_DIR}/${bench_name}.irlasp-aot-exec.time"
  mlirbc_path="/tmp/${bench_name}.mlirbc"
  aot_out_dir="${LOG_DIR}/${bench_name}.aot"
  aot_exe_path="${aot_out_dir}/${bench_name}"
  : >"$mlir_exec_out"
  : >"$mlir_exec_time"
  : >"$aot_exec_out"
  : >"$aot_exec_time"

  run_timed "$sbcl_out" "$sbcl_time" \
    "$SBCL_BIN" --noinform --disable-debugger \
    --eval "(unless (find-package \"SI\") (make-package \"SI\" :use (list (find-package \"COMMON-LISP\"))))" \
    --eval "(defun %bench-sbcl-args () (let* ((v sb-ext:*posix-argv*) (p (position \"--\" v :test (lambda (a b) (string= a b))))) (if p (nthcdr (1+ p) v) (cdr v))))" \
    --eval "(setf (symbol-function (intern \"ARGC\" \"SI\")) (lambda () (length (%bench-sbcl-args))))" \
    --eval "(setf (symbol-function (intern \"ARGV\" \"SI\")) (lambda (n) (nth n (%bench-sbcl-args))))" \
    --eval "(let ((pkg (find-package \"SI\"))) (export (list (intern \"ARGC\" pkg) (intern \"ARGV\" pkg)) pkg))" \
    --script "$bench_path" -- "${args[@]}"
  sbcl_rc="$RUN_RC"
  sbcl_s="$RUN_TIME_S"

  run_timed "$clasp_out" "$clasp_time" \
    "$CLASP_BIN" --non-interactive --load "$bench_path" -- "${args[@]}"
  clasp_rc="$RUN_RC"
  clasp_s="$RUN_TIME_S"

  run_timed "$interp_out" "$interp_time" \
    env RLASP_MEMORY_CEILING_MB="$IRLASP_MEMORY_CEILING_MB" RLASP_MEMORY_CEILING_ACTION=exit RLASP_MEMORY_CEILING_CHECK_MS="$IRLASP_MEMORY_CEILING_CHECK_MS" \
      "$IRLASP_BIN" -m interpret "$bench_path" "${args[@]}"
  interp_rc="$RUN_RC"
  interp_s="$RUN_TIME_S"

  rm -f "$mlirbc_path"
  run_timed "$mlir_compile_out" "$mlir_compile_time" \
    env RLASP_MEMORY_CEILING_MB="$IRLASP_MEMORY_CEILING_MB" RLASP_MEMORY_CEILING_ACTION=exit RLASP_MEMORY_CEILING_CHECK_MS="$IRLASP_MEMORY_CEILING_CHECK_MS" \
      RLASP_SAVE_ARTIFACTS=1 RLASP_MLIR_COMPILE_ONLY=1 RLASP_MLIR_SELECTIVE_EVAL=1 RLASP_MLIR_TARGET_AOT="$RLASP_MLIR_TARGET_AOT" \
      "$IRLASP_BIN" -m mlir "$bench_path" "${args[@]}"
  mlir_compile_rc="$RUN_RC"
  mlir_compile_s="$RUN_TIME_S"

  if [[ "$mlir_compile_rc" -eq 0 && -f "$mlirbc_path" ]]; then
    run_timed "$mlir_exec_out" "$mlir_exec_time" \
      env RLASP_MEMORY_CEILING_MB="$IRLASP_MEMORY_CEILING_MB" RLASP_MEMORY_CEILING_ACTION=exit RLASP_MEMORY_CEILING_CHECK_MS="$IRLASP_MEMORY_CEILING_CHECK_MS" \
        "$IRLASP_BIN" -m mlir "$mlirbc_path" "${args[@]}"
    mlir_exec_rc="$RUN_RC"
    mlir_exec_s="$RUN_TIME_S"
  else
    if [[ "$mlir_compile_rc" -eq 0 ]]; then
      echo "ERROR: missing MLIR artifact at $mlirbc_path" >>"$mlir_compile_out"
    fi
    mlir_exec_s="0.000000"
    mlir_exec_rc=1
  fi
  mlir_total_s="$(float_add "$mlir_compile_s" "$mlir_exec_s")"

  rm -rf "$aot_out_dir"
  if [[ "$mlir_compile_rc" -eq 0 && -f "$mlirbc_path" ]]; then
    run_timed "$aot_build_out" "$aot_build_time" \
      env RLASP_MEMORY_CEILING_MB="$IRLASP_MEMORY_CEILING_MB" RLASP_MEMORY_CEILING_ACTION=exit RLASP_MEMORY_CEILING_CHECK_MS="$IRLASP_MEMORY_CEILING_CHECK_MS" \
        "$AOT_SCRIPT" "$mlirbc_path" --out-dir "$aot_out_dir" --name "$bench_name" --kinds exe --no-smoke
    aot_build_rc="$RUN_RC"
    aot_build_s="$RUN_TIME_S"
  else
    aot_build_rc=1
    aot_build_s="0.000000"
  fi

  if [[ "$aot_build_rc" -eq 0 && -x "$aot_exe_path" ]]; then
    run_timed "$aot_exec_out" "$aot_exec_time" \
      env RLASP_MEMORY_CEILING_MB="$IRLASP_MEMORY_CEILING_MB" RLASP_MEMORY_CEILING_ACTION=exit RLASP_MEMORY_CEILING_CHECK_MS="$IRLASP_MEMORY_CEILING_CHECK_MS" \
        "$aot_exe_path" "${args[@]}"
    aot_exec_rc="$RUN_RC"
    aot_exec_s="$RUN_TIME_S"
  else
    if [[ "$aot_build_rc" -eq 0 ]]; then
      echo "ERROR: missing AOT executable at $aot_exe_path" >>"$aot_build_out"
    fi
    aot_exec_rc=1
    aot_exec_s="0.000000"
  fi
  aot_total_s="$(float_add "$aot_build_s" "$aot_exec_s")"
  relative_sbcl="$(float_div_or_na "$aot_exec_s" "$sbcl_s")"
  relative_clasp="$(float_div_or_na "$aot_exec_s" "$clasp_s")"

  sbcl_result="$(result_line "$sbcl_out")"
  clasp_result="$(result_line "$clasp_out")"
  interp_result="$(result_line "$interp_out")"
  mlir_result="$(result_line "$mlir_exec_out")"
  aot_result="$(result_line "$aot_exec_out")"
  cl_baseline="none"
  cl_expected=""
  if [[ "$sbcl_rc" -eq 0 && -n "$sbcl_result" ]]; then
    cl_baseline="sbcl"
    cl_expected="$sbcl_result"
  elif [[ "$clasp_rc" -eq 0 && -n "$clasp_result" ]]; then
    cl_baseline="clasp"
    cl_expected="$clasp_result"
  fi
  cl_expected_present="0"
  interp_match_cl="0"
  mlir_match_cl="0"
  aot_match_cl="0"
  result_match="0"
  if [[ -n "$cl_expected" ]]; then
    cl_expected_present="1"
    if [[ "$interp_rc" -eq 0 && "$interp_result" == "$cl_expected" ]]; then
      interp_match_cl="1"
    fi
    if [[ "$mlir_exec_rc" -eq 0 && "$mlir_result" == "$cl_expected" ]]; then
      mlir_match_cl="1"
    fi
    if [[ "$aot_exec_rc" -eq 0 && "$aot_result" == "$cl_expected" ]]; then
      aot_match_cl="1"
    fi
    if [[ "$interp_match_cl" == "1" && "$mlir_match_cl" == "1" && "$aot_match_cl" == "1" ]]; then
      result_match="1"
    fi
  fi

  args_for_csv="${bench_args_raw//,/;}"
  echo "${bench_name},\"${args_for_csv}\",${sbcl_s},${clasp_s},${interp_s},${mlir_compile_s},${mlir_exec_s},${mlir_total_s},${aot_build_s},${aot_exec_s},${aot_total_s},${sbcl_rc},${clasp_rc},${interp_rc},${mlir_compile_rc},${mlir_exec_rc},${aot_build_rc},${aot_exec_rc},${cl_baseline},${cl_expected_present},${interp_match_cl},${mlir_match_cl},${aot_match_cl},${result_match},${relative_sbcl},${relative_clasp}" >>"$CSV_FILE"

  echo ""
  echo "BENCHMARK $bench_name args=(${bench_args_raw})"
  echo "  SBCL"
  echo "    exit: ${sbcl_rc} ($(exit_label "$sbcl_rc"))"
  echo "    time_s: $sbcl_s"
  print_result_output "SBCL" "$sbcl_result" "$sbcl_out"
  echo "  CLASP"
  echo "    exit: ${clasp_rc} ($(exit_label "$clasp_rc"))"
  echo "    time_s: $clasp_s"
  print_result_output "CLASP" "$clasp_result" "$clasp_out"
  echo "  rlasp interpret"
  echo "    exit: ${interp_rc} ($(exit_label "$interp_rc"))"
  echo "    time_s: $interp_s"
  print_result_output "rlasp interpret" "$interp_result" "$interp_out"
  echo "    matches CL baseline: $(match_label "$interp_match_cl")"
  echo "  rlasp mlir"
  echo "    compile_exit: ${mlir_compile_rc} ($(exit_label "$mlir_compile_rc"))"
  echo "    compile_time_s: $mlir_compile_s"
  echo "    exec_exit: ${mlir_exec_rc} ($(exit_label "$mlir_exec_rc"))"
  echo "    exec_time_s: $mlir_exec_s"
  echo "    total_time_s: $mlir_total_s"
  print_result_output "rlasp mlir" "$mlir_result" "$mlir_exec_out"
  echo "    matches CL baseline: $(match_label "$mlir_match_cl")"
  echo "  rlasp aot"
  echo "    build_exit: ${aot_build_rc} ($(exit_label "$aot_build_rc"))"
  echo "    build_time_s: $aot_build_s"
  echo "    exec_exit: ${aot_exec_rc} ($(exit_label "$aot_exec_rc"))"
  echo "    exec_time_s: $aot_exec_s"
  echo "    relative_sbcl: $relative_sbcl"
  echo "    relative_clasp: $relative_clasp"
  echo "    total_time_s: $aot_total_s"
  print_result_output "rlasp aot" "$aot_result" "$aot_exec_out"
  echo "    matches CL baseline: $(match_label "$aot_match_cl")"
  echo "  baseline: $cl_baseline"
  echo "  all rlasp modes match CL baseline: $(match_label "$result_match")"
done <<'EOF'
fibonacci_recursive.lisp|28
fibonacci_iterative.lisp|900000
tco_sum.lisp|1000
sieve_primes.lisp|900000
gcd_loop.lisp|140000 832040 514229
list_sum.lisp|1200000
hash_table_stress.lisp|1200000 20000
vector_dot.lisp|1500000
string_count.lisp|120000
fixnum_lcg.lisp|1200000 12345 67890
function_call_hotloop.lisp|800000
EOF

echo "CSV: $CSV_FILE"
