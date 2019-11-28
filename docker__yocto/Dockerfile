FROM ubuntu:14.04
MAINTAINER Lothar Rubusch <lotophagon@protonmail.com>
WORKDIR /root
ENV DEBIAN_FRONTEND=noninteractive


################################################################################
## the USER is needed to make it available as --build-arg
## in case docker complains for a not set USER, perhaps you forgot to use --build-arg USER=$USER
ARG USER=""

## the yocto branch
ARG BRANCH_YOCTO="daisy"


################################################################################
## set up apt fully functional
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y --purge

RUN apt-get install -y  \
    apt-utils

RUN apt-get install -y  \
    build-essential \
    chrpath \
    diffstat \
    gawk \
    libncurses5-dev \
    texinfo \
    zlib1g-dev \
    bison \
    flex \
    binutils \
    unzip \
    python \
    bzip2 \
    libssl-dev \
    locales \
    libsdl1.2-dev \
    xterm \
    bc \
    cpio \
    rsync \
    wget \
    git-core


# ## (opt) tools for debugging and working, e.g. X11-apps for testing the xserver via xclock
RUN apt-get install -y   \
    vim \
    sudo \
    x11-apps


################################################################################
## locale settings
RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8


# ################################################################################
# ## setup user and run stuff under user
RUN useradd "$USER" -m --password "$USER"
RUN usermod -a -G sudo "$USER"
RUN sed -i '/%sudo/s/.*/%sudo   ALL=NOPASSWD: ALL/' /etc/sudoers


# ################################################################################
# ## get sources
RUN cd /home/$USER && git clone -b $BRANCH_YOCTO git://git.yoctoproject.org/poky poky

RUN cd /home/$USER/poky && git clone -b $BRANCH_YOCTO git://git.openembedded.org/meta-openembedded

RUN cd /home/$USER/poky && git clone -b $BRANCH_YOCTO https://github.com/meta-qt5/meta-qt5.git


RUN cd /home/$USER/poky && git clone -b $BRANCH_YOCTO git://git.yoctoproject.org/meta-ti meta-ti

# RUN cd /home/$USER/poky && git clone git://github.com/beagleboard/meta-beagleboard.git bbb

## reset permissions
RUN chown $USER:$USER -R /home/$USER


################################################################################
## command mode
COPY build.sh /usr/local/bin/build.sh
CMD ["/bin/bash", "/usr/local/bin/build.sh"]
