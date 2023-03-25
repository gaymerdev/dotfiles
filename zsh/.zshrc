# if [[ $(command -v neofetch ) ]]; then neofetch; else echo ""; fi

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
antigen bundle pip
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle cp
antigen bundle vkolagotla/zsh-random-quotes
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

##################
#~    THEME     ~#
##################

# antigen theme robbyrussell
antigen theme romkatv/powerlevel10k

##################
#~    APPLY     ~#
##################

antigen apply

###############
#~  CONFIGS  ~#
###############

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

export POETRY_VIRTUALENVS_IN_PROJECT=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
