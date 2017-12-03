#!/bin/bash
##Running Grin made bloddy easy
##Vault 712 by BloddyBaron
##Download on https://github.com/BloddyBaron/Vault712
cd $HOME/mw/grin/node1
export PATH=/$HOME/mw/grin/target/debug/:$PATH
if [ -f "$HOME/mw/grin/node1/wallet.seed" ]
then
    echo Grin Node is now running
    grin wallet -p password -e listen
else
    echo Grin Node is now running
    grin wallet init
    grin wallet -p password -e listen
fi

