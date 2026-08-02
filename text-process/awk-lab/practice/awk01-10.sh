echo ===========h1===========
awk -v OFS=':' 'NR<=3{print NR,$0}' ../logs/app.log

echo ===========h2===========
awk '{print $1,NF,$NF}' ../data/packages.txt

echo ===========h3===========
awk -F "\t" 'NR>1{print $1,$3,$4}' ../data/inventory.tsv

echo ===========h4===========
awk -F "," 'NR>1{print $2,$3,$4}' ../data/users.csv

echo ===========h5===========
awk -F "=" '{if($2)print$1"=>"$2}' ../conf/app.env

echo ===========h6===========
awk -F "," -v OFS="," '{print $2,$4}' ../data/users.csv

echo ===========h7===========
awk '$0 ~ /(WARN|ERROR|FATAL)/{print NR,$0}' ../logs/app.log
# 这里$0 ~ // 表示按行正则匹配

echo ===========h8===========
awk -v IGNORECASE=1 '$0 ~ /(warn|error|fatal)/ {print NR,$0}' ../logs/app.log

echo ===========h9===========
awk -F ',' '$3>=85 || $4>=85 {print NR,$0}' ../data/metrics.csv

echo ===========h10==========
awk -F ',' '{printf "%s\t%s\t%s\t\n",$2,$3,$4}' ../data/metrics.csv




