if status is-interactive
    # Vi keybindings
    fish_vi_key_bindings
    source ~/.config/fish/functions/fish_mode_promt.fish

    # Pacman and AUR package managment
    alias pacin="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
    alias pacrm="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
    alias yayin="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"
    alias yayrm="yay -Qq | fzf --multi --preview 'yay -Qi {1}' | xargs -ro yay -Rns"


    # Applications
    alias y="yazi"
    alias lgit="lazygit"
    alias ls="eza -al --color=always --group-directories-first"
    alias lt="eza -aT --color=always --group-directories-first"

end
