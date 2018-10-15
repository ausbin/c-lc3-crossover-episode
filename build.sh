#!/bin/bash
set -e

git submodule update --init
rm -rvf tools
mkdir tools
pushd lc3tools
    ln -srvTf ../tools tools
    ./configure --installdir "tools/"
    make OS_SIM_LIBS= install
popd
pushd lcc-lc3
    ln -srvTf ../tools tools
    find . -name Makefile.def -not -path './src*' -exec sed -i -e "s*__TOP_DIR__*__INSTALL_DIR__*g" {} \;
    ./configure --installdir "tools/"
    make BASEDIR=tools/ install
popd
# Don't need all this shit
pushd tools
    rm -f lc3convert lc3sim lc3sim-tk
popd

# Copy into place
rm -rvf lab/tools
cp -rv tools lab/tools
cp -rv lcc-lc3/lc3lib lab/tools/lc3lib

# Package up lab
rm -vf fun-lab.tar.gz
make -C lab clean
pushd lab
    tar czvf ../fun-lab.tar.gz *
popd
