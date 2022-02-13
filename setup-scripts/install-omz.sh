#!/usr/bin/env bash

INSTALL_OMZ=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# install-omz
# parameters: [INSTALL_OMZ] true or false
#-------------------------------------------------------------------------------------------------------------
if [ "${INSTALL_OMZ}" = "true" ]; then
    if ! type omz >/dev/null 2>&1; then

        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

        echo "Installing Powerlevel10k..."
        TAPS=(
            "romkatv/powerlevel10k"
        )
        echo "Installing Taps..."
        for tap in "${TAPS[@]}"; do
            brew tap "${tap}"
        done
        FORMULAS=(
            "powerlevel10k"
            "iterm2"
        )
        echo "Installing Formulas..."
        for formula in "${FORMULAS[@]}"; do
            brew install "${formula}"
        done
        echo "Install Powerlevel10k...Done!"

        cat << 'EOF' > "$HOME/.zshrc"
# Configure environment for Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Configure environment for Language Preferences.
export LANG=en_US.UTF-8

# Configure environment for GnuPG gpg-agent.
export GPG_TTY=$(tty)

# Configure environment for Oh My Zsh installation.
ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"

# Configure environment for Homebrew's sbin.
export PATH="/usr/local/sbin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then 
  export EDITOR='nano'
else
  export EDITOR='code -w'
fi
export VISUAL="$EDITOR"

# Load bash completion functions
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

# Configure Oh My Zsh Plugins.
plugins=(
    aws
    bundler
    docker
    docker-compose
    git
    gh
    golang
    gradle
    helm
    heroku
    jenv
    kubectl
    mvn
    nvm
    pip
    pyenv
    pylint
    rust
    terraform
    yarn
    )

# Configure history length.
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

# Configure environment for Java Version Manager.
if command -v jenv 1>/dev/null 2>&1; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi

# Configure environment for Groovy SDK.
if command -v groovy 1>/dev/null 2>&1; then
    export GROOVY_HOME="$(brew --prefix)/opt/groovysdk/libexec"
fi

# Configure environment for Node Version Manager.
if command -v nvm 1>/dev/null 2>&1; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
fi

# Configure environment for Python@3.10
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

# Configure environment for compilers to find python@3.10
export LDFLAGS="-L/usr/local/opt/python@3.10/lib"

# Configure environment for pkg-config to find python@3.10
export PKG_CONFIG_PATH="/usr/local/opt/python@3.10/lib/pkgconfig"
  
# Configure environment for Python Version Manager.
if command -v pyenv 1>/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

# Configure environment for Ruby Version Manager.
if command -v rbenv 1>/dev/null 2>&1; then
	export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init - zsh)"
fi

# Load Powerlevel10k theme.
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# Load Powerlevel10k.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load OMZ
source $ZSH/oh-my-zsh.sh
EOF

        echo "Install Oh My Zsh...Done!"
    fi
fi
