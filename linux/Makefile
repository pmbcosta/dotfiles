nvim-setup:
	@echo "Installing pyvim"
	pip3 install --user pynvim
	@echo "Installing Plug"
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo "Creating config folder"
	mkdir -p ~/.config/nvim
vim-setup:
	pip3 install --user pynvim
tillix-import:
	dconf load /com/gexperts/Tilix/ < tilix.dconf
tillix-export:
	dconf dump /com/gexperts/Tilix/ > tilix.dconf
spotify-setup:
	sudo apt install ubuntu-restricted-extras
	sudo bash -c "wget https://github.com/ramedeiros/spotify_libraries/raw/master/libavcodec.so.54.71.100 -O /usr/lib/x86_64-linux-gnu/libavcodec.so.54 && wget https://github.com/ramedeiros/spotify_libraries/raw/master/libavformat.so.54.36.100 -O /usr/lib/x86_64-linux-gnu/libavformat.so.54 && wget https://github.com/ramedeiros/spotify_libraries/raw/master/libavutil.so.52.6.100 -O /usr/lib/x86_64-linux-gnu/libavutil.so.52 && ldconfig"
linuxbrew-setup:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
	test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
	test -r ~/.zshrc && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.zshrc
	echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.zprofile
vim-import:
	cp $(shell pwd)/.vimrc ~/.vimrc
vim-export:
	cp ~/.vimrc $(shell pwd)/.vimrc 
nvim-import:
	cp $(shell pwd)/init.vim ~/.config/nvim/init.vim
nvim-export:
	cp ~/.config/nvim/init.vim $(shell pwd)/.init.vim 
intellij-export:
	cp /home/paulo/.IntelliJIdea2018.3/config/keymaps/Linux.xml .
intellij-import:
	cp $(shell cmd)/Linux.xml /home/paulo/.IntelliJIdea2018.3/config/keymaps/Linux.xml
help:
	@echo "------Linux setup commands------"
	@echo ""
	@echo "vim-setup:"
	@echo "  Installs vim dependencies for plugins"
	@echo ""
	@echo ""
	@echo "nvim-setup:"
	@echo "  Installs nvim dependencies for plugins"
	@echo ""
	@echo "tilix-import"
	@echo "  Import tilix config from tilix.conf"
	@echo ""
	@echo "tilix-export"
	@echo "  Export tilix config to tilix.conf"
	@echo ""
	@echo "spotify-setup"
	@echo "  Enables local files on spotify. Must install from apt-get and not from snap (maybe)"
	@echo ""
	@echo "linuxbrew-setup"
	@echo "  Installs Linuxbrew"
	@echo ""
	@echo "vim-import"
	@echo "  Applies .vimrc to local machine"
	@echo ""
	@echo "vim-export"
	@echo "  Copies local .vimrc to dotfiles"
	@echo ""
	@echo "nvim-import"
	@echo "  Applies init.vim to ~/.config/nvim/init.vim"
	@echo ""
	@echo "nvim-export"
	@echo "  Copies local init.vim to dotfiles"
	@echo ""
	@echo "intellij-export"
	@echo "  copies local keybind to dotfiles"
	@echo ""
	@echo "intellij-import"
	@echo "  Applies Linux.xml to Intellij keymaps"
