# ADBD insecure patcher
The script ./adb\_insecure.sh can patch any android ROM kernel in order to enable running adbd as root.

# Usage

```
./adb_insecure.sh YOUR_ROM.zip
```

Then you will get a boot.img file that you can flash with `fastboot flash boot boot.img` in bootloader mode.
