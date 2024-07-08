#!/bin/bash

# Function to change directory
function change_directory {
    if [ $# -ne 1 ]; then
        echo "Usage: cd <directory>"
    else
        cd "$1" || echo "No such file or directory: '$1'"
    fi
}

# Function to list directory contents
function list_directory {
    ls
}

# Function to create a directory
function make_directory {
    if [ $# -ne 1 ]; then
        echo "Usage: mkdir <directory>"
    else
        mkdir "$1" 2>/dev/null || echo "Directory '$1' already exists"
    fi
}

# Main shell loop
while true; do
    # Display the current directory
    echo -n "$(pwd) $ "
    read -r command args

    # Split the command and arguments
    case $command in
        exit)
            break
            ;;
        cd)
            change_directory $args
            ;;
        ls)
            list_directory
            ;;
        mkdir)
            make_directory $args
            ;;
        *)
            echo "Command not found: $command"
            ;;
    esac
done
