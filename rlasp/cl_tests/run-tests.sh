#!/bin/bash
# Test runner for rlasp Common Lisp tests
#
# This script runs all test files in the cl_tests directory.
# Requires the 'load' function to be implemented in rlasp.

set -e

RLASP="./target/release/rlasp"

if [ ! -f "$RLASP" ]; then
    echo "Error: rlasp binary not found at $RLASP"
    echo "Please build rlasp first with:"
    echo "  PKG_CONFIG_PATH=\"/opt/homebrew/opt/libffi/lib/pkgconfig:\$PKG_CONFIG_PATH\" cargo build --release"
    exit 1
fi

echo "========================================="
echo "Running rlasp Common Lisp Tests"
echo "========================================="
echo ""

# Find all test files
test_files=$(find cl_tests -name "*.lisp" -type f)

if [ -z "$test_files" ]; then
    echo "No test files found in cl_tests/"
    exit 1
fi

# Run each test file
for test_file in $test_files; do
    echo "Running: $test_file"
    echo "----------------------------------------"

    # Extract the function name (e.g., util.lisp -> util)
    basename=$(basename "$test_file" .lisp)

    # Run the test
    echo "(load \"$test_file\") (run-all-${basename}-tests)" | $RLASP

    echo ""
done

echo "========================================="
echo "All tests completed"
echo "========================================="
