#!/bin/bash
while true
do
    read -p "Input a string (input q to quit): " s
    if [[ $s == q ]]
    then
        echo "quit successfully"
        break
    fi
    flag=1
    len=${#s}
    cnt1=0
    for (( i = 0;i<len;i++))
    do
        cchar=${s:$i:1}
        if [[ ${cchar} != '(' && ${cchar} != ')' ]]
        then
            echo "Invalid input, please put again"
            flag=0
            break
        fi
        if [[ ${cchar} == '(' ]]
        then
            ((cnt1++))
        else
            ((cnt1--))
        fi
        if ((cnt1<0))
        then
            echo "right > left, invalid"
            break
        fi
    done
    if ((cnt1==0)) && ((flag==1))
    then
        echo "Valid string"
    elif (( cnt1 > 0 ))
    then
        echo "left > right, invalid"
    fi
done
