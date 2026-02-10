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
mkdir -p "$LOG_DIR"
STAMP="$(date +%Y%m%d-%H%M%S)"

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <file.lisp|directory>"
  echo "Optional env: SBCL_BIN, CLASP_BIN, IRLASP_BIN, LOG_DIR"
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

float_add() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a + b) }'
}

float_sub() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a - b) }'
}

now_ts() {
  perl -MTime::HiRes=time -e 'printf "%.6f\n", time'
}

sanitize_name() {
  local v="$1"
  print -r -- "$v" | sed -E 's#[ /]#_#g; s#[^A-Za-z0-9._-]#_#g'
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
  shift

  local start="$(now_ts)"
  set +e
  "$@" >"$log_file" 2>&1
  local exit_code=$?
  set -e
  local end="$(now_ts)"

  RUN_STATUS="$exit_code"
  RUN_ELAPSED="$(float_sub "$end" "$start")"
}

run_mlir_with_phase_timing() {
  local file_path="$1"
  local log_file="$2"

  local start="$(now_ts)"
  local exec_mark=""
  local exit_code=127
  local fifo_path
  fifo_path="$(mktemp "${TMPDIR:-/tmp}/irlasp-mlir-stream.XXXXXX")"
  rm -f "$fifo_path"
  mkfifo "$fifo_path"
  : > "$log_file"

  set +e
  ("$IRLASP_BIN" -m mlir "$file_path" >"$fifo_path" 2>&1) &
  local cmd_pid=$!
  while IFS= read -r line <"$fifo_path"; do
    print -r -- "$line" >> "$log_file"
    if [[ -z "$exec_mark" && "$line" == "[Executing __main]"* ]]; then
      exec_mark="$(now_ts)"
    fi
  done
  wait "$cmd_pid"
  exit_code=$?
  set -e
  rm -f "$fifo_path"

  local end="$(now_ts)"
  RUN_STATUS="$exit_code"
  RUN_ELAPSED="$(float_sub "$end" "$start")"
  if [[ -n "$exec_mark" ]]; then
    MLIR_COMPILE="$(float_sub "$exec_mark" "$start")"
    MLIR_EXEC="$(float_sub "$end" "$exec_mark")"
  else
    MLIR_COMPILE="$RUN_ELAPSED"
    MLIR_EXEC="0.000000"
  fi
}

typeset -a FILES=()
if [[ -d "$TARGET_PATH" ]]; then
  while IFS= read -r f; do
    FILES+=("$f")
  done < <(find "$TARGET_PATH" -type f -name '*.lisp' | LC_ALL=C sort)
else
  if [[ "${TARGET_PATH##*.}" != "lisp" ]]; then
    echo "Error: file must end with .lisp: $TARGET_PATH"
    exit 2
  fi
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
  echo "Files: ${#FILES[@]}"
  echo "IRLASP_BIN: $IRLASP_BIN"
  echo "SBCL_BIN: ${SBCL_BIN:-<missing>}"
  echo "CLASP_BIN: ${CLASP_BIN:-<missing>}"
  echo
} > "$SUMMARY_FILE"

echo "file,baseline_engine,sbcl_status,sbcl_time_s,sbcl_match,clasp_status,clasp_time_s,clasp_match,irlasp_interpreter_status,irlasp_interpreter_time_s,irlasp_interpreter_match,irlasp_mlir_status,irlasp_mlir_total_time_s,irlasp_mlir_compile_time_s,irlasp_mlir_exec_time_s,irlasp_mlir_match" > "$CSV_FILE"

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

