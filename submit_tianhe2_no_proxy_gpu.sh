#!/bin/bash 

for n in $(seq 2 -1 2)
do
   for i in $(seq 3 -1 1)
   do
     yhbatch -N $n -n $n -p gpu --dependency=singleton oskar_casa_daliuge.sh $n 
   done
done

