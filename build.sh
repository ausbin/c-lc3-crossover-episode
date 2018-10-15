#!/bin/bash
git submodule update --init
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
