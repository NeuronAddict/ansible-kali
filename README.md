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

## CTF mode

In this mode, you use a vpn, but just for ip. DNS are the host dns.

set vpn.openvpn_username ans vpn.openvpn_password with username/password.
set vpn.ip_pattern with the begin of your vpn address.

set vpn.name.

upload your vpn conf in openvpn/ folder and name it {{ vpn.name }}.conf.
set vpn.enabled to got vpn at startup.

Now, in kali you can use the command `set_victim $IP` to set the target box. All network will be open only for this machine (be areful on CTF with many players).

Leave dns.upstream to 10.0.2.3, this is the default for vagrant.

NOTE: vpn with credentials need the line `auth-user-pass /etc/openvpn/auth.txt`. File is populated with credentials.

## audit mode

In this mode, maybe you want more privacy.

Set dns.upstream with your dns server (ex: 9.9.9.9).

Set your vpn, you can vault the vpnfile and include keys inside.


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

If you use vendor products put it on vendor/, they will be copieds in ~/vendor.

## stranges chars

https://github.com/Guake/guake/issues/877
