source ~/.paths
source ~/.git-completion.bash
source ~/.aliases
source ~/code/kp/tools/frontend-config/dotfiles/.paths-frontend 2> /dev/null
source ~/.bash_config

ssh-add

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
