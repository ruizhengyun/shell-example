#!/bin/bash

x=20
y=10

if [ $x -eq $y ]
then
  echo "$x -eq $y : x 等于 y"
else
  echo "$x -eq $y : x 不等于 y"
fi

if [ $x -ne $y ]
then
  echo "$x -ne $y : x 不等于 y"
else
  echo "$x -ne $y : x 等于 y"
fi

if [ $x -gt $y ]
then
  echo "$x -gt $y : x 大于 y"
else
  echo "$x -gt $y : x 不大于 y"
fi

if [ $x -lt $y ]
then
  echo "$x -lt $y : x 小于 y"
else
  echo "$x -lt $y : x 不小于 y"
fi

if [ $x -ge $y ]
then
  echo "$x -ge $y : x 大于或等于 y"
else
  echo "$x -ge $y : x 小于 y"
fi

if [ $x -ge $y ]
then
  echo "$x -ge $y : x 小于或等于 y"
else
  echo "$x -ge $y : x 大于 y"
fi