#!/usr/bin/env bash

if [[ ! -f $HOME/.antigen.zsh ]] && [[ $? -eq 0 ]]
then
    curl -L git.io/antigen > $HOME/.antigen.zsh
fi

if [[ -f $HOME/.zshrc ]]
then
    rm $HOME/.zshrc
    ln -s $HOME/.profile-configs/zsh/.zshrc $HOME/.zshrc
else
    ln -s $HOME/.profile-configs/zsh/.zshrc $HOME/.zshrc
fi

if [[ -f $HOME/.p10k.zsh ]]
then
    rm $HOME/.p10k.zsh
    ln -s $HOME/.profile-configs/zsh/.p10k.zsh $HOME/.p10k.zsh
else
    ln -s $HOME/.profile-configs/zsh/.p10k.zsh $HOME/.p10k.zsh
fi

if [[ -f $HOME/.digrc ]]
then
    rm $HOME/.digrc
    ln -s $HOME/.profile-configs/.digrc $HOME/.digrc
else
    ln -s $HOME/.profile-configs/.digrc $HOME/.digrc
fi

if [[ -f $HOME/.vimrc ]]
then
    rm $HOME/.vimrc
    ln -s $HOME/.profile-configs/.vimrc $HOME/.vimrc
else
    ln -s $HOME/.profile-configs/.vimrc $HOME/.vimrc
fi
