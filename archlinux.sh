#use gdisk /dev/sda


sudo mkfs.fat -n boot_fs -F 32 /dev/sda1 
sudo mkfs.ext4 -L root_fs /dev/sda2
sudo mkswap -L swaponhdd /dev/sda3

mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot/efi

#pacstrap -K /mnt intel-ucode # for intel cpu
pacstrap -K /mnt base linux linux-firmware 

#coonect to LAN
ip link set enp0s3 up # ip link set interface up|down, see ip-link(8). 
ip addr add 192.168.29.1/24 brd 192.168.29.1 dev enp0s3 #set maully ip 
ip addr add 192.168.29.1/24 brd 192.168.29.1 dev enp0s3 #set maully VirtualBox
#





#arch-chroot /mnt
#pacstrap -K /mnt xfce4 #~ 105MiB D/L 520 MiB Ex
#pacstrap -K /mnt xfce4-goodies #~ +35MiB D/L +90 MiB Ex

#grub2
pacstrap -K /mnt grub efibootmgr #7-8 MB
grub-install --target=x86_64-efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

#pacstrap -K /mnt sudo #for sudo
#pacstrap -K /mnt wpa_supplicant #for wifi
#pacstrap -K /mnt openssh
#pacstrap -K /mnt iproute2



ref: https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf
