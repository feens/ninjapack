#usage: title short_tab_title looooooooooooooooooooooggggggg_windows_title
#http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#ss3.1
#Fully support screen, iterm, and probably most modern xterm and rxvt
#Limited support for Apple Terminal (Terminal can't set window or tab separately)
function title {
  [ "$DISABLE_AUTO_TITLE" != "true" ] || return
  if [[ "$TERM" == screen* ]]; then
    print -Pn "\ek$1:q\e\\" #"set screen hardstatus, usually truncated at 20 chars
  elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2:q\a" #set window name
    print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
  fi
}

function user_portion {
  if [[ "$USER" == "trevor" ]]
  then
    echo "@"
  elif [[ "$USER" == "root" ]]
  then
    echo "#"
  else
    echo "%n@"
  fi
}

# For prompts
function precmd {
  title "$(user_portion)%m" "$(user_portion)%m:%~"
}

# For commands
function preexec {
  title "$(user_portion)%m > %~"  "$(user_portion)%m:%~ > %~"
}
