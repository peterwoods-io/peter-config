alias zshrc="$EDITOR ~/.zshrc"
alias rez="exec zsh"

sourcetree_path=/Applications/SourceTree.app
if [ -e $sourcetree_path ]; then
	alias sourcetree="open -a $sourcetree_path"
fi
unset sourcetree_path

postgres_path=/usr/local/var/postgres
if [ -e $postgres_path ]; then
	alias start_psql='pg_ctl -D $postgres_path start'
fi