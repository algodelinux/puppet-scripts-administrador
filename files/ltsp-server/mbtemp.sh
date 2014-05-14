#!/bin/bash
<<<<<<< HEAD
# Hace limpieza purgando paquetes desinstalados, huérfanos y limpiando la cache de apt

# Esteban M. Navas Martín
# Administrador Informático del IES Valle del Jerte.
# 15-Marzo-2013
=======
MBTEMP=`sensors |grep "MB Temperature"| cut -f7 -d" " | tr -d '+' | tr -d '°C'  | awk '{printf("%d\n",$1 + 0.5)}'`
# echo $MBTEMP # for debug only
exit $MBTEMP
>>>>>>> 7322012f2e4547c6673c4c6625d838b9b8386476

#apt-get -y install deborphan
#apt-get -y remove --purge $(deborphan)
#apt-get -y remove --purge $(deborphan --libdev)
apt-get -y remove --purge $(dpkg -l| grep ^rc | awk '{print $2}')
apt-get -y autoremove
