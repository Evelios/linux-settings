#!/usr/bin/sh

cd ~/Downloads

apt-get install lib32stdc++6  # For printer dependencies

printer_driver=mfc490cwlpr-1.1.2-2.i386.deb
wget http://www.brother.com/pub/bsc/linux/dlf/$printer_driver
mkdir -p /var/spool/lpd/mfc490cw
dpkg -i $printer_driver

config_file=/etc/printcap
echo <<Instructions
Modify the $config_file
replace \":lp\" line to the following 2 lines
:rm=(ip address of your printer)\"
:rp=lp\"

Restart the print system
/etc/init.d/lpr restart
Instructions
