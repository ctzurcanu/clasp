#!/usr/bin/env python3
"""
Split a Lisp file into top-level forms.
Handles comments, strings, and nested parentheses correctly.
"""

import sys
import re

def extract_toplevel_forms(filename):
    """Extract top-level forms from a Lisp file."""
    with open(filename, 'r') as f:
        content = f.read()

    forms = []
    i = 0
    n = len(content)

    while i < n:
        # Skip whitespace
        while i < n and content[i] in ' \t\n\r':
            i += 1

        if i >= n:
            break

        start = i

        # Check for line comment
        if content[i] == ';':
            while i < n and content[i] != '\n':
                i += 1
            # Skip comments, don't add as forms
            continue

        # Check for block comment #| ... |#
        if i + 1 < n and content[i:i+2] == '#|':
            i += 2
            depth = 1
            while i < n and depth > 0:
                if i + 1 < n and content[i:i+2] == '#|':
                    depth += 1
                    i += 2
                elif i + 1 < n and content[i:i+2] == '|#':
                    depth -= 1
                    i += 2
                else:
                    i += 1
            continue

        # Check for reader macros that don't start forms
        if content[i] == '#':
            # Feature conditionals #+, #-
            if i + 1 < n and content[i+1] in '+-':
                # Keep start as original position (include the #+ or #-)
                i += 2
                # Skip the feature expression
                i = skip_form(content, i, n)
                # Skip whitespace before the actual form
                while i < n and content[i] in ' \t\n\r':
                    i += 1
                # Skip the actual form
                i = skip_form(content, i, n)
                # Include entire construct from #+/- to end of form
                forms.append((start, i, content[start:i].strip()))
                continue

        # Regular form (starts with '(' or is an atom)
        if content[i] == '(':
            i = skip_form(content, i, n)
            forms.append((start, i, content[start:i].strip()))
        elif content[i] == "'":
            # Quoted form
            i += 1
            i = skip_form(content, i, n)
            forms.append((start, i, content[start:i].strip()))
        elif content[i] == '`':
            # Backquoted form
            i += 1
            i = skip_form(content, i, n)
            forms.append((start, i, content[start:i].strip()))
        elif content[i] == '#':
            # Various reader macros
            i = skip_form(content, i, n)
            forms.append((start, i, content[start:i].strip()))
        else:
            # Atom or symbol at top level (rare but possible)
            while i < n and content[i] not in ' \t\n\r()\'";':
                i += 1
            if i > start:
                forms.append((start, i, content[start:i].strip()))

    return forms

def skip_form(content, i, n):
    """Skip a single Lisp form, returning the position after it."""
    while i < n and content[i] in ' \t\n\r':
        i += 1

    if i >= n:
        return i

    # Line comment
    if content[i] == ';':
        while i < n and content[i] != '\n':
            i += 1
        return i

    # Block comment
    if i + 1 < n and content[i:i+2] == '#|':
        i += 2
        depth = 1
        while i < n and depth > 0:
            if i + 1 < n and content[i:i+2] == '#|':
                depth += 1
                i += 2
            elif i + 1 < n and content[i:i+2] == '|#':
                depth -= 1
                i += 2
            else:
                i += 1
        return i

    # Reader macros
    if content[i] == '#':
        i += 1
        if i >= n:
            return i

        c = content[i]

        # #+ #- feature conditionals
        if c in '+-':
            i += 1
            i = skip_form(content, i, n)  # feature
            i = skip_form(content, i, n)  # form
            return i

        # #' function quote
        if c == "'":
            i += 1
            return skip_form(content, i, n)

        # #( vector
        if c == '(':
            return skip_list(content, i, n)

        # #\ character
        if c == '\\':
            i += 1
            # Skip character name
            while i < n and content[i] not in ' \t\n\r()";':
                i += 1
            return i

        # #. read-time eval
        if c == '.':
            i += 1
            return skip_form(content, i, n)

        # #: uninterned symbol
        if c == ':':
            i += 1
            while i < n and content[i] not in ' \t\n\r()";':
                i += 1
            return i

        # Numbers like #x, #o, #b, #r
        if c in 'xXoObBrR0123456789':
            while i < n and content[i] not in ' \t\n\r()";':
                i += 1
            return i

        # Other - skip the rest as atom
        while i < n and content[i] not in ' \t\n\r()";':
            i += 1
        return i

    # Quote, backquote, comma
    if content[i] in "'`":
        i += 1
        return skip_form(content, i, n)

    if content[i] == ',':
        i += 1
        if i < n and content[i] == '@':
            i += 1
        return skip_form(content, i, n)

    # List
    if content[i] == '(':
        return skip_list(content, i, n)

    # String
    if content[i] == '"':
        return skip_string(content, i, n)

    # Atom/symbol
    while i < n and content[i] not in ' \t\n\r()";\',`':
        if content[i] == '\\':
            i += 2  # Skip escaped char
        else:
            i += 1

    return i

