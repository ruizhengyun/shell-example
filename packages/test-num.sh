#!/bin/bash
#author:shell

num1=10
num2=10

if test $[num1] -eq $[num2]
then
  echo "num1 与 num2 数值相等"
else
  echo "num1 与 num2 数值不等"
fi

echo "num1 + num2 结果：$[num1+num2]"