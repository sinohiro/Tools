# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=yes
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\e[1;36m\]\d\[\e[1;33m\] \t\[\e[1;35m\]\n\u@\h\[\e[0;34m\]:\w\[\e[0;32m\]\$'
else
    PS1='\d\t\n\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#----my_setting-------

export HTTP_PROXY_USER={Your_ID}
export HTTP_PROXY_PASS={Your_PassWord}
export http_proxy="http://${HTTP_PROXY_USER}:${HTTP_PROXY_PASS}@157.114.16.93:8080"
export https_proxy="http://${HTTP_PROXY_USER}:${HTTP_PROXY_PASS}@157.114.16.93:8080"
echo "http & https_proxysetting...ok"

git config --global http.proxy http://${HTTP_PROXY_USER}:${HTTP_PROXY_PASS}@157.114.16.93:8080
git config --global https.proxy http://${HTTP_PROXY_USER}:${HTTP_PROXY_PASS}@157.114.16.93:80$
git config --global url."https://".insteadof git://

git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global --unset url."https://".insteadOf git://

git config --global user.email "{Your_git_email}"
git config --global user.name "{Your_git_username}"

echo "git_proxysetting...ok"

export RLWRAP_HOME=~/.rlwrap
export RLWRAP_EDITOR=/usr/local/bin/emacs
alias gosh="/usr/bin/rlwrap -pCYAN gosh"


if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

export PS1='${debian_chroot:+($debian_chroot)}\[\e[1;36m\]\d \[\e[1;33m\]\t \n\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '



sleep 1
clear
export VBOX_USER_HOME=~/VBOX
