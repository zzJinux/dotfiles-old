#!/usr/bin/env bash

APP_PATH=
if [ -e /Applications/MacVim.app ]; then
  >&2 echo 'nothing to do'
  exit 1
fi

BREW_PATH=$(brew --prefix macvim 2>/dev/null)
BREW_PATH=${BREW_PATH:+$BREW_PATH/MacVim.app}
if [ ! "$BREW_PATH" ]; then
  >&2 echo "MacVin is not installed"
  exit 1
fi

osascript -e 'tell application "Finder" to make alias file to POSIX file "'${BREW_PATH}'" at POSIX file "/Applications"'
APP_PATH=$BREW_PATH

cd && mkdir -p .local/share/man/man1
cd "$HOME/.local/share/man/man1" && \
  ln -fs "$APP_PATH/Contents/Resources/vim/runtime/doc/"*.1 ./
