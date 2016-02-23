# Demo of native Docker

## Demo

Execute and discuss the following commands:

    docker run -t -i -p 4242:4242 -v `pwd`:/home/dev/in.relation.to hferentschik/in.relation.to
    docker-machine ip default

    docker run busybox /bin/echo hello world
    docker run busybox dd if=/dev/urandom of=file.txt bs=1048576 count=100
    docker ps -a
    docker ps -a -s
    docker ps -a -s | less -S
    docker run busybox --rm /bin/echo hello world

    docker ps -l -q
    docker commit `docker ps -l -q` debug
    docker run -it debug /bin/bash

    docker ps -a -s --filter 'exited=0'
    docker diff <hash>
