# Alias support for Sublime Merge

if [[ "$OSTYPE" == linux* ]]; then
    local _sublime_linux_paths
    _sublime_linux_paths=(
        "$HOME/bin/sublime_merge"
        "/opt/sublime_merge/sublime_merge"
        "/usr/bin/sublime_merge"
        "/usr/local/bin/sublime_merge"
        "/usr/bin/smerge"
    )
    for _sublime_merge_path in $_sublime_linux_paths; do
        if [[ -a $_sublime_merge_path ]]; then
            sm_run() { $_sublime_merge_path $@ >/dev/null 2>&1 &| }
            sm_run_sudo() {sudo $_sublime_merge_path $@ >/dev/null 2>&1}
            alias ssm=st_run_sudo
            alias sm=st_run
            break
        fi
    done
elif  [[ "$OSTYPE" = darwin* ]]; then
    local _sublime_darwin_paths
    _sublime_darwin_paths=(
        "/usr/local/bin/smerge"
        "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge"
        "$HOME/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge"
    )
    for _sublime_merge_path in $_sublime_darwin_paths; do
        if [[ -a $_sublime_merge_path ]]; then
            smerge () { "$_sublime_merge_path" $* }
            alias sm=smerge
            break
        fi
    done
elif [[ "$OSTYPE" = 'cygwin' ]]; then
    local sublime_cygwin_paths
    sublime_cygwin_paths=(
        "$(cygpath $ProgramW6432/Sublime\ Merge)/sublime_merge.exe"
    )
    for _sublime_merge_path in $_sublime_cygwin_paths; do
        if [[ -a $_sublime_merge_path ]]; then
            smerge () { "$_sublime_merge_path" $* }
            alias sm=smerge
            break
        fi
    done
fi
