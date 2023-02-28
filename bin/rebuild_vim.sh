if [ ! -f ".gitmodules" ]; then
    if [ ! -d ".vim/pack/plugins/start/" ]; then
        echo -e "\n========= nerdtree =========\n"
        git submodule add -f https://github.com/preservim/nerdtree.git .vim/pack/plugins/start/nerdtree
        echo -e "\n========= fugitive =========\n"
        git submodule add -f https://github.com/tpope/vim-fugitive.git .vim/pack/plugins/start/fugitive
        echo -e "\n========= vim-go =========\n"
        git submodule add -f https://github.com/fatih/vim-go.git .vim/pack/plugins/start/vim-go
        echo -e "\n========= YCM =========\n"
        git submodule add -f https://github.com/ycm-core/YouCompleteMe.git .vim/pack/plugins/start/YouCompleteMe
        echo -e "\n========= syntastic =========\n"
        git submodule add -f https://github.com/vim-syntastic/syntastic.git .vim/pack/plugins/start/syntastic
        echo -e "\n========= ctrlp =========\n"
        git submodule add -f https://github.com/ctrlpvim/ctrlp.vim.git .vim/pack/plugins/start/ctrlp
    fi
fi

git submodule update --init --recursive

sudo dnf install cmake gcc-c++ make python3-devel

cd ~/.vim/pack/plugins/start/YouCompleteMe
python3 install.py --go-completer
