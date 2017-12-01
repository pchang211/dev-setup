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
	cd ~/.vim/bundle 
	git clone https://github.com/tpope/vim-sensible.git
	git clone git://github.com/airblade/vim-gitgutter.git
	git clone https://github.com/vim-airline/vim-airline
}

if [ $1 -eq "fzf" ] 
then 
	fzf
elif [ $1 -eq "pathogen" ]
then
	pathogen
elif [ $1 -eq "vim_plugins" ]
then
	vim_plugins
elif [ $1 -eq "all" ]
then
	fzf
	pathogen
	vim_plugins
