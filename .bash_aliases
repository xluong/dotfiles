# John C. Wright
# johnwright@eecs.berkeley.edu
# Bash Aliases

if [ `uname` == "SunOS" ]; then
  alias ls='gls --color'
  else if [ `uname` != "Darwin" ]; then
    alias ls='ls --color'
    else if [ `uname` == "Darwin" ]; then
      alias ls='ls -G'
    fi
  fi
fi

# common aliases
alias a='alias'
alias l='ls'
alias ll='ls -lh'
alias kk='ll'
alias lla='ls -alh'
alias ltra='ls -ltrAh'
alias ..='cd ..'
alias ...='cd ../..'
alias u1='cd ..'
alias u2='cd ../..'
alias u3='cd ../../..'
alias u4='cd ../../../..'
alias u5='cd ../../../../..'
alias s='source ~/.bashrc'
alias rc='vim ~/.bashrc'
alias vi='vim'
alias c='clear'
alias grep='grep --color'
function title {
    PROMPT_COMMAND="echo -ne \"\033]0;$1\007\""
}

alias grepe='grep --color -E '"'"'^|Error.*'"'"

# git aliases
alias gitdiff='git difftool --tool=vimdiff --no-prompt'

# cd aliases
alias cdlab='cd $LABROOT'
alias mark='pwd > ~/.markpwd'
alias cdm='cd `cat ~/.markpwd`'

# susan specific stuff
alias aquamacs='/Applications/Aquamacs.app/Contents/MacOS/Aquamacs' 
export EDITOR=aquamacs
