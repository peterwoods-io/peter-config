# Powerline config

function rerun_powerline_install() {
	cp $PETER_CONFIG/powerline-shell-customizations/config.py $PETER_CONFIG/submodules/powerline-shell/
	cp $PETER_CONFIG/powerline-shell-customizations/segments/* $PETER_CONFIG/submodules/powerline-shell/segments/
	cp $PETER_CONFIG/powerline-shell-customizations/themes/* $PETER_CONFIG/submodules/powerline-shell/themes/
	(cd $PETER_CONFIG/submodules/powerline-shell/ && $PETER_CONFIG/submodules/powerline-shell/install.py)
	rm $PETER_CONFIG/submodules/powerline-shell/segments/peter*
	rm $PETER_CONFIG/submodules/powerline-shell/themes/peter*
}

alias repi="rerun_powerline_install && rez"

function powerline_precmd() {
	local lasterr=$?

	peterconfig_powerline_script=$PETER_CONFIG/submodules/powerline-shell/powerline-shell.py

	if [ -e $peterconfig_powerline_script ]; then
		PS1="$(${peterconfig_powerline_script} ${lasterr} --shell zsh 2> /dev/null)"
	fi
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