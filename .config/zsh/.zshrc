# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# color
alias diff="diff --color"
alias grep="grep --color"
alias l="ls -ahl --color"
alias la="ls -ah --color"
alias ll="ls -hl --color"
alias ls="ls --color"
alias y="yazi"

# confirm before overwriting something
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

# programs
alias v="nvim"

# git
alias d='/usr/bin/git --git-dir=/home/tony/docs/github/dotfiles/ --work-tree=/home/tony'
alias ds='/usr/bin/git --git-dir=/home/tony/docs/github/dotfiles/ --work-tree=/home/tony status'
alias gs="git status"
alias gaa="git add ."

source "$XDG_DATA_HOME/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

#yazi setup
function lf() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# update package lists whenever yay installs, updates, or removes packages
function yay() {
	command yay "$@"
	local ret=$?
	if [ $ret -eq 0 ]; then
		case "$1" in
			-Q*|-S[si]*|-F*|-G*|--help|-h)
				;;
			*)
				pacman -Qenq > "$HOME/.config/packages/pkglist.txt"
				pacman -Qemq > "$HOME/.config/packages/aurlist.txt"
				;;
		esac
	fi
	return $ret
}

