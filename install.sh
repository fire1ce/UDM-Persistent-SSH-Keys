#!/bin/sh

user_authorized_keys_file="/mnt/data/ssh/authorized_keys"

curl -sO https://raw.githubusercontent.com/fire1ce/UDM-Persistent-SSH-Keys/main/99-ssh-keys.sh
mv 99-ssh-keys.sh /mnt/data/on_boot.d/99-ssh-keys.sh
chmod +x /mnt/data/on_boot.d/99-ssh-keys.sh
echo "99-ssh-keys.sh installed"

if [ ! -f "$user_authorized_keys_file" ]; then
  echo "Creating $user_authorized_keys_file"
  mkdir -p /mnt/data/ssh
  touch "$user_authorized_keys_file"
  chmod 0644 "$user_authorized_keys_file"
fi

echo "==> Add you public keys to $user_authorized_keys_file"
echo "==> Done."
exit 0
