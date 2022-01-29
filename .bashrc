# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
  echo "you are running bash <4" >&2
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

unset_list=()

#   Bash specific options
#   ------------------------------------------------------------
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=1000

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar



#   Color stuffs
#   ------------------------------------------------------------
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color|nsterm*) color_prompt=yes;;
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
unset_list+=(color_prompt force_color_prompt)
source ~/.bashrc.d/colors



#   Homebrew bash completion
#   ------------------------------------------------------------
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi
unset_list+=(HOMEBREW_PREFIX)



# TODO: alias for custom tab name
source ~/.bashrc.d/aliases
source ~/.bashrc.d/prompt
source ~/.bashrc.d/dotfiles_rc
for f in ~/.bashrc.d/*.bash; do
  [ -r "$f" ] && source "$f"
done

#   Application specifics
#   ------------------------------------------------------------

if command -v nvim >/dev/null; then
  EDITOR=$(command -v nvim)
elif command -v vim >/dev/null; then
  EDITOR=$(command -v vim)
else
  EDITOR=$(command -v vi)
fi
export EDITOR
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export BLOCKSIZE=1k # Default blocksize for ls, df, du
export JAVA_HOME=$(/usr/libexec/java_home)


# ls command
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# kubectl completion
if command -v kubectl &>/dev/null; then
  source <(kubectl completion bash)
fi


#   Cleanup
#   ------------------------------------------------------------
unset ${unset_list[*]}
unset unset_list
