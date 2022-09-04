# vagrant kali with ansible

## config

create file config.yml on root.

```
apt_proxy: host:port # leave blank to not use apt proxy. if use vpn its better to user ipaddress (can interfere with vpn)
default_user: me # default user, use this user to make kali fun things
git_user: # your git user
git_email: # git email
timezone: Europe/Paris # timezone
vpn_ip_pattern: 192.168 # if vpn is activated, this is a pattern to get the IP, usefull for the set_victim script, that set an ip for a CTF
vpn_name: # blank or absent to not use vpn, if not blank, you must add a file with {{ vpn_name }}.conf in roles/vpn/files/etc/openvpn with your openvpn conf
vm_name: 'my-awesome-vm' # name of the vm
upgrade_on_playbook: true # upgrade vm on playbook, can be very long, use vagrant box update if possible !
intnet_dhcp: true # use an intnet vbox with dhcp
enabled_vpn: true # enable vpn at startup
autologin: true # do not prompt login on lightdm
no_screen_lock: true # disable lock screen (useful for vms with a complex password)
```

## vault

create an ansible vault.yml with the following content
```
vagrant_shadow: # shadow hash for vagrant, avoid security risk (vagrant is sudo)
user_shadow: # shadow hash for the user
openvpn_username: # if vpn
openvpn_password:  # if vpn
censys_api_id:  # api id for censys (optional)
censys_api_secret:  # api secret for censys (optional)
shodan_api_key: # api ky for shodan (optional)
```

To create user shadow from password :

```
python hash.py
```

Source: https://www.shellhacks.com/linux-generate-password-hash/

## vendor

If you use vendor products put it on roles/vendor/

## stranges chars

https://github.com/Guake/guake/issues/877

## vpn - systemd
https://wiki.archlinux.org/title/Systemd-resolved#Fallback
https://www.cyberciti.biz/faq/dhclient-etcresolvconf-hooks/
