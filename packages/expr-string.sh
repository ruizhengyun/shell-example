#!/bin/bash

x="abc"
y="def"

if [ $x = $y ]
then
  echo "$x = $y : x 等于 y"
else
  echo "$x = $y : x 不等于 y"
fi

if [ $x != $y ]
then
  echo "$x != $y : x 不等于 y"
else
  echo "$x != $y : x 等于 y"
fi

if [ -z $x ]
then
   echo "-z $x : 字符串长度为 0"
else
   echo "-z $x : 字符串长度不为 0"
fi

if [ -n $x ]
then
   echo "-n $x : 字符串长度不为 0"
else
   echo "-n $x : 字符串长度为 0"
fi

if [ $x ]
then
   echo "$x : 字符串不为空"
else
   echo "$x : 字符串为空"
fi
