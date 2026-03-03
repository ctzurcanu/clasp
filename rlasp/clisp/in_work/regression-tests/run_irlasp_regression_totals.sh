#!/bin/zsh
set -euo pipefail
set +x
unsetopt BG_NICE 2>/dev/null || true
setopt TYPESET_SILENT

BASE_DIR="/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work"
RUNNER="$BASE_DIR/regression-tests/run-all-irlasp.lisp"
IRLASP_BIN="/Users/christiantzurcanu/Documents/dev/clasp/rlasp/target/release/irlasp"
CLASP_BIN="${CLASP_BIN:-/opt/homebrew/bin/clasp}"
SBCL_BIN="${SBCL_BIN:-/opt/homebrew/bin/sbcl}"
LOG_DIR="$BASE_DIR/regression-tests/logs"
RUNNER_FILE="$BASE_DIR/regression-tests/run-all-irlasp.lisp"
SUITES="${TEST_SUITES:-}"
SUITE_TIMEOUT_S="${SUITE_TIMEOUT_S:-120}"
COMPARE_CL_BASELINE="${COMPARE_CL_BASELINE:-1}"
REQUIRE_CL_BASELINE_SUCCESS="${REQUIRE_CL_BASELINE_SUCCESS:-1}"
CL_BASELINE_ENGINE="${CL_BASELINE_ENGINE:-clasp}"
MLIR_BEHAVIOR="${RLASP_MLIR_BEHAVIOR:-strict}"
MLIR_SELECTIVE_EVAL="${RLASP_MLIR_SELECTIVE_EVAL:-0}"
MLIR_SPLIT_PROCESS="${RLASP_MLIR_SPLIT_PROCESS:-0}"
IRLASP_GC_FREE_SPACE_DIVISOR="${IRLASP_GC_FREE_SPACE_DIVISOR:-100000}"
IRLASP_MEMORY_CEILING_MB="${IRLASP_MEMORY_CEILING_MB:-1024}"
IRLASP_MEMORY_CEILING_CHECK_MS="${IRLASP_MEMORY_CEILING_CHECK_MS:-100}"
if [[ "$MLIR_BEHAVIOR" != "strict" ]]; then
  echo "Error: Only strict MLIR behavior is allowed for this harness (got RLASP_MLIR_BEHAVIOR=$MLIR_BEHAVIOR)" >&2
  exit 2
fi
MLIR_EXEC_ARTIFACT="${RLASP_MLIR_EXEC_ARTIFACT:-1}"
typeset -a IRLASP_ENV=()
if [[ -n "$IRLASP_GC_FREE_SPACE_DIVISOR" ]]; then
  IRLASP_ENV+=("GC_FREE_SPACE_DIVISOR=$IRLASP_GC_FREE_SPACE_DIVISOR")
fi
if [[ -n "$IRLASP_MEMORY_CEILING_MB" ]]; then
  IRLASP_ENV+=("RLASP_MEMORY_CEILING_MB=$IRLASP_MEMORY_CEILING_MB")
  IRLASP_ENV+=("RLASP_MEMORY_CEILING_ACTION=exit")
  IRLASP_ENV+=("RLASP_MEMORY_CEILING_CHECK_MS=$IRLASP_MEMORY_CEILING_CHECK_MS")
fi

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

if [[ ! -x "$CLASP_BIN" ]]; then
  if command -v clasp >/dev/null 2>&1; then
    CLASP_BIN="$(command -v clasp)"
  fi
