# Personal Linux DotFiles

Files included:

- .digrc
- .p10k.zsh
- .vimrc
- .zshrc

## Quick Setup

The files are structured in a way to make using GNU Stow fairly simple. Clone the directory and then...

```
cd dot-files
stow dig
stow vim
stow zsh
```

If the `stow` command is unavailable, and it cannot be installed, then the symbolic links will need to be created manually.

```
cd dot-files
ln -s $PWD/dig/.digrc $HOME/.digrc
ln -s $PWD/vim/.vimrc $HOME/.vimrc
ln -s $PWD/zsh/.fzf.zsh $HOME/.fzf.zsh
ln -s $PWD/zsh/.p10k.zsh $HOME/.p10k.zsh
ln -s $PWD/zsh/.zshrc $HOME/.zshrc
```

## DIG Configuration

Uses the CloudFlare DNS (1.1.1.1) to resolve lookups and prunes down the information shows.

## powerlevel10k ZSH theme

[PowerLevel10k GitHub](https://github.com/romkatv/powerlevel10k)

> !! IMPORTANT:  the Meslo Nerd font is recommended for the symbols and overall theme appearance. If the theme looks a bit odd, install the font and then select it in the terminal profile options.

The configuration file was created using the startup wizard and has no customizations beyond those initial selections.

## VIM Configuration

Installs the following VIM plugins:

- Fugitive ([GitHub](https://github.com/tpope/vim-fugitive))
- GruvBox8 theme ([GitHub](https://github.com/lifepillar/vim-gruvbox8))
- ALE (Asynchronous Lint Engine) ([GitHub](https://github.com/dense-analysis/ale))
- Sensible ([GitHub](https://github.com/tpope/vim-sensible))

