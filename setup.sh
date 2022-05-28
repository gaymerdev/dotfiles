#!/usr/bin/env bash

## Import the Antigen plugin manager
if [[ ! -f $HOME/.antigen.zsh ]]; then curl -L git.io/antigen > $HOME/.antigen.zsh; fi

## Symnbolically link profile configs from the repository to their expected locations.
## Create backups of the file if one aleady exists.
if [[ -d $HOME/.configs/profile ]]
then
    ln --symbolic --backup  $HOME/.configs/profile/zsh/.zshrc $HOME/.zshrc
    ln --symbolic --backup  $HOME/.configs/profile/zsh/.p10k.zsh $HOME/.p10k.zsh
    ln --symbolic --backup  $HOME/.configs/profile/ssh/config $HOME/.ssh/config
    ln --symbolic --backup  $HOME/.configs/profile/.digrc $HOME/.digrc
    ln --symbolic --backup  $HOME/.configs/profile/.vimrc $HOME/.vimrc
else
    echo "The repository needs to be @ $HOME/.configs/profile."
fi

#### Switch to ZSH Shell
if echo $0 | grep -qiE "zsh"; then echo "Already using ZSH"; else chsh --shell=/usr/bin/zsh $USER; fi
