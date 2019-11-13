#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

set -o vi

export VISUAL=nvim
export EDITOR="$VISUAL"
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig"

export TERM='xterm-256color'

#export LD_LIBRARY_PATH="/nix/store/qfvf8qzyjkalv0zrh3y0xkl8136ysmgp-system-path/lib/"

export PATH="$HOME/.cabal/bin:$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.conscript/bin:$HOME/.npm-packages/bin"

# Customize to your needs...
alias g="git"
alias gw="git worktree"
alias pushu="git push upstream HEAD"
alias v="nvim"
alias zed="vim ~/.zshrc"
alias nsh="nix-shell --command zsh"
alias nre="sudo nixos-rebuild switch"
alias ned="sudo nvim /etc/nixos/configuration.nix"
alias gc="git commit"
alias gca="git commit --amend"
alias gco="git checkout"
alias gb="git branch"
alias gs="git status"
alias gsa="git stash apply"
alias gr="git rebase"
alias grc="git rebase --continue"
alias grm="git rebase master"
alias gd="git diff"
alias gdm="git diff master"
alias gdh="git diff HEAD"
alias gds="git diff --stat"
alias ga="git add"
alias gl="git log"
alias gsh="git show HEAD"
alias push="git push origin HEAD"
alias pull="git pull"
alias rst="git reset"
alias back="git reset --hard HEAD~"
alias grhh="git reset --hard HEAD"
alias gfum="git fetch upstream master"
alias gfu="git fetch upstream"
alias gmum="git merge upstream/master"
alias clean="git clean -i"
alias cl="git clone"
alias gm="git merge"
alias gmm="git merge master"
alias gcp="git cherry-pick"
alias gcpc="git cherry-pick --continue"
alias revert="git revert"
alias gac="git add . && git commit"
alias gf="git fetch"
alias gfo="git fetch origin"
alias vim="nvim"
alias nvi="nvim ~/.config/nvim/init.vim"
alias cb="cabal v2-build -O0"
alias cr="cabal v2-repl"
alias ct="cabal v2-run -O0 test:tests"
alias c="cabal"
export SBT_OPTS="-Xmx8G -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M"

# added by travis gem
[ -f /home/nope/.travis/travis.sh ] && source /home/nope/.travis/travis.sh
