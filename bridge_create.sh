#!/bin/bash

AUX=$(ifconfig | grep br0 | cut -d: -f1)

if [ "$AUX" == "br0" ]; then
  echo "ERRO: Impossível criar a bridge pois interface bridge br0 já existente"
else
  brctl addbr br0
  ip address add 172.16.0.1/24 dev br0
  ip link set up dev br0
fi