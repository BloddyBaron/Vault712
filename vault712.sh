#!/bin/sh
#running Grin made bloddy easy

cat << "EOF"
   _____      _         _____           _        _ _           
  / ____|    (_)       |_   _|         | |      | | |
 | |  __ _ __ _ _ __     | |  _ __  ___| |_ __ _| | | ___ _ __ 
 | | |_ |  __| |  _ \    | | |  _ \/ __| __/ _  | | |/ _ \  __|
 | |__| | |  | | | | |  _| |_| | | \__ \ || (_| | | |  __/ |   
  \_____|_|  |_|_| |_| |_____|_| |_|___/\__\__ _|_|_|\___|_|   

EOF
   
while true; do
    read -p "Do you wish to install Grin?"  yn
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
mkdir node1
mkdir server
cp grin.toml node1/
cp grin.toml server/
export PATH=/$HOME/mw/grin/target/debug/:$PATH
cd node1
grin wallet init
##TODO start wallet and server and add listener into main terminal output
#grin wallet -p password listen &&
#cd ..
#cd server
#grin server --mine run &&
echo Grin has been succesfully installed. To see your balance, run grin wallet -p password info



