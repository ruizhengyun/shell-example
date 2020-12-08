#!/bin/bash
#author:shell

echo "输入数字 1 或 2"
echo "你输入的数字是："
read num
case $num in
  1)  echo "你输入了 1"
  ;;
  2)  echo "你输入了 2"
  ;;
  *)  echo "你没有输入数字 1 或 2"
  ;;
esac
