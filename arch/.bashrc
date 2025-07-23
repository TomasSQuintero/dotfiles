#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\w > '

alias apps='rofi -show drun'
alias edit='vim ~/.config/hypr/hyprland.conf'
alias neofetch='fastfetch'
alias vvim='vim "$(fzf)"'
alias editkitty='vim ~/.config/kitty/kitty.conf'
alias dot='cp -r ~/.config/mpv/ ~/.config/kitty/ ~/.config/hypr/ ~/.config/fastfetch/ ~/.bashrc	~/.config/rofi ~/dotfiles/arch/'
alias mounthdd='sudo mount /dev/sda2 /mnt/hdd'
