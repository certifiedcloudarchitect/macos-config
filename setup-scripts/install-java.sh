#!/usr/bin/env bash

INSTALL_JAVA=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# install-java
# parameters: [INSTALL_JAVA] true or false
#-------------------------------------------------------------------------------------------------------------
if [ "${INSTALL_JAVA}" = "true" ]; then
    if ! type jenv >/dev/null 2>&1; then

        FORMULAS=(
            "gradle"
            "maven"
            "groovysdk"
            "openjdk"
            "jenv"
        )
        echo "Installing jenv..."
        for formula in "${FORMULAS[@]}"; do
            brew install "${formula}"
        done

        echo "Checking Brew status..."
        brew update && brew upgrade
        brew update --cask && brew upgrade --cask
        brew doctor && brew cleanup

    else
        echo "jenv already installed."
    fi

    echo "Install Java...Done!"
fi
