
##
# Your previous /Users/schmiddi/.bash_profile file was backed up as /Users/schmiddi/.bash_profile.macports-saved_2011-01-19_at_09:50:02
##

# MacPorts Installer addition on 2011-01-19_at_09:50:02: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# export CC=/usr/bin/gcc-4.2
# Finished adapting your PATH environment variable for use with MacPorts.

alias kpwp='ssh ssh-216511-admin@content.kaeuferportal.de'
alias be='bundle exec'
alias flushdns='dscacheutil -flushcache'
alias composer="php54 /usr/bin/composer.phar"
alias vim="mvim"
ssh-add

export EDITOR="/usr/bin/vi"
export PATH=$PATH:/Users/schmiddi/.gem/ruby/1.8/bin:~/bin:./i:./vendor/bin
export PATH=$PATH:.

unset MAILCHECK
PS1="\[\033[1;31m\]\h \[\033[1;34m\]\W\[\033[0m\]\[\033[1;34m\] #\[\033[0m\] "

QTDIR=/opt/local/lib/qt3;
export QTDIR
export PATH=/usr/local/Cellar/php/5.3.10/bin:$PATH

##
# Your previous /Users/schmiddi/.bash_profile file was backed up as /Users/schmiddi/.bash_profile.macports-saved_2012-02-13_at_22:25:55
##

# MacPorts Installer addition on 2012-02-13_at_22:25:55: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# [[ $- == *i* ]]   &&   . /Users/schmiddi/Documents/git-prompt/git-prompt.sh

export GIT_MERGE_AUTOEDIT=no
source ~/.git-completion.bash

HISTFILESIZE=10000
export HISTCONTROL=ignoredups:ignorespace

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
