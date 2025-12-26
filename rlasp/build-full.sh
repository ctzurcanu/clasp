#!/bin/bash
# Full build script for irlasp (shows all output)

PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH" \
    cargo build --release -p irlasp
