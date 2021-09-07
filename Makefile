SHELL = bash

.PHONY: all
all: alacritty vim

.PHONY: alacritty
alacritty:
	mkdir -p ${HOME}/.config/alacritty
	ln -vsf ${HOME}/dotfiles/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml

.PHONY: vim
vim: # Set up symlinks for user .vimrc.
	ln -vsf ${HOME}/dotfiles/vimrc ${HOME}/.vimrc


