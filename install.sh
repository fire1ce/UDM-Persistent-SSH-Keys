#!/bin/sh

user_authorized_keys_file="/mnt/data/ssh/authorized_keys"

curl -O https://raw.githubusercontent.com/fire1ce/UDMP-Persistence-SSH-Keys/main/99-ssh-keys.sh
mv 99-ssh-keys.sh /mnt/data/on_boot.d/99-ssh-keys.sh
chmod +x /mnt/data/on_boot.d/99-ssh-keys.sh
echo "99-ssh-keys.sh installed"

if [ ! -f "$user_authorized_keys_file" ]; then
  touch $user_authorized_keys_file
  echo "Creating $user_authorized_keys_file"
fi

chmod 0644 $user_authorized_keys_file

echo "Add you public keys to $user_authorized_keys_file"
echo "done."
exit 0
