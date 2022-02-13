#!/usr/bin/env bash

INSTALL_KUBECTL=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# install-kubectl
# parameters: [INSTALL_KUBECTL] true or false
#-------------------------------------------------------------------------------------------------------------
if [ "${INSTALL_KUBECTL}" = "true" ]; then
    if ! type kubectl >/dev/null 2>&1; then

        FORMULAS=(
            "kubernetes-cli"
            "helm"
        )
        echo "Installing kubectl..."
        for formula in "${FORMULAS[@]}"; do
            brew install "${formula}"
        done

        echo "Version check..."
        kubectl version --client

        echo "Checking Brew status..."
        brew update && brew upgrade
        brew update --cask && brew upgrade --cask
        brew doctor && brew cleanup
    else
        echo "kubectl already installed."
    fi

    echo "Install kubectl...Done!"
fi
