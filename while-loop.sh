#!/bin/bash
count=5
echo "starting countdown"

while [ $count -gt 0 ]
do 
echo "time left : $count"
sleep 1 #pause for 1 sec
count=$((count - 1)) # decrement the count
done

echo "times up!"

