#!/usr/bin/env bash

APP_PATH=/Applications/MacVim.app
if ! [ -e "$APP_PATH" ]; then
  >&2 echo 'Please install MacVim.app'
  exit 1
fi

# MacVim executables
cd && mkdir -p .local/bin
cd "$HOME/.local/bin" && \
  ln -fs "$APP_PATH/Contents/bin/"* ./

# MacVim manpages
cd && mkdir -p .local/share/man/man1
cd "$HOME/.local/share/man/man1" && \
  ln -fs "$APP_PATH/Contents/Resources/vim/runtime/doc/"*.1 ./
