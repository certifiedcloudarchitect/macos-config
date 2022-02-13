#!/usr/bin/env bash

INSTALL_RUBY=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# install-ruby
# parameters: [INSTALL_RUBY] true or false
#-------------------------------------------------------------------------------------------------------------
if [ "${INSTALL_RUBY}" = "true" ]; then
    if ! type rvm >/dev/null 2>&1; then

        FORMULAS=(
            "rbenv"
        )
        echo "Installing rbenv..."
        for formula in "${FORMULAS[@]}"; do
            brew install "${formula}"
        done

        echo "Checking Brew status..."
        brew update && brew upgrade
        brew update --cask && brew upgrade --cask
        brew doctor && brew cleanup

    else
        echo "rbenv already installed."
    fi

    echo "Install Ruby...Done!"
fi
