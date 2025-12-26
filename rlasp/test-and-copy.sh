#!/bin/bash

# Script to test files from clisp/in_work/ and copy working ones
# Usage: ./test-and-copy.sh

RLASP="./target/release/rlasp"
IN_WORK_DIR="clisp/in_work"
DEST_DIR="clisp"
TIMEOUT=5

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Results tracking
declare -a PASSED_FILES
declare -a FAILED_FILES

echo "Testing files from $IN_WORK_DIR..."
echo "======================================"
echo ""

# Find all .lisp files in in_work directory (not in subdirectories)
while IFS= read -r filepath; do
    filename=$(basename "$filepath")

    echo -n "Testing $filename... "

    # Try to load the file with rlasp
    result=$(echo "(load \"$filepath\")
:quit" | timeout $TIMEOUT $RLASP 2>&1)

    # Check if load was successful (returns T and no errors)
    if echo "$result" | grep -q "=> T" && ! echo "$result" | grep -q "Error:"; then
        echo -e "${GREEN}PASSED${NC}"
        PASSED_FILES+=("$filename")

        # Copy to destination directory
        cp "$filepath" "$DEST_DIR/$filename"
        echo "  → Copied to $DEST_DIR/$filename"
    else
        echo -e "${RED}FAILED${NC}"
        FAILED_FILES+=("$filename")

        # Extract error message if present
        error=$(echo "$result" | grep "Error:" | head -1)
        if [ -n "$error" ]; then
            echo -e "  ${YELLOW}$error${NC}"
        fi
    fi
    echo ""
done < <(find "$IN_WORK_DIR" -maxdepth 1 -name "*.lisp" -type f | sort)

# Print summary
echo ""
echo "======================================"
echo "SUMMARY"
echo "======================================"
echo ""
echo -e "${GREEN}PASSED (${#PASSED_FILES[@]} files):${NC}"
for file in "${PASSED_FILES[@]}"; do
    echo "  ✓ $file"
done

echo ""
echo -e "${RED}FAILED (${#FAILED_FILES[@]} files):${NC}"
for file in "${FAILED_FILES[@]}"; do
    echo "  ✗ $file"
done

echo ""
echo "======================================"
echo "Success rate: ${#PASSED_FILES[@]} / $((${#PASSED_FILES[@]} + ${#FAILED_FILES[@]}))"
echo "======================================"
