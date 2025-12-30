#!/usr/bin/env bash

set -e

# -----------------------------------------------
# Prompt for user password
echo "🔐 Please enter your password to continue:"
# The -v flag stores the password in a variable (but won't echo it)
# We use sudo -v to validate the password without running anything
if ! sudo -v; then
  echo "❌ Incorrect password. Exiting."
  exit 1
fi
# Keep sudo session alive for the rest of the script (optional)
trap 'sudo -k' EXIT

# -----------------------------------------------
# Handle CLI flags
MODE="interactive"  # default
case "$1" in
  --skip-all-existing)
    MODE="skip"
    ;;
  --replace-all)
    MODE="replace"
    ;;
  ""|--help|-h)
    ;; # Do nothing for now (interactive by default)
  *)
    echo "❌ Unknown flag: $1"
    echo "Usage: $0 [--skip-all-existing | --replace-all]"
    exit 1
    ;;
esac

TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
# Origin Paths ---------------------------------
DOT_CONFIG_DIR="$HOME/.config"
# Dots Paths ---------------------------------
DOTS="$HOME/Dots"
DOTS_HOME_DIR="$DOTS/home"
DOTS_HOME_DOT_CONFIG_DIR="$DOTS_HOME_DIR/.config"

echo "------------------------------------"
echo "🔗 Applying Home Configurations"
echo "------------------------------------"
echo ""

# Allow . Files (like .zshrc)
shopt -s dotglob

# User Level Synchronization ---
for item in "$DOTS_HOME_DIR"/*; do
  name="$(basename "$item")"
  target_dir="$HOME/$name"

  # Skip .config directory itself — handled later
  if [ "$name" = ".config" ]; then
    continue
  fi

  # ✅ Skip if already linked correctly
  if [ -L "$target_dir" ] && [ "$(readlink "$target_dir")" = "$item" ]; then
    echo "✅ $target_dir is already linked correctly — skipping"
    continue
  fi

  if [ -e "$target_dir" ]; then
    case "$MODE" in
      skip)
        echo "⏭️  $target_dir exists — skipping (flag: --skip-all-existing)"
        continue
        ;;
      replace)
        echo "🗑️  $target_dir exists — removing (flag: --replace-all)"
        rm -rv "$target_dir"
        echo "🔗 Symlinking $item → $target_dir"
        ln -s "$item" "$target_dir"
        ;;
      interactive)
        echo "⚠️  $name already exists at:"
        echo "$target_dir"
        echo ""
        echo "What would you like to do?"
        echo "[1] Delete it and Continue"
        echo "[2] Skip File Sync"
        echo ""

        read -rp "Enter your choice : " choice
        echo ""
        case "$choice" in
          1)
            echo "-------------------------------"
            rm -rv "$target_dir"
            echo "🔗 Creating Symlink from $item to $target_dir"
            ln -s "$item" "$target_dir"
            echo "-------------------------------"
            ;;
          2)
            echo "-------------------------------"
            echo "Skipping $target_dir"
            echo "-------------------------------"
            continue
            ;;
          *)
            echo "-------------------------------"
            echo "🚫 Invalid option. Exiting."
            echo "-------------------------------"
            exit 1
            ;;
        esac
        ;;
    esac
  else
    echo "🔗 Creating Symlink: $item → $target_dir"
    ln -s "$item" "$target_dir"
  fi

  echo ""
done

# .config Synchronization ---
for item in "$DOTS_HOME_DOT_CONFIG_DIR"/*; do
  name="$(basename "$item")"
  target_dir="$DOT_CONFIG_DIR/$name"

  # ✅ Skip if already linked correctly
  if [ -L "$target_dir" ] && [ "$(readlink "$target_dir")" = "$item" ]; then
    echo "✅ $target_dir is already linked correctly — skipping"
    continue
  fi

  if [ -e "$target_dir" ]; then
    case "$MODE" in
      skip)
        echo "⏭️  $target_dir exists — skipping (flag: --skip-all-existing)"
        continue
        ;;
      replace)
        echo "🗑️  $target_dir exists — removing (flag: --replace-all)"
        rm -rv "$target_dir"
        echo "🔗 Symlinking $item → $target_dir"
        ln -s "$item" "$target_dir"
        ;;
      interactive)
        echo "⚠️  $name already exists in ~/.config"
        echo "$target_dir"
        echo ""
        echo "What would you like to do?"
        echo "[1] Delete it and Continue"
        echo "[2] Skip File Sync"
        echo ""

        read -rp "Enter your choice : " choice
        echo ""
        case "$choice" in
          1)
            echo "-------------------------------"
            rm -rv "$target_dir"
            echo "🔗 Creating Symlink from $item to $target_dir"
            ln -s "$item" "$target_dir"
            echo "-------------------------------"
            ;;
          2)
            echo "-------------------------------"
            echo "Skipping $target_dir"
            echo "-------------------------------"
            continue
            ;;
          *)
            echo "-------------------------------"
            echo "🚫 Invalid option. Exiting."
            echo "-------------------------------"
            exit 1
            ;;
        esac
        ;;
    esac
  else
    echo "🔗 Creating Symlink: $item → $target_dir"
    ln -s "$item" "$target_dir"
  fi

  echo ""
done


echo ""
echo "------------------------------------"
echo "✅ Dotfiles Switch complete."
echo "------------------------------------"
echo ""