#!/bin/zsh
set -euo pipefail

BASE_DIR="/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work"
RUNNER="$BASE_DIR/regression-tests/run-all-irlasp.lisp"
IRLASP_BIN="/Users/christiantzurcanu/Documents/dev/clasp/rlasp/target/release/irlasp"
LOG_DIR="$BASE_DIR/regression-tests/logs"
RUNNER_FILE="$BASE_DIR/regression-tests/run-all-irlasp.lisp"
SUITES="${TEST_SUITES:-}"
SUITE_TIMEOUT_S="${SUITE_TIMEOUT_S:-120}"

mkdir -p "$LOG_DIR"
cd "$BASE_DIR"
STAMP="$(date +%Y%m%d-%H%M%S)-$$"

now_mono_ts() {
  perl -MTime::HiRes=clock_gettime,CLOCK_MONOTONIC -e 'printf "%.9f\n", clock_gettime(CLOCK_MONOTONIC)'
}

float_add() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a + b) }'
}

float_sub() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a - b) }'
}

if command -v gtimeout >/dev/null 2>&1; then
  TIMEOUT_BIN="gtimeout"
elif command -v timeout >/dev/null 2>&1; then
  TIMEOUT_BIN="timeout"
else
  TIMEOUT_BIN=""
fi

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

parse_suite_metrics() {
  local log_file="$1"
  awk '
    BEGIN { tp=0; tf=0; ce=0; re=0; }
    /^Passed / { tp++; next; }
    /^Failed / { tf++; next; }
    /Regression: compile-file/ { ce++; next; }
    /^Error:/ { re++; next; }
    END {
      total = tp + tf;
      nonpassing = tf + ce + re;
      printf("%d %d %d %d %d\n", total, tf, ce, re, nonpassing);
    }
  ' "$log_file"
}

run_one_suite() {
  local mode="$1"
  local suite="$2"
  local suite_log="$3"
  local rc=0
  set +e
  if [[ -n "$TIMEOUT_BIN" ]]; then
    if [[ "$mode" == "interpreter" ]]; then
      TEST_SUITES="$suite" "$TIMEOUT_BIN" -k 5 "${SUITE_TIMEOUT_S}" "$IRLASP_BIN" "$RUNNER" > "$suite_log" 2>&1
      rc=$?
    else
      TEST_SUITES="$suite" "$TIMEOUT_BIN" -k 5 "${SUITE_TIMEOUT_S}" "$IRLASP_BIN" -m mlir "$RUNNER" > "$suite_log" 2>&1
      rc=$?
    fi
  else
    if [[ "$mode" == "interpreter" ]]; then
      TEST_SUITES="$suite" "$IRLASP_BIN" "$RUNNER" > "$suite_log" 2>&1
      rc=$?
    else
      TEST_SUITES="$suite" "$IRLASP_BIN" -m mlir "$RUNNER" > "$suite_log" 2>&1
      rc=$?
    fi
  fi
  set -e
  echo "$rc"
}

