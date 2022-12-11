# vagrant kali with ansible

Configure a kali vagrant vm and make it ready at startup.

## How to

```
git clone https://github.com/NeuronAddict/ansible-kali
cd ansible-kali
cp config-example.yml config.yml
# configure your mv
nano config.yml # see bellow to config
# generate a vault password
mkdir .secret && chmod 700 .secret && touch .secret/vault.txt && chmod 600 .secret/vault.txt && pwgen 30 1 > .secret/vault.txt
# if you don't want use vault, comment or delete file ansible.cfg
vagrant up
# '\o/'
```

- VM can be destroyed and recreated with all stuff.
- reconfigure your kali box (install, parameters, ...) with vagrant provision
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

see config-example.yml.

## vault

You can set this var on config.yml, use a partial vault to be secure.
```
vagrant_shadow: # shadow hash for vagrant, avoid security risk (vagrant is sudo)
user_shadow: # shadow hash for the user
vpn.openvpn_username: # if vpn
vpn.openvpn_password:  # if vpn
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
