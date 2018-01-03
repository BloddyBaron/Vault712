# Vault 712

Vault 712 is a Grin installer for the MimbleWimble protocol. It will install Grin and all prerequisites on your linux computer. Vault 712 is also an interactive shell that allows you to run the Grin server for mining and the Grin wallet and sending/receiving the cryptocurrency Grin. 

## Getting Started

1) Run the command below to download the script

```
wget https://raw.githubusercontent.com/BloddyBaron/Vault712/master/vault712.sh
```

2) Run the main shell script by executing ```./vault712``` on the command line interface 

3) Run ```chmod +x on vault712.sh``` to make sure you have permissions to run it on the command line interface

4) Follow the instructions in the terminal prompt to proceed with the installation

![alt text](https://user-images.githubusercontent.com/32465294/34165766-18ca3724-e4d5-11e7-9077-427a79e215d2.png)

NOTE: Grin is not yet live, and is only on testnet. 

This script is mainly used for testing and fast deployment of the latest Grin as well as testing features in the latest Grin build. 

The installation script works independently of starting a node and server, and can be closed and opened independently to run different optional commands for Grin. 

### Requirements

* Linux - Primary platform (x86 only, at present)
* Ubuntu 16.04 or later, or you will have to install clang manually before running this script

### What will be installed

- Clang 3.6
- Latest Rust, if not already installed (NOTE! If you run older than Rust 1.21, Grin will not work, and you will manually have to update before running this script)
- The latest Grin with wallet and server. (NOTE! Grin is constantly updated and this script does not autoupdate. You need to delete the folder mw in $HOME to install the latest Grin with this script
- An interactive shell wallet to send/receive the cryptocurrency Grin

## Information

* More about Grin: https://github.com/mimblewimble/grin
* More about Grin compared to Bitcoin: https://github.com/mimblewimble/grin/blob/master/doc/grin4bitcoiners.md
* More information about Grin: http://grin-tech.org/
* More information about MimbleWimble & Grin development: https://lists.launchpad.net/mimblewimble/
