# ################################################
#                                                #
#      ███████╗███████╗██╗  ██╗██████╗  ██████╗  #
#      ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝  #
#        ███╔╝ ███████╗███████║██████╔╝██║       #
#       ███╔╝  ╚════██║██╔══██║██╔══██╗██║       #
#    ██╗███████╗███████║██║  ██║██║  ██║╚██████╗ #
#    ___           __ _           __ _ _         #
#   / __|___ _ _  / _(_)__ _     / _(_) |___     #
#  | (__/ _ \ ' \|  _| / _` |_  |  _| | / -_)    #
#   \___\___/_||_|_| |_\__, (_) |_| |_|_\___|    #
#                      |___/                     #
# ################################################
  # Load profiling tool
  # zmodload zsh/zprof
  #hyperfine --warmup 5 'zsh -i -c exit'
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  #source $HOME/zsh-git-prompt/zshrc.sh
  #export POWERLEVEL9K_INSTANT_PROMPT=quiet
  #export POWERLEVEL9K_INSTANT_PROMPT=on
  #typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  #
  #
###################################################
#   docui - TUI Client for Docker Written in Go
#   Source: https://github.com/skanehira/docui
###################################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_DISABLE_COMPFIX=true
# Remove redundant or unnecessary paths
fpath=(${fpath:#$HOME/gdotfiles/.oh-my-zsh/custom/plugins/fzf-tab/lib})
fpath=(${fpath:#$HOME/.oh-my-zsh/cache/completions})
fpath=($HOME/.oh-my-zsh/custom/plugins $fpath)

ZSH_AUTOSUGGEST_USE_ASYNC=1

if [[ ! -f ~/.zcompdump ]] || [[ ~/.zshrc -nt ~/.zcompdump ]]; then
  autoload -Uz compinit
  compinit -C
fi


# Run direnv lazily to avoid console output interfering with Powerlevel10k.

# Consolidate custom plugin directories (if applicable)
#autoload -Uz bashcompinit compinit && bashcompinit
# Run compinit with optimized settings
# autoload -Uz compinit
# compinit -C
# if command -v brew &>/dev/null; then
#   FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
#   ZSH_DISABLE_COMPFIX=true
#   compinit -C
# fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

# Load the profiling the zsh
#zmodload zsh/zprof
# Adding utf-8 for other langauges

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color
LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"

#==================================================
#            CONFIGURATION NVIM
#==================================================

alias vim='nvim'
# export EDITOR=vim   # Using NANO:/usr/bin/nano
# export VISUAL=vim
export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"
#export PAGER="/opt/homebrew/bin/bat --style=numbers"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
#source $HOME/.zshrc_prompt
source $HOME/.aliases
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
export POWERLEVEL9K_INSTANT_PROMPT=off
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git
        # zsh-autocomplete
        # other plugins...
        # auto suggestions from here:
        # https://github.com/zsh-users/zsh-autosuggestions/blob/master/install.md
        zsh-autosuggestions
        # auto jump from here:
        #autojump
        # syntax zsh-syntax-highlighting from here:
        # https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/install.md
        #zsh-syntax-highlighting # Problem occured not used anymore
        # I use instead fast-syntax-highlighting
        # https://github.com/zdharma-continuum/fast-syntax-highlighting
        fast-syntax-highlighting
        # adding vim support to my current zsh:
        # vi-mode
        # https://github.com/jeffreytse/zsh-vi-mode
        zsh-vi-mode
        # replace zsh's default completion selection menu with fzf!
        # https://github.com/aloxaf/fzf-tab
        fzf-tab
  )
# **************************************************************************
#                     ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE
#           This will alter the default for Auto-completetion
# **************************************************************************
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#97A7B3, bg=#ADB6C4  ,bold,underline"

# **************************************************************************
# Configurations for fzf-tab
# **************************************************************************
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

## Adding speed for completion
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache
# **************************************************************************
# Configurations for fzf-vi-mode
# **************************************************************************
function zvm_config() {
  # ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  #ZVM_VI_INSERT_ESCAPE_BINDKEY=jk #[[This causes a problem of hiccup in the
  #prompt https://github.com/romkatv/powerlevel10k/issues/2469]]
}
# **************************************************************************
# Souce all the plugins
# **************************************************************************
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###################################################
#         Auto-completetion of Homebrew            #
###################################################
# https://docs.brew.sh/Shell-Completion
# https://medium.com/@benriemer/fast-install-and-correct-setup-for-homebrew-on-mac-6de816f98142
# if type brew &>/dev/null
# then
#   FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
#   ZSH_DISABLE_COMPFIX=true
#   autoload -Uz compinit
#   compinit -C
# fi
#####################################################################
#        VCPKG: Package Manager for C/C++ Libraries
#####################################################################
# For vcpkg and Homebrew
source "$HOME/vcpkg/scripts/vcpkg_completion.zsh"
#*************************************************************************
#  __________________
#
#  GH-TERM CONFIDENTIAL
#  __________________
#
#   [2002] - [2007] Adobe Systems Incorporated
#   All Rights Reserved.
#
#  NOTICE:  All information contained herein is, and remains
#  the property of the author : G
#  The intellectual and technical concepts contained
#  herein are proprietary to G
#  and its suppliers are protected by copyright law.
#  Dissemination of this information or reproduction of this material
#  is strictly forbidden unless prior written permission is obtained
#  from G.
#*************************************************************************
#export HISTFILE=~/.history_zsh # This doesnt work with hstr
export HISTFILE=~/.zsh_history
export MYNAME
export LESS='-M'
export HISTSIZE=10000    # Default 500
export HISTFILESIZE=1000000
setopt EXTENDED_HISTORY
export HISTTIMEFORMAT='%b %d %I:%M %p ' # using strftime format
#export HISTTIMEFORMAT="%d/%m/%y %T "  # for e.g. “29/02/99 23:59:59”
#export HISTTIMEFORMAT="%F %T "        # for e.g. “1999-02-29 23:59:59”
export HISTCONTROL=ignoreboth            # ignoredups+ ignorespace
export HISTIGNORE="history:pwd:exit:df:df:ls:ls -la:ll"
alias ll='ls -lahG'
alias ctree='colorls --tree'
alias lsg="$HOME/lsd/target/release/lsd -A --icon=always -F -l -1 -h -v -G -L --group-dirs=first" # " -A --icon=always -F -l -1 -h -v -G -L --group-dirs=first"
#alias lsd='colorls -lA --sd'
alias lsd='colorls -l -A -h --light --sort-dirs'
#alias lsd='exa -1 -l -g -H -m -a -x -F --color=always --group-directories-first --icons'
# To make the history format working with zsh use:
alias history="history -i 0 | fzf"
# New way to show the background you will need to follow
# https://drasite.com/blog/Pimp%20my%20terminal
alias hist='history'
alias home='cd ~'
#alias up='cd ..'
#figlet -f speed "Ghsaak"  |boxes | lolcat #-a -d $time_var
#figlet -f small "at Home MBP13"  |boxes -d whirly | lolcat #-a -d $time_var
#neofetch | boxes -d whirly
#figlet -f small "PersonalComputer"  |boxes | lolcat
#

function WelcomeMessage(){

        local RED="\e[31m"
        local MAGENTA="\e[35m"
        local LIGHT_GREEN="\e[36m"
        local GRAY="\e[37m"
        local BLUE="\e[34m"
        local GREEN="\e[32m"
        local LIGHT_YELLOW="\e[93m"
        local ENDCOLOR="\e[0m"
        local MYNAME='Ghasak Ibrahim'
        local OPTIONX=$(echo $((1 + $RANDOM % 10)))
        local FONTSTYLE="ANSI Shadow"
        local WELCOM_VAR=$(echo $(tty) | awk -F "/" '{print $3}')
        #varx=" "; for i in {0..$(echo ${COLUMNS}/3 | bc)}; do; varx="$varx "  ;done;

        if [[ "${WELCOM_VAR}" = "ttys001" ]]; then # Checking if this is the first session for iTerm2 only
            # ---------------- Start of the welcome message ----------------
            # ---------------- Show clock on the right of the terminal -----
            #while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-11));echo -e "\e[31m`date +%r`\e[39m";tput rc;done &
            #figlet -f speed "Ghsaak"  |boxes | lolcat #-a -d $time_var
            echo -n "Uptime: "; uptime | lolcat #-a -d $time_var
            echo ""
            if ! [ -x "$(command -v gcal)" ]; then
                  echo 'Will install gcall from GNU ... will show current days and holidays ... ' >&2
                  brew install gcal
              else
                gcal -H '\e[31;42m:\e[0m:\e[33;45m:\e[0m' -q JP # Setting for Japanese calendar.
                # To show all the months for a given year with all holidies, use:
                # https://unix.stackexchange.com/questions/164555/how-to-emphasize-holidays-by-color-in-cal-command
                # gcal -H '\e[31;42m:\e[0m:\e[33;45m:\e[0m' -q JP 2022
                # You can use also: echo -n; cal
            fi

            figlet -f $FONTSTYLE "WELCOME"|lolcat    #-a -d $time_var
            figlet -f $FONTSTYLE "   $USER" | lolcat
            echo -e "Welcome: ${RED}$MYNAME${ENDCOLOR} on your personal computer ${BLUE}$HOST${ENDCOLOR}"
            echo -e "Operating System: ${GREEN}$(uname -s)${ENDCOLOR} ${GREEN}$(uname -r)${ENDCOLOR}"
            echo -e "Kernel: ${GREEN}$(uname -r)${ENDCOLOR}"
            echo -e "Shell: ${MAGENTA}$SHELL${ENDCOLOR}"
            echo -e "Terminal: ${GREEN}$TERM${ENDCOLOR}"
            echo -e "Working Directory: ${GREEN}$PWD${ENDCOLOR}"
            echo -e "User: ${BLUE}$USER${ENDCOLOR}"
            # echo -e "Directory: ${GREEN}$PWD${ENDCOLOR}"
            # echo -e "Date: ${GREEN}$(date +"%d-%m-%Y")${ENDCOLOR}"
            # echo -e "Time: ${GREEN}$(date +"%H:%M:%S")${ENDCOLOR}"
            echo -e "Uptime: ${RED}$(uptime | awk -F "," '{print $1}')${ENDCOLOR}"
            curl "wttr.in/tokyo?0"
            # ---------------------------- Printing the weather ----------------------------
            # echo -e "Load Average: ${GREEN}$(uptime | awk -F "load average:" '{print $2}')${ENDCOLOR}"
            #echo -e "Memory Usage: ${GREEN}$(free -m | awk '/^Mem:/{printf "%dMB/%dMB\n", $3, $2}')${ENDCOLOR}"
            #echo -e "Disk Usage: ${GREEN}$(df -h | awk '/^\/dev/{printf "%dMB/%dMB\n", $3, $2}')${ENDCOLOR}"
            # echo -e "IP Address: ${GREEN}$(hostname -I)${ENDCOLOR}"
            # echo -e "MAC Address: ${GREEN}$(ifconfig | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')${ENDCOLOR}"
            # echo -e "Gateway: ${GREEN}$(ip route | awk '/default/ { print $3 }')${ENDCOLOR}"
            # echo -e "Public IP: ${GREEN}$(curl -s icanhazip.com)${ENDCOLOR}"
            #$MYNAME $USER $SHELL $ITERM_PROFILE $TERM_PROGRAM $LOGNAME $ZSH $(uptime)
            echo -e  "You are about to experience a potent dosage of Neovim Watch your steps."
            echo -e  "${MAGENTA}╔══════════════════════════════════════════╗${ENDCOLOR}"
            echo -e  "${MAGENTA}║           ${BLUE}⎋  ${RED}HERE BE VIMPIRES ${BLUE}⎋ ${MAGENTA}         ║${ENDCOLOR}"
            echo -e  "${MAGENTA}╚══════════════════════════════════════════╝${ENDCOLOR}"
            if [[ -f $HOME/motivate/motivate/motivate.py ]]; then
                motivate  # https://github.com/mubaris/motivate
            else
                 git clone https://github.com/mubaris/motivate.git ~/motivate
                 cd ~/motivate/motivate
                 echo "Goning to install motivate ... Give Permission Please ... "
                 sudo ./install.sh
            fi

        fi
}

#autoload -Uz WelcomeMessage

#============================================================================
#                   COLORING The MAN-Page
#============================================================================
# LESS_TERMCAP settings for improved man page colors
# Reset: Clears all styles
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
# Bold: Bright green
export LESS_TERMCAP_md=$'\e[1;32m'
# Blink: Same as bold (bright green) here, but could be changed
export LESS_TERMCAP_mb=$'\e[1;32m'
# Standout: Used for highlighting, set to bright yellow
export LESS_TERMCAP_so=$'\e[01;33m'
# Underline: Red with underline
export LESS_TERMCAP_us=$'\e[1;4;31m'
# Page for your man page
# You can use less, more, or cat or bat
# MANPAGER="less -N" man <command_you_want_to_view>
# bat  --wrap=never --style=numbers
#MANPAGER="bat --wrap=never --style=plain"
#alias man="MANPAGER='less' man"
alias man="MANPAGER='bat --wrap=never --style=plain' man"
#MANPAGER="bat --wrap=never --style=plain" man grep
# If you want numbers pass (--style=numbers)

#============================================================================
#                   Useful Functions and Utilities
#============================================================================
find() {
    if [ $# = 1 ]
    then
        command find . -iname "*$@*"
    else
        command find "$@"
    fi
}
# You need to install <bat> using brew install bat
batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}


#============================================================================
    # New Features from Natelandau .bash_profile
#============================================================================
#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better (remapping defaults and adding functionality)
#  3.   File and Folder Management
#  4.   Searching
#  5.   Process Management
#  6.   Networking
#  7.   System Operations & Information
#  8.   Web Development
#  9.   Reminders & Notes
#
#  ---------------------------------------------------------------------------
#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------
#   Change Prompt
#   ------------------------------------------------------------
#export PS1="________________________________________________________________________________"
#export PS2="| => "
#   Set Paths
#   ------------------------------------------------------------
# export PATH="$PATH:/usr/local/bin/"
# export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
export BLOCKSIZE=1k
#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
#   export CLICOLOR=1
#   export LSCOLORS=ExFxBxDxCxegedabagacad
#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
#cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='sublime'                        # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -a '                      # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mkndir () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
#   --------------------------------------------------------------------
mans () {
        man $1 | grep -iC2 --color=always $2 | bat
    }
#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }
#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------
zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)
#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
# cdf () {
#         currFolderPath=$( /usr/bin/osascript <<b
#             tell application "Finder"
#                 try
#             set currFolder to (folder of the front window as alias)
#                 on error
#             set currFolder to (path to desktop folder as alias)
#                 end try
#                 POSIX path of currFolder
#             end tell
# EOT
#         )
# echo "cd to \"$currFolderPath\""
# cd "$currFolderPath"
# }

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
if [ -f $1 ] ; then
case $1 in
*.tar.bz2)   tar xjf $1     ;;
*.tar.gz)    tar xzf $1     ;;
*.bz2)       bunzip2 $1     ;;
*.rar)       unrar e $1     ;;
*.gz)        gunzip $1      ;;
*.tar)       tar xf $1      ;;
*.tbz2)      tar xjf $1     ;;
*.tgz)       tar xzf $1     ;;
*.zip)       unzip $1       ;;
*.Z)         uncompress $1  ;;
*.7z)        7z x $1        ;;
*)     echo "'$1' cannot be extracted via extract()" ;;
esac
else
echo "'$1' is not a valid file"
fi
    }
