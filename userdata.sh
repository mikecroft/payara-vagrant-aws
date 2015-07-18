#!/bin/bash

##########################################
# Setting properties
#
# Payara directory
PAYARA_HOME=/opt/payara
MICRO=https://s3-eu-west-1.amazonaws.com/payara.co/payara-micro-prerelease.jar
#
##########################################

echo "Provisioning Payara Micro to $PAYARA_HOME"

# Download and unzip to /opt/payara
echo "running update..."
sudo apt-get -qqy update                      # Update the repos 

echo "installing openjdk"
sudo apt-get -qqy install openjdk-7-jdk       # Newest JDK in 14.04 LTS repos 

echo "Downloading Payara $PAYARA_VERSION"
wget -q $MICRO 
sudo mkdir -p $PAYARA_HOME
mv payara-micro-prerelease.jar $PAYARA_HOME
sudo chown ubuntu:ubuntu /opt/payara
