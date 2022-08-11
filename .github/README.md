_NOTE: This README lives in `.github` as to not clutter `$HOME`_

This repo keeps all my dotfiles.  Here's the gist of what's going on

```sh
git init --bare ~/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config status.showUntrackedFiles no
# assuming `source /usr/share/bash-completion/completions/git`
__git_complete config __git_main
```

Then use `dotgit` just like `git` to specifically manage dotfiles.
