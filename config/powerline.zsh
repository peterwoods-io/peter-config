# Powerline config

function rerun_powerline_install() {
	cp $PETER_CONFIG/powerline-shell-customizations/segments/* $PETER_CONFIG/submodules/powerline-shell/powerline_shell/segments/
	ln $PETER_CONFIG/powerline-shell.json ~/.powerline-shell.json
	(cd $PETER_CONFIG/submodules/powerline-shell/ && python $PETER_CONFIG/submodules/powerline-shell/setup.py install)
	rm $PETER_CONFIG/submodules/powerline-shell/powerline_shell/segments/peter*
}

alias repi="rerun_powerline_install && rez"

function powerline_precmd() {
	PS1="$(powerline-shell --shell zsh $?)"
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
