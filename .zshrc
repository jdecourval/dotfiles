zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-.]=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/jerome/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=1000
setopt appendhistory
bindkey -v
# End of lines configured by zsh-newuser-install
#

alias ls='ls --color=auto'
alias suspend="systemctl suspend"
alias kreboot="sudo systemctl kexec"
alias grep="grep --color=always"
alias gzip='pigz'
alias gunzip='unpigz'
alias lua='luajit'
alias aria='aria2c --max-connection-per-server=10 --min-split-size=1M -s 10'
alias ping='ping -4'
alias sshfs-fast='sshfs -o Ciphers=chacha20-poly1305@openssh.com -o direct_io,big_writes'
alias g++-asm='g++ -g -O0 -c -fverbose-asm -Wa,-adhln'
alias diff='diff -t --tabsize=4 -W 250 -y --color=always'
alias watch='watch -n 1'

#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[0;36m\]\W\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '

export EDITOR="vim"
export JAVA_HOME=/usr/lib/jvm/java-10-openjdk/
export VISUAL="vim"
export LD=ld.gold
export WORKON_HOME=$HOME/.virtualenvs
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export QT_STYLE_OVERRIDE=gtk
export QUOTING_STYLE=literal
export QT_QPA_PLATFORMTHEME=gtk2
export DESKTOP_SESSION=gnome
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export TZ=:/etc/localtime
export PATH=$PATH:/home/jerome/.cargo/bin


if [ -e /usr/share/terminfo/x/xterm-256color ] && [ "$COLORTERM" = "xfce4-terminal" ]; then
    export TERM=xterm-256color
fi

stty -ixon

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
source /home/jerome/.zshrc_thispc
