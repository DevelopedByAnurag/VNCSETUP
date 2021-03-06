#!/bin/bash
clear
	RED='\033[1;31m'
	WHITE='\033[1;37m'
	ORANGE='\033[01;38;5;166m'
	GREEN='\033[01;38;5;118m'
printf "${ORANGE}"
echo -e " ██╗   ██╗ ███╗   ██╗  ██████╗ ███████╗ ███████╗ ████████╗ ██╗   ██╗ ██████╗"
echo -e " ██║   ██║ ████╗  ██║ ██╔════╝ ██╔════╝ ██╔════╝ ╚══██╔══╝ ██║   ██║ ██╔══██╗"
echo -e " ${WHITE}██║   ██║ ██╔██╗ ██║ ██║      ███████╗ █████╗      ██║    ██║   ██║ ██████╔╝"
echo -e " ╚██╗ ██╔╝ ██║╚██╗██║ ██║      ╚════██║ ██╔══╝      ██║    ██║   ██║ ██╔═══╝"
echo -e "  ${GREEN}╚████╔╝  ██║ ╚████║ ╚██████╗ ███████║ ███████╗    ██║    ╚██████╔╝ ██║"
echo -e "   ╚═══╝   ╚═╝  ╚═══╝  ╚═════╝ ╚══════╝ ╚══════╝    ╚═╝     ╚═════╝  ╚═╝"
   
printf "${WHITE}"
echo -e "-------------------------------------------Coded By :- Anurag Batra -------------------------------------------"
echo -e "---------------------------${ORANGE} Proudly ${WHITE} An ${GREEN} Indian ${WHITE}-------------------------------"
echo -e "                          Kindly Read Note First by typing note                          "
echo -e "============================================================================================================================="
echo -e "                             Installing VNC on VPS"
 echo -e "============================================================================================================================="


echo -e "\nDo you want to install VNC?"
echo -e "\n 1. Yes, Install Graphical VNC"
echo -e "\n 2. No, I changed my Mood Exit Script"
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	1)
		echo -e "============================================================================================================================="
		echo -e "                             Installing GRAPHICAL VNC (tightvncserver) "
  		echo -e "============================================================================================================================="
		apt-get update -y && sudo apt-get upgrade -y
		sudo apt-get install xfce4 xfce4-goodies xorg lxde-core tightvncserver -y --allow-unauthenticated
		vncserver
		vncserver -kill :1
		mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
		echo "#!/bin/bash
		xrdb $HOME/.Xresources
		startxfce4 &
		lxterminal &
		/usr/bin/lxsession -s LXDE &" >> ~/.vnc/xstartup
		sudo chmod +x ~/.vnc/xstartup
		echo "#!/bin/bash
		PATH="$PATH:/usr/bin/"
		export USER="user"
		DISPLAY="1"
		DEPTH="16"
		GEOMETRY="1024x768"
		OPTIONS="-depth ${DEPTH} -geometry ${GEOMETRY} :${DISPLAY} -localhost"
		. /lib/lsb/init-functions" >> /etc/init.d/vncserver
		sudo chmod +x /etc/init.d/vncserver
		vncserver
		su
		clear
		echo -e "============================================================================================================================="
		myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
		echo "Connect it!!! Using :-  ${myip}:1 in VNC Viewer."
  		echo -e "============================================================================================================================="
		break
		;;

	2)
  echo -e "============================================================================================================================="
  echo -e " Okay your Wish VNC not installed."
  echo -e " Its sad to see you you going."
  echo -e "============================================================================================================================="
break
;;
 esac
done
