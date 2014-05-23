#!/bin/bash
# Esteban M. Navas
# IES Valle del Jerte - Plasencia
# Fecha creación: 20/05/2014
# Fecha última modificación: 23/05/2014

# suspende.sh -> Apaga los terminales de un aula y suspende el equipo. Para apagar los terminales 
# utilizamos el script /usr/sbin/apagaterminales.sh y la herramienta pm-suspend que se encuentra instalada en los 
# servidores LTSP
#
# La idea es utilizar este script como tarea cron de forma que se ejecute cada cierto tiempo

# Si hay un usuario logueado en el terminal :0, no hacemos nada y finalizamos
if [ $(/usr/bin/w|/bin/grep ":0" | /usr/bin/cut -f1 -d" ") ]; then
   exit 0
fi

clientes=`facter clients`

# Si no hay un usuario logueado, apagamos los terminales
if [ $clientes = "all" ] || [ $clientes = "thinclients" ]; then
   /usr/sbin/apagaterminales.sh
fi

# Si no hay un usuario logueado en el terminal :0 suspendemos el equipo
/usr/sbin/pm-suspend &
