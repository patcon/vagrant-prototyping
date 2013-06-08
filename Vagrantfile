# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'lib/proviso/helpers'
include Proviso::Helpers

case ENV['PROVISO_PROVIDER']
when /virtualbox/i, /vbox/i, nil
  ENV['VAGRANT_DEFAULT_PROVIDER'] = "virtualbox"
when /aws/i
  ENV['VAGRANT_DEFAULT_PROVIDER'] = "aws"
end

Vagrant.configure("2") do |config|
  config.vm.define "proviso"

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Awaiting on PR before using plugin_installed? helper method:
  # https://github.com/fgrehm/vagrant-cachier/pull/9
  config.cache.auto_detect = true # if plugin_installed?("cachier")

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provider :aws do |aws, override|
    aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
    aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    aws.keypair_name = "patcon-macbook"
    aws.region = "us-east-1"

    override.ssh.private_key_path = File.expand_path("~/.ssh/id_rsa")

    # Handled in upcoming 0.3.0 release:
    # https://github.com/mitchellh/vagrant-aws/pull/64
    override.vm.box_url = "https://dl.dropboxusercontent.com/u/7353431/aws-precise64.box"

  end

  case ENV['PROVISO_PROVISIONER']
  when /chef/i, nil
    config.librarian_chef.cheffile_dir = "chef"
    config.omnibus.chef_version = "11.4.4" if plugin_installed?("omnibus")

    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
      chef.roles_path = "chef/roles"
      chef.log_level = :debug if debug_mode?

      chef.add_role "base"
    end
  when /puppet/i
    config.vm.provision :puppet do |puppet|
      puppet.module_path    = "puppet/modules"
      puppet.manifests_path = "puppet/manifests"
      puppet.options = "--verbose --debug" if debug_mode?
    end
  end
end
