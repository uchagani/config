export GITAWAREPROMPT=~/.bash/git-aware-prompt
export PATH=/usr/local/bin:$PATH
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
source "${GITAWAREPROMPT}/main.sh"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

PS1="\[$txtwht\]\w\[$txtcyn\]\$git_branch\$git_dirty\[$txtwht\]: \[$(tput sgr0)\]"

alias bd='boot2docker'
alias dc='docker-compose'
alias bdinit='eval "$(boot2docker shellinit)"'
alias ls="ls -GpFh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.profile
