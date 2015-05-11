source ~/.paths
source ~/.bash_config
source ~/.aliases
source ~/.git-completion.bash

source ~/code/kp/tools/frontend-config/dotfiles/.paths-frontend 2> /dev/null

ssh-add

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
