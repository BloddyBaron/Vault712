#!/bin/bash
##Running Grin made bloddy easy
##Vault 712 by BloddyBaron
##Download on https://github.com/BloddyBaron/Vault712
cd $HOME/mw/grin/server
export PATH=$HOME/mw/grin/target/debug/:$PATH
grin server --mine run
