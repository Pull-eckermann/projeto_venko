#!/bin/bash

#Rotas estaticas
for a in `ip route show | grep -v " link " | grep -v " nhid " | cut -d" " -f1`; do
  dest_s+=("$a"); done
for a in `ip route show | grep -v " link " | grep -v " nhid " | cut -d" " -f3`; do
  prox_s+=("$a"); done
for a in `ip route show | grep -v " link " | grep -v " nhid " | cut -d" " -f5`; do
  intf_s+=("$a"); done

tam=${#dest_s[@]}
echo "========================Rotas estaticas========================"
printf '%20s %20s %20s\n' 'Rede Destino' 'Prox Servidor' 'Interface'
for i in $(seq 0 $(($tam -1))); do
  printf '%20s %20s %20s\n' ${dest_s[$i]} ${prox_s[$i]} ${intf_s[$i]}; done

#Rotas dinamicas
for a in `ip route show | grep -v " link " | grep " nhid " | cut -d" " -f1`; do
  dest_d+=("$a"); done
for a in `ip route show | grep -v " link " | grep " nhid " | cut -d" " -f5`; do
  prox_d+=("$a"); done
for a in `ip route show | grep -v " link " | grep " nhid " | cut -d" " -f7`; do
  intf_d+=("$a"); done

tam=${#dest_d[@]}
echo "========================Rotas dinamicas========================"
printf '%20s %20s %20s\n' 'Rede Destino' 'Prox Servidor' 'Interface'
for i in $(seq 0 $(($tam -1))); do
  printf '%20s %20s %20s\n' ${dest_d[$i]} ${prox_d[$i]} ${intf_d[$i]}; done

#Rota barramento
for a in `ip route show | grep " link " | cut -d" " -f1`; do
  dest_b+=("$a"); done
for a in `ip route show | grep " link " | cut -d" " -f3`; do
  intf_b+=("$a"); done

tam=${#dest_b[@]}
echo "==================Rotas ligadas em barramento=================="
printf '%20s %20s\n' 'Rede Destino' 'Interface'
for i in $(seq 0 $(($tam -1))); do
  printf '%20s %20s\n' ${dest_b[$i]} ${intf_b[$i]}; done

