#!/bin/bash

# Fetch the latest changes from remote
echo "Fetching latest changes from remote..."
git fetch --prune

# Switch to main branch and pull latest changes
echo "Switching to main branch..."
git checkout main
git pull origin main

# Get list of merged branches (excluding main, master, and development branches)
echo "Finding merged branches..."
merged_branches=$(git branch --merged main | grep -v -E '^\*|main|master|dev|development|staging|prod|production')

if [ -z "$merged_branches" ]; then
    echo "No merged branches found to clean up."
    exit 0
fi

echo "The following branches will be deleted:"
echo "$merged_branches"

# Prompt for confirmation
read -p "Do you want to proceed with deletion? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Delete each merged branch
    echo "$merged_branches" | while read branch; do
        if [ ! -z "$branch" ]; then
            echo "Deleting branch: $branch"
            git branch -d $branch
        fi
    done
    echo "Cleanup complete!"
else
    echo "Operation cancelled."
fi