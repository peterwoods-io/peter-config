# Powerline config
#alias repi="(cd $PETER_CONFIG/submodules/powerline-shell/ && $PETER_CONFIG/submodules/powerline-shell/install.py) && rez"

function rerun_powerline_install() {
	
}

function powerline_precmd() {
    PS1="$(~/.peterconfig/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi