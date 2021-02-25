#!/bin/bash

#
# build-deb.sh - Debian Package Build Script
#
# This source-code is part of the simplekb project by Oddmatics:
# <<https://www.oddmatics.uk>>
#
# Author(s): Rory Fewell <roryf@oddmatics.uk>
#

# Enable 'bash strict mode'
#     (http://redsymbol.net/articles/unofficial-bash-strict-mode/)
#
set -euo pipefail
IFS=$'\n\t'


#
# CONSTANTS
#
PACKAGE_META='./debian-control'
PACKAGE_RULES='./debian-rules'

SOURCE_ROOT='../src'

TARGET_ROOT='debian'
DEBIAN_ROOT="${TARGET_ROOT}/DEBIAN"
TARGET_PACKAGE_META="${DEBIAN_ROOT}/control"
TARGET_PACKAGE_RULES="${DEBIAN_ROOT}/rules"
TARGET_WEB_ROOT="${TARGET_ROOT}/usr/share/simplekb"


#
# FUNCTONS
#
build_website()
{
    mkdir -p $TARGET_WEB_ROOT

    cp -r $SOURCE_ROOT/* $TARGET_WEB_ROOT
}

check_running_dir()
{
    if [ ! -f './build-deb.sh' ]
    then
        echo "This script is intended to be executed from its origin directory."
        exit 1
    fi
}

finalize_build()
{
    # Set up DEBIAN dir
    #
    mkdir -p $DEBIAN_ROOT

    cp $PACKAGE_META  $TARGET_PACKAGE_META
    cp $PACKAGE_RULES $TARGET_PACKAGE_RULES
}

finish_build()
{
    fakeroot dpkg-deb -v --build $TARGET_ROOT

    mv debian.deb oddmatics-simplekb.deb
}

prepare_build()
{
    if [ -d $TARGET_ROOT ]
    then
        rm -rf $TARGET_ROOT
    fi

    mkdir $TARGET_ROOT
}


#
# ENTRY POINT
#
check_running_dir
prepare_build
build_website
finalize_build
finish_build
