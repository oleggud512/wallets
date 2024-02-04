#!/bin/bash

dir1="$1"
dir2="$2"

echo "$dir1"
echo "$dir2"

# Check if directories are provided
if [ -z "$dir1" ] || [ -z "$dir2" ]; then
    echo "Please provide two directory paths."
    exit 1
fi

# Check if directories exist
if [ ! -d "$dir1" ] || [ ! -d "$dir2" ]; then
    echo "One or both of the directories do not exist."
    exit 1
fi

# Find files with the same relative location but different content
while IFS= read -r file1; do
    relative_path="${file1#$dir1}"
    file2="$dir2$relative_path"
    if [ -f "$file2" ] && ! cmp -s "$file1" "$file2"; then
        echo "Files with different content: $file1 and $file2"
    fi
done < <(find "$dir1" -type f)

# Find files that exist in one directory but not the other
find "$dir1" -type f ! -exec test -e "${dir2}/{}" \; -print
find "$dir2" -type f ! -exec test -e "${dir1}/{}" \; -print