# UDMP Persistence SSH Keys

## Persistence on Reboot

This sript need to run every time the system is rebooted since the __/root/.ssh/authorized_keys__ overwrites every boot.  
This can be accomplished with a boot script. Flow its guide [UDM / UDMPro Boot Script](https://github.com/boostchicken-dev/udm-utilities/tree/master/on-boot-script)

## Compatibility

  * Tested on UDM PRO
  * UDM Pro doesn't support __ed25519__ SSH Keys

## Installation

The script was tested on UDM PRO

```bash
curl https://raw.githubusercontent.com/fire1ce/UDMP-Persistence-SSH-Keys/main/install.sh | bash 
```

Add you public RSA keys to:

```bash
/mnt/data/ssh/authorized_keys
```

## Uninstall

Delete the 99-ssh-keys.sh file

```bash
rm -rf /mnt/data/on_boot.d/99-ssh-keys.sh
```

Delete your authorized_keys file

```bash
rm -rf /mnt/data/ssh/authorized_keys
```

## Usage

At boot the script with read the __/mnt/data/ssh/authorized_keys__ file and add the content to UDM's __/root/.ssh/authorized_keys__

Manual run:

```bash
/mnt/data/on_boot.d/99-ssh-keys.sh
```
