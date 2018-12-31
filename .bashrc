#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

if [ ${BASH_VERSINFO[0]} -lt 4 ]; then
  echo "you are running bash <4"
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=1000

# append to the history file, don't overwrite it
shopt -s histappend

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

#   colored GCC warnings and errors
#   ------------------------------------------------------------
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
export EDITOR="neovim"

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
export BLOCKSIZE=1k

complete -d cd

# Command tab-completion
if command -v brew &>/dev/null && [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

if [ -d ~/.bashrc.d ] && mkdir -p ~/.bashrc.d; then
  pushd ~/.bashrc.d &> /dev/null

  source_aliases() {
    if [ -f colors ]; then
      . colors
    fi
    if [ -f aliases ]; then
      . aliases
    fi

    local _url='https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash'
    [ -f git-completion.bash ] || curl $_url -o git-completion.bash
    . git-completion.bash

    local _url='https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh'
    [ -f git-prompt.sh ] || curl $_url -o git-prompt.sh
    . git-prompt.sh

  }

  source_aliases
  unset -f source_aliases 

  popd &> /dev/null

fi

#   Change Prompt
#   ------------------------------------------------------------
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
# export PS1="\u@\h \W \$(__git_ps1 \"(%s) \")\$ "
PROMPT_COMMAND='__git_ps1 "\[$BGreen\]\u@\h\[$Color_Off\]: \[$BBlue\]\W\[$Color_Off\]" "\$ "'
SUDO_PS1="\[$On_Red\]\u@\h\[$Color_Off\] \W\$ "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

command -v rbenv &> /dev/null && eval "$(rbenv init -)"

alias dotfiles='/usr/bin/env git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
__git_complete dotfiles __git_main
