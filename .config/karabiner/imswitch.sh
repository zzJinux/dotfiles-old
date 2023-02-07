#!/usr/bin/env bash
macism=~/.local/bin/macism
im_last=com.apple.keylayout.ABC # defaults to english
im_ko=com.apple.inputmethod.Korean.2SetKorean
im_en=com.apple.keylayout.ABC
data_symlink=~/.config/karabiner/last_input_source

if [ -h "$data_symlink" ]; then
  im_last=$(readlink "$data_symlink")
fi

im_cur=$("$macism")
if [ "$im_cur" = "$im_ko" ]; then
  "$macism" "$im_last"
else
  ln -sf "$im_cur" "$data_symlink"
  "$macism" "$im_ko"
fi

