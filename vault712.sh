#!/bin/sh
##Running Grin made bloddy easy
##Vault 712 by BloddyBaron
##Download on https://github.com/BloddyBaron/Vault712

##Rust installer function
rust_installer()
{
sudo apt-get update -y
sudo apt-get install build-essential cmake -y	
	
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
}

##Grin installer function
main_installer()
{
while true; do
    read -p "Do you wish to install Grin? "  yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
cd $HOME
mkdir mw/
cd mw
git clone https://github.com/mimblewimble/grin.git
cd grin
git checkout milestone/testnet1
cargo build
mkdir node1 server
cp grin.toml node1/ 
cp grin.toml server/
main_menu
}

##Start the main part of the application menu if Grin and prerequisites are installed
main_menu()
{

while :
do
    clear
    cat << "EOF"
      _____      _        __          __   _ _      _      
     / ____|    (_)       \ \        / /  | | |    | |  
    | |  __ _ __ _ _ __    \ \  /\  / /_ _| | | ___| |_ 
    | | |_ | '__| | '_ \    \ \/  \/ / _` | | |/ _ \ __|
    | |__| | |  | | | | |    \  /\  / (_| | | |  __/ |_ 
     \_____|_|  |_|_| |_|     \/  \/ \__,_|_|_|\___|\__|
                                                     
          __      __         _ _     ______ __ ___  
          \ \    / /        | | |   |____  /_ |__ \ 
           \ \  / /_ _ _   _| | |_      / / | |  ) |
            \ \/ / _` | | | | | __|    / /  | | / / 
             \  / (_| | |_| | | |_    / /   | |/ /_ 
              \/ \__,_|\__,_|_|\__|  /_/    |_|____|                                                                                                                                   
EOF
    
	echo " "
	echo "Grin has been succesfully installed, please choose one of the options below. NOTE: You must start the Grin server and node before choosing other options\n"
	echo "Please select an option\n"
	echo "1) Start a Grin Node"
	echo "2) Start a Grin Mining Server"
	echo "3) View Confirmed & Spendable Balance "
	echo "4) Send Grin to an IP:PORT"
	echo "5) Receive Grin to an IP:PORT"
	echo "6) Send Grin to Termbin"
	echo "7) Receive Grin from Termbin"
	echo "8) Send Grin to an Email"
	echo "9) Show Individual Outputs"
	echo "10) Exit"
	echo "====================================="
	
	read m_menu
	
	case "$m_menu" in
	
		1) option_1;;
		2) option_2;;
		3) option_3;;
		4) option_4;;
		5) option_5;;
		6) option_6;;
		7) option_7;;
		8) option_8;;
		9) option_9;;
		10) exit 0;;
		*) echo "Error, invalid input, press ENTER to go back"; read;;
	esac
done
}

option_1()
{
	echo "\nPress ENTER To Start a Grin Node..."
    read continue
    ##open terminal and run a new shell starting the wallet/node listener
    chmod +x vault712_node.sh
    gnome-terminal --tab -e "./vault712_node.sh"  
	return
}

option_2()
{
    echo "\nPress ENTER To Start a Grin Server..."
    read continue
    ##open terminal and run a new shell starting the server
    chmod +x vault712_server.sh
    gnome-terminal --tab -e "./vault712_server.sh" 
	return
}

option_3()
{   
	chmod +x vault712_wallet.sh
    gnome-terminal --tab -e "./vault712_wallet.sh"
	read
	return
}

option_4()
{
	echo "option 4"
	##TODO
    read
	return
}

option_5()
{
	echo "option 5"
	##TODO
    read
	return
}

option_6()
{
	echo "option 6"
	##TODO
    read
	return
}

option_7()
{
	echo "option 7"
	##TODO
    read
	return
}

option_8()
{
	echo "option 8"
	##TODO
    read
	return
}

option_9()
{
	chmod +x vault712_wallet.sh
    gnome-terminal --tab -e "./vault712_outputs.sh"
	read
	return
}

##Check if Rust is installed
if [ "type -p rustc" ];
then
     :
else 
     rust_installer
fi

##Check if Grin is installed
if [ -d "$HOME/mw/grin/" ];
then
    main_menu
else
    main_installer
fi
