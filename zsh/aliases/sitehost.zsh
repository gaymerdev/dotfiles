#############################
#~ Sitehost Alias Commands ~#
#############################

checkfiles () {
    du -hd0 /groups/$groupname/web/* | sort -k1 -hr | head -n 15
}

goto () {
    cd /groups/$groupname/web/
}

checkhtaccess () {
    htaccess=/groups/$1/web/.htaccess
    if [[ -f $htaccess ]]
    then
        less $htaccess
    else
        echo "No .htaccess found for $1"
    fi
}