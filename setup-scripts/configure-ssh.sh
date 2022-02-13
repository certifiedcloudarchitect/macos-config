#!/usr/bin/env bash

USER_EMAIL=${1:-"example@mail.com"}
CONFIG_SSH=${2:-"true"}
#-------------------------------------------------------------------------------------------------------------
# configure-ssh
# parameters: [USER_EMAIL] [CONFIG_SSH]
# note: prompt for a new ssh password to generate the key
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
#-------------------------------------------------------------------------------------------------------------
if [ "${CONFIG_SSH}" = "true" ]; then
    
ssh_conf="$(
    cat <<'EOF'
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile $HOME/.ssh/id_ed25519
EOF
)"

    if [ ! -d "$HOME/.ssh" ]; then

        echo "Creating SSH key..."
        mkdir -p "$HOME/.ssh"
        chmod 700 "$HOME/.ssh"

        ssh-keygen -t ed25519 -C "${USER_EMAIL}" -f "$HOME/.ssh/id_ed25519"
        eval "$(ssh-agent -s)"

        touch "$HOME/.ssh/config"
        echo "${ssh_conf}" >"$HOME/.ssh/config"
        chmod 600 "$HOME/.ssh/config"

        /usr/bin/ssh-add --apple-use-keychain "$HOME/.ssh/id_ed25519"

        echo "Configure SSH...Done!"
    fi
fi
