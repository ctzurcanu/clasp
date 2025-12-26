#!/bin/bash
# Build and install rlasp

set -e

echo "Building rlasp in release mode..."
PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH" cargo build --release --bin rlasp

echo "Installing to ~/.local/bin/rlasp..."
mkdir -p ~/.local/bin
cp target/release/rlasp ~/.local/bin/rlasp
chmod +x ~/.local/bin/rlasp

echo ""
echo "Installation complete!"
echo ""
echo "Make sure ~/.local/bin is in your PATH:"
echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
echo ""
echo "Then run: rlasp"
