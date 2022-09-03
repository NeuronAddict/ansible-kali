# -*- mode: ruby -*-
# vi: set ft=ruby :

current_dir    = File.dirname(File.expand_path(__FILE__))
vagrant_config = YAML.load_file("#{current_dir}/config.yml")

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "kalilinux/rolling"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  if vagrant_config['bridge_interface']
      config.vm.network "public_network", bridge: vagrant_config['bridge_interface']
  end
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "shared_kali", "/home/" + vagrant_config['default_user'] + "/shared", create: true, group:1001, owner: 1001

  if vagrant_config['intnet_dhcp']
    config.vm.network "private_network", virtualbox__intnet: true, type: "dhcp"
  end
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|

    vb.gui = true
    vb.memory = "16000"
    vb.cpus = 4

    vb.name = "kalilinux (vagrant) - " + vagrant_config['vm_name']
    vb.check_guest_additions = true

  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  config.vm.provision "ansible", run: "always" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "playbook.yml"
      ansible.vault_password_file = ".secret/vault-password.txt"
      ansible.extra_vars = {
        "ansible_python_interpreter": "/usr/bin/python3"
      }

    end

end
