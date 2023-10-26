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
# Check if brew is installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Function to install packages if they aren't installed
install_package() {
    for pkg in "$@"; do
        if ! brew list "$pkg" &>/dev/null; then
            brew install "$pkg"
        else
            echo "$pkg is already installed."
        fi
    done
}

# Function to install cask packages if they aren't installed
install_cask() {
    for pkg in "$@"; do
        if ! brew list --cask "$pkg" &>/dev/null; then
            brew install --cask "$pkg"
        else
            echo "$pkg is already installed."
        fi
    done
}

# List of common packages for both macOS architectures and Linux x86_64
pkgs=( zoxide bat fzf tidy-viewer dust tokei hyperfine
    tealdeer gping grex kalker jrnl ctop lazydocker navi
    gh rich mdv khal gnuplot vcpkg)
casks=( appcleaner google-chrome sublime-text vlc )

# Determine OS and architecture
case $(uname -s) in
"Darwin")
  if [ "$(uname -m)" = "arm64" ]; then
      printf '#%.0s' {1..80}
      echo -e "\n    RUNNING ON $(uname -s) System with CPU architecture : $(uname -m)"
      printf '#%.0s' {1..80}
      echo

        install_package "${pkgs[@]}"
        install_cask "${casks[@]}"

  elif [ "$(uname -m)" = "x86_64" ]; then
      printf '#%.0s' {1..80}
      echo -e "\n    RUNNING ON $(uname -s) System with CPU architecture : $(uname -m)"
      printf '#%.0s' {1..80}
      echo
        install_package "${pkgs[@]}"
        install_cask "${casks[@]}"
  fi
  ;;
"Linux")
  if [ "$(uname -m)" = "x86_64" ]; then
        install_package "${pkgs[@]}"
        install_cask "${casks[@]}"
  fi
  ;;
esac

echo
printf '-%.0s' {1..80}
echo "\n    All packages have been installed or checked."
printf '-%.0s' {1..80}
echo

