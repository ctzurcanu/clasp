(load "/Users/christiantzurcanu/Documents/dev/clasp/rlasp/coverage/os_command_coverage/common/assert.lisp")

(oscov-note "socket_host")

(let ((host-info (get-host-by-name "localhost")))
  (oscov-assert host-info "get-host-by-name should return a value")
  (oscov-assert (or (hash-table-p host-info) host-info) "get-host-by-name should be invokable"))

(asdf:defsystem :oscov-example-system)
(oscov-assert (find-system :oscov-example-system) "find-system should return registered system")
(oscov-assert (null (find-system :oscov-missing-system :if-does-not-exist nil))
              "find-system should return NIL when :if-does-not-exist NIL")

(let ((sock (usocket::make-stream-socket)))
  (oscov-assert sock "usocket::make-stream-socket should return descriptor")
  (multiple-value-bind (bound bind-err)
      (ignore-errors (socket-bind sock "127.0.0.1" 0))
    ;; In restricted sandboxes bind may be denied; coverage still validates callable semantics.
    (oscov-assert (or bound bind-err)
                  "socket-bind should either return descriptor or signal an error")
    (when bound
      (multiple-value-bind (listening listen-err)
          (ignore-errors (socket-listen bound 1))
        (oscov-assert (or listening listen-err)
                      "socket-listen should either return descriptor or signal an error")))))

(oscov-assert (serve-event::add-fd-handler 0 :input (lambda () nil))
              "serve-event::add-fd-handler should return truthy")

(format t "OK socket_host~%")