for file_path in "${FILES[@]}"; do
  rel_path="$file_path"
  if [[ "$file_path" == "$TARGET_PATH/"* ]]; then
    rel_path="${file_path#$TARGET_PATH/}"
  fi
  safe_name="$(sanitize_name "$rel_path")"
  file_prefix="$LOG_DIR/$STAMP-$safe_name"

  sbcl_raw="$file_prefix.sbcl.log"
  clasp_raw="$file_prefix.clasp.log"
  interp_raw="$file_prefix.irlasp-interpreter.log"
  mlir_raw="$file_prefix.irlasp-mlir.log"

  if [[ -n "${SBCL_BIN:-}" && -x "$SBCL_BIN" ]]; then
    run_engine_generic "$sbcl_raw" "$SBCL_BIN" --noinform --disable-debugger --non-interactive --load "$file_path"
    sbcl_status="$RUN_STATUS"
    sbcl_time="$RUN_ELAPSED"
  else
    sbcl_status=127
    sbcl_time="0.000000"
    echo "SBCL binary not found/executable" > "$sbcl_raw"
  fi

  if [[ -n "${CLASP_BIN:-}" && -x "$CLASP_BIN" ]]; then
    run_engine_generic "$clasp_raw" "$CLASP_BIN" --non-interactive --load "$file_path"
    clasp_status="$RUN_STATUS"
    clasp_time="$RUN_ELAPSED"
  else
    clasp_status=127
    clasp_time="0.000000"
    echo "CLASP binary not found/executable" > "$clasp_raw"
  fi

  if [[ -x "$IRLASP_BIN" ]]; then
    run_engine_generic "$interp_raw" "$IRLASP_BIN" "$file_path"
    interp_status="$RUN_STATUS"
    interp_time="$RUN_ELAPSED"
  else
    interp_status=127
    interp_time="0.000000"
    echo "IRLASP binary not found/executable: $IRLASP_BIN" > "$interp_raw"
  fi

  if [[ -x "$IRLASP_BIN" ]]; then
    run_mlir_with_phase_timing "$file_path" "$mlir_raw"
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

  sbcl_norm="$sbcl_raw.norm"
  clasp_norm="$clasp_raw.norm"
  interp_norm="$interp_raw.norm"
  mlir_norm="$mlir_raw.norm"
  normalize_output "$sbcl_raw" "$sbcl_norm"
  normalize_output "$clasp_raw" "$clasp_norm"
  normalize_output "$interp_raw" "$interp_norm"
  normalize_output "$mlir_raw" "$mlir_norm"

  baseline_engine=""
  baseline_norm=""
  if [[ "$sbcl_status" -eq 0 ]]; then
    baseline_engine="sbcl"
    baseline_norm="$sbcl_norm"
  elif [[ "$clasp_status" -eq 0 ]]; then
    baseline_engine="clasp"
    baseline_norm="$clasp_norm"
  elif [[ "$interp_status" -eq 0 ]]; then
    baseline_engine="irlasp_interpreter"
    baseline_norm="$interp_norm"
  elif [[ "$mlir_status" -eq 0 ]]; then
    baseline_engine="irlasp_mlir"
    baseline_norm="$mlir_norm"
  else
    baseline_engine="none"
  fi

  sbcl_match="NA"
  clasp_match="NA"
  interp_match="NA"
  mlir_match="NA"
  if [[ "$baseline_engine" != "none" ]]; then
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
  fi

  {
    echo "FILE $rel_path"
    echo "  baseline=$baseline_engine"
    echo "  sbcl: status=$sbcl_status time_s=$sbcl_time match=$sbcl_match"
    echo "  clasp: status=$clasp_status time_s=$clasp_time match=$clasp_match"
    echo "  irlasp-interpreter: status=$interp_status time_s=$interp_time match=$interp_match"
    echo "  irlasp-mlir: status=$mlir_status total_s=$mlir_total_time compile_s=$mlir_compile_time exec_s=$mlir_exec_time match=$mlir_match"
    echo
  } >> "$SUMMARY_FILE"

  echo "\"$rel_path\",$baseline_engine,$sbcl_status,$sbcl_time,$sbcl_match,$clasp_status,$clasp_time,$clasp_match,$interp_status,$interp_time,$interp_match,$mlir_status,$mlir_total_time,$mlir_compile_time,$mlir_exec_time,$mlir_match" >> "$CSV_FILE"
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
  echo "TOTAL_FILES ${#FILES[@]}"
  for e in sbcl clasp irlasp_interpreter irlasp_mlir; do
    avg="$(avg_or_zero "${OK_TIME_SUM[$e]}" "${OK_COUNT[$e]}")"
    echo "ENGINE $e OK ${OK_COUNT[$e]} FAIL ${FAIL_COUNT[$e]} OUTPUT_DIFF ${DIFF_COUNT[$e]} AVG_TIME_S $avg"
  done
  mlir_avg_compile="$(avg_or_zero "$MLIR_COMPILE_SUM" "${OK_COUNT[irlasp_mlir]}")"
  mlir_avg_exec="$(avg_or_zero "$MLIR_EXEC_SUM" "${OK_COUNT[irlasp_mlir]}")"
  echo "MLIR_PHASE_AVG COMPILE_S $mlir_avg_compile EXEC_S $mlir_avg_exec"
  echo
  echo "CSV $CSV_FILE"
} >> "$SUMMARY_FILE"

echo "Wrote summary: $SUMMARY_FILE"
echo "Wrote csv: $CSV_FILE"
