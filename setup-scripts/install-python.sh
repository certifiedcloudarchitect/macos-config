#!/usr/bin/env bash

INSTALL_PYTHON=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# install-python
# parameters: [INSTALL_PYTHON] true or false
#-------------------------------------------------------------------------------------------------------------
if [ "${INSTALL_PYTHON}" = "true" ]; then
    if ! type pyenv >/dev/null 2>&1; then

        FORMULAS=(
            "pyenv"
        )
        echo "Installing python3..."
        for formula in "${FORMULAS[@]}"; do
            brew install "${formula}"
        done

        echo "Checking Brew status..."
        brew update && brew upgrade
        brew update --cask && brew upgrade --cask
        brew doctor && brew cleanup
        
        brew install pipx
        DEFAULT_UTILS=(
            "pylint"
            "flake8"
            "autopep8"
            "black"
            "yapf"
            "mypy"
            "pydocstyle"
            "pycodestyle"
            "bandit"
            "virtualenv"
            )
        for util in "${DEFAULT_UTILS[@]}"; do
            if ! type "${util}" >/dev/null 2>&1; then
                echo "Installing ${util}..."
                pipx install --system-site-packages --pip-args '--no-cache-dir --force-reinstall' "${util}"
            else
                echo "${util} already installed. Skipping."
            fi
        done
    else
        echo "pyenv already installed."
    fi

    echo "Install Python...Done!"
fi
