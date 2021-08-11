# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
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

##################
#~   ALIASES    ~#
##################

## UBUNTU ALIASES
alias apt-upgrade="sudo apt update && sudo apt dist-upgrade -y && sudo apt autoremove"
aptstall () {
  sudo apt install $1
}
pacstall () {
  sudo pacman -Sy $1
}
multistart () {
  sudo /home/minecraft/multicraft/bin/multicraft start
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
