alias l='ls -la'
alias ll='ls -l'
alias ..='cd ..'
alias md='mkdir -p'
alias grep='grep --color'
alias ]='jobs'
alias t='tail -f /var/log/apache2/error.log'
alias d='dpkg -i'
PS1='\[\e[1;34m\]\u\[\e[0m\]@\[\e[1;31m\]\h:\[\e[1;32m\]\w\[\e[1;34m\]\njobs:\j\[\e[0m\]\$ '
alias dpan='aptitude search perl | grep -i'
alias ipan='aptitude install'
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export http_proxy=
source scripts/acd_func.sh
