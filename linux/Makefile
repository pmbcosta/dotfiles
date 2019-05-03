nvim-setup:
	@echo "Installing pyvim"
	pip3 install --user pynvim
	@echo "Installing Plug"
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo "Creating config folder"
	mkdir -p ~/.config/nvim
	pip3 install --user pynvim
tilix-import:
	dconf load /com/gexperts/Tilix/ < tilix.dconf
tilix-export:
	dconf dump /com/gexperts/Tilix/ > tilix.dconf
spotify-setup: 
	sudo apt-get install ubuntu-restricted-extras
	sudo bash -c "wget https://github.com/ramedeiros/spotify_libraries/raw/master/libavcodec.so.54.71.100 -O /usr/lib/x86_64-linux-gnu/libavcodec.so.54 && wget https://github.com/ramedeiros/spotify_libraries/raw/master/libavformat.so.54.36.100 -O /usr/lib/x86_64-linux-gnu/libavformat.so.54 && wget https://github.com/ramedeiros/spotify_libraries/raw/master/libavutil.so.52.6.100 -O /usr/lib/x86_64-linux-gnu/libavutil.so.52 && ldconfig" 
brew-setup:
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	test -d ~/.linuxbrew && eval $$(~/.linuxbrew/bin/brew shellenv)
	test -d /home/linuxbrew/.linuxbrew && eval $$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
vim-import:
	mkdir -p ~/.config/nvim/
	cp $(shell pwd)/init.vim ~/.config/nvim/init.vim
	cp $(shell pwd)/.vimrc ~/.vimrc
vim-export:
	cp ~/.config/nvim/init.vim $(shell pwd)/init.vim
	cp ~/.vimrc $(shell pwd)/.vimrc 
nvim-import:
	cp $(shell pwd)/init.vim ~/.config/nvim/init.vim
nvim-export:
	cp ~/.config/nvim/init.vim $(shell pwd)/.init.vim 
intellij-export:
	cp ~/.IntelliJIdea2018.3/config/keymaps/Linux.xml $(shell pwd)/Linux.xml
intellij-import:
	mkdir -p ~/.IntelliJIdea2018.3/config/keymaps
	cp $(shell pwd)/Linux.xml ~/.IntelliJIdea2018.3/config/keymaps/Linux.xml
zsh-export:
	cp ~/.zprofile $(shell pwd)/.zprofile
	cp ~/.zshrc $(shell pwd)/.zshrc
zsh-import:
	touch ~/.secrets
	cp $(shell pwd)/.zprofile ~/.zprofile
	cp $(shell pwd)/.zshrc ~/.zshrc
install-essential:
	# gnome-tweak-tool is for mapping CapsLock to Escape
	sudo apt-get update
	sudo apt-get install build-essential xclip gnome-tweak-tool zsh curl wget libssl-dev zlib1g-dev libreadline-dev libbz2-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
		postgresql postgresql-contrib libgmp-dev
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	# Installing Spotify with snap has some problems when running local files so I use the debian package here
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get update
	sudo apt-get install spotify-client
	# GCC comes first
	brew install gcc
	brew install z ag pyenv nvim pyenv-virtualenv awscli rustup cmake wabt
	# Install Haskell Stack
	curl -sSL https://get.haskellstack.org/ | sh
	# Install Nix Package Manager & Haskell IDE Server
	curl https://nixos.org/nix/install | sh
	nix-env -iA cachix -f https://cachix.org/api/v1/install
	cachix use hie-nix
	nix-env -iA hies -f https://github.com/domenkozar/hie-nix/tarball/master
	mkdir ~/.stack
	cp coconfig.yaml ~/.stack/config.yaml
	# Snap is being whiny when installing multiple packages in the same command. Bummer.
	snap install --classic android-studio 
	snap install --classic slack
	snap install --classic intellij-idea-ultimate
	snap install --classic datagrip
	snap install --classic skype
	snap install postman 
	snap install insomnia
	# Tilix VTE setup for Ubuntu
	sudo ln -sf /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
	pip install docker-compose
	# Install GCloud console
	echo "deb http://packages.cloud.google.com/apt cloud-sdk-$(shell lsb_release -c -s) main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
	sudo apt-get update && sudo apt-get install google-cloud-sdk
	gcloud init
	gcloud components install beta
	gcloud components update
	gcloud config set run/region us-east-1
	gcloud auth configure-docker
	gcloud components install docker-credential-gcr
help:
	@echo "------Linux setup commands------"
	@echo ""
	@echo "vim-setup:"
	@echo "  Installs vim dependencies for plugins"
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
	@echo "brew-setup"
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
	@echo ""
	@echo "zsh-export"
	@echo "  copies local .zshrc to dotfiles"
	@echo ""
	@echo "zsh-import"
	@echo "  Applies dotfiles .zshrc to local config"
	@echo ""
	@echo "install-essential"
	@echo "  Install general packages that I use"