fi
if [[ ! -x "$SBCL_BIN" ]]; then
  if command -v sbcl >/dev/null 2>&1; then
    SBCL_BIN="$(command -v sbcl)"
  fi
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
    BEGIN { ce=0; re=0; succ=0; failsum=0; in_success_list=0; success_blob=""; }
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
    function note_name_list(kind, blob, name) {
      gsub(/[()]/, " ", blob);
      while (match(blob, /[A-Za-z0-9._:+*\/<>=!?%&|-]+/)) {
        name=toupper(substr(blob, RSTART, RLENGTH));
        if (name != "" && name != "NIL" && name != "T" && name !~ /^~/ && name != "SUCCESSES") {
          status[name]=kind;
        }
        blob=substr(blob, RSTART + RLENGTH);
      }
    }
    {
      if (in_success_list) {
        success_blob = success_blob " " $0;
        if (index($0, ")") > 0) {
          note_name_list("P", success_blob);
          in_success_list=0;
          success_blob="";
        }
        next;
      }
      if (match($0, /^Successes:[[:space:]]*\(/)) {
        success_blob = substr($0, RSTART + RLENGTH);
        if (index(success_blob, ")") > 0) {
          note_name_list("P", success_blob);
          success_blob="";
        } else {
          in_success_list=1;
        }
        next;
      }

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

parse_suite_statuses() {
  local log_file="$1"
  awk '
    BEGIN { in_success_list=0; success_blob=""; }
    function note_test_status(kind, token, name) {
      sub(/Wanted values.*/, "", token);
      sub(/Unexpected error.*/, "", token);
      sub(/while evaluating.*/, "", token);
      sub(/^[[:space:]]+/, "", token);
      sub(/[[:space:]]+$/, "", token);
      if (match(token, /^[A-Za-z0-9._:+*\/<>=!?%&|-]+/)) {
        name=toupper(substr(token, RSTART, RLENGTH));
        if (name != "" && name != "NIL" && name != "T" && name !~ /^~/) {
          status[name]=kind;
        }
      }
    }
    function note_name_list(kind, blob, name) {
      gsub(/[()]/, " ", blob);
      while (match(blob, /[A-Za-z0-9._:+*\/<>=!?%&|-]+/)) {
        name=toupper(substr(blob, RSTART, RLENGTH));
        if (name != "" && name != "NIL" && name != "T" && name !~ /^~/ && name != "SUCCESSES") {
          status[name]=kind;
        }
        blob=substr(blob, RSTART + RLENGTH);
      }
    }
    {
      if (in_success_list) {
        success_blob = success_blob " " $0;
        if (index($0, ")") > 0) {
          note_name_list("P", success_blob);
          in_success_list=0;
          success_blob="";
        }
        next;
      }
      if (match($0, /^Successes:[[:space:]]*\(/)) {
        success_blob = substr($0, RSTART + RLENGTH);
        if (index(success_blob, ")") > 0) {
          note_name_list("P", success_blob);
          success_blob="";
        } else {
          in_success_list=1;
        }
        next;
      }

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
    }
    END {
      for (name in status) {
        printf("%s %s\n", name, status[name]);
      }
    }
  ' "$log_file"
}

build_baseline_suite_runner() {
  local suite="$1"
  local engine="$2"
  local runner_file
  runner_file="$(mktemp -t "clasp-suite-runner-${suite}")"
  runner_file="${runner_file}.lisp"
  local quit_form="(sys:quit 0)"
  if [[ "$engine" == "sbcl" ]]; then
    quit_form="(sb-ext:exit :code 0)"
  fi
  cat > "$runner_file" <<EOF
(in-package :cl-user)
(load "$BASE_DIR/regression-tests/framework.lisp")
(load "$BASE_DIR/regression-tests/set-unexpected-failures.lisp")
(in-package #:clasp-tests)
(reset-clasp-tests)
(message :emph "~%Running $suite suite...")
(load-if-compiled-correctly "$BASE_DIR/regression-tests/$suite.lisp")
(show-test-summary)
$quit_form
EOF
  echo "$runner_file"
}

count_suite_statuses() {
  local log_file="$1"
  parse_suite_statuses "$log_file" | awk 'END { print NR+0 }'
}

run_baseline_suite_with_engine() {
  local engine="$1"
  local suite="$2"
  local baseline_log="$3"
  local runner_file
  local -a cmd
  local rc=0
  runner_file="$(build_baseline_suite_runner "$suite" "$engine")"
  : > "$baseline_log"
  if [[ "$engine" == "clasp" ]]; then
    cmd=("$CLASP_BIN" --non-interactive --load "$runner_file")
  elif [[ "$engine" == "sbcl" ]]; then
    cmd=("$SBCL_BIN" --noinform --non-interactive --load "$runner_file")
  else
    rm -f "$runner_file"
    return 2
  fi
  set +e
  if [[ -n "$TIMEOUT_BIN" ]]; then
    env TEST_SUITES="$suite" "$TIMEOUT_BIN" -k 5 "${SUITE_TIMEOUT_S}" \
      "${cmd[@]}" > "$baseline_log" 2>&1
    rc=$?
  else
    env TEST_SUITES="$suite" "${cmd[@]}" > "$baseline_log" 2>&1
    rc=$?
  fi
  set -e
  rm -f "$runner_file"
  return "$rc"
}

BASELINE_LAST_ENGINE=""
run_cl_suite_baseline() {
  local suite="$1"
  local baseline_log="$2"
  local expected_total="${EXPECTED_SUITE_TOTALS[$suite]:-0}"
  local status_count=0
  local rc=0
  BASELINE_LAST_ENGINE=""

  run_and_validate_engine() {
    local engine="$1"
    BASELINE_LAST_ENGINE="$engine"
    run_baseline_suite_with_engine "$engine" "$suite" "$baseline_log"
    rc=$?
    if [[ "$rc" -ne 0 ]]; then
      return "$rc"
    fi
    status_count="$(count_suite_statuses "$baseline_log")"
    if (( expected_total == 0 || status_count > 0 )); then
      BASELINE_LAST_ENGINE="$engine"
      return 0
    fi
    return 65
  }

  case "$CL_BASELINE_ENGINE" in
    clasp)
      run_and_validate_engine "clasp"
      return $?
      ;;
    sbcl)
      run_and_validate_engine "sbcl"
      return $?
      ;;
    auto)
      if [[ -x "$CLASP_BIN" ]]; then
        run_and_validate_engine "clasp"
        return $?
      fi
      return 127
      ;;
    *)
      return 2
      ;;
  esac
}

