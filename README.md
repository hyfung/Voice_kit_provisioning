# Google AIY Voice Kit Provisioning Guide
Refer to this page for official support: https://aiyprojects.withgoogle.com/voice/

## Five Basic Command

|Cmd|Usage|Explanation|
|-|-|-|
|ls|ls|Show contents of current folder|
|cd|cd `FOLDER`|Used to navigate in terminal|
|python3|python3 `script.py`|Used to run a python script|
|nano|nano `filename`|A simple text editor|
|sudo poweroff|sudo poweroff|Used to turn off the kit gracefully|

## Installing Cloud API Keys
Place the keys in your home directory `~/`.

Please refer to the offical guide on how to obtain the keys.

|Name|Description|
|-|-|
|cloud_speech.json|Used by Cloud Speech API|
|assistant.json|Used by Google Assistant API|

Sample file content

> assistant.json
```
{
    "installed": {
        "client_id": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx.apps.googleusercontent.com",
        "project_id": "xxxxxxxxxxxxx",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_secret": "xxxxxxxxxxxxxxxxxxxxx"
    }
}
```

> cloud_speech.json
```
{
    "type": "service_account",
    "project_id": "xxxxxxx",
    "private_key_id": "d1cc598e4aa1ec00faxxxxxxxxxxxxxxxx",
    "private_key": "-----BEGIN PRIVATE KEY-----\nxxxxxxxxxxxxxxx\n-----END PRIVATE KEY-----\n",
    "client_email": "xxxxxxx@hxxxxx.iam.gserviceaccount.com",
    "client_id": "1004536440539xxxxxxxx",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/xxxxxxxxxxn.iam.gserviceaccount.com"
}
```

## Hard-coding Wifi SSID
Location of the configuration file:
> /etc/wpa_supplicant/wpa_supplicant.conf

To edit this file, type
> sudo nano /etc/wpa_supplicant/wpa_supplicant.conf

The content of that file determines which SSID it will connect to automatically.
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=HK

network={
	ssid="SSID_NAME" <------- SSID Name
	psk="SSID_PASSWORD" <---- SSID Password
        scan_ssid=1 <------------ Add this line for hidden SSID
	key_mgmt=WPA-PSK
}
```

Reboot the Raspberry Pi to see the effect
> sudo reboot

## Getting MAC Address of Raspberry Pi
### Booting Raspberry Pi
* Plug in the preconfigured SD card (For faster loading time another image has been used)
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
        ether b8:27:eb:c7:db:82  txqueuelen 1000  (Ethernet) <-------------- Refer to this line
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
Batch restart functionality is provided by the [reboot_all.sh](https://github.com/hyfung/Voice_kit_provisioning/blob/white/reboot_all.sh) script.

TODO

### Batch Poweroff
Batch poweroff functionality is provided by the [poweroff_all.sh](https://github.com/hyfung/Voice_kit_provisioning/blob/white/poweroff_all.sh) script.

TODO

### Batch Reload Factory Config
TODOS
* Define a factory config
* Gzip everything into a tar.gz and store it somewhere safe locally
* Write a script locally to unpack the tar.gz when invoked
* Add a teacher script to invoke that local script remotely
