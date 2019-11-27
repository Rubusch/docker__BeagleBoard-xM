# Docker Container for my (ancient) Beagleboard xM

**UNDER CONSTRUCTION**


## Resources

TODO


## Build


```
$ cd ./docker__yocto/
$ time docker build --no-cache --build-arg USER=$USER -t rubuschl/beagleboard-xm-yocto:$(date +%Y%m%d%H%M%S) .
```


## Usage

```
$ docker images
    REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
    rubuschl/beagleboard-xm-yocto 20191104161353      cbf4cb380168        24 minutes ago      10.5GB
    ubuntu                        xenial              5f2bf26e3524        4 days ago          123MB

$ time docker run -ti -v $PWD/output:/home/$USER/poky/build -v $PWD/meta-lothars-configs:/home/$USER/poky/meta-lothars-configs --user=$USER:$USER --workdir=/home/$USER rubuschl/beagleboard-xm-yocto:20191104161353
```

For debugging / working in the container, append ``/bin/bash`` to the above command.
