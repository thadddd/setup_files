#!/usr/bin/bash

######################################################################################
###                                                               made by: thadddd ###
###                                                 http://www.github.com/thadddd/ ###
###                                                        Started: March 16, 2023 ###
###                                  Current v: 1.00   Upload date: March 16, 2023 ###
######################################################################################

## Automated Setup for Raspi Pi

# # # # # # # # # # 
# pre-run needs
# # # # # # # # # #

sudo chmod ugo+rwx /home/ -R

# # # # # # # # # # 
# var 
# # # # # # # # # #

usr="whoami"
logfile=/home/$usr/rpiAUTOlog.txt
bin=/usr/bin
OS=0
ID=0
up="sudo apt update"
#ug="sudo apt upgrade -y"
fug="sudo apt full-upgrade -y"
ar="sudo apt autoremove -y"
inst="sudo apt install -y"


# # # # # # # # # # 
# colors
# # # # # # # # # #

#blk='\e[0;30m'
red='\e[0;31m'
grn='\e[0;32m'
ylw='\e[0;33m'
blu='\e[0;34m'
#prp='\e[0;35m'
#cyn='\e[0;36m'
#gry='\e[0;37m'
noc='\e[0;0m'


# # # # # # # # # # 
# support functions
# # # # # # # # # #

menuHEADER(){
    clear;
        echo -ne "
            $red VAVAVAVAVAAVAVAAVAVAVAVAVAVAVAVAVAV$noc
            $red AVAVAV $noc$ylw RASPI PI SETUP MENU $noc$red VAVAVA$noc
            $red VAVAVAVAVAAVAVAAVAVAVAVAVAVAVAVAVAV$noc
        ";
}

update(){
    echo -e "$grn =-><-==-><-==-><-= Updating =-><-==-><-==-><-=$noc";
    $up;
    echo -e "$grn =-><-==-><-==-><-= Upgrading =-><-==-><-==-><-=$noc";
    $fug;
    echo -e "$grn =-><-==-><-==-><-= Autoremoving =-><-==-><-==-><-=$noc";
    $ar;
}

install1(){
    echo -ne "
        $blu =-><-==-><-==-><-= Git Install =-><-==-><-==-><-=$noc";
            if [ -f "$bin/git" ]; 
                then
                    echo -ne "$grn Git is already installed $noc";
                    sleep 2;
                else
                    $inst git;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= Net-Tools Install =-><-==-><-==-><-=$noc";
            if [ -f "$bin/ifconfig" ]; 
                then
                    echo -ne "$grn Net-Tools is already installed $noc";
                    sleep 2;
                else
                    $inst net-tools;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= Aircrack-NG Install =-><-==-><-==-><-=$noc";
            if [ -f "$bin/aircrack-ng" ]; 
                then
                    echo -ne "$grn Aircrack-NG is already installed $noc";
                    sleep 2;
                else
                    $inst aircrack-ng;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= Wifite Install =-><-==-><-==-><-=$noc";
            if [ -f "$bin/wifite" ]; 
                then
                    echo -ne "$grn Wifite is already installed $noc";
                    sleep 2;
                else
                    $inst wifite;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= hcxdumptool Install =-><-==-><-==-><-=$noc";
            $inst hcxdumptool;
    echo -ne "
        $blu =-><-==-><-==-><-= Hashcat Install =-><-==-><-==-><-=$noc";
            if [ -f "$bin/hashcat" ]; 
                then
                    echo -ne "$grn Hashcat is already installed $noc";
                    sleep 2;
                else
                    $inst hashcat;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= Bully Install =-><-==-><-==-><-=$noc";
            if [ -f "$bin/bully" ]; 
                then
                    echo -ne "$grn Bully is already installed $noc";
                    sleep 2;
                else
                    $inst bully;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= MacChanger Install =-><-==-><-==-><-=$noc";
            if [ -f "$bin/macchanger" ]; 
                then
                    echo -ne "$grn MacChanger is already installed $noc";
                    sleep 2;
                else
                    $inst macchanger;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= hcxtools Install =-><-==-><-==-><-=$noc";
                    $inst hcxtools;
    echo -ne "
        $blu =-><-==-><-==-><-= DKMS Install =-><-==-><-==-><-=$noc";
            if [ -f "/usr/sbin/dkms" ]; 
                then
                    echo -ne "$grn DKMS is already installed $noc";
                    sleep 2;
                else
                    $inst dkms;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= BC Install =-><-==-><-==-><-=$noc";
            if [ -f "$bin/bc" ]; 
                then
                    echo -ne "$grn BC is already installed $noc";
                    sleep 2;
                else
                    $inst bc;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= Mokutil Install =-><-==-><-==-><-=$noc";
            if [ -f "$bin/mokutil" ]; 
                then
                    echo -ne "$grn Mokutil is already installed $noc";
                    sleep 2;
                else
                    $inst mokutil;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= Build-Essential Install =-><-==-><-==-><-=$noc";
            if [ -f "/usr/share/build-essential" ]; 
                then
                    echo -ne "$grn Build-Essential is already installed $noc";
                    sleep 2;
                else
                    $inst build-essential;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= libelf-dev Install =-><-==-><-==-><-=$noc";
            if [ -f "/usr/lib/x86_64-linux-gnu/libelf.a" ]; 
                then
                    echo -ne "$grn libelf-dev is already installed $noc";
                    sleep 2;
                else
                    $inst libelf-dev;
            fi
    if [ "$ID" == 1 ];
        then
            echo -ne "
                $blu =-><-==-><-==-><-= KaliPi Kernal Headers Install =-><-==-><-==-><-=$noc";
                    $inst kalipi-kernel-headers;
        if [ "$ID" == 2 ];
            then
                echo -ne "
                    $blu =-><-==-><-==-><-= UbuntuPi Kernal Headers Install =-><-==-><-==-><-=$noc";
                        $inst linux-headers-raspi;
            if [ "$ID" -gt 2 ];
                then
                    echo -ne "
                        $blu =-><-==-><-==-><-= RaspiPi Kernal Headers Install =-><-==-><-==-><-=$noc";
                            $inst raspberrypi-kernel-headers;
            fi
        fi
    fi
    echo -ne "
        $blu =-><-==-><-==-><-= Wireshark Install =-><-==-><-==-><-=$noc";
            if [ -f "$bin/wireshark" ]; 
                then
                    echo -ne "$grn Wireshark is already installed $noc";
                    sleep 2;
                else
                    $inst wireshark;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= GPSD Install =-><-==-><-==-><-=$noc";
            if [ -f "/usr/sbin/gpsd" ]; 
                then
                    echo -ne "$grn GPSD is already installed $noc";
                    sleep 2;
                else
                    $inst gpsd gpsd-clients;
            fi
    echo -ne "
        $blu =-><-==-><-==-><-= RTL-SDR Install =-><-==-><-==-><-=$noc"
                    $inst rtl-sdr gqrx-sdr;
}

