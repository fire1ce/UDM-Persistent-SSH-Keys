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

# if $DATA_DIR/ssh/authorized_keys is missing print error message
if [ ! -f "$user_authorized_keys_file" ]; then
  echo "ERROR: $user_authorized_keys_file is missing"
  exit 1
fi

# Overwrite /root/.ssh/authorized_keys with $DATA_DIR/ssh/authorized_keys
echo "$(cat "$user_authorized_keys_file")" >"$udm_authorized_keys_file"

exit 0
