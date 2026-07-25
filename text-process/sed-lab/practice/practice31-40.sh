echo ==========31===========
sed 's/foo/BAR/2' ../data/words.txt
# 这里的s///2表示只替换匹配到的第二个

echo ==========32===========
sed -n 's/debug=true/debug=false/g p' ../conf/system.ini 
# g和p可以共存，s///和p也可以共存

echo ==========33===========
sed -n 's/^user/USER/Ip' ../data/mixed.txt
# 这里的I表示匹配项大小写不敏感

echo ==========34===========
sed -E 's/([^,]+,)([^,]+)/\1\L\2/' ../data/users.csv
# 这里有两点要注意。
# 1.由于.*有贪婪匹配性质，所以我们如果说想匹配到逗号结束，最好用[^,]反向不选逗号
# 2. \L会把后面的东西转换为小写。\U会转换为大写

echo ===========35===========
sed -n '/ERROR/ { p ; q }' ../logs/app.log
# {}花括号里面的内容表示同时在模式空间
# p是模式参数，打印模式；q是quit，表示退出
# 省内存，防刷屏
# 这里说一下花括号和;以及-e的区别。重点在于花括号可以复用地址。而-e和;相同，必须重新写地址

echo ===========36===========
sed '/server_name/a\ add_header X-Frame-Options DENY;' ../conf/nginx.conf
# 这里a和i后面都要加一个\，表示命令结束续行，后面的空格会被算作正文内容。不加\也可以，但是不标准，所以加

echo ===========37===========
sed '/location \/health/c\ location /health { return 200 "ok"; }' ../conf/nginx.conf
# c\表示change，替换为新文本

echo ===========38===========
sed '/# Application config/r ../data/header.txt' ../conf/app.conf
# r可以在某行后追加文件，注意不要加\！！！

echo ===========39===========
# 本来应该用w，但是我觉得可以重定向
# 但是都是流式的写入，所以没啥区别。在要写入多个文件的时候好用一些
sed -n -e '/ERROR/w ../tmp/error1.log' -e '/api/w ../tmp/error2.log' ../logs/app.log
cat ../tmp/error*
# 这里w类似于>，每次打开文件都会删掉原来的东西，如果要追加，只能重定向>>

echo ===========40============
sed 'y/abcdefg/ABCDEFG/' ../data/packages.txt
# 这个很有意思，y/src/dst/表示，对于src中的逐个字符，用dst替换，逐字符替换，二者必须长度相等。