# # # # # # # # # # 
# menu functions
# # # # # # # # # #

menuMAIN1(){
    menuHEADER;
        echo -ne "
            $red $noc
            $red Distro Installed: $noc
            $red $noc
            $red 1 - KaliPi $noc
            $red 2 - Ubuntu $noc 
            $red 3 - Raspian $noc 
            $red 4 - OpenAuto PRO $noc 
            $red 5 - OpenWRT $noc 
            $red $noc";
            read -p "$ylw Input choice : $noc" -rs dist; 
        echo -ne "
            $red $noc";
                while true; do
                    case $dist in
                        1) echo -e "$grn KaliPi $noc";
                            ID=1; sleep 3;
                                menuDIST;;
                        2) echo -e "$grn Ubuntu $noc";
                            ID=2; sleep 3;
                                menuDIST;;
                        3) echo -e "$grn Raspian $noc";
                            ID=3; sleep 3;
                                menuDIST;;
                        4) echo -e "$grn OpenAuto Pro $noc";
                            ID=4; sleep 3; OS=901; OSN='OpenAuto PRO';
                                menuMAIN2;;
                        5) echo -e "$grn OpenWRT $noc";
                            ID=5; sleep 3; OS=902; OSN='OpenWRT Router';
                                menuMAIN2;;
                        *) ehco -e "$blu Choose Again $noc";
                                sleep 3;
                                menuMAIN1;;
                    esac
                done
}

