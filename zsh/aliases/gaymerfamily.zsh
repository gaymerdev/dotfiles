###########################
#~ Ubuntu Alias Commands ~#
###########################

alias upgrade='sudo -- sh -c "apt update; apt dist-upgrade -y; apt autoremove; apt autoclean"'
alias apti='sudo apt install'

alias multistart='sudo /home/minecraft/multicraft/bin/multicraft start'
alias multistop='sudo /home/minecraft/multicraft/bin/multicraft stop'

nextcloud-occ () {
    sudo -u www-data php /var/www/html/nextcloud/occ $1
}
