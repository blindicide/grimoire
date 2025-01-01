#!/bin/bash

# Get the current date and time
COMMIT_MESSAGE="Scripted commit ($(date '+%Y-%m-%d %H:%M:%S'))"

# Add all files recursively
git add .

# Commit with the specified message
git commit -m "$COMMIT_MESSAGE"

# Push the commit to the remote repository
git push

