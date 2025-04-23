#!/bin/bash

#TODO: navigate to the directory of this script, first

#
# NOTES:
#
# Around Apr 2025, this script was failing to enable
# the webcam. After looking around everywhere, I found
# a suggestion to clean the projects being built below.
# After doing that, it finally worked. So I added the
# `make clean` steps to each project.
#

# Navigate to facetimehd-firmware dl location
cd ../../git/facetimehd-firmware || exit
make clean
make
sudo make install

# Navigate to bcwc_pcie dl location
cd ../bcwc_pcie || exit
make clean
make
sudo make install
sudo depmod
sudo modprobe facetimehd

# Test it out
mplayer tv://