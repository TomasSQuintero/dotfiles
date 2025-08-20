# Set colors: folders cyan, files white
# export LS_COLORS='di=36:fi=0:ln=0:pi=0:so=0:do=0:bd=0:cd=0:or=0:mi=0:su=0:sg=0:tw=0:ow=0:st=0:ex=0'
export LS_COLORS='di=96:fi=97'
alias ls='ls --color=auto'
#PROMPT='tom@mac %~ %# '
PROMPT='%~ > '

alias dl='yt-dlp -f "bv*+ba/b" --merge-output-format mp4 -P ~/Downloads'

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

alias zedit='nvim ~/.zshrc'
alias n='nvim'

# fzf
# ------------------------------------
source <(fzf --zsh)

eval "$(zoxide init --cmd cd zsh)"

# copy dotfiles
# ------------------------------------
dots() {
    rm -rf ~/dotfiles/mac/
    mkdir ~/dotfiles/mac/
    
    cp  ~/.zshrc ~/dotfiles/mac/
    cp -r ~/.config/mpv ~/dotfiles/mac/
    cp -r ~/.config/nvim ~/dotfiles/mac/
    cp -r ~/.config/kitty ~/dotfiles/mac/
    cp -r ~/.config/yazi ~/dotfiles/mac/
    cp -r ~/.config/zathura ~/dotfiles/mac/
}

# yazi
# ------------------------------------
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


