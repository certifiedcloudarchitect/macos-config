#!/usr/bin/env bash

INSTALL_BREW=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# install-homebrew
# parameters: [INSTALL_BREW] true or false
#-------------------------------------------------------------------------------------------------------------
if [ "${INSTALL_BREW}" = "true" ]; then
    if ! type brew >/dev/null 2>&1; then

        echo "Installing Brew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        DEFAULT_TAPS=(
            "homebrew/bundle"
            "homebrew/cask"
            "homebrew/core"
        )
        echo "Installing default Brew Taps..."
        for tap in "${DEFAULT_TAPS[@]}"; do
            brew tap "${tap}"
        done

        DEFAULT_FORMULAS=(
            "ca-certificates"
            "bash"
            "coreutils"
            "curl"
            "git"
            "git-lfs"
            "gnupg"
            "jq"
            "make"
            "nano"
            "openssh"
            "pinentry-mac"
            "rsync"
            "shellcheck"
            "shfmt"
            "unzip"
            "wget"
            "yq"
            "zip"
            "zsh"
        )
        echo "Installing default Brew Formulas..."
        for formula in "${DEFAULT_FORMULAS[@]}"; do
            brew install "${formula}"
        done

        DEFAULT_CASKS=(
            "docker"
            "google-chrome"
            "visual-studio-code"
        )
        echo "Installing default Brew Casks..."
        for cask in "${DEFAULT_CASKS[@]}"; do
            brew install "${cask}"
        done
        echo "Checking Brew status..."
        brew update && brew upgrade
        brew update --cask && brew upgrade --cask
        brew doctor && brew cleanup
    fi

    echo "Install Brew...Done!"
fi
