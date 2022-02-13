#!/usr/bin/env bash

INSTALL_NODE=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# install-node
# parameters: [INSTALL_NODE] true or false
#-------------------------------------------------------------------------------------------------------------
if [ "${INSTALL_NODE}" = "true" ]; then
    if ! type nvm >/dev/null 2>&1; then

        FORMULAS=(
            "nvm"
        )
        echo "Installing node..."
        for formula in "${FORMULAS[@]}"; do
            brew install "${formula}"
        done

        echo "Checking Brew status..."
        brew update && brew upgrade
        brew update --cask && brew upgrade --cask
        brew doctor && brew cleanup

    else
        echo "nvm already installed."
    fi

    echo "Install Node...Done!"
fi
