#!/bin/bash
echo "ParallelDownloads = 5" >> /etc/pacman.conf
pacman -S --needed amd-ucode btrfs-progs dosfstools exfatprogs f2fs-tools e2fsprogs jfsutils nilfs-utils ntfs-3g reiserfsprogs udftools xfsprogs networkmanager nano vi kitty firefox man-db man-pages texinfo zsh xorg nvidia nvidia-utils nvidia-settings plasma plasma-wayland-session egl-wayland kde-applications sddm sddm-kcm
ln -sf /usr/share/zoneinfo/America/Phoenix /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=en" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
systemctl enable NetworkManager.service
systemctl enable sddm.service
passwd
bootctl --path=/boot install
echo "title   Arch Linux Oct 2022" > /boot/loader/entries/arch.conf
echo "linux   /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd  /amd-ucode.img" >> /boot/loader/entries/arch.conf
echo "initrd  /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options root=PARTUUID=$(blkid -o value -s UUID $2) rw" >> /boot/loader/entries/arch.conf
echo "default arch" > /boot/loader/loader.conf
echo "timeout 4" >> /boot/loader/loader.conf
echo "console-mode max" >> /boot/loader/loader.conf
echo "editor no" >> /boot/loader/loader.conf
bootctl --path=/boot update
UNAME="sapien"
useradd -m -G "wheel" -s /bin/zsh $UNAME
passwd $UNAME