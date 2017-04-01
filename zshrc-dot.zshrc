PETER_CONFIG=~/.peterconfig
source $PETER_CONFIG/base.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='st'
fi

# Load all the peterconfig files
peterconfig_source_all $PETER_CONFIG/config

# NOTE: Override default peterconfig oh-my-zsh plugins below

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git bundler osx rake ruby sublime brew)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load all the peterconfig custom files
peterconfig_source_all $PETER_CONFIG/custom