#!/bin/bash

# Function to install packages and update requirements.txt
install_and_save() {
    local failures=()

    # Create requirements.txt if it doesn't exist
    if [ ! -f "requirements.txt" ]; then
        touch "requirements.txt"
        echo "Created requirements.txt file."
    fi

    for package in "$@"; do
        if pip install "$package"; then
            # Get the installed package version
            version=$(pip show "$package" | grep -i version | awk '{print $2}')
            # Add package with version to requirements.txt
            echo "$package==$version" >> "requirements.txt"
            echo "Successfully installed and added $package==$version to requirements.txt."
        else
            failures+=("$package")
            echo "Failed to install $package."
        fi
    done

    # Print all failures
    if [ ${#failures[@]} -ne 0 ]; then
        echo "Failed to install the following packages:"
        for fail in "${failures[@]}"; do
            echo "$fail"
        done
    fi
}

# Check if at least one package name is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: pipsave <package1> <package2> ... <packageN>"
    exit 1
fi

# Install packages and save to requirements.txt
install_and_save "$@"
