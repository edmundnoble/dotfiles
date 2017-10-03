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

# z
. `brew --prefix`/etc/profile.d/z.sh
set -o vi

export VISUAL=nvim
export EDITOR="$VISUAL"
export HOMEBREW_GITHUB_API_TOKEN="0ccbd82580fa68c95b109793974d621d0eae4bc7"
export JDK_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home/"
export PATH="$PATH:/Library/TeX/texbin/"
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig"

if [ -n "$PYTHONPATH" ] ; then export PYTHONPATH="$PYTHONPATH:" ; fi
export PYTHONPATH="${PYTHONPATH}${AUVIK_TOOLS_DIR%/*}"
export PYTHONPATH="$HOME/auvik/auvik_simulator:${PYTHONPATH}"
export PATH="$PATH:$AUVIK_TOOLS_DIR:/Users/edmund/.local/bin"
export GOPATH="/Users/edmund/workspace/go"
export PATH="$PATH:$GOPATH/bin:/opt/chefdk/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.rbenv/bin:$PATH:$HOME/bin:$HOME/.local/bin"
eval "$(rbenv init -)"

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
alias gsh="git show head"
alias push="git push origin head"
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

alias native='cd ./nativeagent'
alias native_clean='./clean'
alias native_dbg='sudo lldb -- ./src/agent/Darwin-x86_64/agent'
alias native_run='sudo ./src/agent/Darwin-x86_64/agent'
alias native_src='cd ./nativeagent/src/agent'
alias native_test='./check'
alias native_test_win='./check_win'
alias sbt_native='./build'
alias sbt_native_win='./build_win'
alias vim="nvim"
alias nvi="nvim ~/.config/nvim/init.vim" 
export ANDROID_HOME="/Users/edmund/Library/Android/sdk"
export SBT_OPTS="-Xmx4G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export VIMRUNTIME=/Applications/MacVim.app/Contents/Resources/vim/runtime
