#!/bin/bash

# Link each dotfile in the directory to its home counterpart.
# Reminders:
#		- Install Powerline Fonts (Currently used: DejaVu 10pt)
#		- Add Pathogen:
#			- curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#			- cd ~/.vim/bundle && git clone git://github.com/tpope/vim-sensible.git
#		- Add Vundle: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#			- Run Vundle :PluginInstall

shopt -s extglob

for file in ~/.dotfiles/!(install*|dotbot*) ; do
	filename=$(basename $file)
	echo "-- Linking: $filename"
	[ -f ~/.$filename ] && rm ~/.$filename && echo "Removed ~/.$filename"
	ln -s ~/.dotfiles/$filename ~/.$filename
done