menuMAIN2(){
    menuHEADER;
        echo -ne "
            $red $noc
            $red WiFi Dongle Drivers Needed $noc
            $red $noc
            $red 1 - ALPHA AWUS1900 $noc
            $red 2 - ALPHA AWUS036AC $noc 
            $red 3 - Brostrend AC1L / AC3L $noc 
            $red 4 - NinePlus $noc 
            $red 5 - NONE / On Board Chip $noc 
            $red $noc";
            read -p "$ylw Input choice : " -rs wifi; 
        echo -ne "
            $red $noc";
                while true; do
                    case $wifi in
                        1) echo -e "$grn Alpha AWUS1900 / Realtek RTL8814AU $noc";
                            sleep 3; WF=401; WFN='Alpha AWUS1900';
                                menuMAIN3;;
                        2) echo -e "$grn Alpha AWUS036AC / Realtek RTL8812AU $noc";
                            sleep 3; WF=402; WFN='Alpha AWUS036AC'
                                menuMAIN3;;
                        3) echo -e "$grn Brostrend AC1L AC3L $noc";
                            sleep 3; WF=403; WFN='Brostrend AC1L AC3L';
                                menuMAIN3;;
                        4) echo -e "$grn NinePlus / Realtek RTL8812BU $noc";
                            sleep 3; WF=404; WFN='NinePlus';
                                menuMAIN3;;
                        5) echo -e "$grn On Board WIFI $noc";
                            sleep 3; WF=405; WFN='On Board WIFI';
                                menuMAIN3;;
                        *) ehco -e "$blu Choose Again $noc";
                            sleep 3;
                                menuMAIN2;;
                    esac
                done
}

menuMAIN3(){
    menuHEADER;
        echo -ne "
            $red $noc
            $red Purpose of Pi $noc
            $red $noc
            $red 1 - WarDriving $noc
            $red 2 - Wifi Crack $noc 
            $red 3 - Network Traffic Sniff $noc 
            $red 4 - IOT $noc 
            $red 5 - Router $noc 
            $red 6 - HeadUnit $noc
            $red $noc";
            read -p "$ylw Input choice : " -rs purp; 
        echo -ne "
            $red $noc";
                while true; do
                    case $purp in
                        1) echo -e "$grn WarDriving Setup $noc";
                            sleep 3; PUR=501; PURN='Wardriving';
                                menuCONF;;
                        2) echo -e "$grn Wifi Cracking Setup $noc";
                            sleep 3; PUR=502; PURN='WiFi Cracking';
                                menuCONF;;
                        3) echo -e "$grn Network Traffic Sniffing Setup $noc";
                            sleep 3; PUR=503; PURN='Network Traffic Sniffing';
                                menuCONF;;
                        4) echo -e "$grn IOT Setup $noc";
                            sleep 3; PUR=504; PURN='IOT';
                                menuCONF;;
                        5) echo -e "$grn Router Setup $noc";
                            sleep 3; PUR=505; PURN='Router';
                                menuCONF;;
                        6) echo -e "$grn Truck Headunit Setup $noc";
                            sleep 3; PUR=506; PURN='Truck Headunit';
                                menuCONF;;
                        *) ehco -e "$blu Choose Again $noc";
                            sleep 3;
                                menuMAIN3;;
                    esac
                done
}

