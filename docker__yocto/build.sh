#!/bin/bash -e
export BUILDDIR=~/poky/build
chown $(whoami):$(whoami) -R $BUILDDIR

## source again, before start building
cd ~/poky
source oe-init-build-env $BUILDDIR

## layers.conf and bblayers.conf (edit those two!)
cp -arf /home/$(whoami)/poky/meta-lothars-configs/conf/bblayers.conf.sample ${BUILDDIR}/conf/bblayers.conf
cp -arf /home/$(whoami)/poky/meta-lothars-configs/conf/local.conf.sample ${BUILDDIR}/conf/local.conf

## adjust config files
sed "s/  ~\/poky\/meta/  \/home\/$(whoami)\/poky\/meta/g" -i ${BUILDDIR}/conf/bblayers.conf

## build
bitbake core-image-minimal