#   ---------------------------
#   4.  SEARCHING
#   ---------------------------
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string
#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }
#   ---------------------------
#   5.  PROCESS MANAGEMENT
#   ---------------------------
#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
findPid () { lsof -t -c "$@" ; }
#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
alias topForever='top -l 9999999 -s 10 -o cpu'
#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"
#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }
#   ---------------------------
#   6.  NETWORKING
#   ---------------------------
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
ii() {
echo -e "\nYou are logged on ${RED}$HOST"
echo -e "\nAdditionnal information:$NC " ; uname -a
echo -e "\n${RED}Users logged on:$NC " ; w -h
echo -e "\n${RED}Current date :$NC " ; date
echo -e "\n${RED}Machine stats :$NC " ; uptime
echo -e "\n${RED}Current network location :$NC " ; scselect
echo -e "\n${RED}Public facing IP Address :$NC " ;myip
#echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
echo
    }
#   ---------------------------------------
#   7.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------
alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user
#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanupts="find . -type f -name 'typescript' -ls -delete"
#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#   -----------------------------------------------------------------------------------
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
#    screensaverDesktop: Run a screensaver on the Desktop
#   -----------------------------------------------------------------------------------
alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'
#   ---------------------------------------
#   8.  WEB DEVELOPMENT
#   ---------------------------------------
alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
alias editHosts='sudo edit /etc/hosts'                  # editHosts:        Edit /etc/hosts file
alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:   Shows apache error logs
httpHeaders () { /usr/bin/curl -I -L $@ ; }             # httpHeaders:      Grabs headers from web page
#   httpDebug:  Download a web page and show info on what took time
#   -------------------------------------------------------------------
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }
#   ---------------------------------------
#   9.  REMINDERS & NOTES
#   ---------------------------------------
#   remove_disk: spin down unneeded disk
#   ---------------------------------------
#   diskutil eject /dev/disk1s3
#   to change the password on an encrypted disk image:
#   ---------------------------------------
#   hdiutil chpass /path/to/the/diskimage
#   to mount a read-only disk image as read-write:
#   ---------------------------------------
#   hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify
#   mounting a removable drive (of type msdos or hfs)
#   ---------------------------------------
#   mkdir /Volumes/Foo
#   ls /dev/disk*   to find out the device to use in the mount command)
#   mount -t msdos /dev/disk1s1 /Volumes/Foo
#   mount -t hfs /dev/disk1s1 /Volumes/Foo
#   to create a file of a given size: /usr/sbin/mkfile or /usr/bin/hdiutil
#   ---------------------------------------
#   e.g.: mkfile 10m 10MB.dat
#   e.g.: hdiutil create -size 10m 10MB.dmg
#   the above create files that are almost all zeros - if random bytes are desired
#   then use: ~/Dev/Perl/randBytes 1048576 > 10MB.dat

