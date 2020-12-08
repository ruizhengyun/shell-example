#!/bin/bash

x=20
y=10

if [[ $x -lt 100 && $y -gt 100 ]]
then
  echo "$x 小于 100 且 $y 大于 100 : 返回 true"
else
  echo "$x 小于 100 且 $y 大于 100 : 返回 false"
fi

if [[ $x -lt 100 || $y -gt 100 ]]
then
  echo "$x 小于 100 或 $y 大于 100 : 返回 true"
else
  echo "$x 小于 100 或 $y 大于 100 : 返回 false"
fi
