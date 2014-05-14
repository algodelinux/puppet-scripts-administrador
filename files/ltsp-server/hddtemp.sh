#!/bin/bash
HDDTEMP=`hddtemp /dev/sda | cut -f3 -d":" | tr -d ' ' | tr -d '°C'`
# echo $HDDTEMP # for debug only
exit $HDDTEMP

