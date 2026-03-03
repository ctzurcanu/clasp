# irlasp OS Command Coverage

This directory provides focused coverage tests for the OS-facing command surface
documented in `CL_CLI.md` (section `27. OS Command Catalog`).

## Test Suites

- `env/env_process.lisp`: environment variables, cwd, argc/argv
- `fs/pathname_fs.lisp`: pathname API and file system mutation
- `io/streams_io.lisp`: stream and file I/O operations
- `process/run_program.lisp`: process execution wrappers
- `ffi/ffi_syscalls.lisp`: foreign memory and syscall bridge
- `async/async_threads.lisp`: async helpers, sockets (error-path), threads, locks
- `async/bordeaux_threads.lisp`: Bordeaux-Threads compatibility API (thread lifecycle, lock API, condition variables, semaphores, thread-yield)
- `network/socket_host.lisp`: host lookup, socket bind/listen, serve-event handler, ASDF find-system
  - Handles restricted sandbox environments where `socket-bind` may be denied; validates callable behavior in both success and error paths.

## Run

```bash
/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/run_os_command_coverage.sh
```

Optional environment variables:

- `IRLASP_BIN` (default: `/Users/christiantzurcanu/Documents/dev/clasp/rlasp/target/release/irlasp`)
- `MODES` as comma-separated list (default: `interpreter,mlir`)
- `IRLASP_MEMORY_CEILING_MB` (default: `1024`)

The runner prints adjacent timing columns:

- `TEST_FILE`
- `MODE`
- `RC`
- `TIME_S`
- `STATUS`
- `LOG_FILE`

It also writes per-run logs under:

`/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/logs/<timestamp>/`

Latest snapshot:

- `TOTAL 16 PASSED 16 FAILED 0`
- `/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/logs/20260303-131529/`
