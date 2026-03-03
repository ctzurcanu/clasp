#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="/Users/christiantzurcanu/Documents/dev/clasp/rlasp"
COV_DIR="$ROOT_DIR/coverage/os_command_coverage"
IRLASP_BIN="${IRLASP_BIN:-$ROOT_DIR/target/release/irlasp}"
MODES_CSV="${MODES:-interpreter,mlir}"
IRLASP_MEMORY_CEILING_MB="${IRLASP_MEMORY_CEILING_MB:-1024}"

IFS=',' read -r -a MODES <<< "$MODES_CSV"

TEST_FILES=(
  "$COV_DIR/env/env_process.lisp"
  "$COV_DIR/fs/pathname_fs.lisp"
  "$COV_DIR/io/streams_io.lisp"
  "$COV_DIR/process/run_program.lisp"
  "$COV_DIR/ffi/ffi_syscalls.lisp"
  "$COV_DIR/async/async_threads.lisp"
  "$COV_DIR/async/bordeaux_threads.lisp"
  "$COV_DIR/network/socket_host.lisp"
)

if [[ ! -x "$IRLASP_BIN" ]]; then
  echo "ERROR: irlasp binary is not executable: $IRLASP_BIN" >&2
  exit 2
fi

ts="$(date +%Y%m%d-%H%M%S)"
LOG_DIR="$COV_DIR/logs/$ts"
mkdir -p "$LOG_DIR"

now_s() {
  perl -MTime::HiRes=time -e 'printf "%.6f", time'
}

printf "%-24s %-12s %-4s %-10s %-8s %-s\n" "TEST_FILE" "MODE" "RC" "TIME_S" "STATUS" "LOG_FILE"

total=0
passed=0

for mode in "${MODES[@]}"; do
  for test_file in "${TEST_FILES[@]}"; do
    ((total += 1))
    test_name="$(basename "$test_file")"
    log_file="$LOG_DIR/${test_name%.lisp}.${mode}.log"

    start="$(now_s)"
    set +e
    (cd "$ROOT_DIR" && IRLASP_MEMORY_CEILING_MB="$IRLASP_MEMORY_CEILING_MB" "$IRLASP_BIN" -m "$mode" "$test_file") >"$log_file" 2>&1
    rc=$?
    set -e
    end="$(now_s)"
    elapsed="$(perl -e "printf \"%.6f\", ($end - $start)")"

    status="FAIL"
    if [[ $rc -eq 0 ]] && rg -q "^OK " "$log_file"; then
      status="PASS"
      ((passed += 1))
    fi

    printf "%-24s %-12s %-4s %-10s %-8s %-s\n" "$test_name" "$mode" "$rc" "$elapsed" "$status" "$log_file"
  done
done

printf "TOTAL %d PASSED %d FAILED %d LOG_DIR %s\n" "$total" "$passed" "$((total - passed))" "$LOG_DIR"
