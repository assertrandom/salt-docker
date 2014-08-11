#!/bin/bash
for (( ; ; ))
do
   echo "Pres CTRL+C to stop..."
   date >> /apps/data/date.txt
   cat /apps/data/date.txt
   sleep 2
done
