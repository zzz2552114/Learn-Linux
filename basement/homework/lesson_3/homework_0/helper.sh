#!/bin/bash

homework 1 create

for (( i=0;i<=9;i++))
do
    cd ~/homework/lesson_1/homework_$i
    if (( i==0 ))
    then
    mkdir dir_a dir_b dir_c
    

    elif (( i==1 ))
    then
        for d in *.txt
        do
            cp $d $d.bak
        done
    

    elif (( i==2 ))
    then
        for p in a b c
        do
            mv $p.txt ${p}_new.txt
        done
    

    elif (( i==3 ))
    then
        mv dir_a/*.txt dir_b/
    
    elif (( i==4 ))
    then
        rm -r *.txt

    elif (( i==5 ))
    then
        rm -r dir_*

    elif (( i==6 ))
    then
        mv task.txt done.txt
        mkdir dir_a
        mv done.txt dir_a/

    elif (( i==7 ))
    then
        for k in 0 1 2
        do
            mkdir dir_${k}
            for m in a b c
            do
                cp $m.txt dir_${k}/${m}${k}.txt
            done
        done
    elif (( i==8 )) 
    then
        rm dir_a/a.txt
        mv dir_b/b.txt dir_b/b_new.txt
        cp dir_c/c.txt dir_c/c.txt.bak

    elif (( i==9 )) 
    then
        rm -r *.txt
    fi
done

