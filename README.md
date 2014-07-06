flickerfavsaver.sh
==================

Description
------------

Bash Script.  Downloads Flickr!-Favorites from your Flickr!-Favorites
RSS Feed. In combination with a slide-show screensaver
(e.g. [GLSlideshow](http://linuxcommand.org/man_pages/glslideshow1.html)
in [xscreensaver](http://www.jwz.org/xscreensaver/)) you get your
personal Flickr! favorites slide-show screensaver.

Requirements
------------

[xsltproc](http://xmlsoft.org/XSLT/xsltproc2.html),
[aria2c](http://sourceforge.net/projects/aria2/) and the file
`parse_enclosure.xsl` (included) which must be located in the same
directory as the script.  `parse_enlcosure.xsl` was originally
obtained from <http://lincgeek.org/bashpodder/>

Install & Usage
---------------

`chmod u+x flickerfavsaver.sh` + copy to directory, where you want the
 images to be downloaded (into the subfolder `Images`).  For maximum
 fun - add a `flickrfavsaver.sh` entry to your crontab.

The only variable which needs to be set in the script is `favs_rss`,
which needs to be set to the location of your Flickr!-favorites RSS-Feed. See Flickr!-Docs: <https://www.flickr.com/services/feeds/docs/photos_faves/>

*Important*: Make sure to set the query string `format` to
 `rss_200_enc`. See the script for an example!

