# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|

# config.vm.box = "ubuntu/trusty64"
  config.vm.box = "dummy"

#  config.vm.provider "virtualbox" do |vb|
#    vb.memory = "512"
#  end
 
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = ENV['AWS_ACCESS_KEY']
    aws.secret_access_key = ENV['AWS_SECRET_KEY']
    aws.region = "eu-central-1"
    aws.keypair_name = "wm-jug2"

    # Default ami - ubuntu-trusty-14.04-amd64-server-20150325 (Frankfurt)
    aws.ami = "ami-accff2b1"

    # Simple region-specific AMI config
    aws.region_config "eu-central-1", :ami => "ami-accff2b1"

    aws.instance_type = "t2.micro"
    aws.subnet_id = "subnet-b04fe3d9"

    aws.tags = {
      'Name' => 'vagrant-payara-micro',
    }
    
    aws.security_groups = "sg-908032f9"

    aws.user_data = File.read("userdata.sh")

    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = "/home/mike/.ssh/wm-jug2.pem"
  end 

  config.vm.define "one" 
  config.vm.define "two"
  config.vm.define "three"
  config.vm.define "four"
  

end
