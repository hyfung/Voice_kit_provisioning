# Google AIY Voice Kit Provisioning Guide

## Getting MAC Address of Raspberry Pi
### Booting Raspberry Pi
* Plug in the preconfigured SD card
* Plug in other necessary cables
* Plug in the power cable
* A green LED should be flashing during boot up
* When finish the screen should display a terminal ready for command

When the terminal is ready, type the following line and press enter to execute
> ifconfig

Your screen should display

```
lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 140  bytes 11194 (10.9 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 140  bytes 11194 (10.9 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

usb0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 192.168.11.2  netmask 255.255.255.0  broadcast 192.168.11.255
        ether 4a:5a:e1:cf:76:7a  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.0.193  netmask 255.255.255.0  broadcast 10.0.0.255
        inet6 fe80::2e51:706:3eec:e21b  prefixlen 64  scopeid 0x20<link>
        ether b8:27:eb:c7:db:82  txqueuelen 1000  (Ethernet)
        RX packets 1575  bytes 174284 (170.1 KiB)
        RX errors 0  dropped 617  overruns 0  frame 0
        TX packets 216  bytes 32030 (31.2 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

Refer to the **wlan0** session and note the **ether** line.

The mac address is in the form of xx:xx:xx:xx:xx:xx which corresponds to **b8:27:eb:c7:db:82** in thise case

Note the MAC address and type **sudo poweroff** in the terminal to poweroff the AIY kit

## Provisioning Voice Kits

### Batch Restart
TODO

### Batch Poweroff
TODO

### Batch Reload Factory Config
TODO
