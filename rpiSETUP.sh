#!/usr/bin/bash

### made by: thadddd
#### March 26, 2023
##### https://github.com/thadddd/setup_files.git
###### Logging script for setup.sh - Automated Setup Script for Raspberry Pi
####### Version v1.0

dscr=/home/dddd_scripts
set=/home/dddd_scripts/setup_files

start(){
    clear;
    if [ ! -d /usr/bin/git ]
        then
            sudo apt install -y git;
    fi
    git config --global user.name "thadddd";
    git config --global user.email "dauthement@virlp.com";
    git clone https://github.com/thadddd/setup_files.git;
    sudo chmod +x $set/setup.sh;
    cd $set || return;
    sudo ./setup.sh
        
}

if [ -d $dscr ]
    then
        cd $dscr || return;
    else
         mkdir -p $dscr;
        cd $dscr || return;
fi
mkdir -p $dscr/logs
sudo chmod ugo+rwx /home -R
touch $dscr/logs/log.out
start >> $dscr/logs/log.out