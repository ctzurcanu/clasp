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
  echo "Optional env: SBCL_BIN, CLASP_BIN, IRLASP_BIN, LOG_DIR, REQUIRE_BASELINE_PASS, HARNESS_MODE"
  echo "Optional env timeouts (seconds): RUN_TIMEOUT_S, SBCL_TIMEOUT_S, CLASP_TIMEOUT_S, IRLASP_INTERP_TIMEOUT_S, IRLASP_MLIR_TIMEOUT_S"
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

float_add() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a + b) }'
}

float_sub() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a - b) }'
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
(let* ((ok (show-test-summary))
       (code (if ok 0 1))
       (quit-sym (and (find-package "SYS") (find-symbol "QUIT" "SYS")))
       (exit-sym (and (find-package "SB-EXT") (find-symbol "EXIT" "SB-EXT"))))
  (cond
    ((and quit-sym (fboundp quit-sym)) (funcall quit-sym code))
    ((and exit-sym (fboundp exit-sym)) (funcall exit-sym :code code))
    (t (error "No exit function available"))))
EOF
}

normalize_output() {
  local in_file="$1"
  local out_file="$2"
  sed -E \
    -e 's/\r$//' \
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

  local time_file
  time_file="$(mktemp "${TMPDIR:-/tmp}/lisp-engine-time.XXXXXX")"
  set +e
  if [[ "$timeout_s" =~ '^[0-9]+$' && "$timeout_s" -gt 0 ]]; then
    /usr/bin/time -p -o "$time_file" perl -e 'my $t=shift @ARGV; alarm $t; exec @ARGV;' "$timeout_s" "$@" >"$log_file" 2>&1
  else
    /usr/bin/time -p -o "$time_file" "$@" >"$log_file" 2>&1
  fi
  local exit_code=$?
  set -e

  RUN_STATUS="$exit_code"
  RUN_ELAPSED="$(extract_real_time "$time_file")"
  rm -f "$time_file"
}

run_mlir_with_phase_timing() {
  local file_path="$1"
  local log_file="$2"
  local timeout_s="$3"

  local start="$(now_mono_ts)"
  local exec_mark=""
  local exit_code=127
  local fifo_path
  local time_file
  fifo_path="$(mktemp "${TMPDIR:-/tmp}/irlasp-mlir-stream.XXXXXX")"
  time_file="$(mktemp "${TMPDIR:-/tmp}/lisp-engine-time.XXXXXX")"
  rm -f "$fifo_path"
  mkfifo "$fifo_path"
  : > "$log_file"

  set +e
  if [[ "$timeout_s" =~ '^[0-9]+$' && "$timeout_s" -gt 0 ]]; then
    (/usr/bin/time -p -o "$time_file" perl -e 'my $t=shift @ARGV; alarm $t; exec @ARGV;' "$timeout_s" "$IRLASP_BIN" -m mlir "$file_path" >"$fifo_path" 2>&1) &
  else
    (/usr/bin/time -p -o "$time_file" "$IRLASP_BIN" -m mlir "$file_path" >"$fifo_path" 2>&1) &
  fi
  local cmd_pid=$!
  while IFS= read -r line <"$fifo_path"; do
    print -r -- "$line" >> "$log_file"
    if [[ -z "$exec_mark" && "$line" == "[Executing __main]"* ]]; then
      exec_mark="$(now_mono_ts)"
    fi
  done
  wait "$cmd_pid"
  exit_code=$?
  set -e
  rm -f "$fifo_path"

  local end="$(now_mono_ts)"
  RUN_STATUS="$exit_code"
  RUN_ELAPSED="$(extract_real_time "$time_file")"
  rm -f "$time_file"
  if [[ -n "$exec_mark" ]]; then
    MLIR_COMPILE="$(float_sub "$exec_mark" "$start")"
    MLIR_EXEC="$(float_sub "$end" "$exec_mark")"
  else
    MLIR_COMPILE="$RUN_ELAPSED"
    MLIR_EXEC="0.000000"
  fi
}

typeset -a FILES=()
DISCOVERED_COUNT=0
REGRESSION_ROOT=""
HARNESS_KIND="direct"

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

if [[ -d "$TARGET_PATH" ]]; then
  while IFS= read -r f; do
    DISCOVERED_COUNT=$(( DISCOVERED_COUNT + 1 ))
    if [[ "$HARNESS_KIND" == "regression" ]]; then
      base="$(basename "$f")"
      if is_regression_helper_file "$base"; then
        continue
      fi
    fi
    FILES+=("$f")
  done < <(find "$TARGET_PATH" -type f -name '*.lisp' | LC_ALL=C sort)
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
  echo "HARNESS_MODE: $HARNESS_MODE"
  echo "HARNESS_KIND: $HARNESS_KIND"
  echo "REGRESSION_ROOT: ${REGRESSION_ROOT:-<none>}"
  echo "TIMEOUTS_S: SBCL=$SBCL_TIMEOUT_S CLASP=$CLASP_TIMEOUT_S IRLASP_INTERP=$IRLASP_INTERP_TIMEOUT_S IRLASP_MLIR=$IRLASP_MLIR_TIMEOUT_S"
  echo "IRLASP_BIN: $IRLASP_BIN"
  echo "SBCL_BIN: ${SBCL_BIN:-<missing>}"
  echo "CLASP_BIN: ${CLASP_BIN:-<missing>}"
  echo
} > "$SUMMARY_FILE"

echo "file,eligible,skip_reason,baseline_engine,sbcl_status,sbcl_time_s,sbcl_match,clasp_status,clasp_time_s,clasp_match,irlasp_interpreter_status,irlasp_interpreter_time_s,irlasp_interpreter_match,irlasp_mlir_status,irlasp_mlir_total_time_s,irlasp_mlir_compile_time_s,irlasp_mlir_exec_time_s,irlasp_mlir_match" > "$CSV_FILE"

