#!/bin/bash
# Test REPL with sample expressions

echo "Testing rlasp REPL..."
echo

PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH" cargo run --bin rlasp --quiet <<EOF
42
(+ 1 2)
(* 30 42)
(+ (* 3 4) (* 2 5))
:q
EOF
