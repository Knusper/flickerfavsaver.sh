#!/bin/bash

######################################################
# Name: flickrfavsaver.sh                            #
# Description, Usage & Requirements - see README.md  #
# URL: https://github.com/Knusper/flickerfavsaver.sh #
# Author: Knusper2000 - http://knusper.net           #
# Date: 2010/07/31                                   #
######################################################

favs_rss='http://api.flickr.com/services/feeds/photos_faves.gne?nsid=66423646@N00&lang=en-us&format=rss_200_enc'
# adjust this variable to your flickr!-favorites rss feed note: the
# feed link is provided on your flickr!-favorites page, but you have
# add rss_200_enc at the end to get enclosures!


cd $(dirname $0) # crontab-friendly :-)

# cleanup & fetch rss
test -s favs.rss && rm favs.rss || true
aria2c --allow-overwrite=true -q -s1 $favs_rss -o favs.rss 
# fetch images, if rss fetch was sucsessfull
test -s favs.rss && xsltproc parse_enclosure.xsl favs.rss | aria2c -q \
    -s2 --allow-overwrite=false \
    --auto-file-renaming=false -d ./Images -i -

# delete thumbnail-sized images, because they would look ugly in slide-show
du -s ./Images/* | while read size name; do
if [ $size -lt 100 ]; then 
rm $name
fi 
done

# delete images older than 60 days,
# but only if after that more than 10 images would be left
files=$(ls -l ./Images | wc -l)
oldfiles=$(find ./Images -mtime +60 | wc -l)
if [ $(($files - $oldfiles)) -gt 10 ]; then
find ./Images -mtime +60 -delete
fi
