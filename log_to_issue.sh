#!/bin/bash

# Usage: ./log_to_issue.sh "Title" "Body Content"

TITLE="$1"
BODY="$2"

if ! command -v gh &> /dev/null; then
    echo "Error: 'gh' CLI is not installed. Please install it (brew install gh) and login (gh auth login)."
    exit 1
fi

# Create the issue
gh issue create --title "$TITLE" --body "$BODY" --label "negotiation-log"

echo "Logged to GitHub Issue: $TITLE"
