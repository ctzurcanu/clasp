#!/usr/bin/env python3
"""
Test loading ASDF by line ranges to find where it breaks.
Uses binary search to efficiently find the first failing line.
"""

import sys
import subprocess
import os

def test_lines(filename, rlasp_path, end_line, timeout=30):
    """Test loading first N lines of the file."""
    with open(filename, 'r') as f:
        lines = f.readlines()

    test_file = f"/tmp/asdf_test_lines.lisp"
    with open(test_file, 'w') as f:
        f.writelines(lines[:end_line])

    try:
        result = subprocess.run(
            [rlasp_path, test_file, "--no-repl"],
            capture_output=True,
            text=True,
            timeout=timeout
        )

        if result.returncode != 0 or "Error" in result.stderr or "Error" in result.stdout:
            return False, result.stderr + result.stdout
        return True, ""

    except subprocess.TimeoutExpired:
        return False, "TIMEOUT"

def binary_search_failure(filename, rlasp_path, min_line, max_line, timeout=30):
    """Binary search to find the first line that causes failure."""
    total_lines = sum(1 for _ in open(filename))
    max_line = min(max_line, total_lines)

    print(f"Binary searching for first failure between lines {min_line} and {max_line}")

    # First check if max_line works
    success, msg = test_lines(filename, rlasp_path, max_line, timeout)
    if success:
        print(f"All {max_line} lines load successfully!")
        return None

    # Binary search
    low, high = min_line, max_line
    last_failure_line = max_line
    last_failure_msg = msg

    while low < high:
        mid = (low + high) // 2
        print(f"Testing lines 1-{mid}...", end=" ", flush=True)

        success, msg = test_lines(filename, rlasp_path, mid, timeout)

        if success:
            print("OK")
            low = mid + 1
        else:
            print(f"FAIL: {msg[:100]}...")
            high = mid
            last_failure_line = mid
            last_failure_msg = msg

    return last_failure_line, last_failure_msg

def main():
    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} <asdf.lisp> <rlasp-binary> [min_line] [max_line] [timeout]")
        print("  Finds the first line that causes loading to fail.")
        sys.exit(1)

    filename = sys.argv[1]
    rlasp = sys.argv[2]
    min_line = int(sys.argv[3]) if len(sys.argv) > 3 else 1
    max_line = int(sys.argv[4]) if len(sys.argv) > 4 else 14105
    timeout = int(sys.argv[5]) if len(sys.argv) > 5 else 30

    result = binary_search_failure(filename, rlasp, min_line, max_line, timeout)

    if result:
        fail_line, msg = result
        print(f"\nFirst failure at or before line {fail_line}")
        print(f"Error: {msg[:500]}")

        # Show context around the failure
        with open(filename, 'r') as f:
            lines = f.readlines()

        print(f"\nLines {max(1, fail_line-5)} to {min(len(lines), fail_line+5)}:")
        for i in range(max(0, fail_line-6), min(len(lines), fail_line+5)):
            marker = ">>>" if i == fail_line - 1 else "   "
            print(f"{marker} {i+1}: {lines[i].rstrip()[:80]}")

if __name__ == '__main__':
    main()
