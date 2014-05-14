#!/bin/bash
# Hace limpieza purgando paquetes desinstalados, huérfanos y limpiando la cache de apt

# Esteban M. Navas Martín
# Administrador Informático del IES Valle del Jerte.
# 15-Marzo-2013

#apt-get -y install deborphan
#apt-get -y remove --purge $(deborphan)
#apt-get -y remove --purge $(deborphan --libdev)
apt-get -y remove --purge $(dpkg -l| grep ^rc | awk '{print $2}')
apt-get -y autoremove