#============================================================================
#           Run Ipython from the virtual Env.   - Added on Thu Dec 19th
#============================================================================
alias ipy="python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

#============================================================================
#       For installting the fuck to correct your formula
#============================================================================
#eval $(thefuck --alias)
#============================================================================
##################################################
#       Direnv Hoocking to zsh
##################################################
eval "$(direnv hook zsh)"

##################################################
#    Any thing added here is automated by
#            an app or service
##################################################
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

###################################################
#        For mtr utility adding to the path
###################################################
PATH=$PATH:/usr/local/sbin
###################################################
#       Interactive Terminal for Git
###################################################

# Source the forgit script if available, else download it
[ -f ~/.GScript/forgitScript.sh ] && source ~/.GScript/forgitScript.sh || {
    echo "404: ~/.GScript/forgitScript.sh not found. Fetching from https://github.com/wfxr/forgit"
    mkdir -p ~/.GScript
    curl -sSL git.io/forgit -o ~/.GScript/forgitScript.sh
    echo "Script downloaded. Please restart your terminal."
}
###################################################
#       Configuration of Neovide
#       https://github.com/Kethku/neovide
###################################################
export PATH="$HOME/neovide/target/release:$PATH"

###################################################
#       Google Driver for Selenium
#       Web Scraping and Automation
###################################################
# export PATH="$HOME/.myServices:$PATH"

