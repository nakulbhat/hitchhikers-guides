#!/bin/bash

# Check if the required files exist in the template branch
template_branch="general/template"
template_files=("hitchhikers-guide.cls")

# Checkout the template files from the template branch into the current branch
echo "Checking out template files from $template_branch..."
git checkout "$template_branch" -- "${template_files[@]}"

if [ $? -ne 0 ]; then
    echo "Error: Failed to checkout template files. Make sure you are in the target branch and the template branch exists."
    exit 1
fi

echo "Template files checked out successfully."

# Extract version number from the .cls file
version_line=$(grep '\\ProvidesClass' "${template_files[0]}")
if [[ $version_line =~ v([0-9]+\.[0-9]+\.[0-9]+) ]]; then
    version_number="v${BASH_REMATCH[1]}"
    echo "Extracted version number: $version_number"
else
    echo "Error: Failed to extract version number from ${template_files[0]}."
    exit 1
fi

# Stage the template files
echo "Staging template files..."
git add "${template_files[@]}"
if [ $? -ne 0 ]; then
    echo "Error: Failed to stage template files."
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

echo "Commit successful. Template files updated to $version_number."