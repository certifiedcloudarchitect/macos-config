#!/usr/bin/env bash

USER_NAME=${1:-"First Last"}
USER_EMAIL=${2:-"example@mail.com"}
CONFIG_GPG=${3:-"true"}
#-------------------------------------------------------------------------------------------------------------
# configure-gpg
# parameters: [USER_NAME] [USER_EMAIL] [CONFIG_GPG]
# note: prompt for a new gpg password to generate the key
# https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-new-gpg-key-to-your-github-account
#-------------------------------------------------------------------------------------------------------------
if [ "${CONFIG_GPG}" = "true" ]; then
gpg_conf="$(
    cat <<EOF
default-cache-ttl 600
max-cache-ttl 7200
pinentry-program /usr/local/bin/pinentry-mac
EOF
)"
    if [ ! -d "$HOME/.gnupg" ]; then

        echo "Creating GPG key..."
        mkdir -p "$HOME/.gnupg"
        chmod 700 "$HOME/.gnupg"
        touch "$HOME/.gnupg/gpg-agent.conf"
        echo "${gpg_conf}" >"$HOME/.gnupg/gpg-agent.conf"
        gpg --batch --full-generate-key <<EOF
Key-Type: 1
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 4096
Name-Real: "${USER_NAME}"
Name-Email: "${USER_EMAIL}"
Expire-Date: 0
EOF
        chmod 600 "$HOME/.gnupg/gpg-agent.conf"

        echo "Configure GPG...Done!"
    fi
fi