###################################################
#       Project Template Builder
#    Script to automate python project template
###################################################
# export PATH="$HOME/.GScript/project_template_builder:$PATH"

###################################################
#             gitstatus from
#     the creator of powerlevel10k
###################################################
# source /usr/local/opt/gitstatus/gitstatus.prompt.zsh

###################################################
#           HISTORY SEARCHING COMMAND
#           using: mcfly
###################################################
# eval "$(mcfly init zsh)"

###################################################
# HSTR configuration - add this to ~/.zshrc
#       Following the configuration here:
#       http://dvorka.github.io/hstr/CONFIGURATION.html
###################################################
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"  # bind hstr to Ctrl-r (for Vi mode check doc)

###################################################
#        Add Heskall to your PATH
###################################################
PATH="$PATH:/usr/local/sbin"
# PATH="$PATH:/Users/ghasak.ibrahim/.local/bin"
PATH="$PATH:$HOME/.local/bin"

###################################################
#           CLICK-CLICK For Mac
###################################################
# export PATH="$HOME/.GScript/utility_functions/cliclick:$PATH"

###################################################
#           mcfly for command history
###################################################
# eval "$(mcfly init zsh)"

###################################################
#         Nvim Stable Release
###################################################
# export PATH="$HOME/dev/nvim-os64/bin:$PATH"
# export PATH="$HOME/dev/nvim-os64:$PATH"
# export PATH="/Users/ghasak.ibrahim/dev/nvim-osx64/bin:$PATH"
# export PATH="$HOME/dev/nvim/bin:$PATH"

