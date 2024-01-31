# Shared clipboard for Arch Linux as VMWare guest

## First: Install open-vm-tools and gtkmm, then add some modules to system bootup

1. sudo pacman -S open-vm-tools gtkmm
2. sudo vim /etc/mkinitcpio.conf
3. Under “MODULES=…” add the following: “vmxnet3 vmw_vmci vmw_pvscsi vmw_balloon” (You probably don’t need most of them, but this is the config which worked for me. I didn’t try to remove them one-by-one to see which ones are actually needed)
4. sudo mkinitcpio -p linux
5. reboot

## Second, make sure “vmware-user-suid-wrapper” is stared on login:

1. echo vmware-user-suid-wrapper > ~/.xinitrc
2. Logout and log in (or reboot)
3. You are done.
