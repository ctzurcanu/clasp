#!/bin/zsh
set -euo pipefail
unsetopt BG_NICE 2>/dev/null || true

usage() {
  cat <<'EOF'
Usage:
  mlirbc_aot.sh <input.mlirbc> [--out-dir DIR] [--name NAME] [--kinds LIST] [--runtime-dir DIR] [--csv FILE] [--no-smoke]

Options:
  --out-dir DIR      Output directory (default: /tmp/mlir-aot-<timestamp>-<pid>)
  --name NAME        Artifact base name (default: input basename)
  --kinds LIST       Comma list: object,static,shared,exe,all (default: all)
  --runtime-dir DIR  Directory with librlasp_jit.{dylib,a} and librlasp_runtime.{dylib,a}
                     (default: <repo>/target/release)
  --csv FILE         Write one-line timing summary CSV to FILE
  --no-smoke         Skip executable smoke run

Output artifacts:
  <name>.lowered.mlir
  <name>.ll
  <name>.o
  lib<name>.a                 (if static requested)
  lib<name>.dylib             (if shared requested)
  <name>                      (if exe requested)
EOF
}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

INPUT=""
OUT_DIR=""
NAME=""
KINDS="all"
RUNTIME_DIR="$REPO_ROOT/target/release"
CSV_FILE=""
SMOKE_RUN=1

while [[ $# -gt 0 ]]; do
  case "$1" in
    --out-dir)
      OUT_DIR="${2:-}"
      shift 2
      ;;
    --name)
      NAME="${2:-}"
      shift 2
      ;;
    --kinds)
      KINDS="${2:-}"
      shift 2
      ;;
    --runtime-dir)
      RUNTIME_DIR="${2:-}"
      shift 2
      ;;
    --csv)
      CSV_FILE="${2:-}"
      shift 2
      ;;
    --no-smoke)
      SMOKE_RUN=0
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    -*)
      echo "Unknown option: $1" >&2
      usage
      exit 2
      ;;
    *)
      if [[ -z "$INPUT" ]]; then
        INPUT="$1"
      else
        echo "Unexpected argument: $1" >&2
        usage
        exit 2
      fi
      shift
      ;;
  esac
done

if [[ -z "$INPUT" ]]; then
  usage
  exit 2
fi

