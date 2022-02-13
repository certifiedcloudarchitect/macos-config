#!/usr/bin/env bash

POST_INSTALL=${1:-"true"}
#-------------------------------------------------------------------------------------------------------------
# post-install
# parameters: [POST_INSTALL]
# note: run after reboot
# note: jenv link requires password
#-------------------------------------------------------------------------------------------------------------
if [ "${POST_INSTALL}" = "true" ]; then
  if command -v nvm >/dev/null 2>&1; then
      echo "Configuring nvm..."
      nvm install node
      nvm use node
      echo "Version check..."
      node --version
      echo "nvm configured...Done!"
  fi
  if command -v jenv >/dev/null 2>&1; then
      echo "Configuring jenv..."
      sudo ln -sfn "$(brew --prefix)"/opt/openjdk/libexec/openjdk.jdk \
        /Library/Java/JavaVirtualMachines/openjdk.jdk
      jenv add /Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home/
      jenv global 17
      jenv rehash
      echo "Version check..."
      jenv version
      echo "jenv configured...Done!"
  fi
  if command -v pyenv >/dev/null 2>&1; then
      echo "Configuring pyenv..."
      python3 -m pip install --upgrade pip
      python3 -m pip install --upgrade setuptools
      pyenv install 3.10.2
      pyenv global 3.10.2
      echo "Version check..."
      python3 -V
      echo "pyenv configured...Done!"
  fi
  if command -v rbenv >/dev/null 2>&1; then
      echo "Configuring rbenv..."
      rbenv install 3.1.0
      rbenv global 3.1.0
      rbenv rehash
      echo "Version check..."
      ruby -v
      echo "gem: --no-document" >"$HOME"/.gemrc
      gem install bundler
      echo "rbenv configured...Done!"
  fi
fi
