#!/bin/bash
git submodule update --init
rm -rvf install-dir
pushd lc3tools
    ./configure --installdir "$(pwd)/../install-dir"
    make OS_SIM_LIBS= install
popd
pushd lcc-lc3
    ./configure --installdir "$(pwd)/../install-dir"
    make install
popd
# Don't need all this shit
pushd install-dir
    rm -f lc3convert lc3sim lc3sim-tk
popd

# Copy into place
rm -rvf lab/tools
cp -rv install-dir lab/tools

# Package up lab
rm -vf fun-lab.tar.gz
make -C lab clean
pushd lab
    tar czvf ../fun-lab.tar.gz *
popd
