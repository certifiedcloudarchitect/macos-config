#!/usr/bin/env bash

USER_NAME=${1:-"First Last"}
USER_EMAIL=${2:-"example@mail.com"}
CONFIG_GIT=${3:-"true"}
#-------------------------------------------------------------------------------------------------------------
# configure-git
# parameters: [USER_NAME] [USER_EMAIL] [CONFIG_GIT]
#-------------------------------------------------------------------------------------------------------------
if [ "${CONFIG_GIT}" = "true" ]; then
git_conf="$(
    cat <<EOF
[user]
    name = "${USER_NAME}"
    email = "${USER_EMAIL}"
    signingkey = $(gpg --list-secret-keys --with-colons | awk -F: '$1 == "sec" {print $5}')
[commit]
    gpgsign = true
[init]
    deafultBranch = main
EOF
)"
    if [ ! -e "$HOME/.gitconfig" ]; then

        echo "Creating .gitconfig..."
        touch "$HOME"/.gitconfig
        echo "${git_conf}" >"$HOME"/.gitconfig

        echo "Configure git...Done!"
    fi
fi
