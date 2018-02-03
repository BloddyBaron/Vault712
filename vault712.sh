#!/bin/bash
##Running Grin made bloddy easy
##Vault 712 by BloddyBaron
##Download on https://github.com/BloddyBaron/Vault712

##Config setup
GrinLog=/root/mw/grin/server/grin.log


##Rust installer function
rust_installer()
{
sudo apt-get update -y
sudo apt-get install build-essential cmake -y	
	
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
}

##Clang installer function
clang_installer()
{
sudo apt-get update
sudo apt-get install clang-3.8
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
cargo build --verbose
mkdir node1 server
cp grin.toml node1/ 
cp grin.toml server/
main_menu
}

#Reinstall Grin
reinstall_grin()
{
rm -rf $HOME/mw
cd $HOME
mkdir mw/
cd mw
git clone https://github.com/mimblewimble/grin.git
cd grin
git checkout milestone/testnet1
cargo build --verbose
mkdir node1 server
cp grin.toml node1/ 
cp grin.toml server/
main_menu
}

##Start node function
my_node()
{
cd $HOME/mw/grin/node1
export PATH=$HOME/mw/grin/target/debug:$PATH
if [ -f "$HOME/mw/grin/node1/wallet.seed" ]
then
    echo Grin Node is now running, please keep this window open
    grin wallet -p password -e listen
else
    echo Grin Node is now running, please keep this window open
    grin wallet init
    grin wallet -p password -e listen
fi
}

##Start server function
my_server()
{
cd $HOME/mw/grin/server
export PATH=$HOME/mw/grin/target/debug/:$PATH
grin server -m run
}

##Start server function non mining
my_server_nonmining()
{
cd $HOME/mw/grin/server
export PATH=$HOME/mw/grin/target/debug/:$PATH
grin server run
}

##Start spend balance function
my_spendbalance()
{
cd $HOME/mw/grin/node1
export PATH=/$HOME/mw/grin/target/debug/:$PATH
if [ -f "$HOME/mw/grin/node1/wallet.seed" ]
then
    grin wallet -p password info
    echo "Press ENTER To Return"
    read continue
else
    grin wallet init
    grin wallet -p password info
    echo "Press ENTER To Return"
    read continue
fi
}

##Start output function
my_outputs()
{
cd $HOME/mw/grin/node1
export PATH=$HOME/mw/grin/target/debug/:$PATH
if [ -f "$HOME/mw/grin/node1/wallet.seed" ]
then
    grin wallet -p password outputs
    echo "Press ENTER To Return"
    read continue
else
    grin wallet init
    grin wallet -p password outputs
    echo "Press ENTER To Return"
    read continue
fi
}

##Start output function in detail
my_outputs_detailed()
{
cd $HOME/mw/grin/node1
if [ -f "$HOME/mw/grin/node1/wallet.seed" ]
then
    cat wallet.dat
    echo "Press ENTER To Return"
    read continue
else
    grin wallet init
    grin wallet -p password
    cat wallet.dat
    echo "Press ENTER To Return"
    read continue
fi
}

##Start the main part of the application menu if Grin and prerequisites are installed
main_menu()
{

while :
do
    clear
    cat << "EOF" 
          __      __         _ _     ______ __ ___  
          \ \    / /        | | |   |____  /_ |__ \ 
           \ \  / /_ _ _   _| | |_      / / | |  ) |
            \ \/ / _` | | | | | __|    / /  | | / / 
             \  / (_| | |_| | | |_    / /   | |/ /_ 
              \/ \__,_|\__,_|_|\__|  /_/    |_|____|                                                                                                                                   
EOF
    
	echo " "
	echo -e "Grin has been succesfully installed, please choose one of the options below.\nNOTE: You must start the Grin server and node before choosing other options\n"
	echo -e "Please select an option\n"
	echo "GRIN MAIN OPTIONS"
	echo "1) Start a Grin Node"
	echo "2) Start a Grin Mining Server"
	echo "3) Start a Non-Mining Server"
	echo "4) Shutdown all Grin Nodes & Servers"
	echo ""
	echo "GRIN DEBUG OPTIONS"
	echo "5) View Confirmed & Spendable Balance "
    echo "6) Show Individual Outputs"
    echo "7) Show Detailed Individual Outputs"
    echo ""
    echo "GRIN SEND & RECEIVE OPTIONS"
	echo "8) Send Grin to an IP:PORT"
	echo "9) Receive Grin to an IP:PORT"
	echo "10) Send Grin to Termbin"
	echo "11) Receive Grin from Termbin"
	echo "12) Send Grin to an Email"
    echo ""
    echo "VAULT 712 OPTIONS"
    echo "13) Reinstall Grin To Latest Available"
	echo "14) Exit"
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
		10) option_10;;
		11) option_11;;
		12) option_12;;
	    13) option_13;;
		14) exit 0;;
		*) echo "Error, invalid input, press ENTER to go back"; read;;
	esac
done
}

option_1()
{
   ##export function, run a new shell starting the wallet/node listener
   export -f my_node
   $(gnome-terminal --tab -e "bash -c 'my_node'")  
}

option_2()
{
    ##export function, run a new shell starting the server
	export -f my_server
	$(gnome-terminal --tab -e "bash -c 'my_server'")
}

option_3()
{   
    ##export function, run a new shell starting the server
	export -f my_server_nonmining
	$(gnome-terminal --tab -e "bash -c 'my_server_nonmining'")
}

option_4()
{
	##shutdown any Grin process
	killall -9 grin
	main_menu
}

option_5()
{
    ##export function, run a new shell
	export -f my_spendbalance
	$(gnome-terminal --tab -e "bash -c 'my_spendbalance'")
}

option_6()
{
    ##export function, run a new shell
	export -f my_outputs
	$(gnome-terminal --tab -e "bash -c 'my_outputs'")
	
}

option_7()
{
	export -f my_outputs_detailed
	$(gnome-terminal --tab -e "bash -c 'my_outputs_detailed'")
}

option_8()
{
	echo "option 8"
	##TODO
}

option_9()
{
	echo "option 9"
	##TODO
}

option_10()
{
	echo This option will send Grins to Termbin and can be claimed by anyone that knows the url
	read -p 'Please enter amount to send: ' amountvar
	grin wallet -p password send $amountvar
	termbinvar="$( $amountvar | nc termbin.com 9999)"
	echo Share this url to allow someone to claim the output: "$termbinvar"
	echo Press any key to return
	read
}

option_11()
{
	echo "option 11"
	##TODO

}

option_12()
{
	echo "option 12"
	##TODO

}

option_13()
{
	export -f reinstall_grin
	$(gnome-terminal --tab -e "bash -c 'reinstall_grin'")

}

##Check if Clang is installed
if [ "type -p clang-3.8" ];
then
	:
else
	clang_installer
fi

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
