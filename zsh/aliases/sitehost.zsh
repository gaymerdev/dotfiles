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
    if [[ -f /groups/$groupname/web/.htaccess ]]
        then less /groups/$groupname/web/.htaccess
        else echo "No .htaccess found for $groupname"
    fi
}