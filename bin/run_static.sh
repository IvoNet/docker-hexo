#!/bin/sh
sudo docker run --rm -it -v $(pwd)/blog:/blog -v $(pwd)/scripts:/scripts  --entrypoint hexo ivonet/hexo clean
sudo docker run --rm -it -v $(pwd)/blog:/blog -v $(pwd)/scripts:/scripts  --entrypoint hexo ivonet/hexo generate
sudo docker run --rm --name hexo -d -v $(pwd)/blog:/blog -v $(pwd)/scripts:/scripts -p 4000:4000 ivonet/hexo:1.0.0
