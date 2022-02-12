#!/bin/sh

user_authorized_keys_file="/mnt/data/ssh/authorized_keys"

curl -O https://raw.githubusercontent.com/fire1ce/
mv 99-ssh-keys.sh /mnt/data/on_boot.d/99-ssh-keys.sh
chmod +x /mnt/data/on_boot.d/99-ssh-keys.sh

if [ ! -f "$user_authorized_keys_file" ]; then
  touch $user_authorized_keys_file
fi

chmod 0644 $user_authorized_keys_file

exit 0
