#!/bin/sh -xe

# need to install as 'root' since some of the unit tests won't run without it
sudo python3 -m pip install --upgrade meson

# add Canonical Kernel Team PPA for newer version kernel header package
if [[ "$TRAVIS_ARCH" == "amd64" ]] || [[ -z "$TRAVIS_ARCH" ]]; then
    sudo add-apt-repository -y ppa:canonical-kernel-team/ppa
    sudo apt-get -q update
    sudo apt-get -y install linux-headers-$(uname -r)
fi

# setup hugepages
# turn off apparmor to set hugepage from LXD
#if [[ "$TRAVIS_ARCH" == "arm64" ]]; then
#which lxc
#sudo apt-get install -y --no-install-suggests --no-install-recommends lxc
#which lxc
#echo $PATH
#sudo lxc config set vppjordan raw.lxc lxc.aa_profile=unconfined
#sudo lxc restart vppjordan
#fi
#cat /proc/meminfo
#sudo sh -c 'echo 1024 > /proc/sys/vm/nr_hugepages'
#cat /proc/meminfo
