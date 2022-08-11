alias set-local-env='$HOME/src/cube-cli/bin/set-local-env $(git branch --show-current)'
alias cube-log='cat $(ls -1t /tmp/cube-audit*|head -n1)'
alias hist="cat ~/.bash_history{,_*} | sed '\$!N;s/\n/ /' | cut -c2- | sort -n | cut -c12- | uniq"
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
