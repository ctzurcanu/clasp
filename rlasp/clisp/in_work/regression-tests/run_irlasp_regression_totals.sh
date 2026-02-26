#!/bin/zsh
set -euo pipefail
set +x
unsetopt BG_NICE 2>/dev/null || true
setopt TYPESET_SILENT

BASE_DIR="/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work"
RUNNER="$BASE_DIR/regression-tests/run-all-irlasp.lisp"
IRLASP_BIN="/Users/christiantzurcanu/Documents/dev/clasp/rlasp/target/release/irlasp"
LOG_DIR="$BASE_DIR/regression-tests/logs"
RUNNER_FILE="$BASE_DIR/regression-tests/run-all-irlasp.lisp"
SUITES="${TEST_SUITES:-}"
SUITE_TIMEOUT_S="${SUITE_TIMEOUT_S:-120}"
MLIR_BEHAVIOR="${RLASP_MLIR_BEHAVIOR:-strict}"
MLIR_SELECTIVE_EVAL="${RLASP_MLIR_SELECTIVE_EVAL:-0}"
if [[ "$MLIR_BEHAVIOR" != "strict" ]]; then
  echo "Error: Only strict MLIR behavior is allowed for this harness (got RLASP_MLIR_BEHAVIOR=$MLIR_BEHAVIOR)" >&2
  exit 2
fi
MLIR_EXEC_ARTIFACT="${RLASP_MLIR_EXEC_ARTIFACT:-0}"

# Canonical suite test inventory for run-all-irlasp (47 suites, TOTAL 1953).
# This keeps totals stable even if a suite crashes before printing all test lines.
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

bool_enabled() {
  local raw="${1:-}"
  local v="${raw:l}"
  [[ -n "$v" && "$v" != "0" && "$v" != "false" && "$v" != "no" && "$v" != "off" ]]
}

RUN_STATUS=127
RUN_ELAPSED="0.000000"
RUN_PHASE_COMPILE="0.000000"
RUN_PHASE_EXEC="0.000000"

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
    BEGIN { ce=0; re=0; succ=0; failsum=0; }
    function note_test_status(kind, token, name) {
      sub(/Wanted values.*/, "", token);
      sub(/Unexpected error.*/, "", token);
      sub(/while evaluating.*/, "", token);
      sub(/^[[:space:]]+/, "", token);
      sub(/[[:space:]]+$/, "", token);
      if (match(token, /^[A-Za-z0-9._:+*\/<>=!?%&|-]+/)) {
        name=toupper(substr(token, RSTART, RLENGTH));
        # Corrupted MLIR traces can emit fake test labels like NIL.
        if (name != "" && name != "NIL" && name != "T" && name !~ /^~/) {
          status[name]=kind;
        }
      }
    }
    {
      rest=$0;
      while (1) {
        p=index(rest, "Passed ");
        f=index(rest, "Failed ");
        if (p==0 && f==0) break;
        if (p>0 && (f==0 || p<f)) {
          kind="P";
          chunk=substr(rest, p+7);
        } else {
          kind="F";
          chunk=substr(rest, f+7);
        }

        np=index(chunk, "Passed ");
        nf=index(chunk, "Failed ");
        nxt=0;
        if (np>0 && nf>0) nxt=(np<nf ? np : nf);
        else if (np>0) nxt=np;
        else if (nf>0) nxt=nf;

        token=(nxt>0 ? substr(chunk, 1, nxt-1) : chunk);
        note_test_status(kind, token);

        if (nxt>0) rest=substr(chunk, nxt);
        else break;
      }

      if (match($0, /Successes:[[:space:]]*[0-9]+/)) {
        token = substr($0, RSTART, RLENGTH);
        gsub(/[^0-9]/, "", token);
        if (token != "") {
          val = token + 0;
          if (val > succ) succ = val;
        }
      }
      if (match($0, /Failures:[[:space:]]*[0-9]+/)) {
        token = substr($0, RSTART, RLENGTH);
        gsub(/[^0-9]/, "", token);
        if (token != "") {
          val = token + 0;
          if (val > failsum) failsum = val;
        }
      }
    }
    /Regression: compile-file/ { ce++; next; }
    /^Error:/ { re++; next; }
    END {
      tp=0;
      tf=0;
      for (name in status) {
        if (status[name] == "P") tp++;
        else if (status[name] == "F") tf++;
      }
      if (tp == 0 && succ > 0) tp = succ;
      if (tf == 0 && failsum > 0) tf = failsum;
      total = tp + tf;
      nonpassing = tf + ce + re;
      printf("%d %d %d %d %d\n", total, tf, ce, re, nonpassing);
    }
  ' "$log_file"
}

