#!/usr/bin/env bash

set -e

DOTS_DIR="$HOME/Dots"
HW_CONFIG="$DOTS_DIR/etc/nixos/hardware-configuration.nix"

echo "-----------------------------------"
echo "Generating Hardware Configuration"
echo "-----------------------------------"

# Check if hardware-configuration.nix already exists
if [ -f "$HW_CONFIG" ]; then
  echo "⚠️  hardware-configuration.nix already exists at:"
  echo "   $HW_CONFIG"
  echo ""
  echo "What would you like to do?"
  echo "[1] Delete it and regenerate"
  echo "[2] Cancel initialization"
  echo "[3] skip generating hardware-configuration.nix"
  echo ""

  read -rp "Enter your choice : " choice
  case "$choice" in
  1)
    echo "🗑️  Deleting existing hardware-configuration.nix"
    rm -v "$HW_CONFIG"
    sudo nixos-generate-config --show-hardware-config >"$HW_CONFIG"
    ;;
  2)
    echo "❌ Cancelled. Nothing was changed."
    exit 1
    ;;
  3)

    echo "Skipped hardware-configuration.nix generation"
    ;;
  *)
    echo "🚫 Invalid option. Exiting."
    exit 1
    ;;
  esac
else
  sudo nixos-generate-config --show-hardware-config >"$HW_CONFIG"
fi

echo ""
echo "-----------------------------------"
echo "Rebuilding Dot Configuration"
echo "-----------------------------------"

# Rebuild using the config from your Dots repo
sudo nixos-rebuild switch -I nixos-config="$DOTS_DIR/etc/nixos/configuration.nix"

echo ""
echo "-----------------------------------"
echo "✅ Rebuild Success"
echo "-----------------------------------"
echo "You can now run 'switch-dots-rebuild'"
echo "→ Rebuild your NixOS system using ~/Dots/etc/nixos"
echo ""
echo "You can now run 'switch-dots'"
echo "→ Apply your dotfile changes from ~/Dots/home to your system"
echo ""

# Cleanup
git update-index --assume-unchanged init.sh
rm -- "$0"
