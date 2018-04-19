source ~/.paths
source ~/.git-completion.bash
source ~/.aliases
source ~/code/kp/tools/frontend-config/dotfiles/.paths-frontend 2> /dev/null
source ~/.bash_config
source ~/.profile

eval "$(rbenv init -)"

ssh-add

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/usr/local/sbin:$PATH"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