run_clasp_suite_baseline() {
  local suite="$1"
  local baseline_log="$2"
  run_cl_suite_baseline "$suite" "$baseline_log"
  return $?
}

compare_suite_statuses() {
  local baseline_log="$1"
  local candidate_log="$2"
  typeset -A baseline_status
  typeset -A candidate_status
  local name test_status
  local correct=0
  local expected=0
  local mismatched=0
  local missing=0
  local extra=0

  while read -r name test_status; do
    [[ -z "${name:-}" || -z "${test_status:-}" ]] && continue
    baseline_status[$name]="$test_status"
  done < <(parse_suite_statuses "$baseline_log")
  while read -r name test_status; do
    [[ -z "${name:-}" || -z "${test_status:-}" ]] && continue
    candidate_status[$name]="$test_status"
  done < <(parse_suite_statuses "$candidate_log")

  for name in "${(@k)baseline_status}"; do
    expected=$((expected + 1))
    if [[ -z "${candidate_status[$name]-}" ]]; then
      missing=$((missing + 1))
      mismatched=$((mismatched + 1))
    elif [[ "${candidate_status[$name]}" == "${baseline_status[$name]}" ]]; then
      correct=$((correct + 1))
    else
      mismatched=$((mismatched + 1))
    fi
  done

  for name in "${(@k)candidate_status}"; do
    if [[ -z "${baseline_status[$name]-}" ]]; then
      extra=$((extra + 1))
      mismatched=$((mismatched + 1))
    fi
  done

  echo "$correct $expected $mismatched $missing $extra"
}

