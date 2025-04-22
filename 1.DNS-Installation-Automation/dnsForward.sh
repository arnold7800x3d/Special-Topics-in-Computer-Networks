#!/bin/bash

# automation file for the installation and setup of bind9 on a Debian machine

# 1. install packages
apt update
apt install bind9 bind9utils -y

# 2. configure forwarders
# cd /etc/bind
# nano /etc/bind/named.conf.options
# copy template file
cp /home/netadmin/1.DNS-Installation-Automation/templates/named.conf.options /etc/bind/named.conf.options

# 3. add a zone for the domain - luffy.cns
# nano /etc/bind/named.conf.default-zones
cp /home/netadmin/1.DNS-Installation-Automation/templates/named.conf.default-zones /etc/bind/named.conf.default-zones

# 4. create the zone file
# nano /etc/bind/db.luffy.cns
cp /home/netadmin/1.DNS-Installation-Automation/templates/db.luffy.cns /etc/bind/db.luffy.cns

# 5. verify setup
named-checkconf
named-checkzone luffy.cns /etc/bind/db.luffy.cns

# 6. reload dns setup
systemctl reload bind9