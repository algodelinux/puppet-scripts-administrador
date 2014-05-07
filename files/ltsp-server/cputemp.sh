#!/bin/bash
CPUTEMP=`sensors |grep "CPU Temperature"| cut -f6 -d" " | tr -d '+' | tr -d '°C'  | awk '{printf("%d\n",$1 + 0.5)}'`
echo $CPUTEMP # for debug only

exit $CPUTEMP

