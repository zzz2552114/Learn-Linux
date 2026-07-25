#!/bin/bash

read n

a0=1
a1=1
if (( n==0 || n==1 ))
then
    echo 1
    exit 0
fi
for ((i=2;i<=n;i++))
do
    t=$a1
    ((a1+=a0))
    a0=$t
done

echo $a1


