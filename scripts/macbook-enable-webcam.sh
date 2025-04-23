#!/bin/bash

#TODO: navigate to the directory of this script, first

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