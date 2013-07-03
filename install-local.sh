#!/bin/sh

paths=$@

if test -z "$paths"; then
  paths=.
fi

for path in $(find $paths -maxdepth 2 -name "*.tar.lzma" -not -name "*-src.*"); do
    case $(basename $path) in
    *mingw32*)
        tar vxf $path -C /mingw/
        ;;
    *msys*)
        tar vxf $path -C /
        ;;
    esac
done
