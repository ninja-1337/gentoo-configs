#!/bin/bash

# Get the input and output file paths from the command line arguments
input_file="$1"
output_file="$2"

# Initialize counters
line_count=0
json_array=""

# Loop through each line in the input file
while IFS= read -r line; do

  # Increment the line count
  ((line_count++))

  # Add the current line to the JSON array
  json_array+=$(printf '"%s",' "$line")

  # If we've reached 10 lines, write the JSON to the output file
  if ((line_count == 10)); then

    # Remove the trailing comma from the JSON array
    json_array="${json_array%,}"

    # Write the JSON object to the output file
    printf '{"prompt": "  ", "completion": [%s]}\n' "$json_array" >> "$output_file"

    # Reset the line count and JSON array
    line_count=0
    json_array=""

  fi

done < "$input_file"

# If there are any lines left over, write them to the output file
if ((line_count > 0)); then

  # Remove the trailing comma from the JSON array
  json_array="${json_array%,}"

  # Write the JSON object to the output file
  printf '{"prompt": "  ", "completion": [%s]}\n' "$json_array" >> "$output_file"

fi
