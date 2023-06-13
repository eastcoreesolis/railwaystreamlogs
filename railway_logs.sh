#!/bin/bash

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python is not installed. Installing..."
    
    # Check the Linux distribution
    if command -v apt-get &> /dev/null; then
        # Ubuntu and Debian-based distributions
        sudo apt-get update
        sudo apt-get install -y python3
    elif command -v dnf &> /dev/null; then
        # Fedora and CentOS/RHEL 8
        sudo dnf install -y python3
    elif command -v yum &> /dev/null; then
        # CentOS/RHEL 7
        sudo yum install -y python3
    elif command -v pacman &> /dev/null; then
        # Arch Linux
        sudo pacman -Sy --noconfirm python3
    else
        echo "Unsupported distribution. Please install Python manually."
        exit 1
    fi
    
    echo "Python has been installed."
else
    echo "Python is already installed."
fi 

# Check if python3 is in the PATH
if command -v python3 &> /dev/null; then
    echo "Python 3 is already in the PATH."
else
    echo "Python 3 is not found in the PATH. Adding it..."

    # Check the shell profile file (e.g., .bashrc, .bash_profile, .zshrc)
    if [[ -f ~/.bashrc ]]; then
        profile_file=~/.bashrc
    elif [[ -f ~/.bash_profile ]]; then
        profile_file=~/.bash_profile
    elif [[ -f ~/.zshrc ]]; then
        profile_file=~/.zshrc
    else
        echo "No supported shell profile file found. Please add 'python3' to the PATH manually."
        exit 1
    fi

    # Add python3 to the PATH in the shell profile file
    echo "" >> "$profile_file"
    echo "# Add python3 to the PATH" >> "$profile_file"
    echo 'export PATH="$PATH:/usr/bin/python3"' >> "$profile_file"

    # Reload the shell profile
    source "$profile_file"

    echo "Python 3 has been added to the PATH."
fi

# Run the Python script
python3 test.py
