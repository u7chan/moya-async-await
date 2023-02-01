#!/bin/bash

if ! which mint >/dev/null; then
    echo 'warning: Mint not installed. Please install mint from https://github.com/yonaskolb/Mint'
    exit 1
fi

TARGET_DIR=$1

if [ -z "$TARGET_DIR" ]; then
    echo "usage: "
    echo "  arg1: <target_dir>"
    exit 1
fi

mint run SwiftFormat $TARGET_DIR
