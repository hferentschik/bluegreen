# Demo of native Docker

## Demo

Execute and discuss the following commands:

    $ docker run -it --name busybox busybox sh
    $ docker top busybox
    $ docker-machine ssh
    $ ps <pid>

    $ time for i in $(seq 1 100); do docker run -P -d nginx; done
    $ docker stop $(docker ps -a -q)
    $ docker rm $(docker ps -a -q)

    $ docker run -t -i -p 4242:4242 -v `pwd`:/home/dev/in.relation.to hferentschik/in.relation.to
    $ docker-machine ip default

    $ docker run -it busybox sh
    $ docker run busybox dd if=/dev/urandom of=file.txt bs=1048576 count=100
    $ docker run busybox --rm dd if=/dev/urandom of=file.txt bs=1048576 count=100

    $ docker ps -a
    $ docker ps -a -s
    $ docker ps -a | less -S
    $ docker ps -l -q
    $ docker ps -a -s --filter 'exited=0'

    $ docker commit `docker ps -l -q` debug
    $ docker run -it debug /bin/bash

    $ docker diff <hash>
