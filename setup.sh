#!/usr/bin/bash

## ### ## ### ## ###
### start logfile
## ### ## ### ## ###

#(

### made by: thadddd
#### March 26, 2023
##### https://github.com/thadddd
###### Automated Setup Script for Raspberry Pi
####### Version v1.0

# # # # #
## color var
# # # # #

#blk='\e[0;30m'
red='\e[0;31m'
grn='\e[0;32m'
ylw='\e[0;33m'
blu='\e[0;34m'
prp='\e[0;35m'
cyn='\e[0;36m'
gry='\e[0;37m'
noc='\e[0;0m'

# # # # #
## normal var
# # # # # 

ID=0
WD=0
upd='sudo apt update'
#upg='sudo apt upgrade -y'
fupg='sudo apt full-upgrade -y'
atrm='sudo apt autoremove -y'
bin=/usr/bin
inst='sudo apt install -y'
tspl='=-><-==->'
tspr='<-==-><-='
mspl="=-><-="
mspr="<-==-><-==-><-="
spac="=-><-==-><-==-><-="
ech='echo -e'
WD1="Alpha AWUS036AC"
WD2="Alpha AWUS1900"
WD3="BrosTrend AC1L/AC3L"
WD4="NinePlus"
ID1="Kali 32bit"
ID2="Kali 64bit"
ID3="Ubuntu 22.04 32bit"
ID4="Ubuntu 22.04 64bit"
ID5="Raspian Bullseye 32bit"
ID6="Raspian Bullseye 64bit"
ID7="OpenAuto PRO"
ID8="OpenWRT"
package_list=(aptitude sceen git net-tools aircrack-ng wifite hcxtools hcxdumptool bully macchanger dkms bc build-essentials libelf-dev mokutil wireshark gpsd gpsd-clients rtl-sdr gqrx-sdr)



# # # # # 
## supporting functions
# # # # # 

instDIST(){
    clear;
    update;
    if [[ $ID == 1 ]] || [[ $ID == 2 ]]
        then
            $inst kalipi-linux-headers;
        if [[ $ID == 3 ]] || [[ $ID == 4 ]]
            then
                $inst linux-headers-raspi;
            if [[ $ID == 5 ]] || [[ $ID == 6 ]]
                then
                    $inst raspberrypi-kernal-headers;
            fi
        fi
    fi
    pkgIN;
}

instWIFI(){
    clear;
    if [[ $WD == 1 ]]
        then
            $ech "$red$tspl$grn Installing $WD1 Drivers $red$tspr$noc";
            mkdir -p ~/src;
            cd ~/src || return; 
            git clone https://github.com/morrownr/8812au-20210629.git;
            cd ~/src/8812au-20210629 || return;
            sudo ./install-driver.sh
                sudo touch 8812au.conf;
                echo "options 8812au rtw_drv_log_level=1 rtw_led_ctrl=1 rtw_vht_enable=1 rtw_switch_usb_mode=1 rtw_power_mgnt=0" | sudo tee -a 8812au.conf;
                sudo cp /etc/modprobe.d/8812au.conf /etc/modprobe.d/8812au.conf.bk;
                sudo mv -f 8812au.conf /etc/modprobe.d/8812au.conf;
                echo -ne "
                    $grn$tspl$ylw Installation Complete$grn$tspr$noc";
                    sleep 2;
    fi
    if [[ $WD == 2 ]]
        then
            $ech "$red$tspl$grn Installing $WD2 Drivers $red$tspr$noc";
            sudo mkdir -p ~/src;
            cd ~/src || return;
            git clone https://github.com/morrownr/8814au.git;
            cd ~/src/8814au || return;
            sudo ./install-driver.sh;
                sudo touch 8814au.conf;
                echo options 8814au rtw_drv_log_level=1 rtw_led_ctrl=1 rtw_vht_enable=1 rtw_switch_usb_mode=1 rtw_power_mgnt=0 | sudo tee -a 8814au.conf;
                sudo cp /etc/modprobe.d/8814au.conf /etc/modprobe.d/8814au.conf.bk;
                sudo mv -f 8814au.conf /etc/modprobe.d/8814au.conf;
                echo -ne "
                    $grn$tspl$ylw Installation Complete$grn$tspr$noc";
                    sleep 2;
    fi
    if [[ $WD == 3 ]]
        then
            $ech "$red$tspl$grn Installing $WD3 Drivers $red$tspr$noc";
            sudo sh -c 'wget linux.brostrend.com/install -O /tmp/install && sudo sh /tmp/install';
            echo -ne "
                    $grn$tspl$ylw Installation Complete$grn$tspr$noc";
                    sleep 2;
    fi
    if [[ $WD == 4 ]]
        then
            $ech "$red$tspl$grn Installing $WD4 Drivers $red$tspr$noc";
            sudo mkdir -p ~/src;
            cd ~/src || return;
            git clone https://github.com/morrownr/88x2bu-20210702.git;
            cd ~/src/88x2bu-20210629 || return;
            sudo ./install-driver.sh;
                sudo touch 88x2bu.conf;
                echo options 88x2bu rtw_drv_log_level=1 rtw_led_ctrl=1 rtw_vht_enable=1 rtw_switch_usb_mode=1 rtw_power_mgnt=0 | sudo tee -a 88x2bu.conf;
                sudo cp /etc/modprobe.d/88x2bu.conf /etc/modprobe.d/88x2bu.conf.bk;
                sudo mv -f 88x2bu.conf /etc/modprobe.d/88x2bu.conf;
                echo -ne "
                    $grn$tspl$ylw Installation Complete$grn$tspr$noc";
                    sleep 2;
    fi
    gpsdSET;
}

