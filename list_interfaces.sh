#!/bin/bash

#Guarda em variáveis os valores separados das características das interfaces
for a in `ifconfig | grep mtu | grep -v "LOOPBACK" | cut -d: -f1`; do
  intf+=("$a"); done

for a in `ifconfig | grep mtu | grep -v "LOOPBACK" | cut -d"<" -f2 | cut -d"," -f1`; do
  states+=("$a"); done

for a in `ifconfig | grep mtu | grep -v "LOOPBACK" | cut -d" " -f5`; do
  mtu+=("$a"); done

for a in `ifconfig | grep " inet " | grep -v "127.0.0.1" | sed 's/        //g' | cut -d" " -f2`; do
  ips+=("$a"); done

for a in `ifconfig | grep ether | sed 's/        //g' | cut -d" " -f2`; do
  macs+=("$a"); done

aux=${#intf[@]} #Tamanho dos arrays
tam=$(($aux-1)) #Tamanho -1 para acessar indice por indice
for i in $(seq 0 $tam); do
  echo "Interface: "${intf[$i]}
  echo "Estado: "${states[$i]}
  echo "MTU: "${mtu[$i]}
  echo "IP: "${ips[$i]}
  echo "MAC: "${macs[$i]}
  echo #Propósito de pular linha
done