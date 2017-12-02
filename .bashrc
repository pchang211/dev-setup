[ -f ~/.fzf.bash ] && source ~/.fzf.bash

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.st status
PS1='\[\e[36;1m\]\u@\h: \[\e[31m\]\W\[\e[36m\]$(__git_ps1)\[\e[0m\]> '
export GREP_OPTIONS='--color=auto'
alias ls="ls -G"
alias sl="ls"

function new_tmux {
	tmux new -s $1
}

function a_tmux {
	tmux attach-session -t $1
}