###################################################
#            Curl Configuration
###################################################
#  If you need to have curl first in your PATH, run:
#    echo 'export PATH="/usr/local/opt/curl/bin:$PATH"' >> ~/.zshrc
#  For compilers to find curl you may need to set:
#    export LDFLAGS="-L/usr/local/opt/curl/lib"
#    export CPPFLAGS="-I/usr/local/opt/curl/include"
#  For pkg-config to find curl you may need to set:
#    export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"
# export PATH="/usr/local/opt/curl/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/curl/lib"
# export CPPFLAGS="-I/usr/local/opt/curl/include"
# export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"

###################################################
#           Correct Cmake Path
###################################################
# export PATH="/usr/local/bin:$PATH"

###################################################
#       Authenticate all my scripts that I developed in the shell
###################################################
# export PATH="$HOME/.GScript:$PATH"
# export PATH="$HOME/.GScript/utility_functions:$PATH"
# This will load recursively all the files in the directory
# for d in $HOME/.GScript/*; do PATH="$PATH:$d"; done
export PATH="$HOME/.GScript:$PATH"
export PATH="$HOME/.GScript/myLatexDev:$PATH"
export PATH="$HOME/.GScript/utility_functions:$PATH"
export PATH="$HOME/.GScript/nvimTimeMachine:$PATH"
export PATH="$PATH:$HOME/.GScript/mysnippets"

