#!/bin/zsh
set -euo pipefail
set +x
unsetopt BG_NICE 2>/dev/null || true
setopt TYPESET_SILENT

BASE_DIR="/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work"
RUNNER_FILE="$BASE_DIR/regression-tests/run-all-irlasp.lisp"
IRLASP_BIN="/Users/christiantzurcanu/Documents/dev/clasp/rlasp/target/release/irlasp"
AOT_SCRIPT="/Users/christiantzurcanu/Documents/dev/clasp/rlasp/scripts/mlirbc_aot.sh"
LOG_DIR="$BASE_DIR/regression-tests/logs"
SUITES="${TEST_SUITES:-}"
SUITE_TIMEOUT_S="${SUITE_TIMEOUT_S:-120}"
SUITE_REPEAT_COUNT="${SUITE_REPEAT_COUNT:-10}"
IRLASP_MEMORY_CEILING_MB="${IRLASP_MEMORY_CEILING_MB:-1024}"
IRLASP_MEMORY_CEILING_CHECK_MS="${IRLASP_MEMORY_CEILING_CHECK_MS:-100}"
MLIR_EVAL_LOAD_FOR_COMPILE="${RLASP_MLIR_EVAL_LOAD_FOR_COMPILE:-0}"
MLIR_BEHAVIOR="${RLASP_MLIR_BEHAVIOR:-strict}"
FORCE_BRIDGE_BUILTINS="${RLASP_FORCE_BRIDGE_BUILTINS:-1}"
AOT_DISABLE_GC="${RLASP_DISABLE_GC:-1}"
AOT_KEEP_SUITE_ARTIFACTS="${AOT_KEEP_SUITE_ARTIFACTS:-0}"
if [[ "$MLIR_BEHAVIOR" != "strict" ]]; then
  echo "Error: Only strict MLIR behavior is allowed for AOT harness (got RLASP_MLIR_BEHAVIOR=$MLIR_BEHAVIOR)" >&2
  exit 2
fi
if ! [[ "$SUITE_REPEAT_COUNT" =~ ^[0-9]+$ ]] || (( SUITE_REPEAT_COUNT < 1 )); then
  echo "Error: SUITE_REPEAT_COUNT must be an integer >= 1 (got $SUITE_REPEAT_COUNT)" >&2
  exit 2
fi

mkdir -p "$LOG_DIR"
cd "$BASE_DIR"
STAMP="$(date +%Y%m%d-%H%M%S)-$$"
MAIN_LOG="$LOG_DIR/irlasp-mlir-aot-${STAMP}.log"
SUMMARY_FILE="$LOG_DIR/irlasp-mlir-aot-${STAMP}.summary.txt"

typeset -A EXPECTED_SUITE_TOTALS
EXPECTED_SUITE_TOTALS=(
  [defcallback-native]=1
  [lowlevel]=1
  [fastgf]=4
  [array0]=35
  [tests01]=9
  [finalizers]=4
  [strings01]=34
  [cons01]=45
  [sequences01]=122
  [clos]=22
  [mop]=3
  [update-instance-abort]=9
  [numbers]=259
  [ehkiller]=3
  [package]=106
  [structures]=30
  [symbol0]=20
  [string-comparison0]=448
  [bit-array0]=108
  [bit-array1]=18
  [character0]=37
  [unicode]=6
  [hash-tables0]=42
  [misc]=54
  [read01]=103
  [printer01]=101
  [streams01]=54
  [environment01]=5
  [types01]=25
  [control01]=46
  [iteration]=2
  [loop]=21
  [numbers-core]=12
  [unwind]=1
  [encodings]=11
  [environment]=28
  [conditions]=2
  [float-features]=8
  [debug]=19
  [mp]=44
  [interrupt]=6
  [posix]=11
  [btb]=12
  [system-construction]=5
  [extensions]=10
  [run-program]=7
  [snapshot]=0
)

