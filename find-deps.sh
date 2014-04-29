#!/bin/bash

paths=$@

if [ -z "$paths" ]; then
    paths=.
fi

echo "Mapping available DLLs to package names..."

# Loop over all downloaded package files in the cache that might contain DLLs.
map=$(for path in $(find /mingw/var/cache/mingw-get/packages -iname "*-bin*.tar.*" -or -iname "*-dll*.tar.*"); do
    # Loop over all DLLs contained in a specific package file.
    for dll in $(tar -tf $path | grep "\.dll$"); do
        # Map a package file to a package name.
        file=${path##*/}
        package=$( cd /mingw/var/lib/mingw-get/data && grep -l "$file" mingw32-*.xml msys-*.xml )
        echo ${package%.*}:$dll
    done
done)

echo "Finding dependencies of executables..."

deps=$(find $paths -iname "*.exe" -or -iname "*.dll" | xargs ntldd | grep "=>" | cut -d "=" -f 1)
deps=$(echo "$deps" | grep -Eiv "advapi32|comctl32|gdi32|kernel32|msvcr|ole32|shell32|user32")

echo "The executable(s) in the given path(s) depend on the following packages:"

for dep in $deps; do
    echo "$map" | grep "$dep$" | cut -d ":" -f 1 
done | sort -u
