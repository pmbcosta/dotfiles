REASON_LSP_VERSION=1.7.8
vim-import:
	mkdir -p ~/.config/nvim/
	cp $(shell pwd)/init.vim ~/.config/nvim/init.vim
	cp $(shell pwd)/.vimrc ~/.vimrc
	cp $(shell pwd)/.ideavimrc ~/.ideavimrc
	cp coc-settings.json ~/.config/nvim/coc-settings.json 
vim-export:
	cp ~/.config/nvim/init.vim $(shell pwd)/init.vim
	cp ~/.vimrc $(shell pwd)/.vimrc 
	cp ~/.ideavimrc $(shell pwd)/.ideavimrc
	cp ~/.config/nvim/coc-settings.json coc-settings.json
elm-setup:
	npm install -g elm elm-test elm-format create-elm-app @elm-tooling/elm-language-server
reason-setup:
	npm install -g bs-platform
	npm install -g esy
	wget https://github.com/jaredly/reason-language-server/releases/download/${REASON_LSP_VERSION}/rls-macos.zip -O out.zip
	unzip out.zip
	mv rls-macos/reason-language-server /usr/local/bin
	rm out.zip
	rm -r rls-macos
go-setup:
	brew install go
	GO111MODULE=on go get golang.org/x/tools/gopls@latest
haskell-setup:
	# Stack
	brew install stack
	# Building haskell-ide-engine from source cause nix is broken on macos
	rm -rf haskell-ide-engine
	git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules
	cd haskell-ide-engine && stack ./install.hs hie hie-8.6.5
	rm -rf haskell-ide-engine
	# Install packages for editors
	stack install hlint
	stack install apply-refact
	stack install hindent
	stack install --resolver=nightly stylish-haskell
	stack install hasktags
	stack install hoogle
	# stack install ghc-mod
	stack install intero
spacemacs-setup:
	# Installing emacs
	brew tap d12frosted/emacs-plus
	brew install emacs-plus
	# brew linkapps emacs-plus
	# brew tap railwaycat/emacsmacport
	# brew cask install emacs-mac-spacemacs-icon
	# Install spacemacs
	rm -rf ~/.emacs.d
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	# Install default fonts
	rm -f out.zip
	rm -rf out
	wget https://github.com/adobe-fonts/source-code-pro/releases/download/2.030R-ro%2F1.050R-it/source-code-pro-2.030R-ro-1.050R-it.zip -O out.zip
	unzip out.zip -d out
	cp out/source-code-pro-2.030R-ro-1.050R-it/TTF/*.ttf /Library/Fonts/
	rm -rf out
	rm out.zip
	@echo DONE
rust-setup:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	rustup toolchain add nightly
	cargo +nightly install racer
python-setup:
	pip3 install virtualenv
	mkdir -p ~/venv/vim
	virtualenv -p $(shell which python3) ~/venv/vim
	source ~/venv/vim/bin/activate && pip install pyvim neovim
