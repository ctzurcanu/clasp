#!/bin/bash
# Generate .bc (bitcode) files from .ll (LLVM IR) files

set -e

LLVM_AS="/opt/homebrew/opt/llvm@19/bin/llvm-as"
IMAGE_DIR="target/lisp-image"

if [ ! -d "$IMAGE_DIR" ]; then
    echo "Error: $IMAGE_DIR directory not found"
    echo "Run 'cargo run --bin rlasp-compile -- --all' first"
    exit 1
fi

echo "Generating bitcode files from LLVM IR..."
echo

# Find all .ll files and convert them to .bc
find "$IMAGE_DIR" -name "*.ll" | while read -r ll_file; do
    bc_file="${ll_file%.ll}.bc"
    echo "  $ll_file -> $bc_file"

    # Convert .ll to .bc using llvm-as
    "$LLVM_AS" "$ll_file" -o "$bc_file"
done

echo
echo "Bitcode generation complete!"
echo "Files are in: $IMAGE_DIR"
