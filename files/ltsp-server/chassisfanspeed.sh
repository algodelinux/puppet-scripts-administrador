#!/bin/bash
CHASSISFANSPEED=`sensors |grep "CHASSIS. FAN Speed" | grep -v "CHASSIS.\ FAN\ Speed:\ \ \ 0\ RPM" | cut -f2 -d":" | cut -f1 -d" " | awk '{printf("%d\n",$1 + 0.5)}'`
# echo $CHASSISFANSPEED # for debug only
exit $CHASSISFANSPEED

