#!/usr/bin/env bash
set -eo pipefail

title=
_begin() {
  title="$1"
  echo "BEGIN $title"
}

_end() {
  echo "  END $title"
  title=
}


_begin 'dotfiles setup'
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
_end


# Ask for privilege
sudo -v

_begin 'Homebrew setup'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
  sudo chown -R $(whoami) /usr/local/lib/pkgconfig \
  chmod u+w /usr/local/lib/pkgconfig \
  brew bundle -v
_end

_begin 'Replace the default shell'
  sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells' \
  sudo chsh -s /usr/local/bin/bash
_end

_begin 'Vimplug setup'
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  nvim -c ':PlugInstall' -c ':qa!'
_end

_begin 'Replace "less" for "man"'
if ! command -v "$(brew --prefix)/bin/less"; then
  echo 'No newer less found. Did you "brew install less"?'
  echo 'After install, edit /private/etc/man.conf manually'
else
  echo 'TODO: edit /private/etc/man.conf'
fi
_end

_begin 'Replace "groff" for "man"'
if ! command -v "$(brew --prefix)/bin/troff"; then
  echo 'No newer groff found. Did you "brew install groff"?'
  echo 'After install, edit /private/etc/man.conf manually'
else
  echo 'TODO: edit /private/etc/man.conf'
fi

_end
echo 'exec the new shell :)'
exec /usr/bin/env bash