run_mode() {
  local mode="$1"
  local log_file="$2"
  local summary_file="${log_file%.log}.summary.txt"
  local suites=()
  local idx=0
  local mode_start
  local mode_end
  local mode_wall_s
  local suite_time_sum="0.000000"

  if [[ -n "$SUITES" ]]; then
    IFS=',' read -rA suites <<< "$SUITES"
  else
    while IFS= read -r s; do
      [[ -n "$s" ]] && suites+=("$s")
    done < <(extract_suites)
  fi

  : > "$log_file"
  : > "$summary_file"
  echo "Running mode=$mode log=$log_file" | tee -a "$summary_file"
  echo "SUITE_TIMEOUT_S $SUITE_TIMEOUT_S" | tee -a "$summary_file"
  echo "TIMEOUT_BIN ${TIMEOUT_BIN:-none}" | tee -a "$summary_file"

  local tp=0
  local tf=0
  local ce=0
  local re=0
  local total=0
  local nonpassing=0
  local timed_out=0
  mode_start="$(now_mono_ts)"

  for suite in "${suites[@]}"; do
    idx=$((idx+1))
    local suite_log="$LOG_DIR/irlasp-${mode}-${STAMP}-${suite}.log"
    local suite_start suite_end suite_elapsed
    echo "[$idx/${#suites[@]}] suite=$suite" | tee -a "$summary_file"
    suite_start="$(now_mono_ts)"
    local rc
    rc="$(run_one_suite "$mode" "$suite" "$suite_log")"
    suite_end="$(now_mono_ts)"
    suite_elapsed="$(float_sub "$suite_end" "$suite_start")"
    printf '[HARNESS-TIMING] mode=%s suite=%s status=%s elapsed_s=%s\n' \
      "$mode" "$suite" "$rc" "$suite_elapsed" >> "$suite_log"
    suite_time_sum="$(float_add "$suite_time_sum" "$suite_elapsed")"
    cat "$suite_log" >> "$log_file"
    echo "\n===== SUITE $suite (mode=$mode rc=$rc elapsed_s=$suite_elapsed) =====" >> "$log_file"

    local m_total m_failed m_ce m_re m_non
    read -r m_total m_failed m_ce m_re m_non <<< "$(parse_suite_metrics "$suite_log")"
    if [[ "$rc" -eq 124 || "$rc" -eq 137 ]]; then
      timed_out=$((timed_out+1))
      m_re=$((m_re+1))
      m_non=$((m_non+1))
      echo "SUITE_TIMEOUT $suite rc=$rc timeout_s=$SUITE_TIMEOUT_S" >> "$summary_file"
    elif [[ "$rc" -ne 0 ]]; then
      m_re=$((m_re+1))
      m_non=$((m_non+1))
      echo "SUITE_RUN_ERROR $suite rc=$rc" >> "$summary_file"
    fi

    tp=$((tp + (m_total - m_failed)))
    tf=$((tf + m_failed))
    ce=$((ce + m_ce))
    re=$((re + m_re))
    total=$((total + m_total))
    nonpassing=$((nonpassing + m_non))
    echo "SUITE $(printf '%-24s' "$suite") TOTAL $m_total FAILED $m_failed PASSED $((m_total-m_failed)) TIME_S $suite_elapsed" >> "$summary_file"
  done

  mode_end="$(now_mono_ts)"
  mode_wall_s="$(float_sub "$mode_end" "$mode_start")"
  printf '[HARNESS-TIMING] mode=%s suites=%s suite_time_sum_s=%s wall_clock_s=%s\n' \
    "$mode" "${#suites[@]}" "$suite_time_sum" "$mode_wall_s" >> "$log_file"
  echo "TOTAL $total FAILED $tf COMPILE_ERRORS $ce RUN_ERRORS $re NON_PASSING $nonpassing PASSED $tp SUITE_TIME_SUM_S $suite_time_sum WALL_CLOCK_S $mode_wall_s" >> "$summary_file"
  echo "SUITES_TOTAL ${#suites[@]} SUITES_TIMED_OUT $timed_out" >> "$summary_file"
  echo "Summary ($mode):"
  cat "$summary_file"
  echo
}

MODE="${1:-both}"
case "$MODE" in
  interpreter)
    run_mode "interpreter" "$LOG_DIR/irlasp-interpreter-$STAMP.log"
    ;;
  mlir)
    run_mode "mlir" "$LOG_DIR/irlasp-mlir-$STAMP.log"
    ;;
  both)
    run_mode "interpreter" "$LOG_DIR/irlasp-interpreter-$STAMP.log"
    run_mode "mlir" "$LOG_DIR/irlasp-mlir-$STAMP.log"
    ;;
  *)
    echo "Usage: $0 [interpreter|mlir|both]"
    exit 2
    ;;
esac
