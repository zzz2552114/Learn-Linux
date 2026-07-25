#!/bin/bash

file=$1
if (( $# != 1 ))
then
    echo arguments not valid
    exit 1
fi

if [[ ! -e $file ]]
then
    echo not exist
    exit 2
fi

if [[ -f $file ]]
then
    echo regular file
fi

if [[ -d $file ]]
then
    echo directory
fi

if [[ -r $file ]]
then
    echo readable
fi

if [[ -w $file ]]
then
    echo writable
fi

if [[ -x $file ]]
then
    echo executable
fi


