#!/bin/bash

echo ----------h26----------
grep -nF "POST /login" ../logs/access.log | grep "HTTP.*401"

echo ----------h27----------
grep -nE "role=api" ../data_inventory.txt | grep "env=prod"

echo ----------h28----------
grep -ns "APP_ENV" ../conf/app.env ../conf/not-exist.env
# 这里的-s命令用于排除"文件无法访问"类型的错误，包括文件不存在等等
# 但是无法排除：正则表达式写错无法解析，参数写错，选项写错

echo ----------h29----------
grep -nE "status=(200|201)" ../logs/app.log
grep -n "status=\(200\|201\)" ../logs/app.log
# 这里不用关注第二行，学会-E即可

echo ----------h30----------
grep -nvE -f ../patterns/security.patterns ../logs/access.log
# 这里依旧要记住-f表示按照后面的文件来匹配。每一行是一个匹配项，相当于用|隔开
