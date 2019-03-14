. /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh
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

source ~/.secrets

# Vim as default editor
export EDITOR='vim'

# Setting zsrch vim mode
set -o vi

# Yesod
export YESOD=/Users/paulocosta/Library/Haskell/bin

# Java & Android config
export JAVA8_HOME=$HOME/Programs/java8
export JAVA_HOME=$JAVA8_HOME
export ANDROID_HOME=$HOME/Android/Sdk

export DEX_2_JAR_HOME=/usr/local/Cellar/dex2jar/2.0
export APKTOOL_HOME=/usr/local/Cellar/apktool/2.0.1

# Golang config
export GOPATH=/Users/paulocosta/Projects/Learning/learning/golang

# Anaconda
export ANACONDA=/Users/paulocosta/anaconda2/bin

# Setting path variables
export PATH=$PATH:$DEX_2_JAR_HOME/bin
export PATH=$PATH:$APKTOOL_HOME/bin
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/ndk-bundle
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/ejabberd/sbin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/Users/paulocosta/Projects/Freela/chat-env/cli
export PATH=$PATH:$ANACONDA
# Julia
export PATH=$PATH:/Applications/Julia-0.4.6.app/Contents/Resources/julia/bin

# Docker Machine Virtualbox config

export VIRTUALBOX_DISK_SIZE=50000
export VIRTUALBOX_MEMORY_SIZE="4096"

export NVM_DIR="/Users/paulo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GCLOUD_PROJECT=nifty-time-131012

function dbash() {
  docker exec -it $1 /bin/bash
}

function dmip() {
  docker-machine ip $1 | pbcopy
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

function clear_images() {
  docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
}

function dmaws() {
  docker-machine create --driver amazonec2 \
    --amazonec2-region "us-east-1" \
    --amazonec2-instance-type $DOCKER_MACHINE_INSTANCE \
    --amazonec2-access-key $AWS_ACCESS_KEY_ID \
    --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
    --amazonec2-security-group $DOCKER_MACHINE_SG \
    --amazonec2-zone "b" \
    --amazonec2-vpc-id $DOCKER_MACHINE_VPC_ID $1
}

function restart_adb() {
  adb kill-server
  adb start-server
}

function emake() {
    elm make $1 --output elm.html
}

function docker_debug() {
  docker run --rm -it $1 bash -il
}

function gcloud_build() {
  docker build -t gcr.io/$GCLOUD_PROJECT/$1:$2 .
}

function gcloud_push() {
  gcloud docker push gcr.io/$GCLOUD_PROJECT/$1:$2
}

function gcloud_pbcopy() {
  echo "gcr.io/$GCLOUD_PROJECT/$1:$2" | pbcopy
}

function ecr_pbcopy() {
  echo "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$1:$2" | pbcopy
}

function kbash() {
  kubectl exec -it $1 -c $2 /bin/bash
}

function kawsbash() {
  kubectl --kubeconfig="$AWS_KUBE_CONFIG" exec -it $1 -c $2 /bin/bash
}

function ecr_build() {
  docker build -t $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$1:$2 .
}

function ecr_push() {
  docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$1:$2
}

function kzsh() {
  kubectl exec -it $1 -c $2 /bin/zsh
}

function ecr_login() {
  echo 'logging on ecr'
  aws ecr get-login | sh -
}

function kpo {
  kubectl get pods -o wide
}

function kdp() {
  kubectl get deployments
}

function ksrv {
  kubectl get services
}

function java_new_gradle {
  gradle init --type java-library
}

function java_new_maven {
    mvn -B archetype:generate \
        -DarchetypeGroupId=org.apache.maven.archetypes \
        -DgroupId=com.mycompany.app \
        -DartifactId=my-app
}

function ecr_k8s_update_login() {
cat > /tmp/image-pull-secret.yaml << EOF
apiVersion: v1
kind: Secret
metadata:
  name: myregistrykey
data:
  .dockerconfigjson: $(echo -n $(cat ~/.docker/config.json | base64 | sed ':a;N;$!ba;s/\n/ /g'))
type: kubernetes.io/dockerconfigjson
EOF
}

function ideadiff() {
  /Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea diff $1 $2
}

alias chrome_unsecure="/opt/homebrew-cask/Caskroom/google-chrome/latest/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security --user-data-dir=/tmp/chrome_dev_sesion1 "
alias d='docker'
alias dm='docker-machine'
alias dc='docker-compose'
alias c='docker container'
alias em='elm-make'
alias ruby='/usr/local/Cellar/ruby/2.2.3/bin/ruby'
alias v="vagrant"
alias ecs="ecs-cli"
alias k="kubectl"
alias kaws="kubectl --kubeconfig="$AWS_KUBE_CONFIG""
alias ds='while true; do TEXT=$(docker stats --no-stream $(docker ps --format={{.Names}})); sleep 0.1; clear; echo "$TEXT"; done'
alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'
alias dbx='dbxcli'
alias sa='source activate dev-env'
alias evim='vim ~/.config/nvim/init.vim'
alias lvim='cd $(fasd -d -l -R learning | head -1) && source activate dev-env && vim' 
alias fu='adb uninstall paulocosta.io.feedbinclient'
alias idea='/snap/intellij-idea-ultimate/current/bin/idea.sh'
alias vim='nvim'

export PROJECT_HOME=/Users/paulocosta/Projects/Learning/learning/python/flask

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# The next line updates PATH for the Google Cloud SDK.
# source '/Users/paulocosta/Programs/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
export PATH="/usr/local/sbin:$PATH"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
export PATH=$PATH:/home/paulo/Programs/flutter/bin

# export PATH=$PATH:$HOME/Programs/node/bin
export PATH=~/.npm-global/bin:$PATH

# Pyenv setup
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
