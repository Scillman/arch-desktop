# Description
Personal Arch Linux desktop setup instructions.

<font color="red">**It's a mess but I know what I am doing, so use it at your own risk.**</font>

# Steps

## Preparations
1) Boot with Arch Linux install USB.
1) Set-up disk partitions using `fdisk /dev/<drive>`
    1) Partition 1: 1GB EFI filesystem FAT32 formatted
    2) Partition 2: 1TB Windows (unallocated)
    3) Parititon 3: 1TB Arch Linux (allocated to prevent Windows installer from taking the space)
1) `# mkfs.fat -F 32 /dev/<efi>`

## Windows 11 (Home)
1) Install Windows into the unallocated space.
1) After installation ensure the EFI is in the EFI partition. (IMPORTANT!!)

<sup>1</sup> Windows will create multiple partitions for itself inside the allocated space. (MSR, Windows and Recovery)

## Arch Linux (Minimal)
TODO:

1) `# loadkeys us`
1) `# cat /sys/firmware/efi/fw_platform_size`
1) `# ip link`
1) `# ping ping.archlinux.org`
1) `# timedatectl`
1) `# fdisk /dev/<device>`
1) `# mkfs.ext4 /dev/<root>`
1) `# mkswap /dev/<swap>`
1) `# mount /dev/<root> /mnt`
1) `# mount /dev/<efi> /mnt/boot`
1) `# swapon /dev/<swap>`
1) `# pacstrap -K /mnt base linux linux-firmware`
1) `# genfstab -U /mnt >> /mnt/etc/fstab`
1) `# arch-chroot /mnt`

##
1) `# pacman -S vim`
1) `# ln -sf /usr/share/Europe/Amsterdam /etc/localtime`
1) `# hwclock --systohc`
1) `# locale-gen`
1) `# vim /etc/locale.gen` (`en_US.UTF-8`, `nl_NL.UTF-8`)
1) `# vim /etc/locale/conf` (`LANG=nl_NL.UTF-8`)
1) `# locale-gen`
1) `# vim /etc/vconsole.conf` (`KEYMAP=us`)
1) `# vim /etc/hostname`
1) `# passwd`

## GRUB Bootloader
1) `# pacman -S grub efibootmgr os-prober`
1) `# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB`
1) `# vim /etc/default/grub`
1) `# grub-mkconfig -o /boot/grub/grub.cfg`

## Networkd
1) `# systemctl enable systemd-networkd`
1) `# systemctl enable systemd-resolved`
1) `# vim /etc/systemd/network/99-custom.network`

## Basic Tools (Optional)
1) `# pacman -S zip unzip curl wget git`

## Users & Security
1) `# pacman -S sudo`
1) `# groupadd -g 999 admin`
1) `# useradd --home-dir /home/admin --create-home -g admin admin`
1) `# groupadd -g 1000 scillman`
1) `# useradd --home-dir /home/scillman --create-home -g scillman scillman`
1) `# chmod u+w /etc/sudoers`
1) `# vim /etc/sudoers`
1) `# chmod u-w /etc/sudoers`

## Docker
1) `# pacman -S docker`
1) `# usermod -aG docker admin`
1) `# usermod -aG docker scillman`

## KDE-Plasma
1) `# pacman -S plasma-meta konsole`
1) `# pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber`
1) `$ systemctl --user enable --now pipewire pipewire-pulse wireplumber`
1) `# pacman -S NetworkManager`
1) `# systemctl stop systemd-resolved`
1) `# systemctl diable systemd-resolved`
1) `# systemctl stop systemd-networkd`
1) `# systemctl diable systemd-networkd`
1) `# systemctl enable NetworkManager`
1) `# systemctl start NetworkManager`
1) `# pacman -S noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu`
1) `# pacman -S freetype2 fontconfig`
1) `# fc-cache -fv`
1) `$ /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland`

## Printer
1) `# pacman -S cups ghostscript gsfonts gutenprint`
1) `# systemctl enable --now cups`
1) `# pacman -S --needed base-devel git`
1) `$ git clone http://aur.archlinux.org/yay.git`
1) `$ cd yay`
1) `$ makepkg -si`
1) `$ yay -S brother-mfc-j4620dw`
1) `$ yay -S brscan4`
1) `$ brsaneconfig4 -a name="MFC-J4620DW" model="MFC-J4620DW" ip=<ip>`
1) `$ lpadmin -p Brother_MFC_J4620DW -v socket://<ip>:9100 -E`
1) `# lpoptions -d Brother_MFC_J4620DW`

## Entertainment
1) `# vim /etc/pacman.conf`
1) `# pacman -S dolphin firefox calibre steam vlc vlc-plugins-all`
1) `# sudo pacman kdenetwork-filesharing`
1) `$ yay -S discord_arch_electron`
1) `# pacman -S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-tools`
1) `# pacman -S lutris`
1) `# pacman -S wine wine-gecko wine-mono`
1) `# pacman -S lib32-gnutls lib32-libldap lib32-mpg123 lib32-openal lib32-v4l-utils lib32-libpulse lib32-alsa-plugins lib32-libxcomposite lib32-libxinerama lib32-ncurses lib32-libxml2 lib32-freetype2 lib32-libpng lib32-sdl2`
1) `# pacman -S winetricks`
1) `# pacman -S dxvk-bin` (?)


### Winetricks (Girls' Frontline 2: EXILIUM)
1) `corefonts`
1) `vc2022`
1) `dotnet48`
1) `# pacman -S gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav`

## Coding
1) `$ yay visual-studio-code-bin`
1) `$ vim /home/scillman/.config/code-flags` (`--password-store=basic`)