if [[ "$INPUT" != /* ]]; then
  INPUT="$PWD/$INPUT"
fi
if [[ ! -f "$INPUT" ]]; then
  echo "Input not found: $INPUT" >&2
  exit 2
fi
if [[ "$INPUT" != *.mlirbc ]]; then
  echo "Input must be a .mlirbc file: $INPUT" >&2
  exit 2
fi

if [[ -z "$OUT_DIR" ]]; then
  OUT_DIR="/tmp/mlir-aot-$(date +%Y%m%d-%H%M%S)-$$"
fi
mkdir -p "$OUT_DIR"

sanitize_name() {
  print -r -- "$1" | sed -E 's#[^A-Za-z0-9._-]#_#g'
}

if [[ -z "$NAME" ]]; then
  base="$(basename "$INPUT")"
  base="${base%.mlirbc}"
  NAME="$(sanitize_name "$base")"
else
  NAME="$(sanitize_name "$NAME")"
fi

LLVM_BIN="${LLVM_BIN:-/opt/homebrew/opt/llvm/bin}"
MLIR_OPT="${MLIR_OPT:-$LLVM_BIN/mlir-opt}"
MLIR_TRANSLATE="${MLIR_TRANSLATE:-$LLVM_BIN/mlir-translate}"
LLC="${LLC:-$LLVM_BIN/llc}"
LLVM_AR="${LLVM_AR:-$LLVM_BIN/llvm-ar}"
CLANG="${CLANG:-$LLVM_BIN/clang}"

require_exec() {
  local p="$1"
  local label="$2"
  if [[ ! -x "$p" ]]; then
    echo "Missing executable for $label: $p" >&2
    exit 2
  fi
}

require_exec "$MLIR_OPT" "mlir-opt"
require_exec "$MLIR_TRANSLATE" "mlir-translate"
require_exec "$LLC" "llc"
require_exec "$LLVM_AR" "llvm-ar"
require_exec "$CLANG" "clang"

JIT_DYLIB="$RUNTIME_DIR/librlasp_jit.dylib"
RUNTIME_DYLIB="$RUNTIME_DIR/librlasp_runtime.dylib"
if [[ ! -f "$JIT_DYLIB" || ! -f "$RUNTIME_DYLIB" ]]; then
  echo "Missing runtime dylibs in $RUNTIME_DIR" >&2
  echo "Expected: $JIT_DYLIB and $RUNTIME_DYLIB" >&2
  echo "Build with: cargo build --release -p rlasp-runtime -p rlasp-jit" >&2
  exit 2
fi

wants_kind() {
  local needle="$1"
  if [[ "$KINDS" == "all" ]]; then
    return 0
  fi
  local list=",$KINDS,"
  [[ "$list" == *",$needle,"* ]]
}

LOWERED_MLIR="$OUT_DIR/${NAME}.lowered.mlir"
LLVM_IR="$OUT_DIR/${NAME}.ll"
OBJ="$OUT_DIR/${NAME}.o"
STATIC_LIB="$OUT_DIR/lib${NAME}.a"
SHARED_LIB="$OUT_DIR/lib${NAME}.dylib"
EXE="$OUT_DIR/${NAME}"
LAUNCHER_C="$OUT_DIR/${NAME}.launcher.c"
REGISTER_DECLS_C="$OUT_DIR/${NAME}.register.decls.cinc"
REGISTER_CALLS_C="$OUT_DIR/${NAME}.register.calls.cinc"

typeset -A STAGE_S
typeset -A STAGE_RC

now_mono_ts() {
  perl -MTime::HiRes=clock_gettime,CLOCK_MONOTONIC -e 'printf "%.9f\n", clock_gettime(CLOCK_MONOTONIC)'
}

float_sub() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a - b) }'
}

float_add() {
  awk -v a="$1" -v b="$2" 'BEGIN { printf "%.6f", (a + b) }'
}

run_stage() {
  local label="$1"
  shift
  local out_file="$OUT_DIR/${label}.out"
  local err_file="$OUT_DIR/${label}.err"
  local start end elapsed rc
  start="$(now_mono_ts)"
  set +e
  "$@" >"$out_file" 2>"$err_file"
  rc=$?
  set -e
  end="$(now_mono_ts)"
  elapsed="$(float_sub "$end" "$start")"
  STAGE_S[$label]="$elapsed"
  STAGE_RC[$label]="$rc"
  if [[ $rc -ne 0 ]]; then
    echo "Stage failed: $label rc=$rc (see $err_file)" >&2
    exit $rc
  fi
}

TOTAL_START="$(now_mono_ts)"

run_stage lower_mlir \
  "$MLIR_OPT" \
  --convert-scf-to-cf \
  --convert-arith-to-llvm \
  --convert-index-to-llvm \
  --convert-func-to-llvm \
  --convert-cf-to-llvm \
  --reconcile-unrealized-casts \
  "$INPUT"
cp "$OUT_DIR/lower_mlir.out" "$LOWERED_MLIR"

run_stage translate_llvm \
  "$MLIR_TRANSLATE" \
  --mlir-to-llvmir \
  "$LOWERED_MLIR"
cp "$OUT_DIR/translate_llvm.out" "$LLVM_IR"

run_stage emit_object \
  "$LLC" \
  -filetype=obj \
  "$LLVM_IR" \
  -o "$OBJ"

if wants_kind static; then
  run_stage archive_static "$LLVM_AR" rcs "$STATIC_LIB" "$OBJ"
fi

if wants_kind shared; then
  run_stage link_shared \
    "$CLANG" \
    -dynamiclib \
    "$OBJ" \
    -L "$RUNTIME_DIR" \
    -Wl,-rpath,"$RUNTIME_DIR" \
    -lrlasp_jit \
    -lrlasp_runtime \
    -o "$SHARED_LIB"
fi

if wants_kind exe; then
  ARGSLIST_FUNCS_TXT="$OUT_DIR/${NAME}.argslist.functions.txt"
  : > "$REGISTER_DECLS_C"
  : > "$REGISTER_CALLS_C"
  : > "$ARGSLIST_FUNCS_TXT"
  perl -0777 -ne '
    if (/\@__argslist_functions\s*=\s*constant\s*\[[^\]]+\]\s*c"([^"]*)"/s) {
      my $blob = $1;
      my %seen = ();
      for my $name (split(/\\00/, $blob)) {
        next if $name eq "";
        $seen{$name} = 1;
      }
      print "$_\n" for sort keys %seen;
    }
  ' "$LLVM_IR" > "$ARGSLIST_FUNCS_TXT"
  typeset -i fn_idx=0
  while IFS= read -r fn_name; do
    [[ -z "$fn_name" ]] && continue
    local_sym="$fn_name"
    if [[ "$(uname -s)" == "Darwin" ]]; then
      local_sym="_$local_sym"
    fi
    fn_alias="rlasp_aot_fn_${fn_idx}"
    fn_name_escaped="${fn_name//\\/\\\\}"
    fn_name_escaped="${fn_name_escaped//\"/\\\"}"
    local_sym_escaped="${local_sym//\\/\\\\}"
    local_sym_escaped="${local_sym_escaped//\"/\\\"}"
    echo "extern void ${fn_alias}(void) __asm__(\"${local_sym_escaped}\");" >> "$REGISTER_DECLS_C"
    if grep -Fxq -- "$fn_name" "$ARGSLIST_FUNCS_TXT"; then
      echo "  cc_register_function_with_args_list(\"${fn_name_escaped}\", (uintptr_t)&${fn_alias}, (uintptr_t)-1);" >> "$REGISTER_CALLS_C"
    else
      echo "  cc_register_function_ptr(\"${fn_name_escaped}\", (uintptr_t)&${fn_alias}, (uintptr_t)-1);" >> "$REGISTER_CALLS_C"
    fi
    fn_idx=$((fn_idx + 1))
  done < <(
    perl -ne '
      my $name = "";
      if (/^define\s+\S+\s+\@\"([^\"]+)\"\(/) {
        $name = $1;
      } elsif (/^define\s+\S+\s+\@([A-Za-z0-9_.]+)\(/) {
        $name = $1;
      } else {
        next;
      }
      if ($name =~ /^%FN%/ || $name =~ /^__lambda_\d+$/) {
        print "$name\n";
      }
    ' "$LLVM_IR" | sort -u
  )

  cat > "$LAUNCHER_C" <<EOF
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
extern void __main(void);
extern void cc_register_builtin_intrinsics(void);
extern void cc_init_standard_cl_variables(void);
extern void cc_runtime_ignore_gc_warnings(void);
extern void cc_set_eval_bridge(uintptr_t callback_ptr);
extern uintptr_t cc_eval_bridge(uintptr_t form_obj);
extern void cc_register_function_ptr(const char *name, uintptr_t address, uintptr_t arity);
extern void cc_register_function_with_args_list(const char *name, uintptr_t address, uintptr_t arity);
extern void stack_clear(void);
extern int64_t stack_depth(void);
extern uintptr_t stack_pop_pointer(void);
$(cat "$REGISTER_DECLS_C")

/*
 * MLIR-generated code emits debug-stack push/pop hooks for backtrace tracking.
 * The JIT runtime exports richer support, but AOT executables only need these
 * hooks to exist so generated code links and executes correctly.
 */
static uintptr_t rlasp_aot_debug_stack_depth = 0;
void cc_runtime_debug_stack_push_name(uintptr_t name_obj_raw) {
  (void)name_obj_raw;
  rlasp_aot_debug_stack_depth += 1;
}
void cc_runtime_debug_stack_pop_name(void) {
  if (rlasp_aot_debug_stack_depth > 0) {
    rlasp_aot_debug_stack_depth -= 1;
  }
}

static int should_delegate_to_irlasp(int argc, char **argv) {
  if (argc <= 1) return 0;
  for (int i = 1; i < argc; ++i) {
    const char *arg = argv[i];
    if (!arg) continue;
    if (strcmp(arg, "--norc") == 0 ||
        strcmp(arg, "--base") == 0 ||
        strcmp(arg, "--feature") == 0 ||
        strcmp(arg, "--eval") == 0 ||
        strcmp(arg, "--load") == 0 ||
        strcmp(arg, "--quit") == 0 ||
        strcmp(arg, "--non-interactive") == 0 ||
        strcmp(arg, "--") == 0) {
      return 1;
    }
  }
  return 0;
}

static int maybe_delegate_to_irlasp(int argc, char **argv) {
  if (!should_delegate_to_irlasp(argc, argv)) {
    return 0;
  }

  const char *irlasp_bin = getenv("IRLASP_BIN");
  if (!irlasp_bin || !*irlasp_bin) {
    irlasp_bin = "${REPO_ROOT}/target/release/irlasp";
  }

  char **exec_argv = (char **)calloc((size_t)argc + 1, sizeof(char *));
  if (!exec_argv) {
    return 125;
  }
  exec_argv[0] = (char *)irlasp_bin;
  for (int i = 1; i < argc; ++i) {
    exec_argv[i] = argv[i];
  }
  exec_argv[argc] = NULL;

  execv(irlasp_bin, exec_argv);
  free(exec_argv);
  return 127;
}

static void install_irlasp_eval_bridge(void) {
  cc_set_eval_bridge((uintptr_t)cc_eval_bridge);
}

static int should_suppress_gc_warnings(void) {
  const char *value = getenv("RLASP_SUPPRESS_GC_WARNINGS");
  if (!value || !*value) return 1;
  if (strcmp(value, "0") == 0 ||
      strcmp(value, "false") == 0 ||
      strcmp(value, "FALSE") == 0 ||
      strcmp(value, "no") == 0 ||
      strcmp(value, "NO") == 0 ||
      strcmp(value, "off") == 0 ||
      strcmp(value, "OFF") == 0) {
    return 0;
  }
  return 1;
}

int main(int argc, char **argv) {
  int delegate_rc = maybe_delegate_to_irlasp(argc, argv);
  if (delegate_rc != 0) {
    return delegate_rc;
  }
  if (should_suppress_gc_warnings()) {
    cc_runtime_ignore_gc_warnings();
  }
  cc_register_builtin_intrinsics();
  cc_init_standard_cl_variables();
  install_irlasp_eval_bridge();
$(cat "$REGISTER_CALLS_C")
  stack_clear();
  __main();
  while (stack_depth() > 0) {
    (void)stack_pop_pointer();
  }
  fflush(NULL);
  _exit(0);
}
EOF
  run_stage link_exe \
    "$CLANG" \
    "$LAUNCHER_C" \
    "$OBJ" \
    -L "$RUNTIME_DIR" \
    -Wl,-rpath,"$RUNTIME_DIR" \
    -lirlasp \
    -lrlasp_jit \
    -lrlasp_runtime \
    -o "$EXE"

  if [[ "$SMOKE_RUN" -eq 1 ]]; then
    run_stage smoke_exe "$EXE"
  fi
fi

TOTAL_END="$(now_mono_ts)"
TOTAL_S="$(float_sub "$TOTAL_END" "$TOTAL_START")"

lower_s="${STAGE_S[lower_mlir]:-0.000000}"
translate_s="${STAGE_S[translate_llvm]:-0.000000}"
object_s="${STAGE_S[emit_object]:-0.000000}"
static_s="${STAGE_S[archive_static]:-0.000000}"
shared_s="${STAGE_S[link_shared]:-0.000000}"
exe_s="${STAGE_S[link_exe]:-0.000000}"
smoke_s="${STAGE_S[smoke_exe]:-0.000000}"

echo "INPUT=$INPUT"
echo "OUT_DIR=$OUT_DIR"
echo "ARTIFACT_OBJ=$OBJ"
if [[ -f "$STATIC_LIB" ]]; then
  echo "ARTIFACT_STATIC=$STATIC_LIB"
fi
if [[ -f "$SHARED_LIB" ]]; then
  echo "ARTIFACT_SHARED=$SHARED_LIB"
fi
if [[ -f "$EXE" ]]; then
  echo "ARTIFACT_EXE=$EXE"
fi
echo "TIMES_S LOWER_MLIR=$lower_s TRANSLATE_LLVM=$translate_s EMIT_OBJECT=$object_s ARCHIVE_STATIC=$static_s LINK_SHARED=$shared_s LINK_EXE=$exe_s SMOKE_EXE=$smoke_s TOTAL=$TOTAL_S"

if [[ -n "$CSV_FILE" ]]; then
  mkdir -p "$(dirname "$CSV_FILE")"
  if [[ ! -f "$CSV_FILE" ]]; then
    echo "name,input,lower_mlir_s,translate_llvm_s,emit_object_s,archive_static_s,link_shared_s,link_exe_s,smoke_exe_s,total_s,out_dir,obj,static,shared,exe" > "$CSV_FILE"
  fi
  echo "${NAME},\"${INPUT}\",${lower_s},${translate_s},${object_s},${static_s},${shared_s},${exe_s},${smoke_s},${TOTAL_S},\"${OUT_DIR}\",\"${OBJ}\",\"${STATIC_LIB}\",\"${SHARED_LIB}\",\"${EXE}\"" >> "$CSV_FILE"
fi
