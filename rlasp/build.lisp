#!/Users/christiantzurcanu/Documents/dev/clasp/rlasp/rlasp

;;; Comprehensive Build Script for RLASP

(defun setup-permissions ()
  (shell "chmod +x build.lisp 2>/dev/null || true")
  (shell "chmod +x rlasp 2>/dev/null || true")
  (shell "chmod +x build.sh 2>/dev/null || true"))

(defun check-dependencies ()
  (shell "echo '=== Checking dependencies ==='")
  (shell "command -v cargo >/dev/null 2>&1 && echo 'cargo: OK' || echo 'cargo: MISSING'")
  (shell "command -v rustc >/dev/null 2>&1 && echo 'rustc: OK' || echo 'rustc: MISSING'")
  (shell "pkg-config --exists libffi && echo 'libffi: OK' || echo 'libffi: MISSING'"))

(defun build-release ()
  (shell "echo '=== Building RLASP (Release) ==='")
  (shell "PKG_CONFIG_PATH=/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH cargo build --release 2>&1 | tail -20")
  (shell "echo 'Build complete: target/release/irlasp'")
  (setup-permissions))

(defun build-debug ()
  (shell "echo '=== Building RLASP (Debug) ==='")
  (shell "PKG_CONFIG_PATH=/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH cargo build 2>&1 | tail -20")
  (shell "echo 'Build complete: target/debug/irlasp'")
  (setup-permissions))

(defun clean-build ()
  (shell "echo '=== Cleaning build artifacts ==='")
  (shell "cargo clean")
  (shell "echo 'Clean complete'"))

(defun run-tests ()
  (shell "echo '=== Running tests ==='")
  (shell "PKG_CONFIG_PATH=/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH cargo test 2>&1 | tail -30"))

(defun build-all ()
  (clean-build)
  (check-dependencies)
  (build-release)
  (run-tests))

(defun show-help ()
  (shell "echo 'RLASP Build Script'")
  (shell "echo 'Usage: ./build.lisp [command]'")
  (shell "echo 'Commands:'")
  (shell "echo '  release  - Build release (default)'")
  (shell "echo '  debug    - Build debug'")
  (shell "echo '  clean    - Clean artifacts'")
  (shell "echo '  test     - Run tests'")
  (shell "echo '  all      - Clean + build + test'")
  (shell "echo '  check    - Check dependencies'")
  (shell "echo '  help     - Show help'"))

(defun main ()
  (let ((n (argc)))
    (if (> n 1)
        (shell "case $1 in release) : ;; debug) : ;; clean) : ;; test) : ;; all) : ;; check) : ;; help) : ;; setup) : ;; *) echo 'Unknown command'; exit 1;; esac")
        (shell "echo ''")))

  ;; Auto-setup permissions on every run
  (setup-permissions)

  ;; Default action: build release
  (build-release))

(main)
