#!/usr/bin/env bash

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
  && brew bundle

# Change the default shell
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells' \
 && chsh -s /usr/local/bin/bash

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  && nvim -c ':PlugInstall' -c ':qa!'
