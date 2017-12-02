#!/usr/bin/env bash

# fzf
fzf() {
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	yes | ~/.fzf/install
	source ~/.bashrc
}

pathogen() {
	mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim	
	echo "execute pathogen#infect()" >> ~/.vimrc
	echo "syntax on" >> ~/.vimrc
	echo "filetype plugin indent on" >> ~/.vimrc
}

vim_plugins() {
	mkdir -p ~/.vim/bundle
	cd ~/.vim/bundle 
	git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible.git
	git clone git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
	git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
	git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
	git clone https://github.com/terryma/vim-multiple-cursors ~/.vim/bundle/vim-multiple-cursors
}

bash() {
	cp .bashrc ~/
	cp .bash_profile ~/
}

tmux() {
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	yes | brew install tmux
	cp .tmux.conf ~/
}

if [ $1 == "fzf" ] 
then 
	fzf
elif [ $1 == "pathogen" ]
then
	pathogen
elif [ $1 == "vim_plugins" ]
then
	vim_plugins
elif [ $1 == "bash" ]
then
	bash
elif [ $1 == "tmux" ]
then
	tmux
elif [ $1 == "all" ]
then
	fzf
	pathogen
	vim_plugins
	bash
	tmux
else
	echo "Invalid target. Options: [fzf, pathogen, vim_plugins, bash, tmux, all]"
fi
