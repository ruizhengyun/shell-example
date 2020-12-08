#!/bin/bash

fun() {
  echo "shell 函数"
}

echo "--- 函数开始 ---"
fun
echo "--- 函数结束 ---"

funRead() {
  echo -e "输入第 1 个数字： \c"
  read num1
  echo -e "输入第 2 个数字： \c"
  read num2
  return $(($num1+$num2))
}
funRead
echo "两数之和为 $?"