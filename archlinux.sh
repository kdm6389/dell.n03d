#use gdisk /dev/sda


sudo mkfs.fat -n boot_fs -F 32 /dev/sda1 
sudo mkfs.ext4 -L root_fs /dev/sda2
sudo mkswap -L swaponhdd /dev/sda3

mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot/efi

#pacstrap -K /mnt intel-ucode # for intel cpu
pacstrap -K /mnt base linux linux-firmware 
#pacstrap -K /mnt sudo #for sudo
#pacstrap -K /mnt openssh

#arch-chroot /mnt
#pacstrap -K /mnt xfce4 #~ 105MiB D/L 520 MiB Ex
#pacstrap -K /mnt xfce4-goodies #~ +35MiB D/L +90 MiB Ex

#grub2
pacstrap -K /mnt grub efibootmgr #7-8 MB
grub-install --target=x86_64-efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
