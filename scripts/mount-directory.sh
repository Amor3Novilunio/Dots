#!/usr/bin/env bash

set -e

# ---- STEP 1: Find mounted directories under /mnt ----
mapfile -t MOUNTED < <(
  mount | awk '{print $3}' | grep "^/mnt/"
)

if [ ${#MOUNTED[@]} -eq 0 ]; then
  echo "No mounted directories found under /mnt."
  exit 0
fi

echo "Select a mounted folder to go to:"
PS3="Choose a folder: "
select FOLDER in "${MOUNTED[@]}"; do
  [[ -n "$FOLDER" ]] || { echo "Invalid selection."; continue; }
  break
done

# ---- STEP 2: cd to it ----
cd "$FOLDER" || { echo "Failed to cd into $FOLDER"; exit 1; }

echo "✅ Changed directory to $FOLDER"
echo "Current location: $(pwd)"
