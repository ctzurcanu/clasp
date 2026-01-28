
(defmacro define-package (package &rest clauses)
  "DEFINE-PACKAGE takes a PACKAGE and a number of CLAUSES, of the form
\(KEYWORD . ARGS\).
DEFINE-PACKAGE supports the following keywords:
SHADOW, SHADOWING-IMPORT-FROM, IMPORT-FROM, EXPORT, INTERN, NICKNAMES,
DOCUMENTATION -- as per CL:DEFPACKAGE.
USE -- as per CL:DEFPACKAGE, but if neither USE, USE-REEXPORT, MIX,
nor MIX-REEXPORT is supplied, then it is equivalent to specifying
(:USE :COMMON-LISP). This is unlike CL:DEFPACKAGE for which the
behavior of a form without USE is implementation-dependent.
RECYCLE -- Recycle the package's exported symbols from the specified packages,
in order.  For every symbol scheduled to be exported by the DEFINE-PACKAGE,
either through an :EXPORT option or a :REEXPORT option, if the symbol exists in
one of the :RECYCLE packages, the first such symbol is re-homed to the package
being defined.
For the sake of idempotence, it is important that the package being defined
should appear in first position if it already exists, and even if it doesn't,
ahead of any package that is not going to be deleted afterwards and never
created again. In short, except for special cases, always make it the first
package on the list if the list is not empty.
MIX -- Takes a list of package designators.  MIX behaves like
\(:USE PKG1 PKG2 ... PKGn\) but additionally uses :SHADOWING-IMPORT-FROM to
resolve conflicts in favor of the first found symbol.  It may still yield
an error if there is a conflict with an explicitly :IMPORT-FROM symbol.
REEXPORT -- Takes a list of package designators.  For each package, p, in the list,
export symbols with the same name as those exported from p.  Note that in the case
of shadowing, etc. the symbols with the same name may not be the same symbols.
UNINTERN -- Remove symbols here from PACKAGE. Note that this is primarily useful
when *redefining* a previously-existing package in the current image (e.g., when
upgrading ASDF).  Most programmers will have no use for this option.
LOCAL-NICKNAMES -- If the host implementation supports package local nicknames
\(check for the :PACKAGE-LOCAL-NICKNAMES feature\), then this should be a list of
nickname and package name pairs.  Using this option will cause an error if the
host CL implementation does not support it.
USE-REEXPORT, MIX-REEXPORT -- Use or mix the specified packages as per the USE or
MIX directives, and reexport their contents as per the REEXPORT directive."
  (let ((ensure-form
         `(prog1
              (funcall 'ensure-package ,@(parse-define-package-form package clauses))
            #+sbcl (setf (sb-impl::package-source-location (find-package ',package))
                         (sb-c:source-location)))))
    `(progn
       #+(or clasp ecl gcl mkcl) (defpackage ,package (:use))
       (eval-when (:compile-toplevel :load-toplevel :execute)
         ,ensure-form))))

;; This package, unlike UIOP/PACKAGE, is allowed to evolve and acquire new symbols or drop old ones.
(define-package :uiop/package*
  (:use-reexport :uiop/package
                 #+package-local-nicknames :uiop/package-local-nicknames)
  (:import-from :uiop/package
                #:define-package-style-warning
                #:no-such-package-error
                #:package-designator)
  (:export #:define-package-style-warning
           #:no-such-package-error
           #:package-designator))