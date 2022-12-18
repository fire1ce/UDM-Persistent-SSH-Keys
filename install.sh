#!/bin/sh

# Get DataDir location
DATA_DIR="/mnt/data"
case "$(ubnt-device-info firmware || true)" in
    1*)
      DATA_DIR="/mnt/data"
      ;;
    2*)
      DATA_DIR="/data"
      ;;
    3*)
      DATA_DIR="/data"
      ;;
    *)
      echo "ERROR: No persistent storage found." 1>&2
      exit 1
      ;;
  esac

user_authorized_keys_file="$DATA_DIR/ssh/authorized_keys"
udm_authorized_keys_file="/root/.ssh/authorized_keys"

curl -sO https://raw.githubusercontent.com/fire1ce/UDM-Persistent-SSH-Keys/main/99-ssh-keys.sh
mv 99-ssh-keys.sh $DATA_DIR/on_boot.d/99-ssh-keys.sh
chmod +x $DATA_DIR/on_boot.d/99-ssh-keys.sh
echo "99-ssh-keys.sh installed"

if [ ! -f "$user_authorized_keys_file" ]; then
  echo "Creating $user_authorized_keys_file"
  mkdir -p $DATA_DIR/ssh
  mkdir -p /root/.ssh/
  touch "$user_authorized_keys_file $udm_authorized_keys_file"
  chmod 0644 "$user_authorized_keys_file $udm_authorized_keys_file"
fi

echo "==> Add you public keys to $user_authorized_keys_file"
echo "==> Done."
exit 0
