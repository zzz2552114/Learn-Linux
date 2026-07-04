#!/bin/bash

input_file=$1
output_file=$2
read n < $input_file

sum=0
for (( i=1;i<=n;i++ ))
do
    t=$(( i*i ))
    (( sum += t ))
done

echo $sum > $output_file