typeset -A FAIL_COUNT
typeset -A DIFF_COUNT
typeset -A OK_TIME_SUM
typeset -A OK_COUNT
for e in sbcl clasp irlasp_interpreter irlasp_mlir; do
  FAIL_COUNT[$e]=0
  DIFF_COUNT[$e]=0
  OK_TIME_SUM[$e]="0.000000"
  OK_COUNT[$e]=0
done
MLIR_COMPILE_SUM="0.000000"
MLIR_EXEC_SUM="0.000000"
ELIGIBLE_COUNT=0
SKIPPED_BASELINE_COUNT=0
SBCL_BASELINE_FAIL_COUNT=0
CLASP_BASELINE_FAIL_COUNT=0

total_selected="${#FILES[@]}"
file_index=0
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
  fi

  if [[ -n "${CLASP_BIN:-}" && -x "$CLASP_BIN" ]]; then
    run_engine_generic "$clasp_raw" "$CLASP_TIMEOUT_S" "$CLASP_BIN" --non-interactive --load "$engine_input"
    clasp_status="$RUN_STATUS"
    clasp_time="$RUN_ELAPSED"
  else
    clasp_status=127
    clasp_time="0.000000"
    echo "CLASP binary not found/executable" > "$clasp_raw"
  fi

  if [[ "$sbcl_status" -ne 0 ]]; then
    SBCL_BASELINE_FAIL_COUNT=$(( SBCL_BASELINE_FAIL_COUNT + 1 ))
  fi
  if [[ "$clasp_status" -ne 0 ]]; then
    CLASP_BASELINE_FAIL_COUNT=$(( CLASP_BASELINE_FAIL_COUNT + 1 ))
  fi

  eligible="yes"
  skip_reason=""
  if [[ "$REQUIRE_BASELINE_PASS" -eq 1 && ( "$sbcl_status" -ne 0 || "$clasp_status" -ne 0 ) ]]; then
    eligible="no"
    skip_reason="baseline_failed(sbcl=$sbcl_status clasp=$clasp_status)"
    SKIPPED_BASELINE_COUNT=$(( SKIPPED_BASELINE_COUNT + 1 ))
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
    fi

    for pair in \
      "sbcl:$sbcl_status:$sbcl_time" \
      "clasp:$clasp_status:$clasp_time" \
      "irlasp_interpreter:$interp_status:$interp_time" \
      "irlasp_mlir:$mlir_status:$mlir_total_time"; do
      engine="${pair%%:*}"
      rest="${pair#*:}"
      pair_status="${rest%%:*}"
      elapsed="${rest#*:}"
      if [[ "$pair_status" -ne 0 ]]; then
        FAIL_COUNT[$engine]=$(( FAIL_COUNT[$engine] + 1 ))
      else
        OK_COUNT[$engine]=$(( OK_COUNT[$engine] + 1 ))
        OK_TIME_SUM[$engine]="$(float_add "${OK_TIME_SUM[$engine]}" "$elapsed")"
      fi
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
    echo "  baseline=$baseline_engine"
    echo "  sbcl: status=$sbcl_status time_s=$sbcl_time match=$sbcl_match"
    echo "  clasp: status=$clasp_status time_s=$clasp_time match=$clasp_match"
    echo "  irlasp-interpreter: status=$interp_status time_s=$interp_time match=$interp_match"
    echo "  irlasp-mlir: status=$mlir_status total_s=$mlir_total_time compile_s=$mlir_compile_time exec_s=$mlir_exec_time match=$mlir_match"
    echo
  } >> "$SUMMARY_FILE"

  echo "\"$rel_path\",$eligible,\"$skip_reason\",$baseline_engine,$sbcl_status,$sbcl_time,$sbcl_match,$clasp_status,$clasp_time,$clasp_match,$interp_status,$interp_time,$interp_match,$mlir_status,$mlir_total_time,$mlir_compile_time,$mlir_exec_time,$mlir_match" >> "$CSV_FILE"

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

{
  echo "TOTAL_FILES_DISCOVERED $DISCOVERED_COUNT"
  echo "TOTAL_FILES_SELECTED ${#FILES[@]}"
  echo "BASELINE_REQUIREMENT SBCL_AND_CLASP_MUST_PASS $REQUIRE_BASELINE_PASS"
  echo "ELIGIBLE_FILES $ELIGIBLE_COUNT"
  echo "SKIPPED_BASELINE_FAIL $SKIPPED_BASELINE_COUNT"
  echo "BASELINE_PRECHECK SBCL_FAIL $SBCL_BASELINE_FAIL_COUNT CLASP_FAIL $CLASP_BASELINE_FAIL_COUNT"
  for e in sbcl clasp irlasp_interpreter irlasp_mlir; do
    avg="$(avg_or_zero "${OK_TIME_SUM[$e]}" "${OK_COUNT[$e]}")"
    echo "ENGINE $e OK ${OK_COUNT[$e]} FAIL ${FAIL_COUNT[$e]} OUTPUT_DIFF ${DIFF_COUNT[$e]} AVG_TIME_S $avg (eligible-only)"
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
    echo "ERROR No eligible files: baseline requires sbcl=0 and clasp=0."
  } >> "$SUMMARY_FILE"
  echo "Error: no eligible files satisfy baseline requirement (sbcl+clasp pass)." >&2
  exit_code=3
fi

echo "Wrote summary: $SUMMARY_FILE"
echo "Wrote csv: $CSV_FILE"
exit "$exit_code"
