DEFAULT_USER="peter"
PETER_CONFIG=~/.peterconfig

# Load all the PeterConfig files
for config_file ($PETER_CONFIG/config/*.zsh(N)); do
  source $config_file
done
unset config_file

source $ZSH/oh-my-zsh.sh

# Load all the PeterConfig custom files
for config_file ($PETER_CONFIG/custom/*.zsh(N)); do
  source $config_file
done
unset config_file