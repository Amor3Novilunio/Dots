#!/usr/bin/env bash

set -e

echo "=============================="
echo "       Disk Unmounter"
echo "=============================="
echo

# ---- STEP 1: Find mounted directories under /mnt ----
mapfile -t MOUNTED < <(
  mount | awk '{print $3}' | grep "^/mnt/"
)

if [ ${#MOUNTED[@]} -eq 0 ]; then
  echo "No mounted directories found under /mnt."
  exit 0
fi

echo "Select a mount to unmount:"
PS3="Choose a mount to unmount: "
select MOUNT_POINT in "${MOUNTED[@]}"; do
  [[ -n "$MOUNT_POINT" ]] || { echo "Invalid selection."; continue; }
  break
done

echo
echo "Selected: $MOUNT_POINT"
echo

# ---- STEP 2: Unmount and remove directory ----
sudo umount "$MOUNT_POINT"
sudo rmdir "$MOUNT_POINT"

echo "✅ Successfully unmounted and removed $MOUNT_POINT"
