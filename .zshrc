# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs command_execution_time time)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

setopt INC_APPEND_HISTORY_TIME

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
case `uname` in
  Darwin)
    # commands for OS X go here
    plugins=(git dircycle docker osx zsh-autosuggestions zsh-completions zsh-syntax-highlighting pip)
  ;;
  Linux)
    # commands for Linux go here
    plugins=(git dircycle docker zsh-autosuggestions zsh-completions pip)
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

source $ZSH/oh-my-zsh.sh

# User configuration

export HISTSIZE=20000
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_CA.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Report CPU usage for commands running longer than 20s
export EDITOR="vim"

alias ls='ls --color=auto'
alias kreboot='sudo sh -c "kexec -l $(fd vmlinuz-linux\\d+-tkg-pds /boot | tail -n 1) --initrd=$(fd initramfs-linux\\d+-tkg-pds.img /boot | tail -n 1) --reuse-cmdline && \
    killall Xorg ; \
    rmmod nvidia_uvm ; \
    rmmod nvidia_drm ; \
    rmmod nvidia_modeset ; \
    rmmod nvidia ; \
    systemctl kexec
    "'
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
alias t='todo.sh'

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

function setcflags() {
    CFLAGS="$CFLAGS -pipe -Wall -Wextra -Wshadow -Wnull-dereference -Wmissing-include-dirs -Wuninitialized -Wstrict-overflow=5 -Wundef -Wcast-align -Wredundant-decls -pedantic"
    export CFLAGS
}

source $HOME/.zshrc_thispc

autoload bashcompinit
bashcompinit
autoload -U compinit && compinit
