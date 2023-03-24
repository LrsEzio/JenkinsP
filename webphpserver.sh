#!/bin/bash

#script bash à faire pour initialiser les containers
    lxc init ubuntu:22.04 $NAME;
    sleep 2;
    lxc start $NAME;
    lxc network attach lxdbr0 $NAME;
    sleep 3;
#configure le réseau 
    lxc exec $NAME -- sed -i 's|#DNS=|DNS=1.1.1.1|g' /etc/systemd/resolved.conf;
    lxc exec $NAME -- systemctl restart systemd-resolved;
    lxc exec $NAME -- bash -c 'echo -e "[Match]\nName=*\n\n[Network]\nDHCP=ipv4" > /etc/systemd/network/10-all.netw>
    lxc exec $NAME -- systemctl restart systemd-networkd; 
    lxc exec $NAME 



