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
if [ -L ramdisk/default.prop ];then
  # On Xioami devices that's a link to /system/etc/prop.default
  rm ramdisk/default.prop
  cat <<EOF > ramdisk/default.prop
#
# ADDITIONAL_DEFAULT_PROPERTIES
#
ro.miui.has_cust_partition=true
ro.sys.sdcardfs=1
ro.secure=0
security.perf_harden=1
ro.adb.secure=0
ro.allow.mock.location=0
ro.debuggable=1
#
# BOOTIMAGE_BUILD_PROPERTIES
#
ro.bootimage.build.date=Thu Jul 26 00:51:13 CST 2018
ro.bootimage.build.date.utc=1532537473
persist.sys.usb.config=mtp,adb
EOF
else
  sed -i 's/ro.secure=.*/ro.secure=0/' ramdisk/default.prop
  sed -i 's/ro.adb.secure=.*/ro.adb.secure=0/' ramdisk/default.prop
  sed -i 's/ro.debuggable=.*/ro.debuggable=1/' ramdisk/default.prop
fi

./repackimg.sh
mv image-new.img boot.img
popd
echo "You can now flash ./boot.img with fastboot flash boot boot.img"
