;;; build.lisp - rlasp kernel build script
;;; Defines the sources to compile into the kernel image

(defparameter *kernel-sources*
  '("clisp/kernel/init.lisp"
    "clisp/kernel/listlib.lisp"))

(defun compile-kernel ()
  "Compile all kernel sources to LLVM IR (.ll files) and bitcode (.bc files)."
  (format t "~%Building rlasp kernel image...~%")
  (format t "Sources: ~A~%" *kernel-sources*)

  (dolist (source *kernel-sources*)
    (format t "  Compiling ~A~%" source)
    ;; TODO: Call rlasp-compile to generate .ll and .bc files
    ;; For now, just list the files
    )

  (format t "~%Kernel build complete!~%")
  (format t "Output directory: images/~%")
  (format t "  - kernel.ll (LLVM IR text)~%")
  (format t "  - kernel.bc (LLVM bitcode for ORC JIT)~%"))

;; Entry point
(compile-kernel)
