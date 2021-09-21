#!usr/bin/python3

import os
import sys
import time
import subprocess

# Banner
banner = """\033[1;32;49m===================================================
|                                                 |
|   _______  __       _  _     _____   __    __   |
|  |   ____||  |     | || |   | ____| |  |  |  |  |
|  |  |__   |  |     | || |_  | |__   |  |__|  |  |
|  |   __|  |  |     |__   _| |___ \  |   __   |  |
|  |  |     |  `----.   | |    ___) | |  |  |  |  |
|  |__|     |_______|   |_|   |____/  |__|  |__|  |
|                                                 |
|      GitHub: https://GitHub.com/JyanJohn        |
===================================================

>>>                 Multi-tool                  <<<
\033[1;32;49m"""

options = """\033[1;32;49m
[01] COVID-19 CLI                   [03] More Tools
[02] Weather                        [xx] Exit"""

# Slowprint
def slowprint(z):
	for e in z + '\n':
		sys.stdout.write(e)
		sys.stdout.flush()
		time.sleep(0.001)
		
# Programs
def COVIDCLI():
	subprocess.call("./Covidcli.sh", shell=True)

def Weather():
	subprocess.call("./weather.sh", shell=True)
	
def MoreTools():
	print("Coming Soon!")
	
# Main Functions
def main():
	os.system("clear")
	slowprint(banner)
	slowprint(options)
	print("\nChoose your option")
	option = input(" >>> ")
	
	if option == "1" or option == "01":
		os.system("clear")
		COVIDCLI()
	elif option == "2" or option == "02":
		os.system("clear")
		Weather()
	elif option == "3" or option == "03":
		os.system("clear")
		MoreTools()
	elif option == "xx" or option == "XX":
		os.system("clear")
		quit
		exit
	
# Execute the "Main Function"
if __name__ == "__main__":
	main()
