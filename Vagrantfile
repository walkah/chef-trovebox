# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "photo"
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :private_network, ip: "33.33.33.10"

  config.omnibus.chef_version = :latest

  config.berkshelf.enabled = true

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777"]

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'root',
        :server_debian_password => 'root',
        :server_repl_password => 'root',
        :allow_remote_root => true,
        :bind_address => '0.0.0.0',
      },
      :openphoto => {
        :dir => '/vagrant/frontend',
        :branch => 'development',
        :user => 'vagrant',
        :group => 'vagrant'
      },
      :php => {
        :conf_dir => "/etc/php5/apache2",
        :directives  => {
          :post_max_size => '50M',
          :upload_max_filesize => '50M'
        }
      }
    }

    chef.run_list = [
      "recipe[apt]",
      "recipe[openphoto::dev]"
    ]
  end
end
