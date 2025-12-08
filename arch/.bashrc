#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LS_COLORS='di=36:fi=0:ln=0:pi=0:so=0:do=0:bd=0:cd=0:or=0:mi=0:su=0:sg=0:tw=0:ow=0:st=0:ex=0'
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
PS1='\w > '

# scripts
# --------------------------------------------------------------------------
alias changewall='sh ~/.config/scripts/change-wallpaper.sh'
alias peli='sh ~/.config/scripts/movie.sh'
alias show='sh ~/.config/scripts/show.sh'
alias episode='sh ~/.config/scripts/episode.sh'

# copy dotfiles to repo directory
# --------------------------------------------------------------------------
dotdirs=(
    ~/.bashrc
    ~/.inputrc
    # ~/.vimrc
    ~/.config/mpv/
    # ~/.config/bat/
    ~/.config/nvim/
    ~/.config/kitty/
    ~/.config/yazi/
    ~/.config/zathura/
    ~/.config/hypr/
    ~/.config/waybar/
    ~/.config/fastfetch/
    ~/.config/rofi
    ~/.config/gtk-3.0/
    ~/.config/gtk-4.0/
    ~/.config/scripts/
)

dots() {
    local target=~/dotfiles/arch/

    # Remove old directory safely
    if [ -d "$target" ]; then
        rm -rf "$target"
    fi

    # Recreate target directory
    mkdir -p "$target"

    # Copy each dotdir
    for dir in "${dotdirs[@]}"; do
        if [ -e "$dir" ]; then
            cp -r "$dir" "$target"
        else
            echo "Warning: '$dir' does not exist or is not a directory"
        fi
    done
}

# rename apps
# --------------------------------------------------------------------------
alias neofetch='fastfetch'
alias cmatrix='unimatrix -s 90 -f -a -l nk'
alias fastfetchimage='fastfetch --logo-type kitty-icat --logo "$(find ~/.config/fastfetch/ -type f | fzf)" --logo-width 23 --logo-height 13'
alias bedit='nvim ~/.bashrc'
alias n='nvim'

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

syncnotes() {
    git add .
    git commit -m "$(date '+%Y-%m-%d %H:%M:%S')"
    git push
}

# fzf
# --------------------------------------------------------------------------
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS='-m --style full --bind 'ctrl-space:accept''
bind -r '"\C-t"'

alias ffzf='fzf -m --preview "bat --style=numbers --color=always {}" --layout reverse'
alias nv='nvim "$(fzf -m --preview "bat --style=numbers --color=always {} | head -n 100" --layout reverse)"'
alias mmpv='mpv "$(fzf --query ".mp4$ | .mkv$ " --layout reverse)"'
alias headlessmmpv='mpv --audio-display=no "$(fzf)"'

# hdd
# --------------------------------------------------------------------------
alias mounthdd='sudo mount -t ntfs-3g /dev/sda2 /mnt/hdd/; cd /mnt/hdd'
alias hdd='cd /mnt/hdd'
alias mountssd='sudo mount /dev/sdb2 /mnt/ssd/; cd /mnt/ssd'
alias ssd='cd /mnt/ssd'

alias mountssdstorage='sudo mount /dev/sdb4 /mnt/ssd-storage; cd /mnt/ssd-storage'

alias mountgames='sudo mount /dev/sdb4 /home/tom/games/steamLibrary'
alias umountgames='sudo umount /home/tom/games/steamLibrary'

# ssh
# --------------------------------------------------------------------------
alias conectarssh='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/id_ed25519'

# clipboard
# --------------------------------------------------------------------------
alias clip='wl-copy'

# misc
# --------------------------------------------------------------------------
## restart hyprpaper
rhp() {
    killall hyprpaper
    nohup hyprpaper > /dev/null 2>&1 &
}

## restart hyprsunset
rhs() {
    killall hyprsunset
    nohup hyprsunset > /dev/null 2>&1 &
}

## app setups
eval "$(zoxide init --cmd cd bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

## opening pdf, cbr, cbz, etc
pdf() {
    local file
    local SEARCH_DIR="${1:-.}"
    file=$(find "$SEARCH_DIR" -type f \( -iname "*.pdf" -o -iname "*.cbr" -o -iname "*.cbz" -o -iname "*.epub" \) | fzf)
    if [[ -n "$file" ]]; then
        nohup zathura "$file" >/dev/null 2>&1 &
    fi
}

# yazi setup
# --------------------------------------------------------------------------
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# temp
# --------------------------------------------------------------------------
alias notes='cd ~/Documents/notes && nvim'
