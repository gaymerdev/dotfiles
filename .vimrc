" <<START>> Checking and Installing the Vundle Package Manager if it does not exist
    let vundle_status=1
    let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle..."
        echo ""
        call mkdir($HOME . '/.vim/bundle', 'p')
        silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim    
        let vundle_status=0
    endif

    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/syntastic'
    Plugin 'altercation/vim-colors-solarized'

    if vundle_status == 0
        echo "Installing Vundle packages. Any keymap errors can be ignored."
        echo ""
        :PluginInstall
    endif

    call vundle#end()
    filetype plugin indent on
" <<END>> Checking and Installing the Vundle Package Manager if it does not exist

syntax enable