now_mono_ts() {
  perl -MTime::HiRes=clock_gettime,CLOCK_MONOTONIC -e 'printf "%.9f\n", clock_gettime(CLOCK_MONOTONIC)'
}

float_add() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a + b) }'
}

float_sub() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a - b) }'
}

extract_suites() {
  awk '
    /defparameter \*irlasp-suites\*/ { in_list=1; next }
    in_list {
      while (match($0, /"[^"]+"/)) {
        s=substr($0, RSTART+1, RLENGTH-2);
        print s;
        $0=substr($0, RSTART+RLENGTH);
      }
      if ($0 ~ /\)\)/) { in_list=0; next }
    }
  ' "$RUNNER_FILE"
}

AOT_TRACE_TEST_PROGRESS="${RLASP_TRACE_TEST_PROGRESS:-0}"

create_suite_runner() {
  local suite="$1"
  local run_id="$2"
  local runner_path="$LOG_DIR/irlasp-aot-suite-${STAMP}-${run_id}-${suite}.lisp"
  {
    echo "(in-package :cl-user)"
    echo "(load \"$BASE_DIR/regression-tests/framework.lisp\")"
    echo "(load \"$BASE_DIR/regression-tests/set-unexpected-failures.lisp\")"
    echo "(in-package #:clasp-tests)"
    if [[ "$AOT_TRACE_TEST_PROGRESS" == "1" || "$AOT_TRACE_TEST_PROGRESS" == "true" ]]; then
      echo "(setf *trace-test-progress* t)"
    else
      echo "(setf *trace-test-progress* nil)"
    fi
    echo "(reset-clasp-tests)"
    echo "(message :emph \"~%Running $suite suite...\")"
    echo "(load \"$BASE_DIR/regression-tests/$suite.lisp\")"
    echo "(show-test-summary)"
    # Emit machine-readable counts to stderr so harness parsing is robust even if
    # suites dynamically rebind *standard-output*.
    echo "(format *error-output* \"AOT_COUNTS PASSED ~d FAILED ~d~%\""
    echo "        (+ (length *expected-passed-tests*) (length *unexpected-passed-tests*))"
    echo "        (+ (length *expected-failed-tests*) (length *unexpected-failed-tests*)))"
  } > "$runner_path"
  echo "$runner_path"
}

extract_pass_fail_counts() {
  local suite_log="$1"
  local passed failed
  read -r passed failed < <(
    awk '
      /^AOT_COUNTS[[:space:]]+PASSED[[:space:]]+/ {
        p=$3; f=$5;
      }
      END {
        if (p ~ /^[0-9]+$/ && f ~ /^[0-9]+$/) print p, f;
      }
    ' "$suite_log"
  )
  if [[ -n "${passed:-}" && -n "${failed:-}" ]]; then
    echo "$passed $failed"
    return
  fi
  passed="$(awk 'BEGIN{c=0} /^[[:space:]]*Passed[[:space:]]+/ { c++ } END{ print c }' "$suite_log")"
  failed="$(awk 'BEGIN{c=0} /^[[:space:]]*Failed[[:space:]]+/ { c++ } END{ print c }' "$suite_log")"
  echo "$passed $failed"
}

normalize_suite_counts() {
  local expected="$1"
  local passed="$2"
  local failed="$3"

  [[ "$passed" =~ ^[0-9]+$ ]] || passed=0
  [[ "$failed" =~ ^[0-9]+$ ]] || failed=0

  if (( passed > expected )); then
    passed="$expected"
  fi
  if (( failed > expected )); then
    failed="$expected"
  fi

  local total=$((passed + failed))
  if (( total < expected )); then
    failed=$((failed + expected - total))
  elif (( total > expected )); then
    failed=$((expected - passed))
    if (( failed < 0 )); then
      failed=0
      passed="$expected"
    fi
  fi
  echo "$passed $failed"
}

extract_time_field() {
  local aot_log="$1"
  local key="$2"
  awk -v k="$key" '
    /^TIMES_S / {
      for (i=1; i<=NF; i++) {
        split($i, kv, "=");
        if (kv[1] == k) {
          print kv[2];
          exit;
        }
      }
    }
  ' "$aot_log"
}

