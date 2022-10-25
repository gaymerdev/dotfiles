############################
#~ Manjaro Alias Commands ~#
############################

# >>> Package Management
alias auri='yay -Sy --nodiffmenu --save'
alias auru='yay -Rs'
alias paci='sudo pacman -Sy --noconfirm --needed'
alias pacu='sudo pacman -Rs'
alias rcp='rsync -avh --progress'

function upgrade {
    sudo pacman -Syyu --noconfirm;
    yay -Syu --nodiffmenu --save;
}

alias upgrade='upgrade'
# <<< Package Management