#!/bin/sh
################################################################################
# Dropbox sync with hexo location
################################################################################
# This script enables syncing from a dropbox source folder to the hexo folder
# and re-render content when changes have been detected.
################################################################################
# Edit the following variables to point to the correct locations
################################################################################

DROPBOX_HEXO_SOURCE="/volume1/CloudSync/Dropbox/Apps/Editorial/www.ivonet.nl/source/"
HEXO_BLOG_LOCATION="/volume1/docker/hexo/www.ivonet.nl/source"
DOCKER_NAME="hexo"

################################################################################
# Do not edit below unless you know what you are doing :-)
################################################################################

echo "Syncing dropbox with site..."
RSYNC_OUTPUT=$(rsync -ituahP --no-motd --delete --partial-dir=.rsync "$DROPBOX_HEXO_SOURCE" "$HEXO_BLOG_LOCATION")
if [ -n "$RSYNC_OUTPUT" ]; then
    echo "Changes were detected so will render new site..."
    docker exec $DOCKER_NAME hexo generate --debug
else
    echo "Site already up-to-date."
fi
