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
	# Install HLint
	stack install hlint
	# Install apply-refact
	stack install apply-refact
	# Hident
	stack install hindent
	# Stylish
	# stack install stylish-haskell
