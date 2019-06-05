# ADBD insecure patcher
In some cases android ROM prevent you from running adb as root. After an `adb root` you can get the message `adbd cannot run as root in production builds` which is super annoying. 
The script ./adb\_insecure.sh can patch any android ROM kernel in order to enable running adbd as root.

# Usage

```
./adb_insecure.sh YOUR_ROM.zip
```

Then you will get a boot.img file that you can flash with `fastboot flash boot boot.img` in bootloader mode.

# For Xiaomi.eu ROMS (and other Treble ROMs)
On Xioami.eu ROMS the ramdisk/default.prop is a symlink to /system/etc/prop.default.  
You can if you want take that /system/etc/prop.default and overwrite the ramdisk/default.prop.  
The script right now is simply overwriting the ramdisk/default.prop with a default one.