build_single_suite_runner() {
  local mode="$1"
  local suite="$2"
  local runner_file
  local suite_load_form
  if [[ "$mode" == "mlir" ]]; then
    # Keep suite load on runtime path in MLIR mode (not compile-time pre-eval
    # through load-if-compiled-correctly/FASL path).
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
  local -a exec_env
  local -a compile_env
  local compile_start compile_end compile_rc
  local exec_start exec_end exec_rc
  local module_name artifact_path
  local suite_artifact_path_lower suite_artifact_path_upper
  local compile_log
  start="$(now_mono_ts)"
  exec_mark=""
  rc=127
  : > "$suite_log"

  exec_env=()
  compile_env=()
  if [[ "$mode" == "mlir" ]]; then
    exec_env=(
      "RLASP_MLIR_BEHAVIOR=$MLIR_BEHAVIOR"
      "RLASP_MLIR_SELECTIVE_EVAL=$MLIR_SELECTIVE_EVAL"
      "RLASP_MLIR_EXEC_ARTIFACT=$MLIR_EXEC_ARTIFACT"
    )
  fi
  if [[ "$mode" == "mlir" && "$MLIR_SPLIT_PROCESS" == "1" ]]; then
    # Keep compile and execute in the same semantic mode.
    compile_env=(
      "RLASP_MLIR_BEHAVIOR=$MLIR_BEHAVIOR"
      "RLASP_MLIR_SELECTIVE_EVAL=$MLIR_SELECTIVE_EVAL"
      "RLASP_MLIR_EXEC_ARTIFACT=$MLIR_EXEC_ARTIFACT"
    )
  fi

  if [[ "$mode" == "mlir" && "$MLIR_SPLIT_PROCESS" == "1" ]]; then
    module_name="${runner_file:t:r}"
    artifact_path="/tmp/${module_name}.mlirbc"
    suite_artifact_path_lower="/tmp/${suite:l}.mlirbc"
    suite_artifact_path_upper="/tmp/${suite:u}.mlirbc"
    compile_log="${suite_log}.compile"
    rm -f "$artifact_path"
    : > "$compile_log"

    compile_start="$(now_mono_ts)"
    set +e
    if [[ -n "$TIMEOUT_BIN" ]]; then
      env TEST_SUITES="$suite" "${compile_env[@]}" "${IRLASP_ENV[@]}" RLASP_SAVE_ARTIFACTS=1 RLASP_MLIR_COMPILE_ONLY=1 \
        "$TIMEOUT_BIN" -k 5 "${SUITE_TIMEOUT_S}" "$IRLASP_BIN" -m "$mode" "$runner_file" >> "$compile_log" 2>&1
      compile_rc=$?
    else
      env TEST_SUITES="$suite" "${compile_env[@]}" "${IRLASP_ENV[@]}" RLASP_SAVE_ARTIFACTS=1 RLASP_MLIR_COMPILE_ONLY=1 \
        "$IRLASP_BIN" -m "$mode" "$runner_file" >> "$compile_log" 2>&1
      compile_rc=$?
    fi
    set -e
    compile_end="$(now_mono_ts)"
    RUN_PHASE_COMPILE="$(float_sub "$compile_end" "$compile_start")"

    if [[ ! -f "$artifact_path" ]]; then
      # In compile-only suite runners, irlasp often emits suite-named artifacts
      # (e.g. /tmp/numbers.mlirbc) rather than runner-named artifacts.
      if [[ -f "$suite_artifact_path_lower" ]]; then
        artifact_path="$suite_artifact_path_lower"
      elif [[ -f "$suite_artifact_path_upper" ]]; then
        artifact_path="$suite_artifact_path_upper"
      fi
    fi

    if [[ ! -f "$artifact_path" ]]; then
      cat "$compile_log" >> "$suite_log"
      echo "SUITE_RUN_ERROR $suite missing_mlirbc_artifact runner_path=/tmp/${module_name}.mlirbc suite_path_lower=$suite_artifact_path_lower suite_path_upper=$suite_artifact_path_upper" >> "$suite_log"
      RUN_STATUS=1
      RUN_PHASE_EXEC="0.000000"
      RUN_ELAPSED="$RUN_PHASE_COMPILE"
      return
    fi

    if [[ "$compile_rc" -ne 0 ]]; then
      echo "SUITE_COMPILE_WARN $suite compile_rc=$compile_rc artifact_present=1" >> "$suite_log"
    fi

    printf '[HARNESS-COMPILE] mode=%s suite=%s artifact=%s compile_log=%s\n' \
      "$mode" "$suite" "$artifact_path" "$compile_log" >> "$suite_log"

    exec_start="$(now_mono_ts)"
    set +e
    if [[ -n "$TIMEOUT_BIN" ]]; then
      env TEST_SUITES="$suite" "${exec_env[@]}" "${IRLASP_ENV[@]}" \
        "$TIMEOUT_BIN" -k 5 "${SUITE_TIMEOUT_S}" "$IRLASP_BIN" -m "$mode" "$artifact_path" >> "$suite_log" 2>&1
      exec_rc=$?
    else
      env TEST_SUITES="$suite" "${exec_env[@]}" "${IRLASP_ENV[@]}" \
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
    (env TEST_SUITES="$suite" "${exec_env[@]}" "${IRLASP_ENV[@]}" "$TIMEOUT_BIN" -k 5 "${SUITE_TIMEOUT_S}" "$IRLASP_BIN" -m "$mode" "$runner_file" > "$fifo_path" 2>&1) &
  else
    (env TEST_SUITES="$suite" "${exec_env[@]}" "${IRLASP_ENV[@]}" "$IRLASP_BIN" -m "$mode" "$runner_file" > "$fifo_path" 2>&1) &
  fi
  local cmd_pid=$!
  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ -z "$exec_mark" ]]; then
      if [[ "$mode" == "mlir" ]]; then
        case "$line" in
          *"[MLIR_EXEC_BEGIN]"*)
            exec_mark="$(now_mono_ts)"
            ;;
        esac
      else
        case "$line" in
          *"Passed "*|*"Failed "*|"Error:"*|"[Executing __main]"|"[Executing __main_batch_"*)
            exec_mark="$(now_mono_ts)"
            ;;
        esac
      fi
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
  local cleanup_runner=0
  local rc=0
  local start end
  RUN_STATUS=127
  RUN_ELAPSED="0.000000"
  RUN_PHASE_COMPILE="0.000000"
  RUN_PHASE_EXEC="0.000000"

  if [[ "$mode" == "mlir" || "$mode" == "fasl" ]]; then
    runner_file="$(build_single_suite_runner "$mode" "$suite")"
    cleanup_runner=1
    run_jit_suite_with_phase_timing "$mode" "$suite" "$suite_log" "$runner_file"
    if (( cleanup_runner )); then
      rm -f "$runner_file"
    fi
    return 0
  fi

  start="$(now_mono_ts)"
  set +e
  if [[ -n "$TIMEOUT_BIN" ]]; then
    env TEST_SUITES="$suite" "${IRLASP_ENV[@]}" "$TIMEOUT_BIN" -k 5 "${SUITE_TIMEOUT_S}" "$IRLASP_BIN" "$RUNNER" > "$suite_log" 2>&1
    rc=$?
  else
    env TEST_SUITES="$suite" "${IRLASP_ENV[@]}" "$IRLASP_BIN" "$RUNNER" > "$suite_log" 2>&1
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
  typeset -A suite_baseline_logs
  typeset -A suite_baseline_rcs
  typeset -A suite_baseline_engines
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
  echo "IRLASP_MEMORY_CEILING_MB $IRLASP_MEMORY_CEILING_MB" | tee -a "$summary_file"
  echo "IRLASP_MEMORY_CEILING_CHECK_MS $IRLASP_MEMORY_CEILING_CHECK_MS" | tee -a "$summary_file"
  if [[ "$mode" == "mlir" ]]; then
    echo "MLIR_BEHAVIOR $MLIR_BEHAVIOR" | tee -a "$summary_file"
    echo "MLIR_SELECTIVE_EVAL $MLIR_SELECTIVE_EVAL" | tee -a "$summary_file"
    echo "MLIR_EXEC_ARTIFACT $MLIR_EXEC_ARTIFACT" | tee -a "$summary_file"
    echo "MLIR_SPLIT_PROCESS $MLIR_SPLIT_PROCESS" | tee -a "$summary_file"
    echo "IRLASP_GC_FREE_SPACE_DIVISOR $IRLASP_GC_FREE_SPACE_DIVISOR" | tee -a "$summary_file"
  fi

  local tp=0
  local tf=0
  local ce=0
  local re=0
  local total=0
  local nonpassing=0
  local correct_total=0
  local expected_from_cl_total=0
  local mismatch_total=0
  local missing_total=0
  local extra_total=0
  local compared_suites=0
  local baseline_errors=0
  local baseline_unavailable=0
  local timed_out=0

  if [[ "$COMPARE_CL_BASELINE" == "1" ]]; then
    echo "CL_BASELINE_ENGINE $CL_BASELINE_ENGINE" | tee -a "$summary_file"
    echo "CLASP_BIN $CLASP_BIN" | tee -a "$summary_file"
    echo "SBCL_BIN $SBCL_BIN" | tee -a "$summary_file"
    echo "REQUIRE_CL_BASELINE_SUCCESS $REQUIRE_CL_BASELINE_SUCCESS" | tee -a "$summary_file"
    for suite in "${suites[@]}"; do
      local baseline_log="$LOG_DIR/cl-baseline-${STAMP}-${suite}.log"
      if run_cl_suite_baseline "$suite" "$baseline_log"; then
        suite_baseline_rcs[$suite]=0
      else
        suite_baseline_rcs[$suite]=$?
      fi
      suite_baseline_logs[$suite]="$baseline_log"
      suite_baseline_engines[$suite]="${BASELINE_LAST_ENGINE:-none}"
      if [[ "${suite_baseline_rcs[$suite]}" -ne 0 ]]; then
        if [[ "${suite_baseline_rcs[$suite]}" -eq 65 ]]; then
          baseline_unavailable=$((baseline_unavailable + 1))
          echo "BASELINE_SUITE_UNAVAILABLE $suite engine=${suite_baseline_engines[$suite]} rc=${suite_baseline_rcs[$suite]} log=$baseline_log" >> "$summary_file"
        else
          baseline_errors=$((baseline_errors + 1))
          echo "BASELINE_SUITE_WARN $suite engine=${suite_baseline_engines[$suite]} rc=${suite_baseline_rcs[$suite]} log=$baseline_log" >> "$summary_file"
        fi
      else
        echo "BASELINE_SUITE_OK $suite engine=${suite_baseline_engines[$suite]} log=$baseline_log" >> "$summary_file"
      fi
    done
  fi
  if [[ "$COMPARE_CL_BASELINE" == "1" && "$REQUIRE_CL_BASELINE_SUCCESS" == "1" && "$baseline_errors" -gt 0 ]]; then
    echo "ERROR CL baseline failed for $baseline_errors suite(s); correctness comparison is invalid." | tee -a "$summary_file" >&2
    return 3
  fi
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
    local suite_correct_num=$((m_total - m_failed))
    local suite_expected_from_cl_num="$m_total"
    local suite_mismatch_num=$((m_total - suite_correct_num))
    local suite_missing_num=0
    local suite_extra_num=0
    local suite_correct_display="$suite_correct_num"
    local suite_expected_from_cl_display="$suite_expected_from_cl_num"
    local suite_mismatch_display="$suite_mismatch_num"
    local suite_missing_display="$suite_missing_num"
    local suite_extra_display="$suite_extra_num"
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

    suite_correct_num=$((m_total - m_failed))
    suite_expected_from_cl_num="$m_total"
    suite_mismatch_num=$((m_total - suite_correct_num))
    suite_missing_num=0
    suite_extra_num=0
    suite_correct_display="$suite_correct_num"
    suite_expected_from_cl_display="$suite_expected_from_cl_num"
    suite_mismatch_display="$suite_mismatch_num"
    suite_missing_display="$suite_missing_num"
    suite_extra_display="$suite_extra_num"

    if [[ "$COMPARE_CL_BASELINE" == "1" ]]; then
      local baseline_rc="${suite_baseline_rcs[$suite]:-1}"
      local baseline_log="${suite_baseline_logs[$suite]:-}"
      if [[ "$baseline_rc" -eq 0 && -n "$baseline_log" && -f "$baseline_log" ]]; then
        read -r suite_correct_num suite_expected_from_cl_num suite_mismatch_num suite_missing_num suite_extra_num \
          <<< "$(compare_suite_statuses "$baseline_log" "$suite_log")"
        suite_correct_display="$suite_correct_num"
        suite_expected_from_cl_display="$suite_expected_from_cl_num"
        suite_mismatch_display="$suite_mismatch_num"
        suite_missing_display="$suite_missing_num"
        suite_extra_display="$suite_extra_num"
        compared_suites=$((compared_suites + 1))
      else
        suite_correct_num=0
        suite_expected_from_cl_num=0
        suite_mismatch_num=0
        suite_missing_num=0
        suite_extra_num=0
        suite_correct_display="NA"
        suite_expected_from_cl_display="NA"
        suite_mismatch_display="NA"
        suite_missing_display="NA"
        suite_extra_display="NA"
      fi
    else
      suite_correct_num=0
      suite_expected_from_cl_num=0
      suite_mismatch_num=0
      suite_missing_num=0
      suite_extra_num=0
      suite_correct_display="NA"
      suite_expected_from_cl_display="NA"
      suite_mismatch_display="NA"
      suite_missing_display="NA"
      suite_extra_display="NA"
    fi

    tp=$((tp + (m_total - m_failed)))
    tf=$((tf + m_failed))
    ce=$((ce + m_ce))
    re=$((re + m_re))
    total=$((total + m_total))
    nonpassing=$((nonpassing + m_non))
    correct_total=$((correct_total + suite_correct_num))
    expected_from_cl_total=$((expected_from_cl_total + suite_expected_from_cl_num))
    mismatch_total=$((mismatch_total + suite_mismatch_num))
    missing_total=$((missing_total + suite_missing_num))
    extra_total=$((extra_total + suite_extra_num))
    if [[ "$mode" == "mlir" || "$mode" == "fasl" ]]; then
      echo "SUITE $(printf '%-24s' "$suite") TOTAL $m_total FAILED $m_failed PASSED $((m_total-m_failed)) CORRECT: $suite_correct_display EXPECTED_FROM_CL: $suite_expected_from_cl_display MISMATCH: $suite_mismatch_display MISSING: $suite_missing_display EXTRA: $suite_extra_display TIME_TOTAL_S $suite_elapsed TIME_COMPILE_S $suite_compile TIME_EXEC_S $suite_exec" >> "$summary_file"
    else
      echo "SUITE $(printf '%-24s' "$suite") TOTAL $m_total FAILED $m_failed PASSED $((m_total-m_failed)) CORRECT: $suite_correct_display EXPECTED_FROM_CL: $suite_expected_from_cl_display MISMATCH: $suite_mismatch_display MISSING: $suite_missing_display EXTRA: $suite_extra_display TIME_S $suite_elapsed" >> "$summary_file"
    fi
  done

  mode_end="$(now_mono_ts)"
  mode_wall_s="$(float_sub "$mode_end" "$mode_start")"
  local correct_total_display="$correct_total"
  local expected_from_cl_total_display="$expected_from_cl_total"
  local mismatch_total_display="$mismatch_total"
  local missing_total_display="$missing_total"
  local extra_total_display="$extra_total"
  if [[ "$COMPARE_CL_BASELINE" != "1" ]]; then
    correct_total_display="NA"
    expected_from_cl_total_display="NA"
    mismatch_total_display="NA"
    missing_total_display="NA"
    extra_total_display="NA"
  elif [[ "$baseline_errors" -gt 0 || "$compared_suites" -eq 0 ]]; then
    correct_total_display="NA"
    expected_from_cl_total_display="NA"
    mismatch_total_display="NA"
    missing_total_display="NA"
    extra_total_display="NA"
  fi
  printf '[HARNESS-TIMING] mode=%s suites=%s suite_time_sum_s=%s wall_clock_s=%s\n' \
    "$mode" "${#suites[@]}" "$suite_time_sum" "$mode_wall_s" >> "$log_file"
  if [[ "$mode" == "mlir" ]]; then
    echo "TOTAL $total FAILED $tf COMPILE_ERRORS $ce RUN_ERRORS $re NON_PASSING $nonpassing PASSED $tp CORRECT: $correct_total_display EXPECTED_FROM_CL: $expected_from_cl_total_display MISMATCH: $mismatch_total_display MISSING: $missing_total_display EXTRA: $extra_total_display SUITE_TIME_SUM_S $suite_time_sum MLIR_COMPILE_SUM_S $mode_compile_sum MLIR_EXEC_SUM_S $mode_exec_sum WALL_CLOCK_S $mode_wall_s" >> "$summary_file"
  elif [[ "$mode" == "fasl" ]]; then
    echo "TOTAL $total FAILED $tf COMPILE_ERRORS $ce RUN_ERRORS $re NON_PASSING $nonpassing PASSED $tp CORRECT: $correct_total_display EXPECTED_FROM_CL: $expected_from_cl_total_display MISMATCH: $mismatch_total_display MISSING: $missing_total_display EXTRA: $extra_total_display SUITE_TIME_SUM_S $suite_time_sum FASL_COMPILE_SUM_S $mode_compile_sum FASL_EXEC_SUM_S $mode_exec_sum WALL_CLOCK_S $mode_wall_s" >> "$summary_file"
  else
    echo "TOTAL $total FAILED $tf COMPILE_ERRORS $ce RUN_ERRORS $re NON_PASSING $nonpassing PASSED $tp CORRECT: $correct_total_display EXPECTED_FROM_CL: $expected_from_cl_total_display MISMATCH: $mismatch_total_display MISSING: $missing_total_display EXTRA: $extra_total_display SUITE_TIME_SUM_S $suite_time_sum WALL_CLOCK_S $mode_wall_s" >> "$summary_file"
  fi
  echo "SUITES_TOTAL ${#suites[@]} SUITES_TIMED_OUT $timed_out CL_BASELINE_ERRORS $baseline_errors CL_BASELINE_UNAVAILABLE $baseline_unavailable CL_BASELINE_COMPARED_SUITES $compared_suites" >> "$summary_file"
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
