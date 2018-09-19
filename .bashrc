#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# Turn on recursive globbing -> supported on bash 4
# shopt -s globstar

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=1000

# Command tab-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# Change Prompt
# ------------------------------------------------------------
export PROMPT_COMMAND="RET=$?;$PROMPT_COMMAND"
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \W\$ "

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
export EDITOR="neovim"

# Set default blocksize for ls, df, du
# from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
# ------------------------------------------------------------
export BLOCKSIZE=1k
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -d ~/.bash ]; then
  pushd ~/.bash &> /dev/null

  if [ -f .bash_colors ]; then
    . .bash_colors
  fi
  if [ -f .bash_aliases ]; then
    . .bash_aliases
  fi
  # git support
  if [ -f .git-completion.bash ]; then
    . .git-completion.bash
  fi
  if [ -f ~/.git-prompt.sh ]; then
    . .git-prompt.sh
  fi

  popd &> /dev/null
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"
alias dotfiles='/usr/bin/git --git-dir=/Users/vustthat/.dotfiles.git/ --work-tree=/Users/vustthat'
