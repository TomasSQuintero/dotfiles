#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LS_COLORS='di=38;5;110:fi=0:ln=0:pi=0:so=0:do=0:bd=0:cd=0:or=0:mi=0:su=0:sg=0:tw=0:ow=0:st=0:ex=0'
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
PS1='\w > '

# cambiar al dir de musica y abrir un directorio de produndidad 2 con mpv
# --------------------------------------------------------------------------
disco() {
  cd ~/Music || return
  dir=$(find . -mindepth 2 -maxdepth 2 -type d | fzf)
  [ -n "$dir" ] && mpv "$dir"
}

alias neofetch='fastfetch'

# fzf and open 
# --------------------------------------------------------------------------
alias vvim='vim "$(fzf)"'
alias mmpv='mpv "$(fzf)"'

# copy dotfiles to repo directory
# --------------------------------------------------------------------------
dotdirs=(
	~/.bashrc
	~/.config/mpv/
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

# change to hyprland config directory and edit with vim
# --------------------------------------------------------------------------
hypredit() {
  cd ~/.config/hypr && vim "$(fzf)"
}

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