if command -v gtimeout >/dev/null 2>&1; then
  TIMEOUT_BIN="gtimeout"
elif command -v timeout >/dev/null 2>&1; then
  TIMEOUT_BIN="timeout"
else
  TIMEOUT_BIN=""
fi

if [[ ! -x "$IRLASP_BIN" ]]; then
  echo "Error: irlasp binary not executable: $IRLASP_BIN" >&2
  exit 2
fi
if [[ ! -x "$AOT_SCRIPT" ]]; then
  echo "Error: AOT script not executable: $AOT_SCRIPT" >&2
  exit 2
fi

typeset -a suites
typeset -a repeated_suites
if [[ -n "$SUITES" ]]; then
  IFS=',' read -rA suites <<< "$SUITES"
else
  while IFS= read -r s; do
    [[ -n "$s" ]] && suites+=("$s")
  done < <(extract_suites)
fi
for ((rep=1; rep<=SUITE_REPEAT_COUNT; rep++)); do
  for suite in "${suites[@]}"; do
    repeated_suites+=("$suite")
  done
done

: > "$MAIN_LOG"
: > "$SUMMARY_FILE"
echo "Running mode=mlir-aot log=$MAIN_LOG" | tee -a "$SUMMARY_FILE"
echo "SUITE_TIMEOUT_S $SUITE_TIMEOUT_S" | tee -a "$SUMMARY_FILE"
echo "SUITE_REPEAT_COUNT $SUITE_REPEAT_COUNT" | tee -a "$SUMMARY_FILE"
echo "SUITE_RUNS_TOTAL ${#repeated_suites[@]}" | tee -a "$SUMMARY_FILE"
echo "TIMEOUT_BIN ${TIMEOUT_BIN:-none}" | tee -a "$SUMMARY_FILE"
echo "IRLASP_MEMORY_CEILING_MB $IRLASP_MEMORY_CEILING_MB" | tee -a "$SUMMARY_FILE"
echo "IRLASP_MEMORY_CEILING_CHECK_MS $IRLASP_MEMORY_CEILING_CHECK_MS" | tee -a "$SUMMARY_FILE"
echo "RLASP_MLIR_EVAL_LOAD_FOR_COMPILE $MLIR_EVAL_LOAD_FOR_COMPILE" | tee -a "$SUMMARY_FILE"
echo "RLASP_FORCE_BRIDGE_BUILTINS $FORCE_BRIDGE_BUILTINS" | tee -a "$SUMMARY_FILE"
echo "RLASP_DISABLE_GC $AOT_DISABLE_GC" | tee -a "$SUMMARY_FILE"
echo "AOT_SCRIPT $AOT_SCRIPT" | tee -a "$SUMMARY_FILE"

mode_start="$(now_mono_ts)"
suite_time_sum="0.000000"
mlirbc_compile_sum="0.000000"
aot_native_build_sum="0.000000"
aot_lower_sum="0.000000"
aot_translate_sum="0.000000"
aot_object_sum="0.000000"
aot_link_exe_sum="0.000000"
aot_exec_sum="0.000000"

total=0
passed_total=0
failed_total=0
compile_errors=0
run_errors=0
nonpassing=0
timed_out=0

