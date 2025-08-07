#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LS_COLORS='di=38;5;110:fi=0:ln=0:pi=0:so=0:do=0:bd=0:cd=0:or=0:mi=0:su=0:sg=0:tw=0:ow=0:st=0:ex=0'
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
PS1='\w > '

# abrir un directorio de profundidad 2 con mpv
# --------------------------------------------------------------------------
disco() {
  #cd ~/Music || return
  dir=$(find . -mindepth 2 -maxdepth 2 -type d | fzf)
  [ -n "$dir" ] && mpv "$dir"
}

headlessdisco() {
  dir=$(find . -mindepth 2 -maxdepth 2 -type d | fzf)
  [ -n "$dir" ] && mpv --audio-display=no "$dir"
}

serie() {
  dir=$(find . -mindepth 1 -maxdepth 2 -type d | fzf)
  [ -n "$dir" ] && mpv "$dir"
}

# rename fastfetch
# --------------------------------------------------------------------------
alias neofetch='fastfetch'

# fzf
# --------------------------------------------------------------------------
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS='-m --style full --bind 'ctrl-space:accept''
alias ffzf='fzf -m --preview "bat --style=numbers --color=always {}" --layout reverse'
alias nv='nvim "$(fzf -m --preview "bat --style=numbers --color=always {} | head -n 100" --layout reverse)"'
alias vvim='vim "$(fzf)"'
alias mmpv='mpv "$(fzf --query ".mp4$ | .mkv$ " --layout reverse)"'
alias headlessmmpv='mpv --audio-display=no "$(fzf)"'
alias rmm='rm -rf "$(fzf -m)'

# copy dotfiles to repo directory
# --------------------------------------------------------------------------
dotdirs=(
	~/.bashrc
	~/.vimrc
	~/.config/mpv/
	~/.config/bat/
	~/.config/nvim/
	~/.config/kitty/
	~/.config/hypr/
	~/.config/waybar/
	~/.config/fastfetch/
	~/.config/rofi
	~/.config/gtk-3.0/
	~/.config/gtk-4.0/
	)

dots() {
  for dir in "${dotdirs[@]}"; do
    cp -r "$dir" ~/dotfiles/arch/
  done
}

# hdd
# --------------------------------------------------------------------------
alias mounthdd='sudo mount -t ntfs-3g /dev/sda2 /mnt/hdd/; cd /mnt/hdd'
alias hdd='cd /mnt/hdd'

# ssh
# --------------------------------------------------------------------------
alias conectarssh='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/id_ed25519'

# edit with vim
# --------------------------------------------------------------------------
hypredit() {
  cd ~/.config/hypr && vim "$(fzf)"
}

alias bedit='nvim ~/.bashrc'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# git add, commit, push. takes input for commit message
# --------------------------------------------------------------------------
gacp() {
  if [ -z "$1" ]; then
    echo "❌ Commit message required."
    echo "Usage: gacp \"your commit message\""
    return 1
  fi

  git add .
  git commit -m "$1"
  git push
}

# clipboard
# --------------------------------------------------------------------------
alias clip='wl-copy'

# misc
# --------------------------------------------------------------------------
# direcories size
alias dirsize='du -h --max-depth=1 | sort -h'
# restart hyprpaper
alias restarthyprpaper='nohup hyprpaper > /dev/null 2>&1 &'
# te tira la edad de la install, requiere cambiar manual la fecha
alias age="echo \$(( ( \$(date +%s) - \$(date -d '2025-07-21' +%s) ) / 86400 )) days"

