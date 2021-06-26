# Setup
1. Install macOS CLI tools
```sh
xcode-select --install
```

2. Clone the repo
```
cd
BARE_GIT=
: ${BARE_GIT:=dotfiles.git}
echo "$BARE_GIT" >> .gitignore
git clone --bare https://github.com/zzJinux/dotfiles.git "$HOME/$BARE_GIT"
alias dotfiles='/usr/bin/env git --git-dir="$HOME/$BARE_GIT/" --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

3. Bootstrap
```
cd
cd .config/macos
./bootstrap.sh
./defaults.sh
```

# More...
**Add ssh credentials**

## Bash Completions
[**docker, -compose, -machine**](https://gist.github.com/rkuzsma/4f8c1354a9ea67fb3ca915b50e131d1c)
```sh
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion docker
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion docker-compose
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion docker-machine
```

## Apps
**Terminal.app**
My default theme: `3024 Night.terminal`

More themes at https://github.com/lysyi3m/macos-terminal-themes

**MacVim**
```sh
cd && mkdir -p .local/bin .local/share/man/man1
cd .local/bin && for item in /Applications/MacVim.app/Contents/bin/*; do
  ln -s `realpath "$item"` `basename "$item"`
done
cd .local/share/man/man1 && \
  ln -s /Applications/MacVim.app/Contents/Resources/vim/runtime/doc/*.1 ./
```

# References
- https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
- https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository-ko.html