idx=0
for suite in "${repeated_suites[@]}"; do
  idx=$((idx + 1))
  echo "[$idx/${#repeated_suites[@]}] suite=$suite" | tee -a "$SUMMARY_FILE"

  expected_total="${EXPECTED_SUITE_TOTALS[$suite]:-0}"
  suite_out_dir="$LOG_DIR/irlasp-mlir-aot-${STAMP}-${idx}-${suite}"
  mkdir -p "$suite_out_dir"

  runner_file="$(create_suite_runner "$suite" "$idx")"
  module_name="${runner_file:t:r}"
  artifact_path="/tmp/${module_name}.mlirbc"
  compile_log="$suite_out_dir/compile.log"
  aot_log="$suite_out_dir/aot.log"
  suite_log="$suite_out_dir/run.log"

  rm -f "$artifact_path"
  : > "$compile_log"
  : > "$aot_log"
  : > "$suite_log"

  suite_start="$(now_mono_ts)"

  compile_start="$(now_mono_ts)"
  set +e
  if [[ -n "$TIMEOUT_BIN" ]]; then
    env RLASP_MLIR_BEHAVIOR=strict RLASP_MLIR_SELECTIVE_EVAL=0 RLASP_MLIR_EVAL_LOAD_FOR_COMPILE="$MLIR_EVAL_LOAD_FOR_COMPILE" \
      RLASP_MLIR_EXEC_ARTIFACT=1 RLASP_SAVE_ARTIFACTS=1 RLASP_MLIR_COMPILE_ONLY=1 \
      RLASP_FORCE_BRIDGE_BUILTINS="$FORCE_BRIDGE_BUILTINS" \
      RLASP_MEMORY_CEILING_MB="$IRLASP_MEMORY_CEILING_MB" \
      RLASP_MEMORY_CEILING_ACTION=exit \
      RLASP_MEMORY_CEILING_CHECK_MS="$IRLASP_MEMORY_CEILING_CHECK_MS" \
      "$TIMEOUT_BIN" -k 5 "$SUITE_TIMEOUT_S" "$IRLASP_BIN" -m mlir "$runner_file" > "$compile_log" 2>&1
    compile_rc=$?
  else
    env RLASP_MLIR_BEHAVIOR=strict RLASP_MLIR_SELECTIVE_EVAL=0 RLASP_MLIR_EVAL_LOAD_FOR_COMPILE="$MLIR_EVAL_LOAD_FOR_COMPILE" \
      RLASP_MLIR_EXEC_ARTIFACT=1 RLASP_SAVE_ARTIFACTS=1 RLASP_MLIR_COMPILE_ONLY=1 \
      RLASP_FORCE_BRIDGE_BUILTINS="$FORCE_BRIDGE_BUILTINS" \
      RLASP_MEMORY_CEILING_MB="$IRLASP_MEMORY_CEILING_MB" \
      RLASP_MEMORY_CEILING_ACTION=exit \
      RLASP_MEMORY_CEILING_CHECK_MS="$IRLASP_MEMORY_CEILING_CHECK_MS" \
      "$IRLASP_BIN" -m mlir "$runner_file" > "$compile_log" 2>&1
    compile_rc=$?
  fi
  set -e
  compile_end="$(now_mono_ts)"
  compile_s="$(float_sub "$compile_end" "$compile_start")"
  mlirbc_compile_sum="$(float_add "$mlirbc_compile_sum" "$compile_s")"

  if [[ ! -f "$artifact_path" ]]; then
    typeset -a artifact_candidates
    artifact_candidates=(/tmp/${module_name}*.mlirbc(Nom[1]))
    if (( ${#artifact_candidates[@]} > 0 )); then
      artifact_path="${artifact_candidates[1]}"
    fi
  fi

  lower_s="0.000000"
  translate_s="0.000000"
  object_s="0.000000"
  link_exe_s="0.000000"
  native_build_s="0.000000"
  exec_s="0.000000"
  run_rc=0

  if [[ "$compile_rc" -ne 0 || ! -f "$artifact_path" ]]; then
    compile_errors=$((compile_errors + 1))
    run_rc=1
  else
    native_start="$(now_mono_ts)"
    set +e
    if [[ -n "$TIMEOUT_BIN" ]]; then
      "$TIMEOUT_BIN" -k 5 "$SUITE_TIMEOUT_S" "$AOT_SCRIPT" "$artifact_path" --out-dir "$suite_out_dir" --name "$suite" --kinds exe --no-smoke > "$aot_log" 2>&1
      aot_rc=$?
    else
      "$AOT_SCRIPT" "$artifact_path" --out-dir "$suite_out_dir" --name "$suite" --kinds exe --no-smoke > "$aot_log" 2>&1
      aot_rc=$?
    fi
    set -e
    native_end="$(now_mono_ts)"
    native_build_s="$(float_sub "$native_end" "$native_start")"
    aot_native_build_sum="$(float_add "$aot_native_build_sum" "$native_build_s")"

    lower_s="$(extract_time_field "$aot_log" "LOWER_MLIR" || true)"
    translate_s="$(extract_time_field "$aot_log" "TRANSLATE_LLVM" || true)"
    object_s="$(extract_time_field "$aot_log" "EMIT_OBJECT" || true)"
    link_exe_s="$(extract_time_field "$aot_log" "LINK_EXE" || true)"
    [[ -z "$lower_s" ]] && lower_s="0.000000"
    [[ -z "$translate_s" ]] && translate_s="0.000000"
    [[ -z "$object_s" ]] && object_s="0.000000"
    [[ -z "$link_exe_s" ]] && link_exe_s="0.000000"
    aot_lower_sum="$(float_add "$aot_lower_sum" "$lower_s")"
    aot_translate_sum="$(float_add "$aot_translate_sum" "$translate_s")"
    aot_object_sum="$(float_add "$aot_object_sum" "$object_s")"
    aot_link_exe_sum="$(float_add "$aot_link_exe_sum" "$link_exe_s")"

    exe_path="$suite_out_dir/$suite"
    if [[ "$aot_rc" -ne 0 || ! -x "$exe_path" ]]; then
      compile_errors=$((compile_errors + 1))
      run_rc=1
    else
      exec_start="$(now_mono_ts)"
      set +e
      if [[ -n "$TIMEOUT_BIN" ]]; then
        env \
          RLASP_FORCE_BRIDGE_BUILTINS="$FORCE_BRIDGE_BUILTINS" \
          RLASP_DISABLE_GC="$AOT_DISABLE_GC" \
          RLASP_MEMORY_CEILING_MB="$IRLASP_MEMORY_CEILING_MB" \
          RLASP_MEMORY_CEILING_ACTION=exit \
          RLASP_MEMORY_CEILING_CHECK_MS="$IRLASP_MEMORY_CEILING_CHECK_MS" \
          "$TIMEOUT_BIN" -k 5 "$SUITE_TIMEOUT_S" "$exe_path" > "$suite_log" 2>&1
        run_rc=$?
      else
        env \
          RLASP_FORCE_BRIDGE_BUILTINS="$FORCE_BRIDGE_BUILTINS" \
          RLASP_DISABLE_GC="$AOT_DISABLE_GC" \
          RLASP_MEMORY_CEILING_MB="$IRLASP_MEMORY_CEILING_MB" \
          RLASP_MEMORY_CEILING_ACTION=exit \
          RLASP_MEMORY_CEILING_CHECK_MS="$IRLASP_MEMORY_CEILING_CHECK_MS" \
          "$exe_path" > "$suite_log" 2>&1
        run_rc=$?
      fi
      set -e
      exec_end="$(now_mono_ts)"
      exec_s="$(float_sub "$exec_end" "$exec_start")"
      aot_exec_sum="$(float_add "$aot_exec_sum" "$exec_s")"
    fi
  fi

  suite_end="$(now_mono_ts)"
  suite_total_s="$(float_sub "$suite_end" "$suite_start")"
  suite_time_sum="$(float_add "$suite_time_sum" "$suite_total_s")"

  suite_passed=0
  suite_failed=0
  if [[ "$run_rc" -eq 0 ]]; then
    # Prefer direct log-line counting for AOT suites. This avoids parser
    # ambiguity when suite footer formatting is partially unsupported.
    parsed_passed="$(awk 'BEGIN{c=0} /^[[:space:]]*Passed[[:space:]]+/ { c++ } END{ print c }' "$suite_log")"
    parsed_failed="$(awk 'BEGIN{c=0} /^[[:space:]]*Failed[[:space:]]+/ { c++ } END{ print c }' "$suite_log")"
    [[ "$parsed_passed" =~ ^[0-9]+$ ]] || parsed_passed=0
    [[ "$parsed_failed" =~ ^[0-9]+$ ]] || parsed_failed=0
    read -r suite_passed suite_failed <<< "$(normalize_suite_counts "$expected_total" "${parsed_passed:-0}" "${parsed_failed:-0}")"
  else
    if [[ "$run_rc" -eq 124 || "$run_rc" -eq 137 ]]; then
      timed_out=$((timed_out + 1))
    fi
    run_errors=$((run_errors + 1))
    suite_passed=0
    suite_failed="$expected_total"
  fi

  suite_total="$expected_total"
  total=$((total + suite_total))
  passed_total=$((passed_total + suite_passed))
  failed_total=$((failed_total + suite_failed))

  echo "SUITE ${suite:0:24} RUN $idx TOTAL $suite_total FAILED $suite_failed PASSED $suite_passed TIME_TOTAL_S $suite_total_s TIME_MLIRBC_COMPILE_S $compile_s TIME_AOT_NATIVE_BUILD_S $native_build_s TIME_AOT_LOWER_S $lower_s TIME_AOT_TRANSLATE_S $translate_s TIME_AOT_OBJECT_S $object_s TIME_AOT_LINK_EXE_S $link_exe_s TIME_AOT_EXEC_S $exec_s" | tee -a "$SUMMARY_FILE"
  {
    echo "===== SUITE $suite ====="
    echo "RUNNER $runner_file"
    echo "ARTIFACT $artifact_path"
    echo "OUT_DIR $suite_out_dir"
    echo "COMPILE_RC $compile_rc"
    echo "RUN_RC $run_rc"
    echo "TIME_TOTAL_S $suite_total_s"
    echo "TIME_MLIRBC_COMPILE_S $compile_s"
    echo "TIME_AOT_NATIVE_BUILD_S $native_build_s"
    echo "TIME_AOT_EXEC_S $exec_s"
    echo "TIME_AOT_LOWER_S $lower_s"
    echo "TIME_AOT_TRANSLATE_S $translate_s"
    echo "TIME_AOT_OBJECT_S $object_s"
    echo "TIME_AOT_LINK_EXE_S $link_exe_s"
    cat "$compile_log"
    cat "$aot_log"
    cat "$suite_log"
    echo
  } >> "$MAIN_LOG"

  if [[ "$AOT_KEEP_SUITE_ARTIFACTS" != "1" ]]; then
    rm -f "$runner_file" "$artifact_path"
    rm -rf "$suite_out_dir"
  fi
done

mode_end="$(now_mono_ts)"
mode_wall_s="$(float_sub "$mode_end" "$mode_start")"

nonpassing=$((failed_total + compile_errors + run_errors))

echo "TOTAL $total FAILED $failed_total COMPILE_ERRORS $compile_errors RUN_ERRORS $run_errors NON_PASSING $nonpassing PASSED $passed_total SUITE_TIME_SUM_S $suite_time_sum MLIRBC_COMPILE_SUM_S $mlirbc_compile_sum AOT_NATIVE_BUILD_SUM_S $aot_native_build_sum AOT_LOWER_SUM_S $aot_lower_sum AOT_TRANSLATE_SUM_S $aot_translate_sum AOT_OBJECT_SUM_S $aot_object_sum AOT_LINK_EXE_SUM_S $aot_link_exe_sum AOT_EXEC_SUM_S $aot_exec_sum WALL_CLOCK_S $mode_wall_s" | tee -a "$SUMMARY_FILE"
echo "SUITES_TOTAL ${#suites[@]} SUITE_REPEAT_COUNT $SUITE_REPEAT_COUNT SUITE_RUNS_TOTAL ${#repeated_suites[@]} SUITES_TIMED_OUT $timed_out" | tee -a "$SUMMARY_FILE"

echo "Summary (mlir-aot):"
cat "$SUMMARY_FILE"
