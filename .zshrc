# ################################################
#      ███████╗███████╗██╗  ██╗██████╗  ██████╗
#      ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#        ███╔╝ ███████╗███████║██████╔╝██║
#       ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#    ██╗███████╗███████║██║  ██║██║  ██║╚██████╗
#    ___           __ _           __ _ _
#   / __|___ _ _  / _(_)__ _     / _(_) |___
#  | (__/ _ \ ' \|  _| / _` |_  |  _| | / -_)
#   \___\___/_||_|_| |_\__, (_) |_| |_|_\___|
#                      |___/
# ################################################

# --- Powerlevel10k instant prompt (must be at top) ---
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --------- Locale / Terminal ---------
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export TERM="xterm-256color"

# --------- Editor / Pager ---------
export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"

# --- My Customized Aliases --------
source $HOME/.aliases
# --------- Oh-My-Zsh core ---------
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/ohmyzsh"
mkdir -p "$ZSH_CACHE_DIR"
ZSH_DISABLE_COMPFIX=true

# --------- fpath clean ---------
typeset -gU fpath
fpath=(${fpath:#$HOME/gdotfiles/.oh-my-zsh/custom/plugins/fzf-tab/lib})
fpath=(${fpath:#$HOME/.oh-my-zsh/cache/completions})
fpath=($HOME/.oh-my-zsh/custom/plugins $fpath)

# --------- Completion ---------
autoload -Uz compinit
_zcd="${ZDOTDIR:-$HOME}/.zcompdump-$ZSH_VERSION"
if [[ ! -f "$_zcd" || ! -s "$_zcd" ]]; then
  compinit -C -d "$_zcd"
  [[ -f "$_zcd" ]] && command zcompile -R "$_zcd.zwc" "$_zcd" 2>/dev/null
else
  compinit -C -d "$_zcd"
fi
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh-completion"

#==================================================
#            CONFIGURATION NVIM
#==================================================
# --------- Plugins ---------
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#97A7B3, bg=#ADB6C4 ,bold,underline"

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

# fzf-tab tuning
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# zsh-vi-mode config
function zvm_config() {
  # ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  #ZVM_VI_INSERT_ESCAPE_BINDKEY=jk #[[This causes a problem of hiccup in the
  #prompt https://github.com/romkatv/powerlevel10k/issues/2469]]
}

# --- Theme: Powerlevel10k ---
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load Oh-My-Zsh
source "$ZSH/oh-my-zsh.sh"

# Powerlevel10k config
[[ -r ~/.p10k.zsh ]] && source ~/.p10k.zsh

# --------- History ---------
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export HISTFILESIZE=1000000
setopt EXTENDED_HISTORY HIST_IGNORE_DUPS HIST_FIND_NO_DUPS HIST_IGNORE_SPACE SHARE_HISTORY
export HISTTIMEFORMAT='%b %d %I:%M %p '

# --------- Aliases ---------
alias vim='nvim'
export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"
# source $HOME/.aliases
alias ll='ls -FGlAhp'
alias lsd='colorls -l -A -h --light --sort-dirs'
alias ctree='colorls --tree'
alias history="history -i 0 | fzf"
alias hist='history'
alias home='cd ~'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias less='less -FSRXc'
alias which='type -a'
alias path='echo -e ${PATH//:/\\n}'
alias c='clear'
alias ..='cd ../'
alias ...='cd ../../'
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanupts="find . -type f -name 'typescript' -ls -delete"
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
alias qfind="find . -name "                 # qfind:    Quickly search for file
alias ipy="python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
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
# --------- Useful Functions ---------
find() { (( $# == 1 )) && command find . -iname "*$1*" || command find "$@"; }
batdiff() { git diff --name-only --diff-filter=d | xargs -r bat --diff; }
mkndir () { mkdir -p -- "$1" && cd -- "$1"; }
trash () { command mv -v -- "$@" ~/.Trash ; }
mans () { man "$1" | grep -iC2 --color=always "$2" | bat; }
zipf () { zip -r "${1}.zip" "$1"; }
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

extract () {
  local f="$1"
  [[ -f "$f" ]] || { echo "'$f' is not a valid file"; return 1; }
  case "$f" in
    *.tar.bz2)   tar xjf "$f"     ;;
    *.tar.gz)    tar xzf "$f"     ;;
    *.bz2)       bunzip2 "$f"     ;;
    *.rar)       unrar e "$f"     ;;
    *.gz)        gunzip "$f"      ;;
    *.tar)       tar xf "$f"      ;;
    *.tbz2)      tar xjf "$f"     ;;
    *.tgz)       tar xzf "$f"     ;;
    *.zip)       unzip "$f"       ;;
    *.Z)         uncompress "$f"  ;;
    *.7z)        7z x "$f"        ;;
    *) echo "'$f' cannot be extracted via extract()"; return 2 ;;
  esac
}

# --------- Man page colors ---------
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
alias man="MANPAGER='bat --wrap=never --style=plain' man"

