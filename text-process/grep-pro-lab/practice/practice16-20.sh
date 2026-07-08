#!/bin/bash

echo ---------h16---------
grep -LR "PasswordAuthentication no" ../conf
# 这里重点学习的是-L的用法，先学-l，表示列出所有包含待检索语句的文件。-L取-l的那些相反文件

echo ---------h17----------
output=$(grep "PermitRootLogin yes" ../conf/sshd_config | grep -v "^[[:space:]]*#")

if [[ -z "$output" ]] # 这里-z表示判断空文件，-n可以表示判断非空。注意[[]]内部前后的空格
then
    echo ok
else
    echo unsafe
fi

echo ---------h18----------
grep -ioE "http.*\"[ ][0-9]{3}" ../logs/access.log | grep -oE "[0-9]{3}"

echo ---------h19----------
grep -nF "https://api.example.com/v1" ../src/app.py
grep -nF "a.b[c]" ../docs/release-notes.txt
# 这里的-F表示忽略正则，不产生转义

echo ---------h20-----------

grep -n -- "-Xmx" ../conf/jvm.options
# -options -- -abc 这样的格式
