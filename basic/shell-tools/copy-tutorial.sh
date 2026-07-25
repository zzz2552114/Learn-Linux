#!/bin/bash

a=$(ls ~/.homework | wc -w)
echo $a

for ((i=1;i<a;i++))
do
    cd ~/.homework/lesson_$i
    cp tutorial.txt ~/learn-linux/homework/lesson_$i/tutorail.txt
done
