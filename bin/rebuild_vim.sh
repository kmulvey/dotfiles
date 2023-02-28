if [ ! -f ".gitmodules" ]; then
    if [ ! -d ".vim/pack/plugins/start/" ]; then
        git submodule add https://github.com/preservim/nerdtree.git .vim/pack/plugins/start/nerdtree
        git submodule add https://github.com/tpope/vim-fugitive.git .vim/pack/plugins/start/fugitive
        git submodule add https://github.com/fatih/vim-go.git .vim/pack/plugins/start/vim-go
        git submodule add https://github.com/ycm-core/YouCompleteMe.git .vim/pack/plugins/start/YouCompleteMe
        git submodule add https://github.com/vim-syntastic/syntastic.git .vim/pack/plugins/start/syntastic
        git submodule add https://github.com/ctrlpvim/ctrlp.vim.git .vim/pack/plugins/start/ctrlp
    fi
fi

git submodule update --init --recursive

sudo dnf install cmake gcc-c++ make python3-devel

cd ~/.vim/pack/plugins/start/YouCompleteMe
python3 install.py --go-completer
