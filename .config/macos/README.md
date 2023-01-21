# Setup
1. Install macOS CLI tools
```sh
xcode-select --install
```

2. Run the setup script
```sh
curl -o- https://raw.githubusercontent.com/zzJinux/dotfiles/master/.config/macos/setup.sh | bash
```

# More...
- Add ssh credentials
- Set additional configurations
  ```sh
  cd && .config/macos/defaults.sh
  ```

## Bash Completions
[**docker, -compose, -machine**](https://gist.github.com/rkuzsma/4f8c1354a9ea67fb3ca915b50e131d1c)
```sh
etc=/Applications/Docker.app/Contents/Resources/etc
ln -s $etc/docker.bash-completion $(brew --prefix)/etc/bash_completion.d/docker
ln -s $etc/docker-machine.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-machine
ln -s $etc/docker-compose.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-compose
```

## Apps
### Terminal

My default theme: `MyCai.terminal`

More themes at https://github.com/lysyi3m/macos-terminal-themes

### MacVim
```sh
cd && cd .config/macos
./macvim_post.sh
```

# Homebrew

https://github.com/Homebrew/brew/issues/9177

`brew uninstall --ignore-dependencies kubernetes-cli`. I don't need kubectl not bound to any cluster.

## Create symlinks on ~/.local for keg-only packages
- curl (`curl`, `curl-config`)

# References
- https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
- https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository-ko.html
- https://github.com/cykerway/complete-alias
