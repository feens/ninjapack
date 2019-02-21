export NINJA_HOME=${NINJA_HOME:=$(cd $(dirname $0)/;pwd)}
export NINJA_ZSH="$NINJA_HOME/zsh"

export PATH="$PATH:$NINJA_HOME/bin"

export GIT_MERGE_AUTOEDIT="no"

setopt autocd

autoload -U zed

source $NINJA_ZSH/osx.zsh
# source $NINJA_ZSH/keybindings.zsh
source $NINJA_ZSH/prompt.zsh
source $NINJA_ZSH/termwindow.zsh
source $NINJA_ZSH/history.zsh
source $NINJA_ZSH/completions.zsh
source $NINJA_ZSH/colors.zsh
source $NINJA_ZSH/editor.zsh
source $NINJA_ZSH/git.zsh

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi
