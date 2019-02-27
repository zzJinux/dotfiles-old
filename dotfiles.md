# Manual Setup
## pre-setup
```sh
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
## main
```sh
# Prepare the ssh credential under '~/.ssh'
cd
echo ".dotfiles.git" >> .gitignore
git clone --bare git@github.com:zzJinux/dotfiles.git $HOME/.dotfiles.git
alias dotfiles='/usr/bin/env git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

## post-setup
```sh
brew bundle
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash
```

## Bash Completion (macOS)
`cd /usr/local/share/bash-completion/completions`
### Docker
```sh
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completiona docker
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion docker-compose
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion docker-machine
```
### Kubernetes
```sh
kubectl completion bash > kubectl
```

## references
https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/  
https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository-ko.html
