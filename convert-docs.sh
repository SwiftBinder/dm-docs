#!/bin/bash

# Convert markdown files from dm-ui/docs to MDX format for Nextra
# This script handles HTML comments conversion and other MDX-specific requirements

SOURCE_DIR="../dm-ui/docs/user"
TARGET_DIR="./pages"

echo "🔄 Converting markdown files to MDX format..."

# Function to convert a single file
convert_md_to_mdx() {
    local source_file="$1"
    local target_file="$2"
    
    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$target_file")"
    
    # Read the file and convert HTML comments to MDX comments
    # Replace <!-- comment --> with {/* comment */}
    sed 's/<!--/{\/*/g; s/-->/*\/}/g' "$source_file" > "$target_file"
    
    echo "  ✓ Converted: $target_file"
}

# Function to convert all .md files in a directory
convert_directory() {
    local source_dir="$1"
    local target_dir="$2"
    local lang="$3"
    
    echo ""
    echo "Converting $lang documentation..."
    
    # Find all .md files and convert them
    find "$source_dir" -name "*.md" | while read -r source_file; do
        # Get relative path from source_dir
        rel_path="${source_file#$source_dir/}"
        # Change extension to .mdx
        target_file="$target_dir/${rel_path%.md}.mdx"
        
        convert_md_to_mdx "$source_file" "$target_file"
    done
}

# Remove old symlinks in subdirectories
echo "Cleaning up old symlinks..."
for subdir in business guide admin reference future; do
    if [ -L "$TARGET_DIR/en/$subdir" ]; then
        rm "$TARGET_DIR/en/$subdir"
        echo "  ✓ Removed symlink: $TARGET_DIR/en/$subdir"
    fi
done

# Convert all English documentation
convert_directory "$SOURCE_DIR/en" "$TARGET_DIR/en" "English"

# Convert all French documentation
convert_directory "$SOURCE_DIR/fr" "$TARGET_DIR/fr" "French"

echo ""
echo "✨ Conversion complete!"
echo ""
echo "All .md files have been converted to .mdx with proper MDX comment syntax."
echo "You can now edit the original .md files and re-run this script to update."
