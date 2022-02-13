#!/usr/bin/env bash

INSTALL_AWS=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# install-awscli
# parameters: [INSTALL_AWS] true or false
#-------------------------------------------------------------------------------------------------------------
if [ "${INSTALL_AWS}" = "true" ]; then
    if ! type aws >/dev/null 2>&1; then
        
        FORMULAS=(
            "awscli"
        )
        echo "Installing awscli..."
        for formula in "${FORMULAS[@]}"; do
            brew install "${formula}"
        done

aws_conf="$(
    cat <<'EOF'
[default]
region = us-west-2
output = json
EOF
)"
        if [ ! -d "$HOME/.aws" ]; then

            echo "Creating .aws/config..."
            mkdir -p "$HOME/.aws"
            chmod 700 "$HOME/.aws"
            touch "$HOME/.aws/config"
            echo "${aws_conf}" >"$HOME/.aws/config"
            chmod 600 "$HOME/.aws/config"

            echo "Configure awscli...Done!"
        fi
    fi
fi
