#!/bin/bash

VENV_DIR=".venv"
GITIGNORE_FILE=".gitignore"

update_gitignore() {
    # Check if .gitignore exists, if not create it
    if [ ! -f "$GITIGNORE_FILE" ]; then
        touch "$GITIGNORE_FILE"
        echo "Created .gitignore file."
    fi

    # Check if .gitignore contains the VENV_DIR, if not add it
    if ! grep -q "^$VENV_DIR/\$" "$GITIGNORE_FILE"; then
        echo "$VENV_DIR/" >> "$GITIGNORE_FILE"
        echo "Added $VENV_DIR to .gitignore."
    else
        echo "$VENV_DIR is already in .gitignore."
    fi
}

handle_x() {
	deactivate
}

handle_r() {
	if [ -d "$VENV_DIR" ]; then
        deactivate
		rm -rf "$VENV_DIR"
                echo "Virtual environment removed."
	else
		echo "No virtual environment found to remove."
	fi
}

handle_h() {
    echo "Usage: setupvenv [option]"
    echo "Options:"
    echo "  -x     Exit the virtual environment"
    echo "  -r     Remove the virtual environment"
    echo "  -h     Show this help message"
}

handle_default() {
	# Create virtual environment if it doesn't exist
	if [ ! -d "$VENV_DIR" ]; then
		python3 -m venv "$VENV_DIR"
		echo "Virtual environment created."
	fi

	# Activate virtual environment
	source "$VENV_DIR/bin/activate"

	# Install requirements if exists
	if [ -f "requirements.txt" ]; then
		pip install -r requirements.txt
	fi
	update_gitignore
}

# Parse options
case "$1" in
    -x)
        handle_x
        ;;
    -r)
        handle_r
        ;;
    -h)
        handle_h
        ;;
    *)
        handle_default
        ;;
esac

