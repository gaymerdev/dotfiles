#!/bin/env bash

rm $HOME/.zshrc && rm $HOME/.p10k.zsh
ln -s $HOME/profile-configs/zsh/.p10k.zsh $HOME/.p10k.zsh
ln -s $HOME/profile-configs/zsh/.zshrc $HOME/.zshrc