# --------- PATH (fixed: use array "path") ---------
typeset -gU path
path+=(
  /usr/local/bin
  /usr/local/sbin
  $HOME/.local/bin
  $HOME/neovide/target/release
  $HOME/go/bin
  /Applications/vmd.app/Contents/MacOS
  /usr/bin
)

# --------- iTerm2 integration ---------
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# --------- vcpkg completion ---------
[[ -r "$HOME/vcpkg/scripts/vcpkg_completion.zsh" ]] && source "$HOME/vcpkg/scripts/vcpkg_completion.zsh"

# --------- direnv / zoxide / uv completions ---------
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh --cmd j)"
command -v uv >/dev/null 2>&1 && eval "$(uv generate-shell-completion zsh)"
command -v uvx >/dev/null 2>&1 && eval "$(uvx --generate-shell-completion zsh)"

###################################################
#      SDKMAN - SDK Manager Package manager similar to brew
#    Still working, just removed temporarily for zsh session speed
###################################################
# --------- SDKMAN lazy-load ---------
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# this is the original loader which takes time and I replaced it with the fast and quiet
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ── Lazy SDKMAN bootstrap (fast & quiet) ───────────────────────────────────
# No console output during init; loads only on first use of sdk/Java tools.

# Point to SDKMAN home if it exists
[[ -d "$HOME/.sdkman" ]] && export SDKMAN_DIR="$HOME/.sdkman"

# Internal: perform real SDKMAN init once
__sdkman_lazy_init() {
  # Guard: only if SDKMAN_DIR and init script exist
  if [[ -n "$SDKMAN_DIR" && -r "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
    # Source official init (adds PATH, candidates, etc.)
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
    export __SDKMAN_LOADED=1
  else
    # No SDKMAN installed; mark as “absent” to avoid repeated checks
    export __SDKMAN_LOADED=0
  fi
}

# Wrapper for `sdk` command
sdk() {
  if [[ -z "$__SDKMAN_LOADED" ]]; then
    __sdkman_lazy_init
  fi
  if [[ "$__SDKMAN_LOADED" == "1" ]]; then
    command sdk "$@"
  else
    return 127  # sdk not available
  fi
}

# Wrappers for common SDKMAN-managed tools
# Add or remove tools as you need.
local -a __SDKMAN_TOOLS=(
  java javac javadoc jshell
  mvn mvnd maven
  gradle
  kotlin kotlinc
  scala sbt
  groovy grails
  spring
  ant
)

# Define thin wrappers that init once, then handoff to the real tool
for __t in "${__SDKMAN_TOOLS[@]}"; do
  eval "
  function $__t() {
    if [[ -z \"\$__SDKMAN_LOADED\" ]]; then
      __sdkman_lazy_init
    fi
    if [[ \"\$__SDKMAN_LOADED\" == \"1\" ]]; then
      command $__t \"\$@\"
    else
      return 127  # tool not available (SDKMAN missing)
    fi
  }"
done

unset __t
# ───────────────────────────────────────────────────────────────────────────

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

########################################################
#              ANACONDA INITIALIZATION
########################################################
# ⚠️ Tip for speed: since you mentioned startup delays earlier,
# you don’t need to auto-activate base in .zshrc. Make sure you run this once:
# conda config --set auto_activate_base false
# ── Lazy Conda bootstrap (fast shell startup) ──────────────────────────────────
# Remove or comment out the whole "conda initialize" block that conda added.

# --------- Conda (lazy bootstrap) ---------
__CONDA_PREFIX_CANDIDATES=("/opt/anaconda3" "$HOME/miniconda3")
for __p in "${__CONDA_PREFIX_CANDIDATES[@]}"; do
  [[ -x "$__p/bin/conda" ]] && export __CONDA_PREFIX="$__p" && break
done
unset __p

__conda_lazy_init() {
  eval "$("$__CONDA_PREFIX/bin/conda" shell.zsh hook 2>/dev/null)"
  conda config --set auto_activate_base false >/dev/null 2>&1
  export __CONDA_LAZY=1
}
conda() {
  if [[ -z "$__CONDA_LAZY" ]]; then
    [[ -n "$__CONDA_PREFIX" ]] || { echo "conda: install not found"; return 127; }
    __conda_lazy_init
  fi
  command conda "$@"
}
ca() { conda activate "$@"; }
cdA() { conda deactivate; }


# --------- Autocompile .zshrc ---------
if [[ -w "${ZDOTDIR:-$HOME}" ]]; then
  local _self="${${(%):-%N}}"
  if [[ -n "$_self" && -r "$_self" && ( ! -f "$_self.zwc" || "$_self" -nt "$_self.zwc" ) ]]; then
    command zcompile -R "$_self.zwc" "$_self" 2>/dev/null || true
  fi
fi

########################################################
#      LOADING FASTER ZSHRC WITH OH-MY-ZSH
# This will make our zsh config super quick at loading
########################################################

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