update(){
    echo -ne "
        $red$spac$grn Updating System $red$spac $noc"
        $upd;
        $fupg;
        $atrm;
}

pkgIN(){
    for pkg in "${package_list[@]}"
        do
        $ech "$red$spac $grn Checking for $pkg $red$spac";
            if [ -f $bin/"$pkg" ]
                then
                    $ech "$ylw $pkg Installed $noc";
                else
                    $inst "$pkg";
            fi
    done
}

pkgINST1(){
    clear;
    echo -ne "
        $red$spac $grn$pkg Install $red$spac $noc"
            if [ -f $bin/"$pkg" ]
                then   
                    $ech -n" $grn $pkg already installed $noc"
                else
                    $inst "$pkg"
            fi
}

kisSET(){
    clear;
    echo -ne "
        $red$spac $grn Kismet Install $red$spac $noc";
        update;
    if [[ $ID == 1 ]] || [[ $ID == 2 ]]
        then
            wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key | sudo apt-key add -;
            echo 'deb https://www.kismetwireless.net/repos/apt/git/kali kali main' | sudo tee /etc/apt/sources.list.d/kismet.list;
            $upd;
            $inst kismet;
        if [[ $ID == 3 ]] || [[ $ID == 4 ]]
            then
                wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key | sudo apt-key add -;
                echo 'deb https://www.kismetwireless.net/repos/apt/git/jammy jammy main' | sudo tee /etc/apt/sources.list.d/kismet.list;
                $upd;
                $inst kismet;
            if [[ $ID == 5 ]] || [[ $ID == 6 ]]
                then
                    wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key | sudo apt-key add -;
                    echo 'deb https://www.kismetwireless.net/repos/apt/release/bullseye bullseye main' | sudo tee /etc/apt/sources.list.d/kismet.list;
                    $upd;
                    $inst kismet;
            fi
        fi
    fi
    echo -ne "
        $grn$tspl$ylw Installation Complete$grn$tspr$noc";
        sleep 2;
        menuEND;
}

menuHEAD(){
    clear;
    menuSPACER;
    $ech "$red =-><-==-><-==-> $grn    RaspiPi Config $red    <-==-><-==-><-=";
    menuSPACER;
}

menuSPACER(){
    $ech "$red =-><-==-><-==-><-==-><-==-><-==-><-==-><-==-><-==-><-="
}

gpsdSET(){
    gpsd /dev/ttyACM0;
    cd ~/src || return;
    sudo touch gpsd.conf;
    echo 'START_DAEMON="true"' || sudo tee -a gpsd.conf;
    echo 'GPSD_OPTIONS="-n"' || sudo tee -a gpsd.conf;
    echo 'DEVICES="/dev/ttyACM0"' || sudo tee -a gpsd.conf;
    echo 'USBAUTO="true"' || sudo tee -a gpsd.conf;
    echo 'GPSD_SOCKET="/var/run/gpsd.sock"' || sudo tee -a gpsd.conf;
    sudo cp /etc/default/gpsd /etc/default/gpsd.bk;
    sudo mv -f gpsd.conf /etc/default/gpsd;
    $inst scons libncurses-dev python-dev pps-tools git-core asciidoctor python3-matplotlib build-essential manpages-dev pkg-config python3-distutils;
    sudo wget http://download.savannah.gnu.org/releases/gpsd/gpsd-3.23.1.tar.gz;
    tar -xzf gpsd-3.23.1.tar.gz;
    cd gpsd-3.23.1 || return;
    sudo scons;
    sudo scons install;
    sudo systemctl enable gpsd;
    sudo systemctl enable gpsd.socket;
    cd ~/src || return;
    sudo touch blacklist-dvb.conf;
    echo "blacklist dvb_usb_rtl28xxu" || sudo tee -a blacklist-dvb.conf;
    sudo mv -f blacklist-dvb.conf /etc/modprobe.d/blacklist-dvb.conf;
    kisSET;
}