def skip_list(content, i, n):
    """Skip a list form including nested lists."""
    if content[i] != '(':
        return i

    i += 1  # Skip opening paren
    depth = 1

    while i < n and depth > 0:
        c = content[i]

        if c == '(':
            depth += 1
            i += 1
        elif c == ')':
            depth -= 1
            i += 1
        elif c == '"':
            i = skip_string(content, i, n)
        elif c == ';':
            while i < n and content[i] != '\n':
                i += 1
        elif c == '#' and i + 1 < n and content[i+1] == '|':
            i += 2
            comment_depth = 1
            while i < n and comment_depth > 0:
                if i + 1 < n and content[i:i+2] == '#|':
                    comment_depth += 1
                    i += 2
                elif i + 1 < n and content[i:i+2] == '|#':
                    comment_depth -= 1
                    i += 2
                else:
                    i += 1
        elif c == '\\':
            i += 2  # Skip escaped char
        else:
            i += 1

    return i

def skip_string(content, i, n):
    """Skip a string literal."""
    if content[i] != '"':
        return i

    i += 1  # Skip opening quote

    while i < n:
        if content[i] == '\\':
            i += 2  # Skip escaped char
        elif content[i] == '"':
            i += 1  # Skip closing quote
            break
        else:
            i += 1

    return i

def main():
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <file.lisp> [--count] [--form N] [--first N]")
        print("  --count     Just show count of top-level forms")
        print("  --form N    Show form number N (1-indexed)")
        print("  --first N   Show first N forms")
        print("  --range A B Show forms A through B")
        print("  --head N    Show first N chars of each form")
        sys.exit(1)

    filename = sys.argv[1]
    forms = extract_toplevel_forms(filename)

    if '--count' in sys.argv:
        print(f"Total top-level forms: {len(forms)}")
        return

    if '--form' in sys.argv:
        idx = sys.argv.index('--form')
        n = int(sys.argv[idx + 1])
        if 1 <= n <= len(forms):
            start, end, form = forms[n - 1]
            print(f"Form {n} (chars {start}-{end}):")
            print(form)
        else:
            print(f"Form {n} out of range (1-{len(forms)})")
        return

    head_len = None
    if '--head' in sys.argv:
        idx = sys.argv.index('--head')
        head_len = int(sys.argv[idx + 1])

    if '--first' in sys.argv:
        idx = sys.argv.index('--first')
        n = int(sys.argv[idx + 1])
        forms = forms[:n]

    if '--range' in sys.argv:
        idx = sys.argv.index('--range')
        a = int(sys.argv[idx + 1])
        b = int(sys.argv[idx + 2])
        forms = forms[a-1:b]

    for i, (start, end, form) in enumerate(forms, 1):
        preview = form[:head_len] if head_len else form[:80]
        if len(form) > len(preview):
            preview += "..."
        preview = preview.replace('\n', ' ')
        print(f"{i}: [{start}-{end}] {preview}")

if __name__ == '__main__':
    main()
