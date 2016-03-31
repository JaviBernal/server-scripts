###--- vservers-info.sh - v1.0 2016-03-31
###--- Javier Bernal
# Muestra un listado de máquinas virtuales ejecutándose en un servidor KVM, indicando
# la cantidad de memoria RAM y el número de CPUs asignadas.

#!/bin/bash
for servidor in `virsh list --all|grep ejecutando|awk '{print $2}'|sort`
do
   echo $servidor
   MEMORIA=`virsh dumpxml $servidor|grep currentMemory|cut -d '>' -f 2|cut -d '<' -f 1`
   echo -e "RAM: $[ $MEMORIA / 1024] Mb"
   PROCESADORES=`virsh dumpxml $servidor|grep vcpu|cut -d '>' -f 2|cut -d '<' -f 1`
   echo -e "CPUs: $PROCESADORES\n"
done
