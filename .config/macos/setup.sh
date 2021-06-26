#!/usr/bin/env bash

cd
: ${BARE_GIT:=.dotfiles.git}
: ${CMD_NAME:=dotfiles}
echo "$BARE_GIT" >> .gitignore
git clone --bare https://github.com/zzJinux/dotfiles.git "$HOME/$BARE_GIT"

dotfiles() { /usr/bin/env git --git-dir="$HOME/$BARE_GIT" --work-tree="$HOME" "$@"; }
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

dotfiles_rc="$HOME/.bashrc.d/dotfiles_rc"
echo "alias $CMD_NAME='/usr/bin/env git --git-dir=\"\$HOME/$BARE_GIT\" --work-tree=\"\$HOME\"'" > "$dotfiles_rc"
echo "__git_complete $CMD_NAME __git_main" >> "$dotfiles_rc"


# Ask for privilege
sudo -v

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
  && brew bundle

# Change the default shell
bash -c 'echo /usr/local/bin/bash >> /etc/shells' \
 && chsh -s /usr/local/bin/bash

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  && nvim -c ':PlugInstall' -c ':qa!'
