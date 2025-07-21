#!/bin/zsh

# Git branch backup function
gbak() {
  # Ensure we're in a Git repo
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Error: Not inside a Git repository."
    return 1
  fi

  # Get current branch name
  local current_branch=$(git rev-parse --abbrev-ref HEAD)
  if [[ -z "$current_branch" ]]; then
    echo "Error: Failed to get current branch."
    return 1
  fi

  # Combine all arguments into one comment string
  local raw_comment="$*"

  if [[ -z "$raw_comment" ]]; then
    echo "Usage: gbak <comment>"
    return 1
  fi

  # Sanitize comment: replace non-alphanumeric with dash
  local sanitized_comment=$(echo "$raw_comment" | sed 's/[^a-zA-Z0-9]/-/g')

  # Generate timestamp
  local timestamp=$(date +"%Y.%m.%d-%H.%M")

  # Construct backup branch name
  local backup_branch="${current_branch}.d/bak/${timestamp}-${sanitized_comment}"

  # Create the backup branch
  git branch "$backup_branch"

  if [[ $? -eq 0 ]]; then
    echo "Backup branch created: $backup_branch"
  else
    echo "Error: Failed to create backup branch."
    return 1
  fi
}
