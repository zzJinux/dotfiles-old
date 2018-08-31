## dotfiles 가져오기!
```bash
echo ".dotfiles.git" >> .gitignore
git clone --bare <git-repo-url> $HOME/.dotfiles.git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'`
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

## 참고링크
https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/  
https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository-ko.html