build_single_suite_runner() {
  local mode="$1"
  local suite="$2"
  local runner_file
  local suite_load_form
  if [[ "$mode" == "mlir" ]]; then
    # Keep suite load on runtime path in MLIR mode (not compile-time pre-eval).
    suite_load_form="(defun irlasp-runtime-suite-load () (load \"$BASE_DIR/regression-tests/$suite.lisp\"))
(irlasp-runtime-suite-load)"
  else
    suite_load_form="(load-if-compiled-correctly \"$BASE_DIR/regression-tests/$suite.lisp\")"
  fi
  runner_file="$(mktemp -t "irlasp-suite-runner-${suite}")"
  runner_file="${runner_file}.lisp"
  cat > "$runner_file" <<EOF
(in-package :cl-user)
(load "$BASE_DIR/regression-tests/framework.lisp")
(load "$BASE_DIR/regression-tests/set-unexpected-failures.lisp")
(in-package #:clasp-tests)
(reset-clasp-tests)
(message :emph "~%Running $suite suite...")
$suite_load_form
(show-test-summary)
(sys:quit 0)
EOF
  echo "$runner_file"
}

run_jit_suite_with_phase_timing() {
  local mode="$1"
  local suite="$2"
  local suite_log="$3"
  local runner_file="$4"
  local start end rc exec_mark
  local fifo_path
  local -a extra_env
  local compile_start compile_end compile_rc
  local exec_start exec_end exec_rc
  local module_name artifact_path
  local compile_log
  start="$(now_mono_ts)"
  exec_mark=""
  rc=127
  : > "$suite_log"

  extra_env=()
  if [[ "$mode" == "mlir" ]]; then
    extra_env=("RLASP_MLIR_BEHAVIOR=$MLIR_BEHAVIOR" "RLASP_MLIR_SELECTIVE_EVAL=$MLIR_SELECTIVE_EVAL")
  fi

  if [[ "$mode" == "mlir" ]] && bool_enabled "$MLIR_EXEC_ARTIFACT"; then
    module_name="${runner_file:t:r}"
    artifact_path="/tmp/${module_name}.mlirbc"
    compile_log="${suite_log}.compile"
    rm -f "$artifact_path"
    : > "$compile_log"

    compile_start="$(now_mono_ts)"
    set +e
    if [[ -n "$TIMEOUT_BIN" ]]; then
      env TEST_SUITES="$suite" "${extra_env[@]}" RLASP_SAVE_ARTIFACTS=1 RLASP_MLIR_COMPILE_ONLY=1 \
        "$TIMEOUT_BIN" -k 5 "${SUITE_TIMEOUT_S}" "$IRLASP_BIN" -m "$mode" "$runner_file" >> "$compile_log" 2>&1
      compile_rc=$?
    else
      env TEST_SUITES="$suite" "${extra_env[@]}" RLASP_SAVE_ARTIFACTS=1 RLASP_MLIR_COMPILE_ONLY=1 \
        "$IRLASP_BIN" -m "$mode" "$runner_file" >> "$compile_log" 2>&1
      compile_rc=$?
    fi
    set -e
    compile_end="$(now_mono_ts)"
    RUN_PHASE_COMPILE="$(float_sub "$compile_end" "$compile_start")"

    if [[ "$compile_rc" -ne 0 ]]; then
      cat "$compile_log" >> "$suite_log"
      RUN_STATUS="$compile_rc"
      RUN_PHASE_EXEC="0.000000"
      RUN_ELAPSED="$RUN_PHASE_COMPILE"
      return
    fi

    if [[ ! -f "$artifact_path" ]]; then
      cat "$compile_log" >> "$suite_log"
      echo "SUITE_RUN_ERROR $suite missing_mlirbc_artifact $artifact_path" >> "$suite_log"
      RUN_STATUS=1
      RUN_PHASE_EXEC="0.000000"
      RUN_ELAPSED="$RUN_PHASE_COMPILE"
      return
    fi

    printf '[HARNESS-COMPILE] mode=%s suite=%s artifact=%s compile_log=%s\n' \
      "$mode" "$suite" "$artifact_path" "$compile_log" >> "$suite_log"

    exec_start="$(now_mono_ts)"
    set +e
    if [[ -n "$TIMEOUT_BIN" ]]; then
      env TEST_SUITES="$suite" "${extra_env[@]}" \
        "$TIMEOUT_BIN" -k 5 "${SUITE_TIMEOUT_S}" "$IRLASP_BIN" -m "$mode" "$artifact_path" >> "$suite_log" 2>&1
      exec_rc=$?
    else
      env TEST_SUITES="$suite" "${extra_env[@]}" \
        "$IRLASP_BIN" -m "$mode" "$artifact_path" >> "$suite_log" 2>&1
      exec_rc=$?
    fi
    set -e
    exec_end="$(now_mono_ts)"
    RUN_PHASE_EXEC="$(float_sub "$exec_end" "$exec_start")"
    RUN_ELAPSED="$(float_add "$RUN_PHASE_COMPILE" "$RUN_PHASE_EXEC")"
    RUN_STATUS="$exec_rc"
    printf '[HARNESS-TIMING] mode=%s suite=%s status=%s elapsed_s=%s compile_s=%s exec_s=%s artifact=%s\n' \
      "$mode" "$suite" "$RUN_STATUS" "$RUN_ELAPSED" "$RUN_PHASE_COMPILE" "$RUN_PHASE_EXEC" "$artifact_path" >> "$suite_log"
    return
  fi

  fifo_path="$(mktemp -t "irlasp-${mode}-suite-stream")"
  rm -f "$fifo_path"
  mkfifo "$fifo_path"

  set +e
  if [[ -n "$TIMEOUT_BIN" ]]; then
    (env TEST_SUITES="$suite" "${extra_env[@]}" "$TIMEOUT_BIN" -k 5 "${SUITE_TIMEOUT_S}" "$IRLASP_BIN" -m "$mode" "$runner_file" > "$fifo_path" 2>&1) &
  else
    (env TEST_SUITES="$suite" "${extra_env[@]}" "$IRLASP_BIN" -m "$mode" "$runner_file" > "$fifo_path" 2>&1) &
  fi
  local cmd_pid=$!
  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ -z "$exec_mark" ]]; then
      case "$line" in
        *"Passed "*|*"Failed "*|"Error:"*|"[Executing __main]"|"[Executing __main_batch_"*)
          exec_mark="$(now_mono_ts)"
          ;;
      esac
    fi
    print -r -- "$line"
  done < "$fifo_path" >> "$suite_log"
  wait "$cmd_pid"
  rc=$?
  set -e
  rm -f "$fifo_path"

  end="$(now_mono_ts)"
  RUN_STATUS="$rc"
  RUN_ELAPSED="$(float_sub "$end" "$start")"
  if [[ -n "$exec_mark" ]]; then
    RUN_PHASE_COMPILE="$(float_sub "$exec_mark" "$start")"
    RUN_PHASE_EXEC="$(float_sub "$end" "$exec_mark")"
  else
    RUN_PHASE_COMPILE="$RUN_ELAPSED"
    RUN_PHASE_EXEC="0.000000"
  fi
}

