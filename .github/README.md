_NOTE: This README lives in `.github` as to not clutter `$HOME`_

This repo keeps all my dotfiles.  Here's the gist of what's going on

## Make a new dotfiles repo

_NOTE skip this if you already have a dotfiles repo_

```sh
git init --bare ~/.dotfiles
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# source /usr/share/bash-completion/completions/git
# __git_complete config __git_main
```

Then use `dotgit` just like `git` to specifically manage dotfiles, e.g., you'll
likely want to push this to GitHub.

```
dotgit remote add git@github.com:<your_username>/dotfiles
dotgit push -u origin main
```

## Get Your Dotfile On another system

use `clone` inplace of `init` to bring your existing dotfiles
down.

_NOTE: The `-f` will smash local files that exist in you dotfiles repo_

```
git clone --bare git@github.com:<your_username>/dotfiles ~/.dotfiles
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotgit checkout -f
```

