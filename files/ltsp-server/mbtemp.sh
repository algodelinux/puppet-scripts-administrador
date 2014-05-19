#!/bin/bash
MBTEMP=`sensors |grep "MB Temperature"| cut -f7 -d" " | tr -d '+' | tr -d '°C'  | awk '{printf("%d\n",$1 + 0.5)}'`
# echo $MBTEMP # for debug only
exit $MBTEMP