###################################################
#           g-Cli Hub for CLI dev.
#       The developed CLI - Operating here
###################################################
export PATH="$PATH:$HOME/gCliHub/nvimTimeMachine"
export PATH="$PATH:$HOME/gCliHub/tagSys"
export PATH="$PATH:$HOME/gCliHub/myLatex"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/14/bin"
export PATH="$HOME/opt/homebrew/bin:$PATH"

###################################################
#           Zathura - PDF reader
#           will read from this location
###################################################
export PATH="$PATH:/usr/local"

###################################################
#          Go Lang - Go Language
###################################################
# export GOPATH=$HOME/go-workspace  # don't forget to change your path correctly!
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin
# export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"

###################################################
#      SDKMAN - SDK Manager Package manager similar to brew
#    Still working, just removed temporarily for zsh session speed
###################################################
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

###################################################
#           Current Java for ARM Mac - M1
###################################################
# export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
# set editing-mode vi

###################################################
#           Neovide - IDE (neovide)
###################################################
# export PATH="$PATH:/Applications/Neovide.app/Contents/MacOS"

###################################################
#       Using Chromium to launch the cv-generator
###################################################
# export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
# export PUPPETEER_EXECUTABLE_PATH=`which chromium`

###################################################
#                 fpath utility_functions
###################################################
fpath=(~/.zsh.d $fpath)

