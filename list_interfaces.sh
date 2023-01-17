#!/bin/bash

#Guarda em variáveis os valores separados para as interfaces
INTF= ifconfig | grep mtu | cut -d: -f1 | grep -v "lo"
STATE= ifconfig | grep mtu | grep -v lo | cut -d"<" -f2 | cut -d"," -f1
MTU= ifconfig | grep mtu | grep -v lo | cut -d" " -f5
IPS= ifconfig | grep " inet " | grep -v "127.0.0.1" | sed 's/        //g' | cut -d" " -f2
MACS= ifconfig | grep ether | sed 's/        //g' | cut -d" " -f2

echo -n $INTF
echo -n $STATE
echo -n $MTU
echo -n $IPS
echo -n $MACS
