#!/usr/bin/env bash
# Create or update the standard KAERU labels in a repository.
# Usage: scripts/sync-labels.sh KAERU-dev/<repo>
# Existing labels with the same name get the standard colour and description;
# labels that are not in the list are left alone.
set -euo pipefail

repo="${1:?usage: $0 OWNER/REPO}"
labels="$(dirname "$0")/labels.tsv"

while IFS=$'\t' read -r name color description; do
  gh label create "$name" --repo "$repo" --color "$color" --description "$description" --force
done < "$labels"
