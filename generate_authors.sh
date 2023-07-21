#!/bin/bash

# Function to get unique authors (names and emails) from git log
get_authors() {
  git log --format='%aN <%aE>' | sort | uniq
}

# Main script
repository_path="https://github.com/sirphilalx/simple_shell.git"
authors_file="AUTHORS"

cd "$repository_path" || exit 1

# Get the unique authors (names and emails)
authors=$(get_authors)

# Create or truncate the AUTHORS file
> "$authors_file"

# Append authors to the AUTHORS file
echo "$authors" >> "$authors_file"

echo "Authors have been written to $authors_file."
