#!/bin/sh -xe

# need to install as 'root' since some of the unit tests won't run without it
sudo python3 -m pip install --upgrade meson

# linux header and hugepage settings are skipped on arm64 due to environment limitation
if [ "$TRAVIS_ARCH" != "aarch64" ]; then
    sudo apt-get -y install linux-headers-$(uname -r)
# setup hugepages
    cat /proc/meminfo
    sudo sh -c 'echo 1024 > /proc/sys/vm/nr_hugepages'
    cat /proc/meminfo
fi