###################################################
#                 coreutils utility_functions
###################################################
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

###################################################
#                 llvm utility_functions
###################################################
# llvm is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.
# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

###################################################
#              Other Utilities - After you upgrade brew
###################################################
# ruby is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.
# export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

# curl is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.
# export PATH="/opt/homebrew/opt/curl/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"

# zsh completions have been installed to:
# /opt/homebrew/opt/curl/share/zsh/site-functions

###################################################
#       This function is working with ranger
#       using Capital (Q) to exit ranger to
#       the last specified directory in ranger.
#       - Added Wed. Feb. 24th 2021
###################################################
function ranger-cd {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat "$tempfile")" != "$(pwd)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    rm -f -- "$tempfile" 2>/dev/null
}

alias ranger=ranger-cd

###################################################
#       Broot Configuration
###################################################
# source /Users/gmbp/.config/broot/launcher/bash/br
source $HOME/.config/broot/launcher/bash/br

###################################################
#       Adapter for debugging (used in Emacs [dap layer/dap-mode])
###################################################
export PATH="$PATH:$HOME/.vscode/extensions/ms-vscode.cpptools-1.17.5-darwin-arm64/debugAdapters/lldb-mi/bin"
# export PATH="$PATH:$HOME/.vscode/extensions/ms-vscode.cpptools-1.17.4-darwin-arm64/debugAdapters/lldb-mi/bin"
# export PATH="$PATH:$HOME/.vscode/extensions/ms-vscode.cpptools-1.14.5-darwin-arm64/debugAdapters/lldb-mi/bin"
# export PATH="$PATH:$HOME/.vscode/extensions/ms-vscode.cpptools-1.15.4-darwin-arm64/debugAdapters/lldb-mi/bin"
# export PATH="$PATH:$HOME/.vscode/extensions/ms-vscode.cpptools-1.15.4-darwin-arm64/bin"

###################################################
#             Markdown Reader Engine - Emacs - layer
#    Install it from here: https://github.com/yoshuawuyts/vmd/releases/tag/1.34.0
###################################################
export PATH="$PATH:/Applications/vmd.app/Contents/MacOS"

###################################################
#           ADDING 3rd party libraries (e.g. SDL2)
###################################################
export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

###################################################
#         Using zoxide instead of autojump
#   URL: https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
###################################################
eval "$(zoxide init zsh --cmd j)"

###################################################
#     Emacs 31 dependencies for `as` command
###################################################
export PATH="/usr/bin:$PATH"
function yazix() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

########################################################
#            C/C++, Rust developement
########################################################
export CC=clang
export CXX=clang++
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)


########################################################
#              ANACONDA INITIALIZATION
########################################################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

########################################################
#      LOADING FASTER ZSHRC WITH OH-MY-ZSH
# This will make our zsh config super quick at loading
########################################################

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


