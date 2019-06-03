# ivonet/hexo

This image contains a Hexo distro.

It is actually a the base for my [website](https://www.ivonet.nl).

# Usage example(s)

## Interactive EDGEd mode

Start hexo in interactive mode with two folders mounted and in EDGE mode...
EDGE mode will always try to upgrade hexo after a restart. This might break your
build if the update was not a good one. (default EDGE=0)

```bash
docker run \
       --rm \
       --name hexo \
       -it \
       -v $(pwd)/blog:/blog \
       -v $(pwd)/scripts:/scripts \
       -p 4000:4000 \
       -e EDGE=0 \
       ivonet/hexo:1.0.0
```

## Generate content

This command you do on a running hexo to re-render static content. e.g. when a new blog was added.

```bash
docker exec -it hexo hexo generate --debug
```

## bin folder

Please look in the bin folder for some example scripts that might help...


# /script

This folder can be used to install "aftermarket" stuff :-)
if you put a shell script in that folder and restart docker it will be executed in the docker container

# /blog

this folder contains the blog. If empty it will be filled with a default `landscape` theme
if it already contains stuff then it will just start the server


# Contact

My twitter handle: @ivonet


---
# License

    Copyright 2019 (c) Ivo Woltring

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
