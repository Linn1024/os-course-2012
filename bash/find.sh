#!/bin/bash
shopt -s nullglob
shopt -s globstar
shopt -s nocasematch
shopt -s nocaseglob


checkin ()
{
    filename=${1##*/}
    if [[ $filename == $pattern ]]
    then
        if [[ -z $filetype ]]
        then
            echo $1
        elif [[ $filetype == "b" && -b $1 ]]
        then
            echo $1

        elif [[ $filetype == "l" && -L $1 ]]
        then
            echo $1

        elif [[ $filetype == "s" && -S $1 ]]
        then
            echo $1

        elif [[ $filetype == "c" && -c $1 ]]
        then
            echo $1

        elif [[ $filetype == "p" && -p $1 ]]
        then
            echo $1

        elif [[ $filetype == "d" && -d $1 ]]
        then
            echo $1
        
        elif [[ $filetype == "f" && -f $1 ]]
        then
            echo $1
        fi
    fi
}

if [[ -z $1 ]]
then
    path="."
else 
    path="$1"
fi

pattern="*"

if [[ $2 == "-iname" ]]
then
    pattern=$3
fi
if [[ $4 == "-iname" ]]
then
    pattern=$5
fi
if [[ $2 == "-itype" ]]
then
    filetype=$3
fi
if [[ $4 == "-itype" ]]
then
    filetype=$4
fi

for i in $path/**
do
    checkin $i
done
