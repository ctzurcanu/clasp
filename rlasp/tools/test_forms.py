#!/usr/bin/env python3
"""
Test loading ASDF forms one by one to find where it breaks.
"""

import sys
import subprocess
import os

# Import the form extractor
sys.path.insert(0, os.path.dirname(__file__))
from split_lisp import extract_toplevel_forms

def test_forms(filename, rlasp_path, start=1, end=None, timeout=10):
    """Test loading forms incrementally."""
    forms = extract_toplevel_forms(filename)

    if end is None:
        end = len(forms)

    print(f"Testing forms {start} to {end} of {len(forms)} total")

    # Test incrementally
    for i in range(start, min(end + 1, len(forms) + 1)):
        # Write forms 1 through i to a temp file
        test_file = f"/tmp/asdf_test_{i}.lisp"
        with open(test_file, 'w') as f:
            for j in range(i):
                _, _, form = forms[j]
                f.write(form)
                f.write("\n\n")

        # Run rlasp
        try:
            result = subprocess.run(
                [rlasp_path, test_file, "--no-repl"],
                capture_output=True,
                text=True,
                timeout=timeout
            )

            if result.returncode != 0 or "Error" in result.stderr or "Error" in result.stdout:
                print(f"FAIL at form {i}:")
                _, _, form = forms[i-1]
                preview = form[:200].replace('\n', ' ')
                if len(form) > 200:
                    preview += "..."
                print(f"  Form: {preview}")
                if result.stderr:
                    print(f"  Stderr: {result.stderr[:500]}")
                if result.stdout:
                    print(f"  Stdout: {result.stdout[:500]}")
                return i
            else:
                print(f"OK: forms 1-{i}")

        except subprocess.TimeoutExpired:
            print(f"TIMEOUT at form {i}:")
            _, _, form = forms[i-1]
            preview = form[:200].replace('\n', ' ')
            if len(form) > 200:
                preview += "..."
            print(f"  Form: {preview}")
            return i

    print(f"All {end} forms loaded successfully!")
    return None

def main():
    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} <asdf.lisp> <rlasp-binary> [start] [end] [timeout]")
        sys.exit(1)

    filename = sys.argv[1]
    rlasp = sys.argv[2]
    start = int(sys.argv[3]) if len(sys.argv) > 3 else 1
    end = int(sys.argv[4]) if len(sys.argv) > 4 else None
    timeout = int(sys.argv[5]) if len(sys.argv) > 5 else 10

    test_forms(filename, rlasp, start, end, timeout)

if __name__ == '__main__':
    main()
