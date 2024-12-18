# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

setopt INC_APPEND_HISTORY_TIME

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Don't add zsh-completions here.
# https://github.com/zsh-users/zsh-completions/issues/603
case `uname` in
  Darwin)
    # commands for OS X go here
    plugins=(git dircycle docker macos zsh-autosuggestions kubectl pip sudo)
  ;;
  Linux)
    # commands for Linux go here
    plugins=(git dircycle zsh-autosuggestions pip sudo zsh-interactive-cd fzf)
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

export PATH="$HOME/.local/bin:$PATH"

export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-$HOST"
source $HOME/.zshrc_thispc
source $ZSH/oh-my-zsh.sh

export HISTFILESIZE=10000000
export HISTSIZE=100000

export EDITOR="vim"
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/input.rc"

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ls='ls --color=auto'
alias grep="grep --color=always"
alias aria='aria2c --max-connection-per-server=10 --min-split-size=10M -s 10 --bt-request-peer-speed-limit 100M'
alias g++-asm='g++ -g -O0 -c -fverbose-asm -Wa,-adhln'
alias diff='diff -t --tabsize=4 -W 250 -y --color=always'
alias watch='watch -n 1'
alias t='todo.sh'
alias yubi='ykman oath accounts code --single "$(ykman oath accounts list | fzf)" | wl-copy'
alias open='xdg-open'
alias fkill='kill -15 $(ps ax | fzf | awk "{print \$1}")'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias wanip='curl ipinfo.io/ip'

function setcflags() {
    CFLAGS="$CFLAGS -pipe -Wall -Wextra -Wshadow -Wnull-dereference -Wmissing-include-dirs -Wuninitialized -Wstrict-overflow=5 -Wundef -Wcast-align -Wredundant-decls -pedantic"
    export CFLAGS
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
