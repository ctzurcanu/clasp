(load "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/common/assert.lisp")

(oscov-note "pathname_fs")

(let* ((root "/tmp/irlasp-oscov/")
       (subdir (concatenate 'string root "fs/"))
       (src (concatenate 'string subdir "a.txt"))
       (dst (concatenate 'string subdir "b.txt")))
  (ensure-directories-exist subdir)

  (with-open-file (out src :direction :output :if-exists :supersede :if-does-not-exist :create)
    (write-line "hello-pathname" out))

  (oscov-assert (pathnamep (pathname src)) "pathname/pathnamep should work")
  (oscov-assert (probe-file src) "probe-file should find src")
  (oscov-assert-equal "a" (pathname-name src) "pathname-name should be 'a'")
  (oscov-assert-equal "txt" (pathname-type src) "pathname-type should be 'txt'")
  (oscov-assert (pathnamep (truename src)) "truename should return pathname object")
  (oscov-assert (integerp (file-write-date src)) "file-write-date should return integer")

  (let ((entries (directory subdir)))
    (oscov-assert (or (null entries) (consp entries)) "directory should return list or NIL"))

  (rename-file src dst)
  (oscov-assert (null (probe-file src)) "source should not exist after rename")
  (oscov-assert (probe-file dst) "destination should exist after rename")

  (delete-file dst)
  (oscov-assert (null (probe-file dst)) "destination should be deleted"))

(format t "OK pathname_fs~%")
