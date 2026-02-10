#!/bin/zsh
set -euo pipefail

BASE_DIR="/Users/christiantzurcanu/Documents/dev/clasp/rlasp/clisp/in_work"
RUNNER="$BASE_DIR/regression-tests/run-all-irlasp.lisp"
IRLASP_BIN="/Users/christiantzurcanu/Documents/dev/clasp/rlasp/target/release/irlasp"
LOG_DIR="$BASE_DIR/regression-tests/logs"
SUITES="${TEST_SUITES:-}"

mkdir -p "$LOG_DIR"
cd "$BASE_DIR"
STAMP="$(date +%Y%m%d-%H%M%S)"

parse_totals() {
  local log_file="$1"
  awk '
    BEGIN { suite=""; tp=0; tf=0; ce=0; re=0; }
    /^Running [^ ]+ suite\.\.\./ { suite=$2; next; }
    /^Passed / { p[suite]++; tp++; next; }
    /^Failed / { f[suite]++; tf++; next; }
    /Regression: compile-file/ { ce++; next; }
    /^Error:/ { re++; next; }
    END {
      total = tp + tf;
      nonpassing = tf + ce + re;
      printf("TOTAL %d FAILED %d COMPILE_ERRORS %d RUN_ERRORS %d NON_PASSING %d PASSED %d\n", total, tf, ce, re, nonpassing, tp);
      for (s in p) {
        st = p[s] + f[s];
        sf = f[s] + 0;
        sp = p[s] + 0;
        printf("SUITE %-24s TOTAL %d FAILED %d PASSED %d\n", s, st, sf, sp);
      }
      for (s in f) {
        if (!(s in p)) {
          printf("SUITE %-24s TOTAL %d FAILED %d PASSED 0\n", s, f[s], f[s]);
        }
      }
      if (total == 0) {
        print "WARNING no test results were parsed from log";
      }
    }
  ' "$log_file"
}

run_mode() {
  local mode="$1"
  local log_file="$2"
  echo "Running mode=$mode log=$log_file"
  if [[ -n "$SUITES" ]]; then
    export TEST_SUITES="$SUITES"
  else
    unset TEST_SUITES || true
  fi

  local run_status=0
  set +e
  if [[ "$mode" == "interpreter" ]]; then
    "$IRLASP_BIN" "$RUNNER" > "$log_file" 2>&1
    run_status=$?
  else
    "$IRLASP_BIN" -m mlir "$RUNNER" > "$log_file" 2>&1
    run_status=$?
  fi
  set -e

  local summary_file="${log_file%.log}.summary.txt"
  parse_totals "$log_file" > "$summary_file"
  echo "RUN_EXIT_STATUS $run_status" >> "$summary_file"
  if [[ "$run_status" -ne 0 ]]; then
    echo "WARNING runner exited non-zero; inspect log for setup/runtime errors" >> "$summary_file"
  fi
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
