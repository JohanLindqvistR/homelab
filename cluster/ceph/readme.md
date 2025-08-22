
# thunderbolt network

on each node:
nano /etc/modules
```
thunderbolt
thunderbolt-net
```
nano /etc/network/interfaces

This fragment should go between the existing auto lo section and adapater sections.

```
iface en05 inet manual
#do not edit it GUI

iface en06 inet manual
#do not edit in GUI
```

If you see any thunderbol sections delete them from the file before you save it.

use ``` udevadm monitor ``` command to find your device IDs when you insert and remove each TB4 cable. Yes you can use other ways to do this, i recommend this one as it is great way to understand what udev does - the command proved more useful to me than the syslog or lspci command for troublehsooting thunderbolt issues and behavious. In my case my two pci paths are 0000:00:0d.2and 0000:00:0d.3 if you bought the same hardware this will be the same on all 3 units. Don't assume your PCI device paths will be the same as mine.

nano /etc/systemd/network/00-thunderbolt0.link
```
[Match]
Path=pci-0000:00:0d.2
Driver=thunderbolt-net
[Link]
MACAddressPolicy=none
Name=en05
```
nano /etc/systemd/network/00-thunderbolt1.link
```
[Match]
Path=pci-0000:00:0d.3
Driver=thunderbolt-net
[Link]
MACAddressPolicy=none
Name=en06
```
nano /etc/udev/rules.d/10-tb-en.rules
```
ACTION=="move", SUBSYSTEM=="net", KERNEL=="en05", RUN+="/usr/local/bin/pve-en05.sh"
ACTION=="move", SUBSYSTEM=="net", KERNEL=="en06", RUN+="/usr/local/bin/pve-en06.sh"
```
nano /usr/local/bin/pve-en05.sh
```
#!/bin/bash

LOGFILE="/tmp/udev-debug.log"
VERBOSE="" # Set this to "-v" for verbose logging
IF="en05"

echo "$(date): pve-$IF.sh triggered by udev" >> "$LOGFILE"

# If multiple interfaces go up at the same time, 
# retry 10 times and break the retry when successful
for i in {1..10}; do
    echo "$(date): Attempt $i to bring up $IF" >> "$LOGFILE"
    /usr/sbin/ifup $VERBOSE $IF >> "$LOGFILE" 2>&1 && {
        echo "$(date): Successfully brought up $IF on attempt $i" >> "$LOGFILE"
        break
    }
  
    echo "$(date): Attempt $i failed, retrying in 3 seconds..." >> "$LOGFILE"
    sleep 3
done
```
nano /usr/local/bin/pve-en06.sh
```
#!/bin/bash

LOGFILE="/tmp/udev-debug.log"
VERBOSE="" # Set this to "-v" for verbose logging
IF="en06"

echo "$(date): pve-$IF.sh triggered by udev" >> "$LOGFILE"

# If multiple interfaces go up at the same time, 
# retry 10 times and break the retry when successful
for i in {1..10}; do
    echo "$(date): Attempt $i to bring up $IF" >> "$LOGFILE"
    /usr/sbin/ifup $VERBOSE $IF >> "$LOGFILE" 2>&1 && {
        echo "$(date): Successfully brought up $IF on attempt $i" >> "$LOGFILE"
        break
    }
  
    echo "$(date): Attempt $i failed, retrying in 3 seconds..." >> "$LOGFILE"
    sleep 3
done
```
chmod +x /usr/local/bin/*.sh

update-initramfs -u -k all

reboot

# Ceph

https://www.youtube.com/watch?v=YzgKkgQFXSM


## SDN

In proxmox gui

Datacenter - SDN - Fabrics -  Create Openfabric

cephmesh
10.0.10.0/24

Add node
draup-pve1
10.0.10.11
ens05
ens06

Add node
draup-pve2
10.0.10.12
ens05
ens06

Add node
draup-pve3
10.0.10.13
ens05
ens06

Datacenter - SDN - Apply

Ping test

## Cephmesh

each node:

Ceph - Install Ceph - Squid - No Subcription

First node - public network - 10.0.10.0/24

after installation
add node 2 and 3 as monitor and mgr

Ceph - Monitor add monitor - draup-pve2 draup-pve3

Ceph - Monitor add manager - draup-pve2 draup-pve3

## OSD

each node

Ceph - OSD - select disk

## Pool

Ceph - Pools - create - ceph






