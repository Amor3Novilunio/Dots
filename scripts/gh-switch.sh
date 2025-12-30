#!/usr/bin/env bash

echo "=============================="
echo "   GH Multi-Account Switcher"
echo "=============================="

# Dots Paths ---------------------------------
DOTS="$HOME/Dots"
DOTS_HOME_DIR="$DOTS/home"
DOTS_HOME_DOT_CONFIG_DIR="$DOTS_HOME_DIR/.config"

DOTS="$HOME/Dots"
DOTS_SCRIPTS_DIR="$DOTS/scripts"
DOTS_SCRIPTS_USER_DIR="$DOTS_SCRIPTS_DIR/gh-users"  # path to your user folder

# List files excluding README.MD
FILES=()
for f in "$DOTS_SCRIPTS_USER_DIR"/*; do
    [[ $(basename "$f") == "README.MD" ]] && continue
    FILES+=("$f")
done

echo ""
ACTIVE_ACCOUNT=$(git config --global user.name 2>/dev/null)
echo "Current active GitHub account: $ACTIVE_ACCOUNT"
echo ""

# Step 1: Select account file
PS3="Select the GitHub account number: "
select FILENAME in "${FILES[@]##*/}"; do
    if [[ -n "$FILENAME" ]]; then
        SELECTED_FILE="$DOTS_SCRIPTS_USER_DIR/$FILENAME"
        echo "You selected: $FILENAME"
        break
    else
        echo "Invalid selection, try again."
    fi
done

echo ""

# Step 2: Read the file into an array
mapfile -t LINES < "$SELECTED_FILE"

# Extract values
USERNAME_LINE="${LINES[0]}"          # e.g., <username>
GH_SWITCH_CMD="${LINES[1]}"          # e.g., gh auth switch --user <username>
GIT_NAME_CMD="${LINES[2]}"           # e.g., git config --global user.name "<username>"
GIT_EMAIL_CMD="${LINES[3]}"          # e.g., git config --global user.email "<email>"

# Step 3: Attempt to switch GH account and capture output
OUTPUT=$(gh auth switch --user "$USERNAME_LINE" 2>&1)

if [[ "$OUTPUT" == *"no accounts matched that criteria"* ]]; then
    echo "GitHub account '$USERNAME_LINE' not found."
    read -p "Do you want to login to this account? (y/n) " RESP
    if [[ "$RESP" =~ ^[Yy]$ ]]; then
        gh auth login
    else
        echo "Exiting."
        exit 0
    fi
else
    echo "✓ Switched active account for github.com to '$USERNAME_LINE'"
    echo "Applying git config..."
    eval "$GIT_NAME_CMD"
    eval "$GIT_EMAIL_CMD"
fi
