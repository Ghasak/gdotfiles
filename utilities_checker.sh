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
pkgs=( zoxide bat fzf tidy-viewer dust tokei hyperfine lolcat boxes figlet
    tealdeer gping grex kalker jrnl ctop lazydocker navi
    gh rich mdv khal gnuplot )
casks=( appcleaner google-chrome sublime-text vlc keycastr stats xquartz numi)

# Determine OS and architecture
case $(uname -s) in
"Darwin")
  if [ "$(uname -m)" = "arm64" ]; then
      printf '#%.0s' {1..80}
      echo -e "\n\tRUNNING ON $(uname -s) System with CPU architecture : $(uname -m)"
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
printf '#%.0s' {1..80}
echo -e "\n\t\tAll packages have been installed or checked."
printf '#%.0s' {1..80}
echo

# npm libraries
#
#   ╰─ npm -g list                                                                                                                                                                                                                                                                                                      ─╯
#   /opt/homebrew/lib
#   ├── @excalidraw/excalidraw@0.15.2
#   ├── asciicast2gif@0.2.1
#   ├── electron@24.4.0
#   ├── eslint@8.53.0
#   ├── js-beautify@1.14.9
#   ├── live-server@1.2.2
#   ├── markdown-it-anchor@8.6.7
#   ├── markdown-it-toc-done-right@4.2.0
#   ├── neovim@4.10.1
#   ├── npm@10.5.0
#   ├── phpdoc@0.3.0
#   ├── puppeteer@19.0.0
#   ├── react-dom@18.2.0
#   ├── react@18.2.0
#   ├── resume-cli@3.0.7
#   ├── taskbook@0.3.0
#   ├── typescript-language-server@4.1.0
#   └── typescript@5.2.2
#




