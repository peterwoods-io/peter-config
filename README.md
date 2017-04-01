# Peter's Terminal and Shell Config
A collection of pieces I use to configure my terminal and shell to make life 
easier when working with the command line.

## Setup Steps
At some point I intend to write a setup-y script to automate bootstrapping everything, 
but for now these steps will get things up and running:

0. Get a decent terminal (such as [iTerm2](https://iterm2.com) on macOS) and a dark theme for it, otherwise the colors will look weird. I prefer [Solarized Dark](https://github.com/altercation/solarized). If you're using iTerm2 you can import the profile I use in `iTerm2-profile.json`.

	* NOTE: You'll have to install a special font to get the full `powerline-shell` fanciness: [Powerline Fonts](https://github.com/powerline/fonts). I'm using [Meslo LG S Regular](https://github.com/powerline/fonts/tree/master/Meslo%20Slashed) currently.

1. Ensure these dependencies are installed (via brew, apt, etc.): `git python zsh`

2. Clone this repo and its submodules into `~/.peterconfig`:

		git clone --recursive https://github.com/futileohm/peter-config.git ~/.peterconfig

3. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh):

		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	Once oh-my-zsh is installed, `zsh` should be the default shell

4. Move or remove the default `.zshrc` installed by oh-my-zsh:

		mv ~/.zshrc ~/.zshrc.oh-my-zsh-default

	OR

		rm ~/.zshrc

5. Copy the Peter Config default `.zshrc`:

		cp ~/.peterconfig/zshrc-dot.zshrc ~/.zshrc

6. Restart `zsh` to get the initial config:

		exec zsh

7. If you want the `powerline-shell` fancy PS1, run `repi` to bootstrap it and set it up properly:

		repi

8. Add any customizations you want during shell init in one of two ways:
	
	a. Modify `~/.zshrc`. This is particularly useful if you want to customize the plugins that `oh-my-zsh` loads as you can specify them before the `oh-my-zsh` init.
	
	b. Add other customizations to `~/.peterconfig/custom/` as `*.zsh` files. These files will be sourced in alphabetical order during shell init, after `oh-my-zsh` initializes. This folder is ignored by git so it won't dirty the repo if you put your own customizations in there. See `~/.peterconfig/config/` for examples of files used to set up the config.


## Useful Links

[Powerline Shell](https://github.com/banga/powerline-shell)  
[Powerline Fonts](https://github.com/powerline/fonts) - Using Meslo currently  
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)  
[What terminal is Felix using](https://github.com/KrauseFx/what-terminal-is-felix-using)  
