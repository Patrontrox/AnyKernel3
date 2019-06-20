# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Revolution Kernel by Revolution Techs Team
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=beryllium
device.name2=dipper
device.name3=polaris
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes

umount /vendor || true
mount -o rw /dev/block/bootdevice/by-name/vendor /vendor
exec_util "cp -a /tmp/anykernel/ramdisk/init.simple.sh /vendor/bin/"
set_con qti_init_shell_exec /vendor/bin/init.simple.sh
umount /vendor || true

# end ramdisk changes

write_boot;
## end install

