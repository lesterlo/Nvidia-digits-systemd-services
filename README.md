# Nvidia-digits-systemd-services

## Table of Contents
* [Tested Environment](README.md#Tested-Environment)
* [Description](README.md#Description)
* [Installation](README.md#Installation)
* [Reference](README.md#Reference)

## Tested Environment

OS: Ubuntu Server 16.04.1

## Description

You can use this systemd script to run nvidia digits as services

## Tensorflow support
Modify the digits-devserver script and add the cuda path to solve the import tensorflow problem
```bash
#add cuda path
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
 
set -e
python2 -m digits $@
```

## Installation

### Auto Install

1. Run the script

 ```bash
sudo ./install.sh
```

### Manual Install

1. Copy nv-digits.service to /lib/systemd/system

 ```bash
sudo cp nv-digits.service /lib/systemd/system
```
2. Enable the service

 ```bash
sudo systemctl enable nv-digits.service   #Enable the server at startup
```
3. Reload the systemd

 ```bash
sudo systemctl daemon-reload              #Reload the systemd daemon
```
After that, Nvidia DIGITS will run at startup

* You can start, stop, restart the Nvidia DIGITS Manually by using the following command

 ```bash
sudo systemctl start nv-digits.service     #Start the DIGITS Server
sudo systemctl stop nv-digits.service      #Stop the DIGITS Server
sudo systemctl restart nv-digits.service#  #Restart the DIGITS Server
```
* You can view the status and console output by using the following command
 ```bash
sudo systemctl stauts nv-digits.service   #View Status
```

* You can disable the Nvidia DIGITS service by using the following command
 ```bash
sudo systemctl disable nv-digits.service  #Don't execute the server at startup
sudo systemctl stop nv-digits.service     #Stop the DIGITS Server
```

## Reference:
https://github.com/NVIDIA/DIGITS/blob/master/packaging/deb/templates/digits.service
