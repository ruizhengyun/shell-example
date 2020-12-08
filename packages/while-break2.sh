#!/bin/bash

while :
do
    echo -n "输入 1~10 之间的数字:"
    read num
    case $num in
        1|2|3|4|5|6|7|8|9|10) echo "你输入的数字为 $num"
            break
        ;;
        *) echo "${num} 不在 1~10 之间"
            continue
        ;;
    esac
done