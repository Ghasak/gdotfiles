#!/usr/bin/env bash
#
#
echo "Hello world"

# Check the zsh version
ZSH_VERSION=$(zsh --version | awk '{print $2}')
BASH_PATH=$(which bash)
BASH_VERSION=$($BASH_PATH --version | head -n 1 | awk '{print $4}' | awk -F '(' '{print$1}')

echo "ZSH Version: $ZSH_VERSION"
echo "Bash Version: $BASH_VERSION"
