#!/bin/zsh
set -euo pipefail
unsetopt BG_NICE 2>/dev/null || true

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

IRLASP_BIN="${IRLASP_BIN:-/Users/christiantzurcanu/Documents/dev/clasp/rlasp/target/release/irlasp}"
SBCL_BIN="${SBCL_BIN:-$(command -v sbcl || true)}"
CLASP_BIN="${CLASP_BIN:-$(command -v clasp || true)}"
if [[ -z "$CLASP_BIN" && -x /opt/homebrew/bin/clasp ]]; then
  CLASP_BIN="/opt/homebrew/bin/clasp"
fi

LOG_DIR="${LOG_DIR:-$SCRIPT_DIR/logs}"
REQUIRE_BASELINE_PASS="${REQUIRE_BASELINE_PASS:-1}"
BASELINE_POLICY="${BASELINE_POLICY:-auto}"
HARNESS_MODE="${HARNESS_MODE:-auto}"
RUN_TIMEOUT_S="${RUN_TIMEOUT_S:-180}"
SBCL_TIMEOUT_S="${SBCL_TIMEOUT_S:-$RUN_TIMEOUT_S}"
CLASP_TIMEOUT_S="${CLASP_TIMEOUT_S:-$RUN_TIMEOUT_S}"
IRLASP_INTERP_TIMEOUT_S="${IRLASP_INTERP_TIMEOUT_S:-$RUN_TIMEOUT_S}"
IRLASP_MLIR_TIMEOUT_S="${IRLASP_MLIR_TIMEOUT_S:-$RUN_TIMEOUT_S}"
mkdir -p "$LOG_DIR"
STAMP="$(date +%Y%m%d-%H%M%S)"

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <file.lisp|directory>"
  echo "Optional env: SBCL_BIN, CLASP_BIN, IRLASP_BIN, LOG_DIR, REQUIRE_BASELINE_PASS, BASELINE_POLICY, HARNESS_MODE"
  echo "Optional env timeouts (seconds): RUN_TIMEOUT_S, SBCL_TIMEOUT_S, CLASP_TIMEOUT_S, IRLASP_INTERP_TIMEOUT_S, IRLASP_MLIR_TIMEOUT_S"
  echo "BASELINE_POLICY: auto|clasp|sbcl|sbcl_and_clasp (default: auto)"
  echo "HARNESS_MODE: auto|direct|regression (default: auto)"
  exit 2
fi

TARGET_INPUT="$1"
if [[ "$TARGET_INPUT" = /* ]]; then
  TARGET_PATH="$TARGET_INPUT"
else
  TARGET_PATH="$PWD/$TARGET_INPUT"
fi

if [[ ! -e "$TARGET_PATH" ]]; then
  echo "Error: input does not exist: $TARGET_PATH"
  exit 2
fi

if [[ "$HARNESS_MODE" != "auto" && "$HARNESS_MODE" != "direct" && "$HARNESS_MODE" != "regression" ]]; then
  echo "Error: HARNESS_MODE must be one of auto|direct|regression"
  exit 2
fi
if [[ "$BASELINE_POLICY" != "auto" && "$BASELINE_POLICY" != "clasp" && "$BASELINE_POLICY" != "sbcl" && "$BASELINE_POLICY" != "sbcl_and_clasp" ]]; then
  echo "Error: BASELINE_POLICY must be one of auto|clasp|sbcl|sbcl_and_clasp"
  exit 2
fi

TIMEOUT_BIN=""
if command -v gtimeout >/dev/null 2>&1; then
  TIMEOUT_BIN="$(command -v gtimeout)"
elif command -v timeout >/dev/null 2>&1; then
  TIMEOUT_BIN="$(command -v timeout)"
fi

float_add() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a + b) }'
}

float_sub() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a - b) }'
}

float_gt_zero() {
  awk -v a="$1" 'BEGIN { exit !(a > 0.0) }'
}

now_mono_ts() {
  perl -MTime::HiRes=clock_gettime,CLOCK_MONOTONIC -e 'printf "%.9f\n", clock_gettime(CLOCK_MONOTONIC)'
}

extract_real_time() {
  local time_file="$1"
  if [[ -s "$time_file" ]]; then
    awk '/^real[[:space:]]+/ { printf "%.6f", $2; found=1 } END { if (!found) printf "0.000000" }' "$time_file"
  else
    echo "0.000000"
  fi
}

sanitize_name() {
  local v="$1"
  print -r -- "$v" | sed -E 's#[ /]#_#g; s#[^A-Za-z0-9._-]#_#g'
}

is_regression_root_dir() {
  local dir="$1"
  [[ -f "$dir/framework.lisp" && -f "$dir/set-unexpected-failures.lisp" ]]
}

is_regression_helper_file() {
  local base="$1"
  case "$base" in
    framework.lisp|set-unexpected-failures.lisp|run-all.lisp|run-all-irlasp.lisp)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

pick_regression_suite_manifest() {
  local root="$1"
  if [[ -f "$root/run-all-irlasp.lisp" ]]; then
    echo "$root/run-all-irlasp.lisp"
    return 0
  fi
  if [[ -f "$root/run-all.lisp" ]]; then
    echo "$root/run-all.lisp"
    return 0
  fi
  return 1
}

extract_regression_suite_names() {
  local manifest_file="$1"
  awk '
    BEGIN { in_list=0 }
    {
      if (!in_list && $0 ~ /\(def(parameter|var)[[:space:]]+\*(irlasp-suites|suites)\*/) {
        in_list=1
      }
      if (in_list) {
        line=$0
        while (match(line, /"[^"]+"/)) {
          print substr(line, RSTART + 1, RLENGTH - 2)
          line=substr(line, RSTART + RLENGTH)
        }
        if ($0 ~ /\)\)/) {
          exit
        }
      }
    }
  ' "$manifest_file"
}

