#!/bin/bash
PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH" cargo build --release 2>&1 | tail -20