run_one_suite() {
  local mode="$1"
  local suite="$2"
  local suite_log="$3"
  local runner_file="$RUNNER"
  local rc=0
  local start end
  RUN_STATUS=127
  RUN_ELAPSED="0.000000"
  RUN_PHASE_COMPILE="0.000000"
  RUN_PHASE_EXEC="0.000000"

  if [[ "$mode" == "mlir" || "$mode" == "fasl" ]]; then
    runner_file="$(build_single_suite_runner "$mode" "$suite")"
    run_jit_suite_with_phase_timing "$mode" "$suite" "$suite_log" "$runner_file"
    rm -f "$runner_file"
    return 0
  fi

  start="$(now_mono_ts)"
  set +e
  if [[ -n "$TIMEOUT_BIN" ]]; then
    TEST_SUITES="$suite" "$TIMEOUT_BIN" -k 5 "${SUITE_TIMEOUT_S}" "$IRLASP_BIN" "$RUNNER" > "$suite_log" 2>&1
    rc=$?
  else
    TEST_SUITES="$suite" "$IRLASP_BIN" "$RUNNER" > "$suite_log" 2>&1
    rc=$?
  fi
  set -e
  end="$(now_mono_ts)"
  RUN_STATUS="$rc"
  RUN_ELAPSED="$(float_sub "$end" "$start")"
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
  local mode_compile_sum="0.000000"
  local mode_exec_sum="0.000000"

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
  if [[ "$mode" == "mlir" ]]; then
    echo "MLIR_BEHAVIOR $MLIR_BEHAVIOR" | tee -a "$summary_file"
    echo "MLIR_SELECTIVE_EVAL $MLIR_SELECTIVE_EVAL" | tee -a "$summary_file"
    echo "MLIR_EXEC_ARTIFACT $MLIR_EXEC_ARTIFACT" | tee -a "$summary_file"
  fi

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
    local suite_elapsed suite_compile suite_exec
    echo "[$idx/${#suites[@]}] suite=$suite" | tee -a "$summary_file"
    run_one_suite "$mode" "$suite" "$suite_log"
    local rc="$RUN_STATUS"
    suite_elapsed="$RUN_ELAPSED"
    suite_compile="$RUN_PHASE_COMPILE"
    suite_exec="$RUN_PHASE_EXEC"
    if [[ "$mode" == "mlir" || "$mode" == "fasl" ]]; then
      printf '[HARNESS-TIMING] mode=%s suite=%s status=%s elapsed_s=%s compile_s=%s exec_s=%s\n' \
        "$mode" "$suite" "$rc" "$suite_elapsed" "$suite_compile" "$suite_exec" >> "$suite_log"
      mode_compile_sum="$(float_add "$mode_compile_sum" "$suite_compile")"
      mode_exec_sum="$(float_add "$mode_exec_sum" "$suite_exec")"
    else
      printf '[HARNESS-TIMING] mode=%s suite=%s status=%s elapsed_s=%s\n' \
        "$mode" "$suite" "$rc" "$suite_elapsed" >> "$suite_log"
    fi
    suite_time_sum="$(float_add "$suite_time_sum" "$suite_elapsed")"
    cat "$suite_log" >> "$log_file"
    if [[ "$mode" == "mlir" || "$mode" == "fasl" ]]; then
      echo "\n===== SUITE $suite (mode=$mode rc=$rc total_s=$suite_elapsed compile_s=$suite_compile exec_s=$suite_exec) =====" >> "$log_file"
    else
      echo "\n===== SUITE $suite (mode=$mode rc=$rc elapsed_s=$suite_elapsed) =====" >> "$log_file"
    fi

    local m_total m_failed m_ce m_re m_non
    read -r m_total m_failed m_ce m_re m_non <<< "$(parse_suite_metrics "$suite_log")"
    local observed_total="$m_total"
    local observed_failed="$m_failed"
    local expected_total="${EXPECTED_SUITE_TOTALS[$suite]:-}"
    if [[ -n "$expected_total" ]] && (( observed_total < expected_total )); then
      local observed_passed=$(( observed_total - observed_failed ))
      if (( observed_passed < 0 )); then
        observed_passed=0
      fi
      m_total="$expected_total"
      m_failed=$(( expected_total - observed_passed ))
      if (( m_failed < 0 )); then
        m_failed=0
      fi
      # Unreached tests are counted as non-passing when execution aborts early.
      m_non=$(( m_non + (expected_total - observed_total) ))
    fi
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
    if [[ "$mode" == "mlir" || "$mode" == "fasl" ]]; then
      echo "SUITE $(printf '%-24s' "$suite") TOTAL $m_total FAILED $m_failed PASSED $((m_total-m_failed)) TIME_TOTAL_S $suite_elapsed TIME_COMPILE_S $suite_compile TIME_EXEC_S $suite_exec" >> "$summary_file"
    else
      echo "SUITE $(printf '%-24s' "$suite") TOTAL $m_total FAILED $m_failed PASSED $((m_total-m_failed)) TIME_S $suite_elapsed" >> "$summary_file"
    fi
  done

  mode_end="$(now_mono_ts)"
  mode_wall_s="$(float_sub "$mode_end" "$mode_start")"
  printf '[HARNESS-TIMING] mode=%s suites=%s suite_time_sum_s=%s wall_clock_s=%s\n' \
    "$mode" "${#suites[@]}" "$suite_time_sum" "$mode_wall_s" >> "$log_file"
  if [[ "$mode" == "mlir" ]]; then
    echo "TOTAL $total FAILED $tf COMPILE_ERRORS $ce RUN_ERRORS $re NON_PASSING $nonpassing PASSED $tp SUITE_TIME_SUM_S $suite_time_sum MLIR_COMPILE_SUM_S $mode_compile_sum MLIR_EXEC_SUM_S $mode_exec_sum WALL_CLOCK_S $mode_wall_s" >> "$summary_file"
  elif [[ "$mode" == "fasl" ]]; then
    echo "TOTAL $total FAILED $tf COMPILE_ERRORS $ce RUN_ERRORS $re NON_PASSING $nonpassing PASSED $tp SUITE_TIME_SUM_S $suite_time_sum FASL_COMPILE_SUM_S $mode_compile_sum FASL_EXEC_SUM_S $mode_exec_sum WALL_CLOCK_S $mode_wall_s" >> "$summary_file"
  else
    echo "TOTAL $total FAILED $tf COMPILE_ERRORS $ce RUN_ERRORS $re NON_PASSING $nonpassing PASSED $tp SUITE_TIME_SUM_S $suite_time_sum WALL_CLOCK_S $mode_wall_s" >> "$summary_file"
  fi
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
  fasl)
    run_mode "fasl" "$LOG_DIR/irlasp-fasl-$STAMP.log"
    ;;
  mlir)
    run_mode "mlir" "$LOG_DIR/irlasp-mlir-$STAMP.log"
    ;;
  both)
    run_mode "interpreter" "$LOG_DIR/irlasp-interpreter-$STAMP.log"
    run_mode "mlir" "$LOG_DIR/irlasp-mlir-$STAMP.log"
    ;;
  jit)
    run_mode "fasl" "$LOG_DIR/irlasp-fasl-$STAMP.log"
    run_mode "mlir" "$LOG_DIR/irlasp-mlir-$STAMP.log"
    ;;
  *)
    echo "Usage: $0 [interpreter|fasl|mlir|both|jit]"
    exit 2
    ;;
esac
