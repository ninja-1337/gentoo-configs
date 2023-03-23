#!/bin/bash

# Get the directory containing the PDF files from the command line argument
pdf_dir="$1"

# Create the directory if it doesn't exist
mkdir -p "$pdf_dir"

# Loop through each PDF file in the directory and convert it to a text file
for pdf_file in "$pdf_dir"/*.pdf; do
    # Get the filename without the extension
    base_name=$(basename "$pdf_file" .pdf)
    # Convert the PDF file to a text file
    pdftotext "$pdf_file" "$pdf_dir/$base_name.txt"
done
