#!/bin/bash

x=20
y=10

val=`expr $x + $y`
echo "x + y : $val"

val=`expr $x - $y`
echo "x - y : $val"

val=`expr $x \* $y`
echo "x * y : $val"

val=`expr $x / $y`
echo "x / y : $val"

val=`expr $x % $y`
echo "x % y : $val"

if [ $x == $y ]
then
  echo "x 等于 y"
fi
if [ $x != $y ]
then
  echo "x 不等于 y"
fi
