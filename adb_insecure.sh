#!/usr/bin/env bash
#
#          DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                  Version 2, December 2004
#
#  Copyright (C) 2004 Sam Hocevar
#  14 rue de Plaisance, 75014 Paris, France
#  Everyone is permitted to copy and distribute verbatim or modified
#  copies of this license document, and changing it is allowed as long
#  as the name is changed.
#  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#
#
#  David Hagege <david.hagege@gmail.com>
#
set -euo pipefail

pushd `dirname $0`
unzip $1 boot.img
./unpackimg.sh boot.img
sed -i 's/ro.secure=.*/ro.secure=0/' ramdisk/default.prop
sed -i 's/ro.adb.secure=.*/ro.adb.secure=0/' ramdisk/default.prop
sed -i 's/ro.debuggable=.*/ro.debuggable=1/' ramdisk/default.prop
./repackimg.sh
mv image-new.img boot.img
popd
echo "You can now flash ./boot.img with fastboot boot boot.img"
