set -U fish_greeting ""

if status is-interactive
    # Commands to run when the shell opens
    fish_config theme choose "tokyo_night_moon"
    neofetch
    export EDITOR=nvim

    # Aliases
    alias start-hyprland="exec ~/.local/bin/hyprwrapped.sh"
    alias fishconf="nvim ~/.config/fish/config.fish"
    alias shipconf="nvim ~/.config/starship.toml"
    alias hyprconf="nvim ~/.config/hypr/hyprland.conf"
    alias hyprpaperconf="nvim ~/.config/hypr/hyprpaper.conf"
    alias bsprc="nvim ~/.config/bspwm/bspwmrc"
    alias bspwmrc="nvim ~/.config/bspwm/bspwmrc"
    alias sxhkdrc="nvim ~/.config/sxhkd/sxhkdrc"
    alias polyconf="nvim ~/.config/polybar/config.ini"
    alias picomconf="nvim ~/.config/picom/picom.conf"
    alias dunstrc="nvim ~/.config/dunst/dunstrc"
    alias qtileconf="nvim ~/.config/qtile/config.py"
    alias kittyconf="nvim ~/.config/kitty/kitty.conf"
    alias nvimconf="vim ~/.config/nvim/init.lua"
    alias wbconf="nvim ~/.config/waybar/config"
    alias tty-clock="tty-clock -c -C 6 -b -t"
    alias pipes="pipes.sh -t 1"
    alias cat="bat --theme=tokyo_night"
    alias bat="bat --theme=tokyo_night"
    alias ls="exa -a --icons --color=always --group-directories-first"
    alias ll="exa -l --icons --color=always --group-directories-first"
    alias la 'exa -a --color=always --group-directories-first --icons'  # all files and dirs
    alias lt 'exa -aT --color=always --group-directories-first --icons' # tree listing
    alias l. 'exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles
    alias .. 'cd ..'
    alias ... 'cd ../..'
    alias .... 'cd ../../..'
    alias ..... 'cd ../../../..'
    alias ...... 'cd ../../../../..'
    alias big 'expac -H M "%m\t%n" | sort -h | nl'     # Sort installed packages according to size in MB (expac must be installed)
    alias dir 'dir --color=auto'
    alias egrep 'grep -E --color=auto'
    alias fgrep 'grep -F --color=auto'
    alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
    alias gitpkg 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
    alias grep 'grep --color=auto'
    alias wget 'wget -c'
    alias grubup 'sudo update-grub'
    alias hw 'hwinfo --short'                          # Hardware Info
    alias ip 'ip -color'
    alias psmem 'ps auxf | sort -nr -k 4'
    alias psmem10 'ps auxf | sort -nr -k 4 | head -10'
    alias rmpkg 'sudo pacman -Rdd'
    alias tarnow 'tar -acf '
    alias untar 'tar -zxvf '
    alias vim 'nvim'
    alias vi 'nvim'
    alias yay 'paru'
    alias upd 'rate-mirrors --entry-country FI --country-test-mirrors-per-country 50 --top-mirrors-number-to-retest 20 --save /etc/pacman.d/mirrorlist arch && sudo pacman -Syu && paru -Syu'
    alias vdir 'vdir --color=auto'
    alias mirror 'rate-mirrors --entry-country FI --country-test-mirrors-per-country 50 --top-mirrors-number-to-retest 20 --save /etc/pacman.d/mirrorlist arch'
    alias mirrorr 'sudo reflector --verbose -l 200 -n 20 -p http --sort rate --save /etc/pacman.d/mirrorlist1'
    alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
    alias mirrord 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
    alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
    alias fucking 'doas'
    alias cls 'clear && neofetch'
    alias visudo="sudo EDITOR=nvim visudo"
    alias gadd="git add ."
    alias gcommit="git commit -m"
    alias gpush="git push -u origin main"
    alias mkdir="mkdir -p"

    alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
end

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end


starship init fish | source
