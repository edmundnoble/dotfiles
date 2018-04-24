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

export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

# Customize to your needs...
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
alias revert="git revert"
alias gac="git add . && git commit"
alias gf="git fetch"
alias gfo="git fetch origin"
alias vim="nvim"
alias nvi="nvim ~/.config/nvim/init.vim" 
export SBT_OPTS="-Xmx8G -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M"
