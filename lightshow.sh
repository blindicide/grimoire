#!/bin/bash

# Default text
TEXT="SAMPLE TEXT"

# Parse command-line arguments
while getopts ":t:" opt; do
  case $opt in
    t)
      TEXT="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Function to create placeholder.txt in a directory
create_placeholder() {
  local dir="$1"
  local file="$dir/placeholder.txt"
  if [[ ! -f "$file" ]]; then
    echo "$TEXT" > "$file"
    echo "Created: $file"
  else
    echo "Exists: $file"
  fi
}

# Recursively process directories
process_directory() {
  local dir="$1"
  create_placeholder "$dir"
  for subdir in "$dir"/*/; do
    if [[ -d "$subdir" ]]; then
      process_directory "$subdir"
    fi
  done
}

# Start processing from the current directory
process_directory "."

echo "Done!"

