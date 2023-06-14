alias rm='rm -r'
alias .='cd $DOTFILES'
alias .v='cd $DOTFILES && vim .'
alias ls='ls --color'
alias l='ls -lah'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias tailf='tailf -f'

zinit ice atload"cwd"
zinit light pjvds/zsh-cwd

zinit ice silent wait"1"
zinit light pjvds/zsh-cd-print

cf() {
	selection=$(fzf)
	if [ $? -eq 0 ]; then
		cd $(dirname "$selection")
	fi
}

# source .env file
senv() {
	local file=$([ -z "$1" ] && echo ".env" || echo "$1.env")
	if [ ! -f "$file" ]
	then
		error "$file file not found" 1>&2
		return 1
	fi

	local temp=$(mktemp -d)
	local before="$temp/before"
	local after="$temp/after"

	#trap "rm \"$temp\"" INT TERM
	export > $before

	set -a
	source "$file"
	set +a

	export > $after

	sdiff "$before" "$after"
}

# copy full path of given file
function cpath() {
	local path=${PWD}

	if type xclip > /dev/null; then
		echo -n "$path" | xclip -selection clipboard
	else
		echo -n "$path" | pbcopy
	fi

	info "copied $path to clipboard"
}

bindkey -s '^y' "cpath"

# copy full path of current dir
function cdir {
	local path=$(pwd)

	if type xclip > /dev/null; then
		echo -n $path | xclip -selection clipboard
	else
		echo -n $path | pbcopy
	fi

	info "copied $path to clipboard"
}

bindkey -s 'yp' 'cpath'
