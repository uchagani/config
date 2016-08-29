export GITAWAREPROMPT=~/.bash/git-aware-prompt
export PATH=/usr/local/bin:$PATH
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export AWS_DEFAULT_REGION=us-east-1

complete -C aws_completer aws

source "${GITAWAREPROMPT}/main.sh"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

PS1="\[$txtwht\]\w\[$txtcyn\]\$git_branch\$git_dirty\[$txtwht\]: \[$(tput sgr0)\]"

alias ls="ls -GpFh"
alias be='bundle exec '
alias dc='docker-compose'
alias dm='docker-machine'
alias remove-docker-containers='docker rm -f $(docker ps -a -q)'
alias remove-docker-images='docker rmi -f $(docker images -q)'
alias ssh-sonar-api-app='docker exec -it sonarapi_app_1 /bin/bash'
alias ssh-sonar-jenkins='ssh -i sonar-engine-key.pem ubuntu@54.172.26.160'
alias lps='lpass show -c --password'
alias cc='pbcopy </dev/null'

source ~/.profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

update-docker-host(){
  # clear existing development.local entry from /etc/hosts
  sudo sed -i '' '/[[:space:]]development\.local$/d' /etc/hosts

  # get ip of running machine
  export DOCKER_IP=`docker-machine ip default`

  # update /etc/hosts with docker machine ip
  [[ -n $DOCKER_IP ]] && sudo /bin/bash -c "echo \"${DOCKER_IP} development.local\" >> /etc/hosts"
}

dminit() {
  bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'
}

dm-vpn-init(){
  export DOCKER_TLS_VERIFY="1"
  export DOCKER_HOST="tcp://localhost:2376"
  export DOCKER_MACHINE_NAME="default"
  export DOCKER_CERT_PATH="${HOME}/.docker/machine/machines/${DOCKER_MACHINE_NAME}"
}

function repeat() {
    number=$1
    shift
    for n in $(seq $number); do
      $@
    done
}
