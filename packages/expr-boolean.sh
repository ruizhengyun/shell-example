#!/bin/bash

x=20
y=10

if [ $x != $y ]
then
  echo "$x != $y : x 不等于 y"
else
  echo "$x != $y : x 等于 y"
fi

if [ $x -lt 100 -a $y -gt 5 ]
then
  echo "$x 小于 100 且 $y 大于 5 : 返回 true"
else
  echo "$x 小于 100 且 $y 大于 5 : 返回 false"
fi

if [ $x -lt 100 -o $y -gt 100 ]
then
  echo "$x 小于 100 或 $y 大于 100 : 返回 true"
else
  echo "$x 小于 100 或 $y 大于 100 : 返回 false"
fi

if [ $x -lt 5 -o $y -gt 100 ]
then
  echo "$x 小于 5 或 $y 大于 100 : 返回 true"
else
  echo "$x 小于 5 或 $y 大于 100 : 返回 false"
fi
