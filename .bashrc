#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# extglob is enabled
shopt -s extglob
#                                   Settings

# Add custom enviroment
PATH=$PATH:~/Scripts

# PS1 Setup
echo $(clear)
echo -e '\n\e[01;30m ▚ \e[0;30m ▞ \e[01;31m ▚ \e[0;31m ▞ \e[01;32m ▚ \e[0;32m ▞ \e[01;33m ▚ \e[0;33m ▞ \e[01;34m ▚ \e[0;34m ▞ \e[01;35m ▚ \e[0;35m ▞ \e[01;36m ▚ \e[0;36m ▞ \e[01;37m ▚ \e[0;37m ▞'

#PS1='[\u@\h \W]\$ ' #default
#PS1='\n\[\e[1;32m\]\u@\h╺─╸\[\e[42m\][\W]\[\e[0m\]\[\e[1;32m\]\$\[\e[0m\] '
PS1="\n\[$(tput sgr0)\]\[\033[38;5;34m\]\h \[\033[38;5;202m\][\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;33m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;202m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]\n \[$(tput sgr0)\]\[\033[38;5;200m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;34m\]\u \\$ >>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\e[1;36m\]"
trap 'printf $(tput sgr0) "$_"' DEBUG

#                                    Binds

## Fancy commands output
#alias ls='els --els-icons=fontawesome'
#alias la='els -laH --els-icons=fontawesome'
alias la='ls -aH'
alias ll='ls -laH'
#alias du='du -kh'
#alias df='df -kTh'
alias grep='grep --color=auto'
#alias mkdir='mkdir --parents'
#alias free='free -h'
alias less='less -r'
## Upagrade distro
#alias upgradearch='sudo pacman -Syy && yaourt -Syua --noconfirm'
## Load configs for bash and nvim
#alias settings='nvim -O ~/.bashrc ~/.config/nvim/init.vim'
## Load configs for i3 and polybar
#alias settingswm='nvim -O ~/.config/i3/config ~/.config/polybar/config'
# Get current IP
alias myip="curl http://ipecho.net/plain; echo"
# Edit i3 config
alias ei3='vim ~/.config/i3/config'

#                                   Functions

# man coloring with less
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[48;5;196m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# The following function will extract a wide range of compressed file types. and use it with the syntax
extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}

shopt -s cdspell
