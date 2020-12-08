#!/bin/bash
#author:shell

x=0

until [ $x -gt 10 ]
do
  echo $x
  x=`expr $x + 1`
done