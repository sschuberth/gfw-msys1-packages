#!/bin/sh

paths=$@

if [ -z "$paths" ]; then
    paths=.
fi

for path in $(find $paths -maxdepth 2 -iname "*.tar.lzma" -not -iname "*-src.*"); do
    package=$(basename $path)
    echo "Installing $package..."

    case $package in
    *mingw32*)
        tar vxf $path -C /mingw/
        ;;
    *msys*)
        tar vxf $path -C /
        ;;
    esac
done
