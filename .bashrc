# Source global definitions

export RLWRAP_HOME=~/.rlwrap
export RLWRAP_EDITOR=/usr/local/bin/emacs
alias gosh="/usr/bin/rlwrap -pCYAN gosh"


if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

export PS1='${debian_chroot:+($debian_chroot)}\[\e[1;36m\]\d \[\e[1;33m\]\t \n\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global --unset url."https://".insteadOf git://

export HTTP_PROXY_USER={Your_ID}
export HTTP_PROXY_PASS={Your_PassWord}
export http_proxy="http://${HTTP_PROXY_USER}:${HTTP_PROXY_PASS}@157.114.16.93:8080"
export https_proxy="http://${HTTP_PROXY_USER}:${HTTP_PROXY_PASS}@157.114.16.93:8080"
echo "http & https_proxysetting...ok"

git config --global http.proxy http://${HTTP_PROXY_USER}:${HTTP_PROXY_PASS}@157.114.16.93:8080
git config --global https.proxy http://${HTTP_PROXY_USER}:${HTTP_PROXY_PASS}@157.114.16.93:80$
git config --global url."https://".insteadof git://
echo "git_proxysetting...ok"

sleep 1
clear
export VBOX_USER_HOME=~/VBOX