menuDIST(){
    menuHEADER;
    if [[ $dist == 1 ]]
        then 
            echo -ne "
            $red $noc
            $red KaliPi Version $noc
            $red $noc
            $red 1 - 32bit Desktop $noc
            $red 2 - 32bit Headless $noc 
            $red 3 - 64bit Desktop $noc 
            $red 4 - 64bit Headless $noc 
            $red $noc";
            read -p "$ylw Input choice : " -rs vers; 
        echo -ne "
            $red $noc";
                while true; do
                    case $vers in
                        1) echo -e "$grn Kali Pi 32bit Desktop $noc";
                            sleep 3; 
                                OS=101; OSN='Kali Pi 32bit Desktop';
                                menuCONF;;
                        2) echo -e "$grn Kali Pi 32bit Headless $noc";
                            sleep 3;
                                OS=102; OSN='Kali Pi 32bit Headless';
                                menuCONF;;
                        3) echo -e "$grn Kali Pi 64bit Desktop $noc";
                            sleep 3;
                                OS=103; OSN='Kali Pi 32bit Headless';
                                menuCONF;;
                        4) echo -e "$grn Kali Pi 64bit Headless $noc";
                            sleep 3;
                                OS=104; OSN='Kali Pi 32bit Headless';
                                menuCONF;;
                        *) ehco -e "$blu Choose Again $noc";
                            sleep 3;
                                menuDIST;;
                    esac
                done
    fi
    if [[ $dist == 2 ]]
        then 
            echo -ne "
            $red $noc
            $red Ubuntu Version $noc
            $red $noc
            $red 1 - 32bit Desktop $noc
            $red 2 - 32bit Headless $noc 
            $red 3 - 32bit Server $noc
            $red 4 - 64bit Desktop $noc 
            $red 5 - 64bit Headless $noc 
            $red 6 - 64bit Server $noc
            $red $noc";
            read -p "$ylw Input choice : " -rs vers; 
        echo -ne "
            $red $noc";
                while true; do
                    case $vers in
                        1var ) echo -e "$grn Ubuntu 32bit Desktop $noc";
                            sleep 3; 
                                OS=201; OSN='Ubuntu 32bit Desktop';
                                menuCONF;;
                        2) echo -e "$grn Ubuntu 32bit Headless $noc";
                            sleep 3;
                                OS=202; OSN='Ubuntu 32bit Headless';
                                menuCONF;;
                        3) echo -e "$grn Ubuntu 32bit Server $noc";
                            sleep 3;
                                OS=203; OSN='Ubuntu 32bit Server';
                                menuCONF;;
                        4) echo -e "$grn Ubuntu 64bit Desktop $noc";
                            sleep 3;
                                OS=204; OSN='Ubuntu 64bit Desktop';
                                menuCONF;;
                        5) echo -e "$grn Ubuntu 64bit Headless $noc";
                            sleep 3;
                                OS=205; OSN='Ubuntu 64bit Headless';
                                menuCONF;;
                        6) echo -e "$grn Ubuntu 64bit Server $noc";
                            sleep 3;
                                OS=206; OSN='Ubuntu 64bit Server';
                                menuCONF;;
                        *) ehco -e "$blu Choose Again $noc";
                            sleep 3;
                                menuDIST;;
                    esac
                done
    fi
    if [[ $dist == 3 ]]
        then 
            echo -ne "
            $red $noc
            $red Raspian Version $noc
            $red $noc
            $red 1 - 32bit Desktop $noc
            $red 2 - 32bit Headless $noc
            $red 3 - 64bit Desktop $noc 
            $red 4 - 64bit Headless $noc
            $red $noc";
            read -p "$ylw Input choice : " -rs vers; 
        echo -ne "
            $red $noc";
                while true; do
                    case $vers in
                        1) echo -e "$grn Raspian 32bit Desktop $noc";
                            sleep 3; 
                                OS=301; OSN='Raspian 32bit Desktop';
                                menuCONF;;
                        2) echo -e "$grn Raspian 32bit Headless $noc";
                            sleep 3;
                                OS=302; OSN='Raspian 32bit Headless';
                                menuCONF;;
                        3) echo -e "$grn Raspian 64bit Desktop $noc";
                            sleep 3;
                                OS=303; OSN='Raspian 64bit Desktop';
                                menuCONF;;
                        4) echo -e "$grn Raspian 64bit Headless $noc";
                            sleep 3;
                                OS=304; OSN='Raspian 64bit Headless';
                                menuCONF;;
                        *) ehco -e "$blu Choose Again $noc";
                            sleep 3;
                                menuDIST;;
                    esac
                done
    fi
}

menuCONF(){
    menuHEADER;
        echo -ne "
            $red Is the fol
                gpsd -V;lowing correct : $noc
            $grn $OSN with $WFN for $PURN
            ";
        read -rps "$red Do you want to continue ?  Y or N $noc" ans1;
            while true; do
                case $ans1 in
                    y | Y ) instSTART;;
                    n | N ) echo -e "$blu Okay, lets restart $noc"; menuMAIN1;;
                    *) echo -e "$ylw DIDNT GET THAT $noc";
                        menuCONF;;
                esac
            done
}