# # # # #
## menu funtions
# # # # #

menuMAIN(){
    if [ -f /usr/bin/timeshift ];
        then
            sudo timeshift --create --comments "setupSTART"
        else
            $inst timeshift -y;
            sudo timeshift --create --comments "setupSTART"
    fi
    menuHEAD;
    $ech "$red$tspl  $grn    Which distro is installed  $red   $tspr";
    menuSPACER;
    $ech "$red $mspl $ylw $ID1              $red  $mspr";
    $ech "$red $mspl $ylw $ID2              $red  $mspr";
    $ech "$red $mspl $blu $ID3      $red  $mspr";
    $ech "$red $mspl $blu $ID4      $red  $mspr";
    $ech "$red $mspl $cyn $ID5  $red  $mspr";
    $ech "$red $mspl $cyn $ID6  $red  $mspr";
    $ech "$red $mspl $gry $ID7            $red  $mspr";
    $ech "$red $mspl $gry $ID8                 $red  $mspr";
    $ech "$red $mspl $gry 9 - EXIT                    $red  $mspr";
    menuSPACER;
    $ech "$red=-><-=   $prp Choose a number -  "; read -r mans1; $ech "       $red  ><-==-><-==-><-= $noc";
    menuSPACER;
    while true; do 
        case $mans1 in
            1) ID=1; instDIST; menuWIFI;;
            2) ID=2; instDIST; menuWIFI;;
            3) ID=3; instDIST; menuWIFI;;
            4) ID=4; instDIST; menuWIFI;;
            5) ID=5; instDIST; menuWIFI;; 
            6) ID=6; instDIST; menuWIFI;;
            7) ID=7; OAP; menuWIFI;;
            8) ID=8; OWRT; menuWIFI;;
            9) exit 0;;          
            *) menuWIFI;;
        esac
    done
}

OAP(){
    echo -e "$red NOT SETUP YET $noc";
    sleep 3;
}

OWRT(){
    echo -e "$red NOT SETUP YET $noc";
    sleep 3;
}

menuWIFI(){
    menuHEAD;
    $ech "$red$tspl   $grn    WiFi Drivers To Install      $red$tspr";
    menuSPACER;
    $ech "$red $mspl $ylw 1 - $WD1         $red  $mspr";
    $ech "$red $mspl $blu 2 - $WD2          $red  $mspr";
    $ech "$red $mspl $blu 3 - $WD3     $red  $mspr";
    $ech "$red $mspl $cyn 4 - $WD4                $red  $mspr";
    $ech "$red $mspl $cyn 5 - Internal Wi-Fi          $red  $mspr";
    menuSPACER;
    $ech "$red=-><-=   $prp Choose a number -  "; 
    read -r wans1; 
    $ech "       $red  ><-==-><-==-><-= $noc";
    menuSPACER;
    while true; do 
        case $wans1 in
            1) WD=1; instWIFI;;
            2) WD=2; instWIFI;;
            3) WD=3; instWIFI;;
            4) WD=4; instWIFI;;
            5) WD=5; menuEND;;
            6) exit 0;;            
            *) menuWIFI;;
        esac
    done
}


menuEND(){
    clear;
    echo -ne "
        $red What $grn Do $ylw You $red Want $grn To $ylw Do...
        $grn 1-Main Menu
        $red 2-Wifi Menu
        $ylw 3-EXIT $noc";
        read -r fin
        while true; do
            case $fin in
                1) menuMAIN;;
                2) menuWIFI;;
                3) exit 0;;
                *) menuEND;;
            esac
        done
}

sudo chmod ugo+rwx /home/ -R
menuMAIN

## ### ## ### ##
### end logfile
## ### ## ### ##

#) 2>>&1 | sudo tee -a ${logfile}