#!/usr/bin/env bash
NAME=hexo
PORT=8080
if [ ! -z $1 ]; then
   EP="--entrypoint bash"
fi

docker run          \
    -it             \
    --rm            \
    --name $NAME    \
    -v $(pwd)/blog:/blog \
    -v $(pwd)/scripts:/scripts \
    -p ${PORT}:4000 \
    $EP             \
    ivonet/$NAME

