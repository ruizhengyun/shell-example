#!/bin/bash
array_name=(value0 value1 value2 value3-3)
echo ${array_name[@]}

# 取得数组元素的个数
echo ${#array_name[@]}

# 取得数组单个元素的长度
echo ${#array_name[3]}
