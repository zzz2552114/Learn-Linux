#!/bin/bash

func()
{
    local a=$1
    if (( a<=0 ))
    then
        echo 0
        return 0
    fi

    echo $(( a + $( func $(( a - 1 )))))
}

echo $(func 10)

