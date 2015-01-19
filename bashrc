BASE_PATH=$HOME/dev
PATH="$BASE_PATH/ezzaf/terminal_stuff/shell-scripts:$HOME/.rvm/bin:$HOME/bin:$PATH"
export PATH

# get nice colours
TERM=xterm-color; export TERM
export CLICOLOR=1
export LSCOLORS=DxFxCxDxDxegedabagacad

# OS specific stuff (like editor)
case $(uname -s) in
  Darwin)
    export EDITOR='subl -w'
  ;;
  Linux)
    export EDITOR='gvim -f'
  ;;
esac

# git branch in prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "!!"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1)$(parse_git_dirty)/"
}

function plain_git_branch {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local BLINK_GREEN="\[\033[5;32m\]"
  local NO_COLOUR="\[\033[0m\]"

PS1="$RED\h$GREEN[\t]$RED:\w$GREEN\$(parse_git_branch)\
\n♻  $NO_COLOUR"
PS2='> '
PS4='+ '
}
proml

# git checkout tab auto completion
source ~/.git-completion.sh

# aliases
alias publickey='cat ~/.ssh/id_rsa.pub | pbcopy'
alias gp="git push origin $(plain_git_branch)"
alias gpr='git fetch origin && git rebase -p origin/$(plain_git_branch)'
alias cowboy="git push && bin/cap production deploy"
alias gsta="git status"
alias gcm="git commit -v"
alias mate="subl"
alias l="ls -lah"

p() {
  cd "$BASE_PATH/lexer/$1"
}

pe() {
  cd "$BASE_PATH/ezzaf/$1"
}
