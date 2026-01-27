#!/usr/bin/env bash

set -e

echo "=============================="
echo "        Disk Mounter"
echo "=============================="
echo

# ---- STEP 1: Select disk ----
mapfile -t DISKS < <(
  lsblk -lnpo NAME,TYPE,SIZE | awk '$2=="disk" {print $1 " | " $2 " | " $3}'
)

if [ ${#DISKS[@]} -eq 0 ]; then
  echo "No disks found."
  exit 1
fi

PS3="Select a disk :  "
select DISK_ENTRY in "${DISKS[@]}"; do
  [[ -n "$DISK_ENTRY" ]] || { echo "Invalid selection."; continue; }
  DISK="${DISK_ENTRY%% | *}"
  break
done

echo
echo "Selected disk: $DISK"
echo

# ---- STEP 2: Select partition ----
mapfile -t PARTS < <(
  lsblk -lnpo NAME,SIZE,TYPE "$DISK" | awk '$3=="part" {print $1 " | " $2}'
)

if [ ${#PARTS[@]} -eq 0 ]; then
  echo "No partitions found on $DISK."
  exit 1
fi

echo "Select a partition:"
select PART_ENTRY in "${PARTS[@]}"; do
  [[ -n "$PART_ENTRY" ]] || { echo "Invalid selection."; continue; }
  PARTITION="${PART_ENTRY%% | *}"
  break
done

echo
echo "Selected partition: $PARTITION"
echo

# ---- STEP 3: Check if storage is still connected ----
if [ ! -b "$PARTITION" ]; then
  echo "⚠️  Partition $PARTITION is not connected!"
  exit 1
fi

echo "✅ Partition is connected."
echo

# ---- STEP 4: Detect filesystem type (mandatory) ----
FS_TYPE=$(lsblk -no FSTYPE "$PARTITION")
if [ -z "$FS_TYPE" ]; then
  echo "⚠️  Could not detect filesystem type, defaulting to auto"
  FS_TYPE="auto"
fi

echo "Detected filesystem: $FS_TYPE"
echo

# ---- STEP 5: Mount automatically under /mnt ----
MOUNT_POINT="/mnt/$(basename $PARTITION)"
sudo mkdir -p "$MOUNT_POINT"
sudo mount -t "$FS_TYPE" "$PARTITION" "$MOUNT_POINT"

echo "✅ Mounted successfully at $MOUNT_POINT"
