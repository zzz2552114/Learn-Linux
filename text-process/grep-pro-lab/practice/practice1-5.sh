#!/bin/bash

echo "---------h1--------"

grep -n "ERROR" ../logs/app.log

echo "---------h2--------"

grep -ni "Failed password" ../logs/auth.log

echo "---------h3--------"

grep -n -w "root" ../logs/auth.log
# 这里的-w表示匹配完整单词

echo "---------h4---------"

grep -nvE "^ *($|#)" ../conf/nginx.conf
# 这里空格可以直接输入空格 来表示，也可以用[ ]来显示
# 当然也可以用[[:space:]]来表示，但是这样也会匹配\t,\n这样的空白符号

echo "---------h5---------"

# 错误做法：grep -nE [400-599] ../logs/access.log
# 这样会把"400-599"视为7个字符，试图匹配这7个字符的其中一个
grep -nEw "[45][0-9][0-9]" ../logs/access.log
