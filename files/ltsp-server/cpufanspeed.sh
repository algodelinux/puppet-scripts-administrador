#!/bin/bash
CPUFANSPEED=`sensors |grep "CPU FAN Speed"| cut -f8 -d" " | awk '{printf("%d\n",$1 + 0.5)}'`
# echo $CPUFANSPEED # for debug only
exit $CPUFANSPEED

