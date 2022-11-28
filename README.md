# vagrant kali with ansible

Configure a kali vagrant vm and make it ready at startup.

## How to

```
git clone https://github.com/NeuronAddict/ansible-kali
cd ansible-kali
cp config-example.yml config.yml
nano config.yml # see bellow to config
vagrant up
echo '\o/'
```

- VM can be destroyed and recreated with all stuff.
- No need to reconfigure your kali box (install, parameters, ...)
- Optional Autologin
- guake terminal configured
- useful for CTF (with vpn) or audit (with vpn + dns)
- git
- apt proxy for upgrades 
- auto upgrades
- many tools installed : discovery, apache for serve malware, tor
- no screen lock option
- osint tools
- ntp
- firewall
- ...

## issues

- https://github.com/NeuronAddict/ansible-kali/issues


## config

create file config.yml on root.

```
apt_proxy: host:port # leave blank to not use apt proxy. if use vpn its better to user ipaddress (can interfere with vpn)
default_user: me # default user, use this user to make kali fun things
git_user: # your git user
git_email: # git email
timezone: Europe/Paris # timezone
vpn_ip_pattern: 192.168 # if vpn is activated, this is a pattern to get the IP, usefull for the set_victim script, that set an ip for a CTF
vpn_name: # blank or absent to not use vpn, if not blank, you must add a file with {{ vpn_name }}.conf in openvpn with your openvpn conf
vm_name: 'my-awesome-vm' # name of the vm
upgrade_on_playbook: true # upgrade vm on playbook, can be very long, use vagrant box update if possible. box is automatically upgraded when run with unattended upgrades.
intnet_dhcp: true # use an intnet vbox with dhcp
enabled_vpn: true # enable vpn at startup
autologin: true # do not prompt login on lightdm
no_screen_lock: true # disable lock screen (useful for vms with a complex password)
local_domains: mydmz mydomain # domains to resolve with local dns (to work with vpn). Be carefaul, this can lead to dns leak if you resolve a public domain.
dns:
  fallback: 8.8.8.8 9.9.9.9 # fallback dns servers
  hosts: | # config to add on /etc/hosts
    192.168.1.66 awesome.local
  nosec: false # set to true to disable dnssec
```

## vault

You can set this var on config.yml, use a partial vault to be secure.
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
