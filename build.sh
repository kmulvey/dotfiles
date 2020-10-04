git submodule init
git submodule update --init --recursive
git submodule update --remote --merge
vim +PluginInstall +qall

sudo dnf install cmake gcc-c++ make python3-devel
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --go-completer
