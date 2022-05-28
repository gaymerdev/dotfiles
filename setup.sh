#!/usr/bin/env bash

## Import the Antigen plugin manager
if [[ ! -f $HOME/.antigen.zsh ]]; then curl -L git.io/antigen > $HOME/.antigen.zsh; fi

## Symnbolically link profile configs from the repository to their expected locations.
## Create backups of the file if one aleady exists.
if [[ -d $HOME/.config/profile ]]
then
    ln --symbolic --backup  $HOME/.config/profile/zsh/.zshrc $HOME/.zshrc
    ln --symbolic --backup  $HOME/.config/profile/zsh/.p10k.zsh $HOME/.p10k.zsh
    ln --symbolic --backup  $HOME/.config/profile/ssh/config $HOME/.ssh/config
    ln --symbolic --backup  $HOME/.config/profile/.digrc $HOME/.digrc
    ln --symbolic --backup  $HOME/.config/profile/.vimrc $HOME/.vimrc
else
    echo "The repository needs to be @ $HOME/.config/profile."
fi

#### Switch to ZSH Shell
chsh --shell=/usr/bin/zsh $USER
