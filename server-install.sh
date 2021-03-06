#!/bin/bash

# Install Python Software Properties
apt-get install python-software-properties

# Add Glances Monitor Tool Repository
add-apt-repository ppa:arnaud-hartmann/glances-stable

# Start Work With Update
apt-get update
apt-get upgrade

# Install Commonly Used Packages
apt-get -y install vim screen clamav inotify-tools fail2ban mailutils pv htop glances curl

# Download MySQL Performance Optimize Tool
wget -cO /usr/local/bin/tuning-primer.sh https://launchpadlibrarian.net/78745738/tuning-primer.sh
chmod u+x /usr/local/bin/tuning-primer.sh

# Update ClamAV Database
freshclam


# Allow Localhost To Connect Port 25 (Postfix)
iptables -A INPUT -p tcp -s 127.0.0.0/8 --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j DROP

# Filter Port 25 On Startup
sed -i "s/exit.*/# Allow Localhost To Connect Port 25 \(Postfix\)\niptables -A INPUT -p tcp -s 127.0.0.0\/8 --dport 25 -j ACCEPT\niptables -A INPUT -p tcp --dport 25 -j DROP\nexit 0;/" /etc/rc.local

# Custom Prompt PS1
echo 'PS1="\`if [ \$? = 0 ]; then echo \[\e[37m\]^_^[\u@\H:\w]\\$ \[\e[0m\]; else echo \[\e[31m\]O_O[\u@\H:\w]\\$ \[\e[0m\]; fi\`"' >> /root/.bashrc

