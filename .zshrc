. /usr/local/etc/profile.d/z.sh
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="nebirhos"
ZSH_THEME="mh"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew mvn npm node web-search docker gradle)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

 #Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
 else
  export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Vim as default editor
export EDITOR='vim'

# Setting zsrch vim mode
set -o vi

# Yesod
export YESOD=/Users/paulocosta/Library/Haskell/bin

# Java & Android config
export JAVA7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
export JAVA_HOME=$JAVA7_HOME
export ANDROID_HOME=$HOME/library/Android/sdk

export DEX_2_JAR_HOME=/usr/local/Cellar/dex2jar/2.0
export APKTOOL_HOME=/usr/local/Cellar/apktool/2.0.1

# Golang config
export GOPATH=$HOME/Projects/learning/go

# Setting path variables
export PATH=$PATH:$DEX_2_JAR_HOME/bin
export PATH=$PATH:$APKTOOL_HOME/bin
export PATH=$PATH:$HOME/.rvm/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:$GOPATH
export PATH=$PATH:/usr/local/opt/ejabberd/sbin

export NVM_DIR="/Users/paulo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GO15VENDOREXPERIMENT=1

# Helper functions

function dssh() {
  docker exec -it $1 /bin/bash
}

function dmev() {
  eval $(docker-machine env $1)
}

function clear_containers() {
  docker rm `docker ps --no-trunc -aq`
}

alias d='docker'
alias dm='docker-machine'
alias dc='docker-compose'
