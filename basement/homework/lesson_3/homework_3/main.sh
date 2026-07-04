#!/bin/bash

read n
read m

for (( i=0;i<=n;i++))
do
    vis[$i]=0
done

p=0
dfs()
{
    local d=$1
    local j
    if (( d >= n ))
    then
        (( p++ ))
        if (( p == m ))
        then
            echo ${array[*]}
            exit 0
        fi
        return 0
    fi
    
    for(( j = 1;j<=n;j++ ))
    do
        if (( vis[$j] == 0 ))
        then
            vis[$j]=1
            array[$d]=$j
            dfs $(( d + 1 ))
            vis[$j]=0
        fi
    done
}

echo $(dfs 0)
