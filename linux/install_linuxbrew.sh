sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.zshrc && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.zshrc
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.zprofile
