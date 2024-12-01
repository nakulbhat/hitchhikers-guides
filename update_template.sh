#!/bin/bash

# Define the template branch and required files
template_branch="general/template"
template_files=("hitchhikers-guide.cls")

# Checkout the template files from the template branch into the current branch
echo "Checking out template files from $template_branch..."
git checkout "$template_branch" -- "${template_files[@]}"

if [ $? -ne 0 ]; then
    echo "Error: Failed to checkout template files. Make sure you are in the target branch and the template branch exists."
    exit 1
fi

echo "Template file checked out successfully."

# Extract version number from CHANGELOG.md
changelog_file="CHANGELOG.md"
version_number=$(grep -oP '^## \Kv[0-9]+\.[0-9]+\.[0-9]+' "$changelog_file" | head -n 1)

if [ -z "$version_number" ]; then
    echo "Error: Failed to extract version number from $changelog_file."
    exit 1
fi

echo "Extracted version number: $version_number"

# Stage the template files
echo "Staging template file..."
git add "${template_files[@]}"
if [ $? -ne 0 ]; then
    echo "Error: Failed to stage template file."
    exit 1
fi

# Commit with the appropriate message
commit_message="Update to Template $version_number"
echo "Committing with message: $commit_message"
git commit -m "$commit_message"
if [ $? -ne 0 ]; then
    echo "Error: Commit failed."
    exit 1
fi

echo "Commit successful. Template file updated to $version_number."
