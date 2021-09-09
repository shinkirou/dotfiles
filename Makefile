SHELL = bash

.PHONY: all
all: alacritty vim i3 tmux

.PHONY: alacritty
alacritty:
	mkdir -p ${HOME}/.config/alacritty
	ln -vsf ${HOME}/dotfiles/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml

.PHONY: vim
vim:
	ln -vsf ${HOME}/dotfiles/vimrc ${HOME}/.vimrc
	if ! [ -f ${HOME}/.vim/autoload/plug.vim ]; then \
 	 	curl -LSso ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi

.PHONY: i3
i3:
	mkdir -p ${HOME}/.config/i3
	ln -vsf ${HOME}/dotfiles/i3/config ${HOME}/.config/i3/config

.PHONY: tmux
tmux:
	ln -vsf ${HOME}/dotfiles/tmux.conf ${HOME}/.tmux.conf
	if [ ! -d ${HOME}/.tmux/plugins/tpm ] ; then \
		git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm; \
	else \
	    cd ${HOME}/.tmux/plugins/tpm; \
		git pull https://github.com/tmux-plugins/tpm; \
	fi

