#!/bin/bash

# deploy.sh - Deploy Claude commands to home directory

set -e  # Exit on error

SOURCE_DIR=".claude/commands"
TARGET_DIR="$HOME/.claude/commands"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
ARCHIVE_DIR="$TARGET_DIR/archive/$TIMESTAMP"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory $SOURCE_DIR does not exist"
    exit 1
fi

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Check if any files from source already exist in target
FILES_TO_ARCHIVE=()
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        if [ -f "$TARGET_DIR/$filename" ]; then
            FILES_TO_ARCHIVE+=("$filename")
        fi
    fi
done

# Archive existing files if any
if [ ${#FILES_TO_ARCHIVE[@]} -gt 0 ]; then
    echo "Found existing files. Creating archive: $ARCHIVE_DIR"
    mkdir -p "$ARCHIVE_DIR"

    for filename in "${FILES_TO_ARCHIVE[@]}"; do
        echo "  Archiving: $filename"
        mv "$TARGET_DIR/$filename" "$ARCHIVE_DIR/"
    done
fi

# Move files from source to target
echo "Deploying commands to $TARGET_DIR"
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        echo "  Deploying: $filename"
        cp "$file" "$TARGET_DIR/"
    fi
done

echo "Deployment complete!"
