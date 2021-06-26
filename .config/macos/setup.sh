#!/usr/bin/env bash
set -eo pipefail

cd
: ${BARE_GIT:=.dotfiles.git}
: ${CMD_NAME:=dotfiles}
echo "$BARE_GIT" >> .gitignore
git clone --bare https://github.com/zzJinux/dotfiles.git "$HOME/$BARE_GIT"

dotfiles() { /usr/bin/env git --git-dir="$HOME/$BARE_GIT" --work-tree="$HOME" "$@"; }
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

mkdir -p "$HOME/.bashrc.d"
dotfiles_rc="$HOME/.bashrc.d/dotfiles_rc"
echo "alias $CMD_NAME='/usr/bin/env git --git-dir=\"\$HOME/$BARE_GIT\" --work-tree=\"\$HOME\"'" > "$dotfiles_rc"
echo "__git_complete $CMD_NAME __git_main" >> "$dotfiles_rc"


# Ask for privilege
sudo -v

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
  && brew bundle -v

# Change the default shell
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells' \
 && chsh -s /usr/local/bin/bash

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  && nvim -c ':PlugInstall' -c ':qa!'
