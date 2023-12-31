## Path section
# Set $PATH if ~/.local/bin exist
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

# Display custom terminal title for easy identification
function set_win_title(){
  echo -ne "\033]0; $USER@$HOST:${PWD/$HOME/~} \007"
}
precmd_functions+=(set_win_title)

# Antigen download
if [[ ! -f ~/.antigen.zsh ]]; then
  curl -L git.io/antigen > .antigen.zsh
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.antigen.zsh

##################
#~    LIBRARY   ~#
##################

antigen use oh-my-zsh

##################
#~   PLUGINS    ~#
##################

antigen bundle git
# antigen bundle cantino/mcfly
antigen bundle command-not-found
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle unixorn/fzf-zsh-plugin@main

##################
#~    THEME     ~#
##################

antigen theme romkatv/powerlevel10k

##################
#~    APPLY     ~#
##################

antigen apply

###############
#~  OPTIONS  ~#
###############

setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

###############
#~  CONFIGS  ~#
###############

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# Completion.
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=10000

###############
#~  ALIASES  ~#
###############

# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header'

# Common use
alias grubup="sudo update-grub"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='ugrep --color=auto'
alias fgrep='ugrep -F --color=auto'
alias egrep='ugrep -E --color=auto'
alias hw='hwinfo --short'                          # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB (expac must be installed)
alias ip='ip -color'

# Easy tail & follow
alias t='tail -f'

# Head, Tail, Error redirect

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L='| less'
alias -g M='| most'
alias -g LL='2>&1 | less'
alias -g CA='2>&1 | cat -A'
alias -g NE='2> /dev/null'
alias -g NUL="> /dev/null 2>&1"

# Find

(( $+commands[duf] )) || alias duf='du -sh *'
(( $+commands[fd] )) || alias fd='find . -type d -name'
alias ff='find . -type f -name'

# Distribution specific

function distro_aliases () {
  local distro=$(lsb_release -i | cut -f 2)
  if [[ $distro == "Garuda" ]]; then
    ### Set aliases for Garuda

    # Common use
    [ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'
    alias fixpacman="sudo rm /var/lib/pacman/db.lck"
    alias rmpkg="sudo pacman -Rdd"
    alias upd='/usr/bin/garuda-update'
    alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages

    # Get fastest mirrors
    alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
    alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
    alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
    alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

    # New to Arch
    alias apt='man pacman'
    alias apt-get='man pacman'
    alias please='sudo'
    alias tb='nc termbin.com 9999'
    alias helpme='cht.sh --shell'
    alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

    # Cleanup orphaned packages
    alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

    # Get the error messages from journalctl
    alias jctl="journalctl -p 3 -xb"

    # Recent installed packages
    alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
  
  elif [[ $distro == "Ubuntu" ]]; then
    alias apt='aptitude'
    alias upd='sudo aptitude update && sudo aptitude upgrade'
  fi
}

distro_aliases

#################
#~  LOCAL ENV  ~#
#################

export POETRY_VIRTUALENVS_IN_PROJECT=true

# Load Mcfly
export MCFLY_FUZZY=true
export MCFLY_RESULTS=20
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_RESULTS_SORT=LAST_RUN
eval "$(mcfly init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh