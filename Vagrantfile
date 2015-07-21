# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

# config.vm.box = "ubuntu/trusty64"
  config.vm.box = "dummy"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end
 
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

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
#  config.vm.provision "shell", inline: <<-SHELL
#    ##########################################
#    # Setting properties
#    #
#    # Payara directory
#    PAYARA_HOME=/opt/payara
#    MICRO=https://s3-eu-west-1.amazonaws.com/payara.co/payara-micro-prerelease.jar
#    #
#    ##########################################
#    
#    echo "Provisioning Payara Micro to $PAYARA_HOME"
#    
#    # Download and unzip to /opt/payara
#    echo "running update..."
#    sudo apt-get -qqy update                      # Update the repos 
#    
#    echo "installing openjdk"
#    sudo apt-get -qqy install openjdk-7-jdk       # Newest JDK in 14.04 LTS repos 
#    
#    echo "Downloading Payara $PAYARA_VERSION"
#    wget -q $MICRO 
#    sudo mkdir -p $PAYARA_HOME
#    mv payara-micro-prerelease.jar $PAYARA_HOME
#    sudo chown ubuntu:ubuntu /opt/payara
#  SHELL
end
