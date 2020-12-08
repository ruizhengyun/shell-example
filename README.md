# Shell

记录学习 shell 脚本 bash
## 概念

Shell 是一个用 C 语言编写的程序，它是用户使用 Linux 的桥梁。Shell 既是一种命令语言，又是一种程序设计语言。

Shell 是指一种应用程序，这个应用程序提供了一个界面，用户通过这个界面访问操作系统内核的服务。

[Shell 在线脚本 runoob](https://www.runoob.com/try/runcode.php?filename=helloworld&type=bash)

## Shell 脚本

Shell 脚本（shell script），是一种为 shell 编写的脚本程序。业界所说的 shell 通常都是指 shell 脚本，但读者朋友要知道，shell 和 shell script 是两个不同的概念。由于习惯的原因，简洁起见，本文出现的 "shell编程" 都是指 **shell 脚本编程**，不是指开发 shell 自身。

## 环境

Shell 编程跟 JavaScript、php 编程一样，只要有一个能编写代码的文本编辑器和一个能解释执行的脚本解释器就可以了。

Linux 的 Shell 种类众多，常见的有：

- Bourne Shell（/usr/bin/sh或/bin/sh）
- Bourne Again Shell（/bin/bash）
- C Shell（/usr/bin/csh）
- K Shell（/usr/bin/ksh）
- Shell for Root（/sbin/sh）
- ……

其中 Bash（Bourne Again Shell），由于易用和免费，在日常工作中被广泛使用。同时，Bash 也是大多数 Linux 系统默认的 Shell。

一般情况下，不区分 Bourne Shell 和 Bourne Again Shell，所以，像 **#!/bin/sh** 同样也可以为 **#!/bin/bash**。

**#!** 是一个约定标识，让系统知晓其后路径所指定的程序即是**解释此脚本文件的 Shell 程序**。

```shell
#!/bin/bash

echo "Hello World!"
```

## 运行脚本

### 1.作为可执行程序

```shell
chmod +x ./test.sh  #使脚本具有执行权限
./test.sh  #执行脚本
```

这里要写成 `./test.sh`，和运行其它二进制的程序一样，是告诉系统就在当前目录。而直接写 test.sh，linux 系统会去 PATH 里寻找有没有叫 test.sh 的，而只有 /bin, /sbin, /usr/bin，/usr/sbin 等在 PATH 里，我们的当前目录通常是不在 PATH 里。

### 2.作为解释器参数

这种运行方式是，直接运行解释器，其参数就是 shell 脚本的文件名，如:

```shell
/bin/sh test.sh
/bin/php test.php
```

## 变量：定义和使用

```shell
#!/bin/bash
name="Hello World"
echo $name
```

- 定义变量，变量名和等号之间不能有空格，这可能和我们熟悉的所有编程语言都不一样。同时，变量名的命名须遵循如下规则：
  - 命名只能使用英文字母，数字和下划线，首个字符不能以数字开头。
  - 中间不能有空格，可以使用下划线（_）。
  - 不能使用标点符号。
  - 不能使用 bash 里的关键字（可用 help 命令查看保留关键字）。
- 使用一个定义过的变量，在变量名前面加美元符号，若是有和其他字符串有连写时，可用花括号把变量名包裹起来，比如 `echo ${name}s`。

### 只读变量

```shell
#!/bin/bash
name="Hello World"
readonly name
name="Hello Shell"
echo $name
```

### 删除变量

使用 unset 命令可以删除变量，但不能删除只读变量。当然，删除后的变量不能再次使用。语法：

```shell
unset name
```

### 变量类型

运行shell时，会同时存在三种变量：

- **局部变量**。局部变量在脚本或命令中定义，仅在当前 shell 实例中有效，其他 shell 启动的程序不能访问局部变量
- **环境变量**。所有的程序，包括 shell 启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候 shell 脚本也可以定义环境变量
- **shell变量**。shell 变量是由 shell 程序设置的特殊变量。shell 变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了 shell 的正常运行

### 字符串

可以用单引号，也可以用双引号，推荐使用双引号。其中双引号支持：

- 双引号里可以有变量
- 双引号里可以出现转义字符

```shell
#!/bin/bash
name="Shell"
name_1="\"Hello, "$name" !\""
name_2="\"Hello, ${name} !\""
echo $name_1
echo $name_2


name_single='Shell'
name_3='\"Hello, '$name_single' !\"'
name_4='\"Hello, ${name_single} !\"'
echo $name_3
echo $name_4
```

### 获取字符串长度和提取子字符串

```shell
#!/bin/bash
name="Shell"
echo ${#name}
echo ${name:1:5}
```

## 数组

bash支持一维数组（不支持多维数组），并且没有限定数组的大小。

### 定义数组

在 Shell 中，用括号来表示数组，数组元素用"空格"符号分割开。使用 **@** 符号可以获取数组中的所有元素，例如：

```shell
#!/bin/bash
array_name=(value0 value1 value2 value3)
echo ${array_name[@]}
```

### 获取数组的长度

获取数组长度的方法与获取字符串长度的方法相同，例如：

```shell
#!/bin/bash
array_name=(value0 value1 value2 value3-3)
echo ${array_name[@]}

# 取得数组元素的个数
echo ${#array_name[@]}

# 取得数组单个元素的长度
echo ${#array_name[3]}
```

## 注释

以 # 开头的行就是注释，会被解释器忽略。

```shell
#!/bin/bash
#--------------------------------------------
# 这是一个注释
# author：shell
# site：www.xxx.com
# slogan：学而不思则罔，思而不学则殆
#--------------------------------------------

##### 用户配置区 开始 #####
#
#
# 这里可以添加脚本描述信息
# 
#
##### 用户配置区 结束  #####
```

### 多行注释

多行注释还可以使用以下格式：

```shell
#!/bin/bash
:<<EOF
注释内容...
注释内容...
注释内容...
EOF

:<<!
注释内容...
注释内容...
注释内容...
!

:<<'
注释内容...
注释内容...
注释内容...
'
```

## 传递参数

我们可以在执行 Shell 脚本时，向脚本传递参数，脚本内获取参数的格式为：`$n`。n 代表一个数字，1 为执行脚本的第一个参数，2 为执行脚本的第二个参数，以此类推……

```shell
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
```

| 参数处理 | 说明 |
|:-|:-|
| $# | 传递到脚本的参数个数|
| $* | 以一个单字符串显示所有向脚本传递的参数，如 "$*" 用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。|
| $$ | 脚本运行的当前进程ID号|
| $! | 后台运行的最后一个进程的ID号|
| $@ | 与$*相同，但是使用时加引号，并在引号中返回每个参数，如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数|
| $- | 显示Shell使用的当前选项，与set命令功能相同|
| $? | 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误 |

**$*** 与 **$@** 区别：

- 相同点：都是引用所有参数。
- 不同点：只有在双引号中体现出来。假设在脚本运行时写了三个参数 1、2、3，，则 " * " 等价于 "1 2 3"（传递了一个参数），而 "@" 等价于 "1" "2" "3"（传递了三个参数）。

## Shell 基本运算符

Shell 和其他编程语言一样，支持多种运算符，包括：

- 算数运算符
- 关系运算符
- 布尔运算符
- 字符串运算符
- 文件测试运算符

原生 bash 不支持简单的数学运算，但是可以通过其他命令来实现，最常用 expr。需注意：

- 表达式和运算符之间要有空格，例如 2+2 是不对的，必须写成 2 + 2
- 完整的表达式要被 `表达式` 包含，使用的是反引号 **`** 而不是单引号 **'**

```shell
#!/bin/bash
val=`expr 1 + 2`
echo "两数之和为 : $val"
```

### 算术运算符

| 运算符 | 说明 | 举例 |
|:-|:-|:-|
| + | 加法 | `expr $x + $b` |
| - | 减法 | `expr $x - $b` |
| * | 乘法 | `expr $x \* $b` |
| / | 除法 | `expr $x / $y` |
| % | 取余 | `expr $x % $y` |
| = | 赋值 | x=$y 将把变量 y 的值赋给 x |
| == | 相等，用于比较两个数字，相同则返回 true | [ $x == $y ] |
| != | 不相等，用于比较两个数字，不相同则返回 true | [ $x != $y ] |

**注意**：条件表达式要放在方括号之间，并且要有空格，例如: `[$x==$y]` 是错误的，必须写成 `[ $x == $y ]`。

示例

```shell
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
```

### 关系运算符

关系运算符只支持数字，不支持字符串，除非字符串的值是数字。

| 运算符 | 说明 | 举例 |
|:-|:-|:-|
| -eq | 检测两个数是否相等，相等返回 true | [ $x -eq $y ] |
| -ne | 检测两个数是否不相等，不相等返回 true | [ $x -ne $y ] |
| -gt | 检测左边的数是否大于右边的，如果是，则返回 true | [ $x -gt $y ] |
| -lt | 检测左边的数是否小于右边的，如果是，则返回 true | [ $x -lt $y ] |
| -ge | 检测左边的数是否大于等于右边的，如果是，则返回 true | [ $x -ge $y ] |
| -le | 检测左边的数是否小于等于右边的，如果是，则返回 true | [ $x -le $y ] |

```shell
#!/bin/bash

x=20
y=10

if [ $x -eq $y ]
then
  echo "$x -eq $y : x 等于 y"
else
  echo "$x -eq $y : x 不等于 y"
fi

if [ $x -ne $y ]
then
  echo "$x -ne $y : x 不等于 y"
else
  echo "$x -ne $y : x 等于 y"
fi

if [ $x -gt $y ]
then
  echo "$x -gt $y : x 大于 y"
else
  echo "$x -gt $y : x 不大于 y"
fi

if [ $x -lt $y ]
then
  echo "$x -lt $y : x 小于 y"
else
  echo "$x -lt $y : x 不小于 y"
fi

if [ $x -ge $y ]
then
  echo "$x -ge $y : x 大于或等于 y"
else
  echo "$x -ge $y : x 小于 y"
fi

if [ $x -ge $y ]
then
  echo "$x -ge $y : x 小于或等于 y"
else
  echo "$x -ge $y : x 大于 y"
fi
```

### 布尔运算符

下表列出了常用的布尔运算符。

| 运算符 | 说明 | 举例 |
|:-|:-|:-|
| ! | 非运算，表达式为 true 则返回 false，否则返回 true | [ ! false ] 返回 true |
| -o | 或运算，有一个表达式为 true 则返回 true | [ $x -lt 20 -o $y -gt 100 ] |
| -a | 与运算，两个表达式都为 true 才返回 true | [ $x -lt 20 -a $y -gt 100 ] |

```shell
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
```

### 逻辑运算符

| 运算符 | 说明 | 举例 |
|:-|:-|:-|
| && | 逻辑的 AND | [[ $x -lt 100 && $y -gt 100 ]] |
| || | 逻辑的 OR | [[ $x -lt 100 || $y -gt 100 ]] |

```shell
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
```

### 字符串运算符

下表列出了常用的字符串运算符，假定变量 a 为 "abc"，变量 b 为 "efg"：

| 运算符 | 说明 | 举例 |
|:-|:-|:-|
| = | 检测两个字符串是否相等，相等返回 true | [ $x = $y ] |
| != | 检测两个字符串是否相等，不相等返回 true | [ $x != $y ] |
| -z | 检测字符串长度是否为0，为0返回 true | [ -z $x ] |
| -n | 检测字符串长度是否不为 0，不为 0 返回 true | [ -n "$x" ] |
| $ | 检测字符串是否为空，不为空返回 true | [ $x ] |

```shell
#!/bin/bash

x="abc"
y="def"

if [ $x = $y ]
then
  echo "$x = $y : x 等于 y"
else
  echo "$x = $y : x 不等于 y"
fi

if [ $x != $y ]
then
  echo "$x != $y : x 不等于 y"
else
  echo "$x != $y : x 等于 y"
fi

if [ -z $x ]
then
   echo "-z $x : 字符串长度为 0"
else
   echo "-z $x : 字符串长度不为 0"
fi

if [ -n $x ]
then
   echo "-n $x : 字符串长度不为 0"
else
   echo "-n $x : 字符串长度为 0"
fi

if [ $x ]
then
   echo "$x : 字符串不为空"
else
   echo "$x : 字符串为空"
fi
```

### 文件测试运算符

文件测试运算符用于检测 Unix 文件的各种属性。

| 操作符 | 说明 | 举例 |
|:-|:-|:-|
| -b file | 检测文件是否是块设备文件，如果是，则返回 true | [ -b $file ] |
| -c file | 检测文件是否是字符设备文件，如果是，则返回 true | [ -c $file ] |
| -d file | 检测文件是否是目录，如果是，则返回 true | [ -d $file ] |
| -f file | 检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true | [ -f $file ] |
| -g file | 检测文件是否设置了 SGID 位，如果是，则返回 true | [ -g $file ] |
| -k file | 检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true | [ -k $file ] |
| -p file | 检测文件是否是有名管道，如果是，则返回 true | [ -p $file ] |
| -u file | 检测文件是否设置了 SUID 位，如果是，则返回 true | [ -u $file ] |
| -r file | 检测文件是否可读，如果是，则返回 true | [ -r $file ] |
| -w file | 检测文件是否可写，如果是，则返回 true | [ -w $file ] |
| -x file | 检测文件是否可执行，如果是，则返回 true | [ -x $file ] |
| -s file | 检测文件是否为空（文件大小是否大于0），不为空返回 true | [ -s $file ] |
| -e file | 检测文件（包括目录）是否存在，如果是，则返回 true | [ -e $file ] |

```shell
#!/bin/bash

file="/Users/ruizhengyun/courses/shell-example/packages/test.sh"

if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi

if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi

if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi

if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi

if [ -d $file ]
then
   echo "文件是个目录"
else
   echo "文件不是个目录"
fi

if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi

if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi
```

## echo 命令

- 普通字符串 `echo "It is a test"`
- 显示转义字符 `echo "\"It is a test\""`
- 显示变量 `echo "$name It is a test"`
- 显示换行 `echo -e "OK! \n" # -e 开启转义`
- 显示不换行 `echo -e "OK! \c" # -e 开启转义 \c 不换行`
- 显示结果定向至文件 `echo "It is a test" > myfile`
- 原样输出字符串，不进行转义或取变量(用单引号) `echo '$name\"'`
- 显示命令执行结果

```shell
echo `date`
```

## printf 命令

- printf 命令模仿 C 程序库（library）里的 printf() 程序。
- printf 由 POSIX 标准所定义，因此使用 printf 的脚本比使用 echo 移植性好。
- printf 使用引用文本或空格分隔的参数，外面可以在 printf 中使用格式化字符串，还可以制定字符串的宽度、左右对齐方式等。默认 printf 不会像 echo 自动添加换行符，我们可以手动添加 \n。

格式 `printf  format-string  [arguments...]`

- **format-string**: 为格式控制字符串
- **arguments**: 为参数列表

```shell
#!/bin/bash
#author:shell

printf "%-10s %-8s %-8s\n" 姓名 性别 影视
printf "%-10s %-7s %-8s\n" 胡歌 男 仙剑奇侠传
printf "%-11s %-7s %-8s\n" 刘亦菲 女 仙剑奇侠传
```

- `%s`、`%c`、`%d`、`%f` 都是格式替代符
- `%-10s` 指一个宽度为 10 个字符（-表示左对齐，没有则表示右对齐），任何字符都会被显示在 10 个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来。
- `%-4.2f` 指格式化为小数，其中 `.2` 指保留2位小数

### 转义序列

| 序列 | 说明 |
|:-|:-|
| \a | 警告字符，通常为ASCII的BEL字符 |
| \b | 后退 |
| \c | 抑制（不显示）输出结果中任何结尾的换行字符（只在%b格式指示符控制下的参数字符串中 |有| 效），而且，任何留在参数里的字符、任何接下来的参数以及任何留在格式字符串中的字符，都被忽略
| \f | 换页（formfeed） |
| \n | 换行 |
| \r | 回车（Carriage return） |
| \t | 水平制表符 |
| \v | 垂直制表符 |
| \\ | 一个字面上的反斜杠字符 |
| \ddd | 表示1到3位数八进制值的字符。仅在格式字符串中有效 |
| \0ddd | 表示1到3位的八进制值字符 |

## test 命令

Shell中的 test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。

### 数值测试

| 参数 | 说明 |
|:-|:-|
| -eq | 等于则为真 |
| -ne | 不等于则为真 |
| -gt | 大于则为真 |
| -ge | 大于等于则为真 |
| -lt | 小于则为真 |
| -le | 小于等于则为真 |

代码中的 `[]`执行基本的算数运算，如：

```shell
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
```

### 字符串测试

| 参数 | 说明 |
|:-|:-|
| = | 等于则为真 |
| != | 不相等则为真 |
| -z 字符串 | 字符串的长度为零则为真 |
| -n 字符串 | 字符串的长度不为零则为真 |

```shell
#!/bin/bash
#author:shell

string1="string1"
string2="string2"

if test $string1 = $string2
then
  echo "string1 与 string2 相等"
else
  echo "string1 与 string2 不等"
fi
```

### 文件测试

| 参数 | 说明 |
|:-|:-|
| -e 文件名 | 如果文件存在则为真 |
| -r 文件名 | 如果文件存在且可读则为真 |
| -w 文件名 | 如果文件存在且可写则为真 |
| -x 文件名 | 如果文件存在且可执行则为真 |
| -s 文件名 | 如果文件存在且至少有一个字符则为真 |
| -d 文件名 | 如果文件存在且为目录则为真 |
| -f 文件名 | 如果文件存在且为普通文件则为真 |
| -c 文件名 | 如果文件存在且为字符型特殊文件则为真 |
| -b 文件名 | 如果文件存在且为块特殊文件则为真 |

```shell
#!/bin/bash
#author:shell

cd /bin
if test -e ./notFile -o -e ./bash
then
  echo '至少有一个文件存在!'
else
  echo '两个文件都不存在'
fi
```

## 流程控制

### if

if 语句语法格式：

```shell
if condition
then
  command1 
  command2
  ...
  commandN 
fi
```

写成一行（适用于终端命令提示符）：`if [ $(ps -ef | grep -c "ssh") -gt 1 ]; then echo "true"; fi`

末尾的 **fi** 就是 **if** 倒过来拼写。

### if else

if else 语法格式：

```shell
if condition
then
  command1 
  command2
  ...
  commandN
else
  command
fi
```

### if else-if else

if else-if else 语法格式：

```shell
if condition1
then
  command1
elif condition2 
then 
  command2
else
  commandN
fi
```

### for 循环

for循环一般格式为：

```shell
for var in item1 item2 ... itemN
do
  command1
  command2
  ...
  commandN
done
```

写成一行：`for var in item1 item2 ... itemN; do command1; command2… done;`

### while 语句

while循环用于不断执行一系列命令，也用于从输入文件中读取数据；命令通常为测试条件。其格式为：

```shell
while condition
do
  command
done
```

示例

```shell
#!/bin/bash
#author:shell

int=1

while(( int<=5 ))
do
  echo $int
  let "int++"
done
```

while 循环可用于读取键盘信息。下面的例子中，输入信息被设置为变量FILM，按 `<Ctrl-D>` 结束循环。

```shell
#!/bin/bash
#author:shell

echo "按下 <CTRL-D> 退出"
echo -n "输入你最喜欢的电视剧: "
while read FILM
do
  echo "$FILM 这确实是一部好电视剧"
done
```

### 无限循环

```shell
while :
do
    command
done
```

或者

```shell
while true
do
    command
done
```

或者

```shell
for (( ; ; ))
```

### until 循环

until 循环执行一系列命令直至条件为 true 时停止。until 循环与 while 循环在处理方式上刚好相反。一般 while 循环优于 until 循环，但在某些时候—也只是极少数情况下，until 循环更加有用。

```shell
until condition
do
  command
done
```

示例

```shell
#!/bin/bash
#author:shell

x=0

until [ $x -gt 10 ]
do
  echo $x
  x=`expr $x + 1`
done
```

### case

Shell case语句为多选择语句。可以用case语句匹配一个值与一个模式，如果匹配成功，执行相匹配的命令。

```shell
#!/bin/bansh
case 值 in
1)
  command1
  command2
  ...
  commandN
  ;;
2）
  command1
  command2
  ...
  commandN
  ;;
esac
```

示例

```shell
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
```

### 跳出循环

在循环过程中，有时候需要在未达到循环结束条件时强制跳出循环，Shell 使用两个命令来实现该功能：**break** 和 **continue**。

```shell
#!/bin/bash

while :
do
    echo -n "输入 1~10 之间的数字:"
    read num
    case $num in
        1|2|3|4|5|6|7|8|9|10) echo "你输入的数字为 ${num}"
        ;;
        *) echo "${num} 不在 1~10 之间"
            break
        ;;
    esac
done
```

```shell
#!/bin/bash

while :
do
    echo -n "输入 1~10 之间的数字:"
    read num
    case $num in
        1|2|3|4|5|6|7|8|9|10) echo "你输入的数字为 $num"
            break
        ;;
        *) echo "${num} 不在 1~10 之间"
            continue
        ;;
    esac
done
```

## 函数

格式

```shell
[ function ] funname [()]{
  action;
  [return int;]
}
```

- 可以带 function fun() 定义，也可以直接 fun() 定义,不带任何参数
- 调用函数仅使用其函数名 fun 即可
- 参数返回，可以显示加：return 返回，如果不加，将以最后一条命令运行结果，作为返回值。其中，函数返回值在调用该函数后通过 **$?** 来获得

```shell
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
```

### 函数参数

在Shell中，调用函数时可以向其传递参数。在函数体内部，通过 $n 的形式来获取参数的值，例如，$1表示第一个参数，$2表示第二个参数...

```shell
#!/bin/bash

fun() {
    echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    echo "第十个参数为 $11 !"
    echo "第十个参数为 ${10} !"
    echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "作为一个字符串输出所有参数 $* !"
}
fun 1 2 3 4 5 6 7 8 9 21 22
```

注意，$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用 ${n} 来获取参数。

## 输入/输出重定向

大多数 UNIX 系统命令从你的终端接受输入并将所产生的输出发送回​​到您的终端。一个命令通常从一个叫标准输入的地方读取输入，默认情况下，这恰好是你的终端。重定向命令列表如下：

| 命令 | 说明|
|:-|:-|
| command > file | 将输出重定向到 file |
| command < file | 将输入重定向到 file |
| command >> file | 将输出以追加的方式重定向到 file |
| n > file | 将文件描述符为 n 的文件重定向到 file |
| n >> file | 将文件描述符为 n 的文件以追加的方式重定向到 file |
| n >& m | 将输出文件 m 和 n 合并 |
| n <& m | 将输入文件 m 和 n 合并 |
| << tag | 将开始标记 tag 和结束标记 tag 之间的内容作为输入 |

### 重定向

一般情况下，每个 Unix/Linux 命令运行时都会打开三个文件：

- 标准输入文件(stdin)：stdin 的文件描述符为 0，Unix 程序默认从 stdin 读取数据
- 标准输出文件(stdout)：stdout 的文件描述符为 1，Unix 程序默认向 stdout 输出数据
- 标准错误文件(stderr)：stderr 的文件描述符为 2，Unix 程序会向 stderr 流中写入错误信息
>>>>>>> master
