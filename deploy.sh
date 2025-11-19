#!/bin/bash

set -e

SOURCE_DIR=".claude/commands"
TARGET_DIR="$HOME/.claude/commands"
ARCHIVE_DIR="$TARGET_DIR/archive/$(date +"%Y%m%d%H%M%S")"

# Check if source exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory $SOURCE_DIR does not exist"
    exit 1
fi

# Create target directory
mkdir -p "$TARGET_DIR"

# Archive existing files (if any exist)
if compgen -G "$TARGET_DIR/*" > /dev/null 2>&1 || ls "$TARGET_DIR"/* > /dev/null 2>&1; then
    for file in "$TARGET_DIR"/*; do
        if [ -f "$file" ]; then
            mkdir -p "$ARCHIVE_DIR"
            echo "Archiving: $(basename "$file")"
            mv "$file" "$ARCHIVE_DIR/"
        fi
    done
fi

# Deploy new files
echo "Deploying commands to $TARGET_DIR"
cp "$SOURCE_DIR"/* "$TARGET_DIR/"

echo "Deployment complete!"
