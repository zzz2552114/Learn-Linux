echo ----------h6-----------

grep "([0-9]{1,3}\.){3}[0-9]{1,3}" -nEo ../logs/access.log
# 注意这里{x,y}表示匹配前面的内容最少x次最多y次

echo ----------h7-----------

grep -nE "ERROR|FATAL|timeout|'out of memory'" ../logs/app.log

echo ----------h8-----------

grep -nC 2 "FATAL" ../logs/app.log
# 这里-C 后面空格加数字表示显示“找到的行”的前后2行
# 不是目标行的，行号-内容；是目标行的，行号：内容

echo ----------h9-----------

grep -cE "ERROR|FATAL" ../logs/app.log ../logs/kubelet.log
# 这里告诉我们，要匹配的文件可以有多个，但是最好加-R

echo ----------h10----------

grep -f ../patterns/errors.patterns -nH -R ../logs/
# 这里-f+文件表示按照文件里的内容匹配，每一行作为一个模式，用|连接。
# -H显示文件名
# -R递归搜索
