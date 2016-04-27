. /usr/local/etc/profile.d/z.sh
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mh" 
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

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
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home
export JAVA_HOME=$JAVA8_HOME
export ANDROID_HOME=$HOME/Android

export DEX_2_JAR_HOME=/usr/local/Cellar/dex2jar/2.0
export APKTOOL_HOME=/usr/local/Cellar/apktool/2.0.1

# Golang config
export GOPATH=/Users/paulocosta/Projects/Learning/learning/go

# Setting path variables
export PATH=$PATH:$DEX_2_JAR_HOME/bin
export PATH=$PATH:$APKTOOL_HOME/bin
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/ndk-bundle
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/ejabberd/sbin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/Users/paulocosta/Projects/Freela/chat-env/cli

# Docker Machine Virtualbox config

export VIRTUALBOX_DISK_SIZE=80000
export VIRTUALBOX_MEMORY_SIZE="4096"

export EJABBERD_HOST=192.168.25.26

export NVM_DIR="/Users/paulo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GO15VENDOREXPERIMENT=1

# Helper functions

function dbash() {
  docker exec -it $1 /bin/bash
}

function dzsh() {
  docker exec -it $1 /bin/zsh
}

function dtail() {
  docker logs -f -t=true --tail=300 $1
}

function dmev() {
  eval $(docker-machine env $1)
}

function clear_containers() {
  docker rm `docker ps --no-trunc -aq`
}

function gmclone() {
  git clone git@github.com:greenmilellc-org/$1.git
}

function gmu() {
  adb uninstall com.greenmile.android
}

function gmdb() {
  adb pull data/data/com.greenmile.android/databases/greenmile.db ~/greenmile.db
  sqlite3 ~/greenmile.db
}

function gmdb2() {
  adb shell am broadcast -a com.greenmile.android.COPY_DATABASE
  adb pull /sdcard/database/greenmile.db ~/greenmile.db
  sqlite3 ~/greenmile.db
}

function dmaws() {
  echo 'creating machine with name $1'
  docker-machine -D create \
    --driver amazonec2 \
    --amazonec2-access-key $AWS_ACCESS_KEY_ID \
    --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
    --amazonec2-vpc-id $AWS_VPC_ID \
    --amazonec2-zone b \
    $1
}

function restart_adb() {
  adb kill-server
  adb start-server
}

function emake() {
    elm make $1 --output elm.html
}

alias chrome_unsecure="/opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=/tmp/chrome_dev_sesion1 --disable-web-security"

alias d='docker'
alias dm='docker-machine'
alias dc='docker-compose'
alias em='elm-make'
alias ruby='/usr/local/Cellar/ruby/2.2.3/bin/ruby'
alias v="vagrant"
alias ecs="ecs-cli"

source ~/.secrets
source /usr/local/bin/virtualenvwrapper.sh
export PROJECT_HOME=/Users/paulocosta/Projects/Learning/learning/python/flask

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
