#!/bin/bash

# author:shell

echo "Shell 参数示例："
echo "参数个数为：$#";
echo "传递的参数作为一个字符串显示：$*";
echo "传递的参数作为一个字符串显示："$@"";
echo "执行文件名：$0";
echo "第 1 个参数为：$1";
echo "第 2 个参数为：$2";

echo "-- \$* --"
for i in "$*"; do
  echo $i
done

echo "-- \$@ --"
for i in "$@"; do
  echo $i
done