#!/bin/bash

echo ----------h21----------
grep -nE "^DEBUG=false$" ../conf/app.env

grep -nEx "DEBUG=false" ../conf/app.env
# 这里-x这个选项，可以表示匹配整行，必须正好是后面的那个东西

echo ----------h22----------
grep -nrlE "TODO|FIXME" ../src/ ../docs
# 这里-l这个选项，表示只输出文件名！！！

echo ----------h23----------
grep -nE "ERROR" ../logs/app.log | head -n 2

grep -nEm 2 "ERROR" ../logs/app.log
# 这里的-m选项表示最多输出几行，和head等价，性能更好
echo ----------h24-----------
grep -n -A 2 -B 1 "ImagePullBackOff" ../logs/kubelet.log
# -A after -B before，只要记住大写就可以
echo ----------h25-----------
grep -nEr --include=*.env* --exclude=*.bak "API_KEY" ../conf
# 这里注意！！exclude优先级是高于include的！！！
# 而且，这两个东西后面不能写相对路径，如果要写相对路径，可以写--exlude-dir=
