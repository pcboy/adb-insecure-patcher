# ADBD insecure patcher
In some cases android ROM prevent you from running adb as root. After an `adb root` you can get the message `adbd cannot run as root in production builds` which is super annoying. 
The script ./adb\_insecure.sh can patch any android ROM kernel in order to enable running adbd as root.

# Usage

```
./adb_insecure.sh YOUR_ROM.zip
```

Then you will get a boot.img file that you can flash with `fastboot flash boot boot.img` in bootloader mode.
