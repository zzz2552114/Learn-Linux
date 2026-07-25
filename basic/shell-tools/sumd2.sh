#!/bin/bash

read n

func()
{
    if (( $1 == 0 ))
    then
        echo $2
        return 0
    fi

    echo $( func $(( $1 - 1)) $(( $2 + $1 )))
}

echo $( func $n 0 )


