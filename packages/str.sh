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