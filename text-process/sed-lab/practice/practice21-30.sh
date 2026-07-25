echo ==========21============
sed '/\/health / d' ../logs/access.log

echo ==========22============
sed -E 's/(.*5[0-9][0-9].*)/\[SERVER_ERROR] \1/g' ../logs/access.log

echo ==========23============
sed -E '/\[production\]/,/\[/ s/(.*debug=).*/\1false/g' ../conf/system.ini

echo ==========24============
sed -E 's/(.*,.*,).*(@.*)/\1\*\*\*\2/g' ../data/users.csv

echo ==========25============
sed -nE 's/.*token=([0-9a-zA-Z]+).*/\1/p' ../logs/app.log


echo ==========26============
sed -nE -e '/\[service: (.*)\]/ h' -nEe '/ERROR/ { G ; s/(.*)\n(.*)/\2 \1/p}' ../logs/service.log
# 这里，h和G是两个对hold space（保持空间/暂存区）的操作。
# h是替换，把内存模式空间里的东西复制，替换掉暂存区的内容；H是把模式空间里的内容向暂存区的内容追加，用\n连接。
# g是h的对偶，暂存区->工作区。G是H的对偶，暂存区->工作区
# 这里刚好用到h和G。这里sed本质也是一行一行工作。匹配到service就替换暂存区，没匹配到就保持。匹配到ERROR就把暂存区的内容追加然后操作，没匹配到就-n掠过。

echo ==========27============
sed -Ee '/(DEBUG|TRACE)/d' -e 's/warning/WARN/g' ../logs/app.log

echo ==========28============
sed -E -f ../tmp/sanitize.sed ../conf/app.conf

echo ==========29============
sed -E 's/status=[0-9]{3}/[&]/g' ../data/words.txt
# 感觉这里就是一个便捷语法糖，也可以用()加\1来实现

echo ==========30============
sed 's#/api/v1/orders#/api/v2/orders#g' ../logs/access.log 
