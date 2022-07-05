parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[34;1m\]\u@\h\[\033[0m\] \[\033[32m\]\w\[\033[0m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n$ "
