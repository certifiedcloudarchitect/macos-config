#!/usr/bin/env bash

INSTALL_GO=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# install-go 
# parameters: [INSTALL_GO] true or false
#-------------------------------------------------------------------------------------------------------------
if [ "${INSTALL_GO}" = "true" ]; then
    if ! type go >/dev/null 2>&1; then

        FORMULAS=(
            "go"
        )
        echo "Installing go..."
        for formula in "${FORMULAS[@]}"; do
            brew install "${formula}"
        done

        echo "Checking Brew status..."
        brew update && brew upgrade
        brew update --cask && brew upgrade --cask
        brew doctor && brew cleanup

        TOOLS=(
            "golang.org/x/tools/gopls@latest"
            "honnef.co/go/tools/cmd/staticcheck@latest"
            "golang.org/x/lint/golint@latest"
            "github.com/mgechev/revive@latest"
            "github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest"
            "github.com/ramya-rao-a/go-outline@latest"
            "github.com/go-delve/delve/cmd/dlv@latest"
            "github.com/golangci/golangci-lint/cmd/golangci-lint@latest"
        )
        for tool in "${TOOLS[@]}"; do
            go install "${tool}"
        done

        echo "Version check..."
        go version

    else
        echo "go already installed."
    fi

    echo "Install Go...Done!"
fi
