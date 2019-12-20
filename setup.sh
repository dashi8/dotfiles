#!/bin/sh

make_link () {
    source=$1
    target=$2
    if [ -e $target ] && [ ! -L $target ]; then
        backup=$target.dotfiles-bak
        mv -f $target $backup
        echo "!Note: Existing file "$target" is moved to "$backup
    fi
    ln -snf $source $target
}

SCRIPT_DIR=$(cd $(dirname $0); pwd)
# link
make_link $SCRIPT_DIR/.vimrc ~/.vimrc
make_link $SCRIPT_DIR/.vim ~/.vim
make_link $SCRIPT_DIR/.tmux.conf ~/.tmux.conf
make_link $SCRIPT_DIR/.tmux.d ~/.tmux.d
make_link $SCRIPT_DIR/.gitconfig ~/.gitconfig
make_link $SCRIPT_DIR/.bashrc ~/.bashrc
make_link $SCRIPT_DIR/.inputrc ~/.inputrc

# vim plugin setup
rm -rf $SCRIPT_DIR/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git $SCRIPT_DIR/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# 読み込み
bind -f ~/.inputrc
source ~/.bashrc
source ~/.vimrc
tmux source ~/.tmux.conf
