#!/bin/sh

if [ "$(ls -A /scripts/)" ]; then
   echo "Executing additional scripts..."
   for SCRIPT in /scripts/*
   do
      sh $SCRIPT
   done
fi

echo "Check if folder is empty."

if  [ ! "$(ls -A ./)" ]; then
    hexo init /blog
    npm install --save hexo-generator-sitemap
    npm install --save hexo-generator-index
    npm install --save hexo-generator-archive
    npm install --save hexo-generator-category
    npm install --save hexo-generator-tag
    npm install --save hexo-renderer-pug
    npm install --save hexo-generator-feed
    npm install --save hexo-hey
    echo "Template built."
fi

if [ ! "$EDGE" = "1" ]; then
  echo "EDGE not requested, keeping stable version"
else
  echo "EDGE requested, updating to latest version"
  npm update --save
fi

echo "Generating static content..."
hexo generate
echo "Rendering done."

exec "$@"