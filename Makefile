.PHONY: all
all : vim

.PHONY: vim
vim: ## Set up symlinks for user .vimrc.
	ln -snf "$(HOME)/dotfiles/vimrc" "$(HOME)/.vimrc"
