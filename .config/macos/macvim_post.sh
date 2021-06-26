#!/usr/bin/env bash

cd && mkdir -p .local/bin .local/share/man/man1
cd .local/bin && for item in /Applications/MacVim.app/Contents/bin/*; do
  ln -s `realpath "$item"` `basename "$item"`
done
cd .local/share/man/man1 && \
  ln -s /Applications/MacVim.app/Contents/Resources/vim/runtime/doc/*.1 ./
