alias set-local-env='$HOME/src/cube-cli/bin/set-local-env'
alias cube-log='cat $(ls -1t /tmp/cube-audit*|head -n1)'
alias hist="tail -qn1000 ~/.bash_history{,_*} | sed '\$!N;s/\n/ /' | cut -c2- | sort -n | cut -c12- | uniq"
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
