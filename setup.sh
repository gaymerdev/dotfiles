#!/bin/env bash

curl -L git.io/antigen > $HOME/antigen.zsh
git clone https://github.com/zsh-users/antigen.git $HOME/antigen


rm $HOME/.zshrc && rm $HOME/.p10k.zsh
ln -s $HOME/profile-configs/zsh/.p10k.zsh $HOME/.p10k.zsh
ln -s $HOME/profile-configs/zsh/.zshrc $HOME/.zshrc

