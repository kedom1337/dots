if status is-interactive
    set -g fish_greeting
    set -gx GPG_TTY (tty)

    fish_config theme choose "Catppuccin Mocha"

    fish_vi_key_bindings

    abbr -a !! --position anywhere --function last_history_item

    # Pacman and AUR package managment
    abbr -a pacin "pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
    abbr -a pacrm "pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
    abbr -a yayin "yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"
    abbr -a yayrm "yay -Qq | fzf --multi --preview 'yay -Qi {1}' | xargs -ro yay -Rns"

    # Applications
    abbr -a y "yazi"
    abbr -a lgit "lazygit"
    abbr -a fetch "fastfetch"
    alias ls "eza -al --color=always --group-directories-first"
end
