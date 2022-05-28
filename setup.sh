#!/usr/bin/env bash

##################
#   ZSH IMPORT   #
##################
if [[ ! -f $HOME/.antigen.zsh ]] && [[ $? -eq 0 ]]
then
    curl -L git.io/antigen > $HOME/.antigen.zsh
fi

if [[ -f $HOME/.zshrc ]]
then
    rm $HOME/.zshrc
    ln -s $HOME/.configs/profile/zsh/.zshrc $HOME/.zshrc
else
    ln -s $HOME/.configs/profile/zsh/.zshrc $HOME/.zshrc
fi

if [[ -f $HOME/.p10k.zsh ]]
then
    rm $HOME/.p10k.zsh
    ln -s $HOME/.configs/profile/zsh/.p10k.zsh $HOME/.p10k.zsh
else
    ln -s $HOME/.configs/profile/zsh/.p10k.zsh $HOME/.p10k.zsh
fi

##################
#   SSH IMPORT   #
##################
if [[ -f $HOME/.ssh/config ]]
then
    rm $HOME/.ssh/config
    ln -s $HOME/.configs/profile/ssh/config $HOME/.ssh/config
else
    ln -s $HOME/.configs/profile/ssh/config $HOME/.ssh/config
fi

##################
#   DIG IMPORT   #
##################
if [[ -f $HOME/.digrc ]]
then
    rm $HOME/.digrc
    ln -s $HOME/.configs/profile/.digrc $HOME/.digrc
else
    ln -s $HOME/.configs/profile/.digrc $HOME/.digrc
fi

##################
#   VIM IMPORT   #
##################
if [[ -f $HOME/.vimrc ]]
then
    rm $HOME/.vimrc
    ln -s $HOME/.configs/profile/.vimrc $HOME/.vimrc
else
    ln -s $HOME/.configs/profile/.vimrc $HOME/.vimrc
fi

#### Switch to ZSH Shell
if echo $0 | grep -qiE "zsh"; then echo "Already using ZSH"; else chsh --shell=/usr/bin/zsh $USER; fi
