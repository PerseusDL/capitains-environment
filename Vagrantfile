# Prerequisites
# Vagrant
# Virtual Box
# vagrant plugin install vagrant-aws
# vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :capitains do |x|
    x.vm.box = "hashicorp/precise64"
    x.vm.hostname = "capitains"

    x.vm.provider :virtualbox do |v|
      v.name = "capitains"
    end

    x.vm.provider :aws do |aws, override|
      aws.access_key_id = ENV['AWS_KEY']
      aws.secret_access_key = ENV['AWS_SECRET']
      aws.keypair_name = ENV['AWS_KEYNAME']
      aws.ami = "ami-fce3c696"
      aws.region = "us-east-1"
      aws.instance_type = "m3.medium"

      override.vm.box = "dummy"
      override.ssh.username = "ubuntu"
      override.ssh.private_key_path = ENV['AWS_KEYPATH']
    end
  end
  config.vm.provision :shell, :path => "vagrant/bootstrap.sh", :privileged => true
  config.vm.provision :shell, :path => "vagrant/apps.sh", :privileged => true
end

