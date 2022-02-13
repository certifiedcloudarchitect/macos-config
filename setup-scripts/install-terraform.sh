#!/usr/bin/env bash

INSTALL_TERRAFORM=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# install-terraform
# parameters: [INSTALL_TERRAFORM] true or false
#-------------------------------------------------------------------------------------------------------------
if [ "${INSTALL_TERRAFORM}" = "true" ]; then
    if ! type tfenv >/dev/null 2>&1; then

        FORMULAS=(
            "tfenv"
        )
        echo "Installing tfenv..."
        for formula in "${FORMULAS[@]}"; do
            brew install "${formula}"
        done

        echo "Checking Brew status..."
        brew update && brew upgrade
        brew update --cask && brew upgrade --cask
        brew doctor && brew cleanup

        tfenv install latest
        tfenv use latest

        echo "Version check..."
        terraform -version

    else
        echo "tfenv already installed."
    fi

    echo "Install Terraform...Done!"
fi
