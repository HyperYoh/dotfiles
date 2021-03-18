# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export
if [ -d ~/afs/bin ] ; then
	export PATH=~/afs/bin:$PATH
fi

if [ -d ~/.local/bin ] ; then
	export PATH=~/.local/bin:$PATH
fi

if [ -d ~/afs/Tools/bin ] ; then
	export PATH=~/afs/Tools/bin:$PATH
fi

if [ -d ~/afs/Tools/tools ] ; then
	export PATH=~/afs/Tools/tools:$PATH
fi

if [ -d ~/Tools/tools ] ; then
	export PATH=~/Tools/tools:$PATH
fi

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"
export EDITOR=vim
export LS_COLORS="di=01;36" # Display directory in cyan with ls
export DISPLAY="localhost:0.0" # Display for Xauth11/Xming

# Color support for less
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# PostgreSQL-specific environment variable
# export PGDATA="$HOME/postgres_data"
# export PGHOST="/tmp"

# Git Configuration
# ssh-keygen -a 100 -t ed25519
# git config --global user.name 'Julien LATULIPE'
# git config --global user.email 'julien.latulipe@epita.fr'

# Prompt
PS1='\[\e[1m\][\[\e[1;93m\]HyperYoh\[\e[1;91m\]@\[\e[1;33m\]Dobie\[\e[97m\]:\[\e[1;92m\]\W\[\e[39m\]]\$\[\e[0m\] '
#PS1='[\u@\h \W]\$ ' Ancient PS1

# alias
alias grep='grep --color -n'
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -a --color=auto'
alias v='vim -O'
alias l="i3lock -i afs/compiling.png"
alias please="sudo"
alias gpt="git push && git push --tag"

alias rm='mv -f -t ~/afs/.zTrash/'
alias rr='reset'
alias kiero!="'rm' -fr"

alias MF='MF.py'
alias MF+='MF+.py'
alias H='H.py'
alias 444='gcc -Wall -Werror -Wextra -pedantic -std=c99 -fsanitize=address -g'
alias 666='g++ -Wall -Werror -Wextra -pedantic -std=c++17 -fsanitize=address -g'

# function
mcd(){ mkdir -p "$1" && cd "$1";}

term_size() # @https://github.com/epita/term_size
{
    if [ "$1" = "-h" ]; then
        echo "Usage: $0 [size [font]]"
        exit 0
    fi

    SIZE=${1:-16}
    FONT=${2:-DejaVuSansMono}

    printf '\33]50;%s%d\007' "xft:${FONT}:pixelsize=" "${SIZE}"
}

# Terminal
set -o vi
setxkbmap fr -option caps:escape
#term_size
#xrdb ~/.Xresources #normally automatic at PC launch but ...

echo -e "\e[1;91mYour Focus Is Unparalleled!\e[0m"
