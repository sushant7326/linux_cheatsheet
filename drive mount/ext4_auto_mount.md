## Find the drive's UUID
```bash
lsblk -f
```

## Make the mount point directory
```bash
sudo mkdir /mnt/ssd2
```

## Add the following line at the end of `/etc/fstab`
```bash
# <file system>  <mount point>  <type>  <options>          <dump>  <pass>
UUID=<UUID>       /mnt/ssd2      ext4    defaults,noatime   0        2
```