# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.antigen.zsh

##################
#~   LIBRARY    ~#
##################

antigen use oh-my-zsh

##################
#~   PLUGINS    ~#
##################

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle common-aliases
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

### NOTES:
# Install antigen with:
# curl -L git.io/antigen > $HOME/.antigen.zsh
# git clone https://github.com/zsh-users/antigen.git ~/.antigen

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
