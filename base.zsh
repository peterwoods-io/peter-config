# Base bootstrapping functionality for peterconfig

# Source every .zsh file in the directory passed as the first parameter
function peterconfig_source_all() {
	for config_file ($1/*.zsh(N)); do
	  source $config_file
	done
	unset config_file
}