instSTART(){
    update;
    if [[ $OS -lt 310 ]];
        then
            install1;
        else
            install2;
    fi
    if [[ $WF == 401 ]];
        then
            echo -ne "
                $grn =-><-==-><-= Installing RTL8814AU Drivers =-><-==-><-= $noc";
            sudo mkdir -p ~/src;
            cd ~/src || return;
            git clone https://github.com/morrownr/8814au.git;
            cd ~/src/8814au || return;
            sudo ./install-driver.sh;
                sudo touch 8814au.conf
                echo options 8814au rtw_drv_log_level=1 rtw_led_ctrl=1 rtw_vht_enable=1 rtw_switch_usb_mode=1 rtw_power_mgnt=0 | sudo tee -a 8814au.conf;
                sudo cp /etc/modprobe.d/8814au.conf /etc/modprobe.d/8814au.conf.bk;
                sudo mv -f 8814au.conf /etc/modprobe.d/8814au.conf;
            echo -ne "
                $grn =-><-==-><-==-><-==-><-=  Install Complete  =-><-==-><-==-><-==-><-= $noc";
                sleep 4;
    fi
    if [[ $WF == 402 ]];
        then
            echo -ne "
                $grn =-><-==-><-= Installing RTL8812AU Drivers =-><-==-><-= $noc";
            sudo mkdir -p ~/src;
            cd ~/src || return;
            git clone https://github.com/morrownr/8812au-20210629.git;
            cd ~/src/8812au-20210629 || return;
            sudo ./install-driver.sh || return;
                sudo touch 8812au.conf
                echo options 8812au rtw_drv_log_level=1 rtw_led_ctrl=1 rtw_vht_enable=1 rtw_switch_usb_mode=1 rtw_power_mgnt=0 | sudo tee -a 8812au.conf;
                sudo cp /etc/modprobe.d/8812au.conf /etc/modprobe.d/8812au.conf.bk;
                sudo mv -f 8812au.conf /etc/modprobe.d/8812au.conf;
            echo -ne "
                $grn =-><-==-><-==-><-==-><-=  Install Complete  =-><-==-><-==-><-==-><-= $noc";
                sleep 4;
    fi
    if [[ $WF == 403 ]];
        then
            echo -ne "
                $grn  =-><-==-><-= Installing Brostrend Drivers =-><-==-><-= $noc";
                sh -c 'wget linux.brostrend.com/install -O /tmp/install && sh /tmp/install';
                echo -ne "
                $grn =-><-==-><-==-><-==-><-=  Install Complete  =-><-==-><-==-><-==-><-= $noc";
                sleep 4;var 
    fi
    if [[ $WF == 404 ]];
        then
            echo -ne "
                $grn  =-><-==-><-= Installing RTL8812bu Drivers =-><-==-><-= $noc";
                sudo mkdir -p ~/src;
            cd ~/src || return;
            git clone https://github.com/morrownr/88x2bu-20210702.git;
            cd ~/src/88x2bu-20210629 || return;
            sudo ./install-driver.sh || return;
                sudo touch 88x2bu.conf
                echo options 88x2bu rtw_drv_log_level=1 rtw_led_ctrl=1 rtw_vht_enable=1 rtw_switch_usb_mode=1 rtw_power_mgnt=0 | sudo tee -a 88x2bu.conf;
                sudo cp /etc/modprobe.d/88x2bu.conf /etc/modprobe.d/88x2bu.conf.bk;
                sudo mv -f 88x2bu.conf /etc/modprobe.d/88x2bu.conf;
            echo -ne "
                $grn =-><-==-><-==-><-==-><-=  Install Complete  =-><-==-><-==-><-==-><-= $noc";
                sleep 4;
    fi
    if [[ $PUR == 501 ]] || [[ $PUR == 502 ]] || [[ $PUR == 503 ]];
        then 
            echo -ne "
                $grn =-><-==-><-= Update GPSD and Setup =-><-==-><-= $noc";
                sleep 3;
                sudo gpsdvar  /dev/ttyACM0;
                sudo mkdir -p ~/src/gpsd;
                cd ~/src/gpsd || return;
                sudo touch gpsd;
                echo 'START_DAEMON="true"' || sudo tee -a gpsd;
                echo 'GPSD_OPTIONS="-n"' || sudo tee -a gpsd;
                echo 'DEVICES="/dev/ttyACM0"' || sudo tee -a gpsd;
                echo 'USBAUTO="true"' || sudo tee -a gpsd;
                echo 'GPSD_SOCKET="/var/run/gpsd.sock"' || sudo tee -a gpsd;
                sudo cp /etc/default/gpsd /etc/default/gpsd.bk;
                sudo mv -f gpsd /etc/default/gpsd;
                cd ~/src/gpsd || return;
                    $inst scons libncurses-dev python-dev pps-tools git-core asciidoctor python3-matplotlib build-essential manpages-dev pkg-config python3-distutils;
                    sudo wget http://download.savannah.gnu.org/releases/gpsd/gpsd-3.23.1.tar.gz;
                    tar -xzf gpsd-3.23.1.tar.gz;
                    cd gpsd-3.23.1 || return;
                    sudo scons;
                    sudo scons install;
            sudo systemctl enable gpsd;
            sudo systemctl enable gpsd.socket;
            echo -ne "
                $grn =-><-==-><-= RTL-SDR Setup =-><-==-><-= $noc";
                sleep 3;
                sudo mkdir -p ~/src/rtl;
                cd ~/src/rtl || return;
                sudo touch blacklist-dvb.conf;
                echo blacklist dvb_usb_rtl28xxu || sudo tee -a blacklist-dvb.conf;
                sudo mv blacklist-dvb.conf /etc/modprobe.d/blacklist-dvb.conf;
            cd ~/src || return;
            sudo cp /etc/apt/sources.list /etc/apt/sources.list.bk;
            sudo cp /etc/apt/
            git clone https://github.com/hacker3983/pyrit-installer && cd pyrit-installer && sudo bash install.sh;


    fi
}

h# # # # # # # # # # 
# program run
# # # # # # # # # #

menuMAIN1

exec 1>"$logfile"
exec 2>&1