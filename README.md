# vagrant kali with ansible

## config

Fill config.yml

```
apt_proxy: host:port # leave blank to not use apt proxy
default_user: me # default user, use this user to make kali fun things
git_user: # your git user
git_email: # git email
timezone: Europe/Paris # timezone
vpn_ip_pattern: 192.168 # if vpn is activated, this is a pattern to get the IP
vpn_name: # blank to not use vpn
# if not blank, you must add a file with {{ vpn_name }}.conf in roles/vpn/files/etc/openvpn with your openvpn conf
vm_name: 'my-awesome-vm' # name of the vm
upgrade_on_playbook: true # upgrade vm on playbook, can be very long !
intnet_dhcp: true # use an intnet vbox with dhcp
```

## vault

vault.yml
```
user_shadow: # shadow hash for the user
openvpn_username: # if vpn
openvpn_password:  # if vpn
```

## vendor

If you use vendor products put it on roles/vendor/


## user

To create user shadow : 

```
python -c "import random,string,crypt;
randomsalt = ''.join(random.sample(string.ascii_letters,8));
print crypt.crypt('MySecretPassword', '\$6\$%s\$' % randomsalt)"
---
$6$HMpFTkgb$WqzuqMqYbjWsXFrOtvZPo.1gIkH6HiXJGr4QPv.k26jE.3mE.sdf3dds[...]
```

Source: https://www.shellhacks.com/linux-generate-password-hash/

## stranges chars

https://github.com/Guake/guake/issues/877