lisp_escape_string() {
  local s="$1"
  print -r -- "$s" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g'
}

write_regression_runner() {
  local suite_file="$1"
  local runner_file="$2"
  local escaped_framework
  local escaped_unexpected
  local escaped_suite
  local escaped_root

  escaped_framework="$(lisp_escape_string "$REGRESSION_ROOT/framework.lisp")"
  escaped_unexpected="$(lisp_escape_string "$REGRESSION_ROOT/set-unexpected-failures.lisp")"
  escaped_suite="$(lisp_escape_string "$suite_file")"
  escaped_root="$(lisp_escape_string "$REGRESSION_ROOT/")"

  cat > "$runner_file" <<EOF
(in-package :cl-user)
(let* ((root "$escaped_root")
       (single (concatenate 'string root "*.*"))
       (multi (concatenate 'string root "**/*.*")))
  ;; Regression files reference SYS:SRC;LISP;REGRESSION-TESTS;... logical paths.
  ;; Map those to the local regression-tests directory for all engines.
  (setf (logical-pathname-translations "SYS")
        \`(("SRC;LISP;REGRESSION-TESTS;*.*.*" ,single)
          ("SRC;LISP;REGRESSION-TESTS;**;*.*.*" ,multi))))
(load "$escaped_framework")
(load "$escaped_unexpected")
(in-package #:clasp-tests)
(reset-clasp-tests)
(load-if-compiled-correctly #P"$escaped_suite")
(let ((ok (show-test-summary)))
  (unless ok
    (error "REGRESSION-FAIL")))
EOF
}

normalize_output() {
  local in_file="$1"
  local out_file="$2"
  sed -E \
    -e 's/\r$//' \
    -e '/^\[HARNESS-TIMING\]/d' \
    -e '/^\[MLIR\]/d' \
    -e '/^\[Saved /d' \
    -e '/^\[Lowered /d' \
    -e '/^\[Parsed /d' \
    -e '/^\[Initialized /d' \
    -e '/^\[Forced /d' \
    -e '/^\[Loaded /d' \
    -e '/^\[Created /d' \
    -e '/^\[Added /d' \
    -e '/^\[Collected /d' \
    -e '/^\[Registered /d' \
    -e '/^\[Executing /d' \
    -e '/^\[JIT execution:/d' \
    -e '/^=> /d' \
    "$in_file" > "$out_file"
}

RUN_STATUS=127
RUN_ELAPSED="0.000000"
MLIR_COMPILE="0.000000"
MLIR_EXEC="0.000000"

run_engine_generic() {
  local log_file="$1"
  local timeout_s="$2"
  shift
  shift

  local start_ts end_ts wall_elapsed
  start_ts="$(now_mono_ts)"
  set +e
  if [[ "$timeout_s" =~ '^[0-9]+$' && "$timeout_s" -gt 0 ]]; then
    perl -e 'my $t=shift @ARGV; alarm $t; exec @ARGV;' "$timeout_s" "$@" >"$log_file" 2>&1
  else
    "$@" >"$log_file" 2>&1
  fi
  local exit_code=$?
  set -e
  end_ts="$(now_mono_ts)"
  wall_elapsed="$(float_sub "$end_ts" "$start_ts")"

  RUN_STATUS="$exit_code"
  RUN_ELAPSED="$wall_elapsed"
  printf '[HARNESS-TIMING] status=%s elapsed_s=%s\n' "$RUN_STATUS" "$RUN_ELAPSED" >> "$log_file"
}

run_mlir_with_phase_timing() {
  local file_path="$1"
  local log_file="$2"
  local timeout_s="$3"
  local selective_eval="${RLASP_MLIR_SELECTIVE_EVAL:-1}"

  local start="$(now_mono_ts)"
  local exec_mark=""
  local exit_code=127
  local fifo_path
  fifo_path="$(mktemp "${TMPDIR:-/tmp}/irlasp-mlir-stream.XXXXXX")"
  rm -f "$fifo_path"
  mkfifo "$fifo_path"
  : > "$log_file"

  set +e
  if [[ "$timeout_s" =~ '^[0-9]+$' && "$timeout_s" -gt 0 ]]; then
    (perl -e 'my $t=shift @ARGV; alarm $t; exec @ARGV;' "$timeout_s" env RLASP_MLIR_VERBOSE=1 RLASP_MLIR_SELECTIVE_EVAL="$selective_eval" "$IRLASP_BIN" -m mlir "$file_path" >"$fifo_path" 2>&1) &
  else
    (env RLASP_MLIR_VERBOSE=1 RLASP_MLIR_SELECTIVE_EVAL="$selective_eval" "$IRLASP_BIN" -m mlir "$file_path" >"$fifo_path" 2>&1) &
  fi
  local cmd_pid=$!
  while IFS= read -r line; do
    print -r -- "$line"
    if [[ -z "$exec_mark" && "$line" == "[Executing __main]"* ]]; then
      exec_mark="$(now_mono_ts)"
    fi
  done <"$fifo_path" >>"$log_file"
  wait "$cmd_pid"
  exit_code=$?
  set -e
  rm -f "$fifo_path"

  local end="$(now_mono_ts)"
  RUN_STATUS="$exit_code"
  RUN_ELAPSED="$(float_sub "$end" "$start")"
  if [[ -n "$exec_mark" ]]; then
    MLIR_COMPILE="$(float_sub "$exec_mark" "$start")"
    MLIR_EXEC="$(float_sub "$end" "$exec_mark")"
  else
    MLIR_COMPILE="$RUN_ELAPSED"
    MLIR_EXEC="0.000000"
  fi
  printf '[HARNESS-TIMING] status=%s elapsed_s=%s compile_s=%s exec_s=%s\n' \
    "$RUN_STATUS" "$RUN_ELAPSED" "$MLIR_COMPILE" "$MLIR_EXEC" >> "$log_file"
}

typeset -a FILES=()
typeset -a DISCOVERED_FILES=()
DISCOVERED_COUNT=0
REGRESSION_ROOT=""
HARNESS_KIND="direct"
SUITE_LIST_SOURCE="<none>"
EFFECTIVE_BASELINE_POLICY="$BASELINE_POLICY"

if [[ -d "$TARGET_PATH" ]]; then
  candidate_root="$TARGET_PATH"
else
  candidate_root="$(dirname "$TARGET_PATH")"
fi
if [[ -d "$candidate_root" ]]; then
  candidate_root="$(cd "$candidate_root" && pwd)"
fi

if [[ "$HARNESS_MODE" == "regression" ]]; then
  if ! is_regression_root_dir "$candidate_root"; then
    echo "Error: HARNESS_MODE=regression requires framework.lisp and set-unexpected-failures.lisp in input directory"
    exit 2
  fi
  REGRESSION_ROOT="$candidate_root"
  HARNESS_KIND="regression"
elif [[ "$HARNESS_MODE" == "auto" ]]; then
  if is_regression_root_dir "$candidate_root"; then
    REGRESSION_ROOT="$candidate_root"
    HARNESS_KIND="regression"
  fi
fi
if [[ "$BASELINE_POLICY" == "auto" ]]; then
  if [[ "$HARNESS_KIND" == "regression" ]]; then
    EFFECTIVE_BASELINE_POLICY="clasp"
  else
    EFFECTIVE_BASELINE_POLICY="sbcl_and_clasp"
  fi
fi

if [[ -d "$TARGET_PATH" ]]; then
  while IFS= read -r f; do
    DISCOVERED_COUNT=$(( DISCOVERED_COUNT + 1 ))
    DISCOVERED_FILES+=("$f")
  done < <(find "$TARGET_PATH" -type f -name '*.lisp' | LC_ALL=C sort)
  if [[ "$HARNESS_KIND" == "regression" ]]; then
    suite_manifest="$(pick_regression_suite_manifest "$REGRESSION_ROOT" || true)"
    if [[ -n "$suite_manifest" ]]; then
      SUITE_LIST_SOURCE="$suite_manifest"
      typeset -A seen_suite_files
      while IFS= read -r suite_name; do
        [[ -z "$suite_name" ]] && continue
        suite_file="$REGRESSION_ROOT/$suite_name.lisp"
        if [[ ! -f "$suite_file" ]]; then
          continue
        fi
        if [[ "$suite_file" != "$TARGET_PATH/"* && "$suite_file" != "$TARGET_PATH" ]]; then
          continue
        fi
        if [[ -n "${seen_suite_files[$suite_file]:-}" ]]; then
          continue
        fi
        seen_suite_files[$suite_file]=1
        FILES+=("$suite_file")
      done < <(extract_regression_suite_names "$suite_manifest")
    fi
    if (( ${#FILES[@]} == 0 )); then
      for f in "${DISCOVERED_FILES[@]}"; do
        base="$(basename "$f")"
        if is_regression_helper_file "$base"; then
          continue
        fi
        FILES+=("$f")
      done
    fi
  else
    FILES=("${DISCOVERED_FILES[@]}")
  fi
else
  if [[ "${TARGET_PATH##*.}" != "lisp" ]]; then
    echo "Error: file must end with .lisp: $TARGET_PATH"
    exit 2
  fi
  DISCOVERED_COUNT=1
  FILES+=("$TARGET_PATH")
fi

if (( ${#FILES[@]} == 0 )); then
  echo "No .lisp files found under: $TARGET_PATH"
  exit 2
fi

SUMMARY_FILE="$LOG_DIR/lisp-engine-compare-$STAMP.summary.txt"
CSV_FILE="$LOG_DIR/lisp-engine-compare-$STAMP.csv"

{
  echo "Input: $TARGET_PATH"
  echo "Files discovered: $DISCOVERED_COUNT"
  echo "Files selected: ${#FILES[@]}"
  echo "REQUIRE_BASELINE_PASS: $REQUIRE_BASELINE_PASS"
  echo "BASELINE_POLICY: $BASELINE_POLICY"
  echo "BASELINE_POLICY_EFFECTIVE: $EFFECTIVE_BASELINE_POLICY"
  echo "HARNESS_MODE: $HARNESS_MODE"
  echo "HARNESS_KIND: $HARNESS_KIND"
  echo "REGRESSION_ROOT: ${REGRESSION_ROOT:-<none>}"
  echo "SUITE_LIST_SOURCE: $SUITE_LIST_SOURCE"
  echo "TIMEOUT_BIN: ${TIMEOUT_BIN:-<none>}"
  echo "RLASP_MLIR_SELECTIVE_EVAL: ${RLASP_MLIR_SELECTIVE_EVAL:-1}"
  echo "TIMEOUTS_S: SBCL=$SBCL_TIMEOUT_S CLASP=$CLASP_TIMEOUT_S IRLASP_INTERP=$IRLASP_INTERP_TIMEOUT_S IRLASP_MLIR=$IRLASP_MLIR_TIMEOUT_S"
  echo "IRLASP_BIN: $IRLASP_BIN"
  echo "SBCL_BIN: ${SBCL_BIN:-<missing>}"
  echo "CLASP_BIN: ${CLASP_BIN:-<missing>}"
  echo
} > "$SUMMARY_FILE"

echo "file,eligible,skip_reason,baseline_engine,sbcl_status,sbcl_match,sbcl_time_s,clasp_status,clasp_match,clasp_time_s,irlasp_interpreter_status,irlasp_interpreter_match,irlasp_interpreter_time_s,irlasp_mlir_status,irlasp_mlir_match,irlasp_mlir_total_time_s,irlasp_mlir_compile_time_s,irlasp_mlir_exec_time_s" > "$CSV_FILE"

typeset -A FAIL_COUNT
typeset -A DIFF_COUNT
typeset -A OK_TIME_SUM
typeset -A OK_COUNT
typeset -A ATTEMPT_COUNT
typeset -A TOTAL_TIME_SUM
typeset -A MATCH_COUNT
for e in sbcl clasp irlasp_interpreter irlasp_mlir; do
  FAIL_COUNT[$e]=0
  DIFF_COUNT[$e]=0
  OK_TIME_SUM[$e]="0.000000"
  OK_COUNT[$e]=0
  ATTEMPT_COUNT[$e]=0
  TOTAL_TIME_SUM[$e]="0.000000"
  MATCH_COUNT[$e]=0
done
MLIR_COMPILE_SUM="0.000000"
MLIR_EXEC_SUM="0.000000"
ELIGIBLE_COUNT=0
SKIPPED_BASELINE_COUNT=0
SBCL_BASELINE_FAIL_COUNT=0
CLASP_BASELINE_FAIL_COUNT=0

record_engine_result() {
  local engine="$1"
  local exit_status="$2"
  local elapsed="$3"
  ATTEMPT_COUNT[$engine]=$(( ATTEMPT_COUNT[$engine] + 1 ))
  TOTAL_TIME_SUM[$engine]="$(float_add "${TOTAL_TIME_SUM[$engine]}" "$elapsed")"
  if [[ "$exit_status" -ne 0 ]]; then
    FAIL_COUNT[$engine]=$(( FAIL_COUNT[$engine] + 1 ))
  else
    OK_COUNT[$engine]=$(( OK_COUNT[$engine] + 1 ))
    OK_TIME_SUM[$engine]="$(float_add "${OK_TIME_SUM[$engine]}" "$elapsed")"
  fi
}

total_selected="${#FILES[@]}"
file_index=0
RUN_START_TS="$(now_mono_ts)"
for file_path in "${FILES[@]}"; do
  file_index=$(( file_index + 1 ))
  rel_path="$file_path"
  if [[ "$file_path" == "$TARGET_PATH/"* ]]; then
    rel_path="${file_path#$TARGET_PATH/}"
  fi
  safe_name="$(sanitize_name "$rel_path")"
  file_prefix="$LOG_DIR/$STAMP-$safe_name"
  engine_input="$file_path"
  runner_file=""
  if [[ "$HARNESS_KIND" == "regression" ]]; then
    runner_file="$(mktemp "${TMPDIR:-/tmp}/lisp-regression-runner.XXXXXX")"
    write_regression_runner "$file_path" "$runner_file"
    engine_input="$runner_file"
  fi
  echo "[$file_index/$total_selected] $rel_path"

  sbcl_raw="$file_prefix.sbcl.log"
  clasp_raw="$file_prefix.clasp.log"
  interp_raw="$file_prefix.irlasp-interpreter.log"
  mlir_raw="$file_prefix.irlasp-mlir.log"

  if [[ -n "${SBCL_BIN:-}" && -x "$SBCL_BIN" ]]; then
    run_engine_generic "$sbcl_raw" "$SBCL_TIMEOUT_S" "$SBCL_BIN" --noinform --disable-debugger --non-interactive --load "$engine_input"
    sbcl_status="$RUN_STATUS"
    sbcl_time="$RUN_ELAPSED"
  else
    sbcl_status=127
    sbcl_time="0.000000"
    echo "SBCL binary not found/executable" > "$sbcl_raw"
    printf '[HARNESS-TIMING] engine=sbcl status=%s elapsed_s=%s\n' "$sbcl_status" "$sbcl_time" >> "$sbcl_raw"
  fi
  record_engine_result "sbcl" "$sbcl_status" "$sbcl_time"

  if [[ -n "${CLASP_BIN:-}" && -x "$CLASP_BIN" ]]; then
    run_engine_generic "$clasp_raw" "$CLASP_TIMEOUT_S" "$CLASP_BIN" --non-interactive --load "$engine_input"
    clasp_status="$RUN_STATUS"
    clasp_time="$RUN_ELAPSED"
  else
    clasp_status=127
    clasp_time="0.000000"
    echo "CLASP binary not found/executable" > "$clasp_raw"
    printf '[HARNESS-TIMING] engine=clasp status=%s elapsed_s=%s\n' "$clasp_status" "$clasp_time" >> "$clasp_raw"
  fi
  record_engine_result "clasp" "$clasp_status" "$clasp_time"

  if [[ "$sbcl_status" -ne 0 ]]; then
    SBCL_BASELINE_FAIL_COUNT=$(( SBCL_BASELINE_FAIL_COUNT + 1 ))
  fi
  if [[ "$clasp_status" -ne 0 ]]; then
    CLASP_BASELINE_FAIL_COUNT=$(( CLASP_BASELINE_FAIL_COUNT + 1 ))
  fi

  eligible="yes"
  skip_reason=""
  failed_baseline_engines="none"
  if [[ "$REQUIRE_BASELINE_PASS" -eq 1 ]]; then
    case "$EFFECTIVE_BASELINE_POLICY" in
      clasp)
        if [[ "$clasp_status" -ne 0 ]]; then
          failed_baseline_engines="clasp"
        fi
        ;;
      sbcl)
        if [[ "$sbcl_status" -ne 0 ]]; then
          failed_baseline_engines="sbcl"
        fi
        ;;
      sbcl_and_clasp)
        failed_baseline_engines=""
        if [[ "$sbcl_status" -ne 0 ]]; then
          failed_baseline_engines="sbcl"
        fi
        if [[ "$clasp_status" -ne 0 ]]; then
          if [[ -n "$failed_baseline_engines" ]]; then
            failed_baseline_engines="$failed_baseline_engines,clasp"
          else
            failed_baseline_engines="clasp"
          fi
        fi
        ;;
      *)
        echo "Error: unsupported baseline policy: $EFFECTIVE_BASELINE_POLICY" >&2
        exit 2
        ;;
    esac
    if [[ "$failed_baseline_engines" != "none" && -n "$failed_baseline_engines" ]]; then
      eligible="no"
      skip_reason="baseline_failed(policy=$EFFECTIVE_BASELINE_POLICY failed=$failed_baseline_engines sbcl=$sbcl_status clasp=$clasp_status)"
      SKIPPED_BASELINE_COUNT=$(( SKIPPED_BASELINE_COUNT + 1 ))
    fi
  fi

  if [[ "$eligible" == "yes" ]]; then
    ELIGIBLE_COUNT=$(( ELIGIBLE_COUNT + 1 ))
    if [[ -x "$IRLASP_BIN" ]]; then
      run_engine_generic "$interp_raw" "$IRLASP_INTERP_TIMEOUT_S" "$IRLASP_BIN" "$engine_input"
      interp_status="$RUN_STATUS"
      interp_time="$RUN_ELAPSED"
    else
      interp_status=127
      interp_time="0.000000"
      echo "IRLASP binary not found/executable: $IRLASP_BIN" > "$interp_raw"
      printf '[HARNESS-TIMING] engine=irlasp-interpreter status=%s elapsed_s=%s\n' "$interp_status" "$interp_time" >> "$interp_raw"
    fi

    if [[ -x "$IRLASP_BIN" ]]; then
      run_mlir_with_phase_timing "$engine_input" "$mlir_raw" "$IRLASP_MLIR_TIMEOUT_S"
      mlir_status="$RUN_STATUS"
      mlir_total_time="$RUN_ELAPSED"
      mlir_compile_time="$MLIR_COMPILE"
      mlir_exec_time="$MLIR_EXEC"
    else
      mlir_status=127
      mlir_total_time="0.000000"
      mlir_compile_time="0.000000"
      mlir_exec_time="0.000000"
      echo "IRLASP binary not found/executable: $IRLASP_BIN" > "$mlir_raw"
      printf '[HARNESS-TIMING] engine=irlasp-mlir status=%s elapsed_s=%s compile_s=%s exec_s=%s\n' \
        "$mlir_status" "$mlir_total_time" "$mlir_compile_time" "$mlir_exec_time" >> "$mlir_raw"
    fi

    for pair in \
      "irlasp_interpreter:$interp_status:$interp_time" \
      "irlasp_mlir:$mlir_status:$mlir_total_time"; do
      engine="${pair%%:*}"
      rest="${pair#*:}"
      pair_status="${rest%%:*}"
      elapsed="${rest#*:}"
      record_engine_result "$engine" "$pair_status" "$elapsed"
    done

    if [[ "$mlir_status" -eq 0 ]]; then
      MLIR_COMPILE_SUM="$(float_add "$MLIR_COMPILE_SUM" "$mlir_compile_time")"
      MLIR_EXEC_SUM="$(float_add "$MLIR_EXEC_SUM" "$mlir_exec_time")"
    fi
  else
    interp_status=125
    interp_time="0.000000"
    interp_match="SKIP"
    mlir_status=125
    mlir_total_time="0.000000"
    mlir_compile_time="0.000000"
    mlir_exec_time="0.000000"
    mlir_match="SKIP"
    echo "Skipped due to baseline requirement: $skip_reason" > "$interp_raw"
    echo "Skipped due to baseline requirement: $skip_reason" > "$mlir_raw"
    printf '[HARNESS-TIMING] engine=irlasp-interpreter status=%s elapsed_s=%s\n' "$interp_status" "$interp_time" >> "$interp_raw"
    printf '[HARNESS-TIMING] engine=irlasp-mlir status=%s elapsed_s=%s compile_s=%s exec_s=%s\n' \
      "$mlir_status" "$mlir_total_time" "$mlir_compile_time" "$mlir_exec_time" >> "$mlir_raw"
  fi

  sbcl_match="NA"
  clasp_match="NA"
  if [[ "$eligible" == "yes" ]]; then
    interp_match="NA"
    mlir_match="NA"
    sbcl_norm="$sbcl_raw.norm"
    clasp_norm="$clasp_raw.norm"
    interp_norm="$interp_raw.norm"
    mlir_norm="$mlir_raw.norm"
    normalize_output "$sbcl_raw" "$sbcl_norm"
    normalize_output "$clasp_raw" "$clasp_norm"
    normalize_output "$interp_raw" "$interp_norm"
    normalize_output "$mlir_raw" "$mlir_norm"

    baseline_engine="sbcl"
    baseline_norm="$sbcl_norm"
    if [[ "$sbcl_status" -eq 0 ]]; then
      if cmp -s "$sbcl_norm" "$baseline_norm"; then sbcl_match="MATCH"; else sbcl_match="DIFF"; DIFF_COUNT[sbcl]=$(( DIFF_COUNT[sbcl] + 1 )); fi
    fi
    if [[ "$clasp_status" -eq 0 ]]; then
      if cmp -s "$clasp_norm" "$baseline_norm"; then clasp_match="MATCH"; else clasp_match="DIFF"; DIFF_COUNT[clasp]=$(( DIFF_COUNT[clasp] + 1 )); fi
    fi
    if [[ "$interp_status" -eq 0 ]]; then
      if cmp -s "$interp_norm" "$baseline_norm"; then interp_match="MATCH"; else interp_match="DIFF"; DIFF_COUNT[irlasp_interpreter]=$(( DIFF_COUNT[irlasp_interpreter] + 1 )); fi
    fi
    if [[ "$mlir_status" -eq 0 ]]; then
      if cmp -s "$mlir_norm" "$baseline_norm"; then mlir_match="MATCH"; else mlir_match="DIFF"; DIFF_COUNT[irlasp_mlir]=$(( DIFF_COUNT[irlasp_mlir] + 1 )); fi
    fi
    [[ "$sbcl_match" == "MATCH" ]] && MATCH_COUNT[sbcl]=$(( MATCH_COUNT[sbcl] + 1 ))
    [[ "$clasp_match" == "MATCH" ]] && MATCH_COUNT[clasp]=$(( MATCH_COUNT[clasp] + 1 ))
    [[ "$interp_match" == "MATCH" ]] && MATCH_COUNT[irlasp_interpreter]=$(( MATCH_COUNT[irlasp_interpreter] + 1 ))
    [[ "$mlir_match" == "MATCH" ]] && MATCH_COUNT[irlasp_mlir]=$(( MATCH_COUNT[irlasp_mlir] + 1 ))
  else
    baseline_engine="none"
    sbcl_match="SKIP"
    clasp_match="SKIP"
    interp_match="SKIP"
    mlir_match="SKIP"
  fi

  {
    echo "FILE $rel_path"
    echo "  eligible=$eligible skip_reason=$skip_reason"
    echo "  baseline_gate_failed_engines=$failed_baseline_engines"
    echo "  baseline=$baseline_engine"
    echo "  sbcl: status=$sbcl_status time_s=$sbcl_time match=$sbcl_match"
    echo "  clasp: status=$clasp_status time_s=$clasp_time match=$clasp_match"
    echo "  irlasp-interpreter: status=$interp_status time_s=$interp_time match=$interp_match"
    echo "  irlasp-mlir: status=$mlir_status total_s=$mlir_total_time compile_s=$mlir_compile_time exec_s=$mlir_exec_time match=$mlir_match"
    echo
  } >> "$SUMMARY_FILE"

  echo "\"$rel_path\",$eligible,\"$skip_reason\",$baseline_engine,$sbcl_status,$sbcl_match,$sbcl_time,$clasp_status,$clasp_match,$clasp_time,$interp_status,$interp_match,$interp_time,$mlir_status,$mlir_match,$mlir_total_time,$mlir_compile_time,$mlir_exec_time" >> "$CSV_FILE"

  if [[ -n "$runner_file" ]]; then
    rm -f "$runner_file"
  fi
done

avg_or_zero() {
  local sum="$1"
  local count="$2"
  if [[ "$count" -eq 0 ]]; then
    echo "0.000000"
  else
    awk -v s="$sum" -v c="$count" 'BEGIN { printf "%.6f", (s / c) }'
  fi
}
RUN_END_TS="$(now_mono_ts)"
RUN_WALL_S="$(float_sub "$RUN_END_TS" "$RUN_START_TS")"

{
  echo "TOTAL_FILES_DISCOVERED $DISCOVERED_COUNT"
  echo "TOTAL_FILES_SELECTED ${#FILES[@]}"
  echo "BASELINE_REQUIREMENT ENABLED $REQUIRE_BASELINE_PASS"
  echo "BASELINE_POLICY_EFFECTIVE $EFFECTIVE_BASELINE_POLICY"
  echo "ELIGIBLE_FILES $ELIGIBLE_COUNT"
  echo "SKIPPED_BASELINE_FAIL $SKIPPED_BASELINE_COUNT"
  echo "BASELINE_PRECHECK SBCL_FAIL $SBCL_BASELINE_FAIL_COUNT CLASP_FAIL $CLASP_BASELINE_FAIL_COUNT"
  echo "RUN_WALL_CLOCK_S $RUN_WALL_S"
  for e in sbcl clasp irlasp_interpreter irlasp_mlir; do
    avg_ok="$(avg_or_zero "${OK_TIME_SUM[$e]}" "${OK_COUNT[$e]}")"
    avg_attempted="$(avg_or_zero "${TOTAL_TIME_SUM[$e]}" "${ATTEMPT_COUNT[$e]}")"
    echo "ENGINE $e ATTEMPTED ${ATTEMPT_COUNT[$e]} EXIT_OK ${OK_COUNT[$e]} EXIT_FAIL ${FAIL_COUNT[$e]} OUTPUT_MATCH ${MATCH_COUNT[$e]} OUTPUT_DIFF ${DIFF_COUNT[$e]} TOTAL_TIME_S ${TOTAL_TIME_SUM[$e]} AVG_TIME_S_ATTEMPTED $avg_attempted AVG_TIME_S_EXIT_OK $avg_ok"
  done
  mlir_avg_compile="$(avg_or_zero "$MLIR_COMPILE_SUM" "${OK_COUNT[irlasp_mlir]}")"
  mlir_avg_exec="$(avg_or_zero "$MLIR_EXEC_SUM" "${OK_COUNT[irlasp_mlir]}")"
  echo "MLIR_PHASE_AVG COMPILE_S $mlir_avg_compile EXEC_S $mlir_avg_exec"
  echo
  echo "CSV $CSV_FILE"
} >> "$SUMMARY_FILE"

exit_code=0
if [[ "$REQUIRE_BASELINE_PASS" -eq 1 && "$ELIGIBLE_COUNT" -eq 0 ]]; then
  {
    echo
    echo "ERROR No eligible files: baseline policy $EFFECTIVE_BASELINE_POLICY rejected all files."
  } >> "$SUMMARY_FILE"
  echo "Error: no eligible files satisfy baseline requirement (policy=$EFFECTIVE_BASELINE_POLICY)." >&2
  exit_code=3
fi

echo "Wrote summary: $SUMMARY_FILE"
echo "Wrote csv: $CSV_FILE"
exit "$exit_code"
