# UDM Persistence SSH Keys

## Persistence on Reboot

This script need to run every time the system is rebooted since the **/root/.ssh/authorized_keys** overwrites every boot.  
This can be accomplished with a boot script. Flow this guide: [UDM / UDMPro Boot Script](https://github.com/unifi-utilities/unifios-utilities/tree/main/on-boot-script)

## Compatibility

- Tested on [UDM PRO][amz-udm-pro-url]
- UDM Pro doesn't support **ed25519** SSH Keys


## Installation

The script was tested on UDM PRO

(!) Depending on firmware your $DATA_DIR will be "/mnt/data" (Firmware 1.x) or "/data" (Firmware 2.x and 3.x)

```shell
curl -s https://raw.githubusercontent.com/fire1ce/UDM-Persistent-SSH-Keys/main/install.sh | sh
```

Add you public RSA keys to:

```shell
$DATA_DIR/ssh/authorized_keys
```

## Uninstall

Delete the 99-ssh-keys.sh file

```shell
rm -rf $DATA_DIR/on_boot.d/99-ssh-keys.sh
```

Delete your authorized_keys file

```shell
rm -rf $DATA_DIR/ssh/authorized_keys
```

## Usage

At boot the script with read the **$DATA_DIR/ssh/authorized_keys** file and add the content to UDM's **/root/.ssh/authorized_keys**

Manual run:

```shell
$DATA_DIR/on_boot.d/99-ssh-keys.sh
```

<!-- --- -->

[amz-udm-pro-url]: https://amzn.to/3J4fezk 'Amazon Unifi UDM Pro'

<!-- --- -->
