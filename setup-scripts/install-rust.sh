#!/usr/bin/env bash

INSTALL_RUST=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# install-rust
# parameters: [INSTALL_RUST] true or false
#-------------------------------------------------------------------------------------------------------------
if [ "${INSTALL_RUST}" = "true" ]; then
    if ! type rustc >/dev/null 2>&1; then

        FORMULAS=(
            "rustup-init"
        )
        echo "Installing rust..."
        for formula in "${FORMULAS[@]}"; do
            brew install "${formula}"
        done

        echo "Checking Brew status..."
        brew update && brew upgrade
        brew update --cask && brew upgrade --cask
        brew doctor && brew cleanup

        rustup-init -y

        echo "Version check..."
        rustup -V

    else
        echo "rust already installed."
    fi

    echo "Install Rust...Done!"
fi
