# Description
Personal Arch Linux desktop setup instructions. Your preferences and experiences may differ.

# Steps

## Preparations

## Windows 11 (Home)

## Arch Linux (Minimal)
TODO:

1) `pacman -S vim konsole`
1) `ln -sf /usr/share/Europe/Amsterdam /etc/localtime`
1) `vim /etc/locale.gen`
1) `vim /etc/locale/conf` (`en_US.UTF-8`, `nl_NL.UTF-8`)
1) `vim /etc/vconsole.conf` (`us`)
1) `vim /etc/hostname`
1) `passwd`

## GRUB Bootloader
1) `pacman -S grub efibootmgr os-prober`
1) `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB`
1) `vim /etc/default/grub`
1) `grub-mkconfig -o /boot/grub/grub.cfg`

## Networkd
1) `systemctl enable systemd-networkd`
1) `systemctl enable systemd-resolved`

## KDE-Plasma

