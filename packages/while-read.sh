#!/bin/bash
#author:shell

echo "按下 <CTRL-D> 退出"
echo -n "输入你最喜欢的电视剧: "
while read FILM
do
  echo "$FILM 这确实是一部好电视剧"
done
