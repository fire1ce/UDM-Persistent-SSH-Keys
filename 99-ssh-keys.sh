#!/bin/sh

user_authorized_keys_file="/mnt/data/ssh/authorized_keys"
udm_authorized_keys_file="/root/.ssh/authorized_keys"

# if /mnt/data/ssh/authorized_keys is missing print error message
if [ ! -f "$user_authorized_keys_file" ]; then
  echo "ERROR: $user_authorized_keys_file is missing"
  exit 1
fi

# Reads the user file line by line and adds the key to the authorized_keys file
file=$user_authorized_keys_file
while IFS= read -r line || [ -n "$line" ]; do
  echo $line >>$udm_authorized_keys_file
done <"$file"

exit 0
