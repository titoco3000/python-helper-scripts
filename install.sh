#!/bin/bash

SCRIPTS_DIR=~/scripts
SETUPVENV_SCRIPT=setupvenv.sh
PIPSAVE_SCRIPT=pipsave.sh
BASHRC_FILE=~/.bashrc

# Create scripts directory if it doesn't exist
if [ ! -d "$SCRIPTS_DIR" ]; then
    mkdir -p "$SCRIPTS_DIR"
    echo "Created directory $SCRIPTS_DIR."
fi

# Move scripts to the scripts directory
if [ -f "$SETUPVENV_SCRIPT" ]; then
    mv "$SETUPVENV_SCRIPT" "$SCRIPTS_DIR/"
    echo "Moved $SETUPVENV_SCRIPT to $SCRIPTS_DIR."
else
    echo "Error: $SETUPVENV_SCRIPT not found."
fi

if [ -f "$PIPSAVE_SCRIPT" ]; then
    mv "$PIPSAVE_SCRIPT" "$SCRIPTS_DIR/"
    echo "Moved $PIPSAVE_SCRIPT to $SCRIPTS_DIR."
else
    echo "Error: $PIPSAVE_SCRIPT not found."
fi

# Add aliases to .bashrc if they are not already present
if ! grep -q "alias setupvenv" "$BASHRC_FILE"; then
    echo "alias setupvenv=\"source ~/scripts/setupvenv.sh\"" >> "$BASHRC_FILE"
    echo "Added alias for setupvenv to $BASHRC_FILE."
else
    echo "Alias for setupvenv already exists in $BASHRC_FILE."
fi

if ! grep -q "alias pipsave" "$BASHRC_FILE"; then
    echo "alias pipsave=\"~/scripts/pipsave.sh\"" >> "$BASHRC_FILE"
    echo "Added alias for pipsave to $BASHRC_FILE."
else
    echo "Alias for pipsave already exists in $BASHRC_FILE."
fi

# Source .bashrc to make aliases available immediately
source "$BASHRC_FILE"
echo "Sourced $BASHRC_FILE to make aliases available."
