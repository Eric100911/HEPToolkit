#!/bin/bash
                     
input_file=""
keyword=""
prefix=""
suffix=""
helpmsg="Call as 'subst_expand.sh [-i <input-file>] [-w <keyword>]
                                  [-p <prefix>    ] [-s <suffix> ]
                                      <keywords>      > <result>'"


# Dealing with parameters. Specifing the IO files.
while getopts "i:w:p:s:" opt; do
    case "$opt" in
        i ) input_file="$OPTARG" ;;
        w )    keyword="$OPTARG" ;;
        p )     prefix="$OPTARG" ;;
        s )     suffix="$OPTARG" ;;
        ? ) echo $helpmsg ; exit 1  ;;
    esac
done

while read line; do
    echo s/$keyword/$prefix$line$suffix/g > __tmp.sed
    sed -f __tmp.sed $input_file;
done

rm -f __tmp.sed