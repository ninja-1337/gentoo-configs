#!/bin/bash

# Check for the correct number of command line arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <file_list> <destination_dir>"
    exit 1
fi

# Path to the text file containing the list of files
file_list_path="$1"

# Destination directory for the copied files
destination_dir="$2"

# Loop through each file in the list and copy/move it to the destination directory
while read -r file_path; do
    # Copy the file to the destination directory
    cp "$file_path" "$destination_dir"
done < "$file_list_path"
