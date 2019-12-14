vim-import:
	mkdir -p ~/.config/nvim/
	cp $(shell pwd)/init.vim ~/.config/nvim/init.vim
	cp $(shell pwd)/.vimrc ~/.vimrc
	cp coc-settings.json ~/.config/nvim/coc-settings.json 
vim-export:
	cp ~/.config/nvim/init.vim $(shell pwd)/init.vim
	cp ~/.vimrc $(shell pwd)/.vimrc 
	cp ~/.config/nvim/coc-settings.json coc-settings.json
