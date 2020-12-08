#!/bin/bash
name="Hello World"
len=${#name}
echo $len
echo ${name:3:len}