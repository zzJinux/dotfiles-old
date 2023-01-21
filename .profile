#!/usr/bin/env sh
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

export LANG='en_US.UTF-8'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
#   export CLICOLOR=1
#   export LSCOLORS=ExFxBxDxCxegedabagacad

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Host-specific
if [ -f "$HOME/.profile_host" ]; then
  . "$HOME/.profile_host"
fi

# python (Xcode Command Line Tools)
# PATH="$(python3 -c 'import os,sysconfig;print(sysconfig.get_path("scripts",f"{os.name}_user"))'):$PATH"

# go
PATH="$HOME/go/bin:$PATH"
