echo ============31=============
awk -v OFS='\t' -F "\t" 'BEGIN{print "time\thost\tIP\t\trole\t\tenv\tlevel\tmessage"} FNR==NR && FNR>1{ip[$1]=$2;role[$1]=$3;env[$1]=$4;next} FNR>1{printf "%s\t%s\t",$1,$2;if($2 in ip) {print ip[$2],role[$2],env[$2],$3,$4} else{print "UNKOWN","UNKOWN","UNKOWN",$3,$4}}' ../data/inventory.tsv ../data/incidents.tsv
# 神来之笔是FNR==NR,这个就表示当前是第一个文件而不是第二个

echo ============32=============
awk -F '\t' 'FNR==NR && NR>1{if($3 ~ /^(ERROR|FATAL)$/){mp[$2]++;next}} FNR>1{if($1 in mp) arr[$NF]+=mp[$1]} END{for (i in arr) print i,arr[i]} ' ../data/incidents.tsv  ../data/inventory.tsv | sort -nrk 2

echo ============33=============
awk 'FNR==NR{arr[$0]++;next} {if($1 in arr && $3=="installed") arr[$1]=0} END{for (i in arr) {if(arr[i]>0){print i}}}' ../data/required_packages.txt ../data/packages.txt

echo ============34=============
grep -rnE "(ERROR|FATAL|TODO|FIXME)" ../logs/ ../conf/ ../src/
# 这个题grep纯一行的事，没必要用awk

echo ============35=============
awk 'FNR==NR{if($9 ~ /^5[0-9][0-9]$/) i++;next} {if($9 ~ /^5[0-9][0-9]$/) j++} END{print "FILE1""\n"i;print"FILE2\n"j}' ../logs/access_yesterday.log ../logs/access.log

echo ============36=============
awk -F ':' '{if($1=="Ticket"){t=$2} else if($1=="Host"){h=$2} else if($1=="Severity"){s=$2} else if($0 ~ /^$/) print "TICKET="t,"HOST="h,"SEVERITY="s} END{print "TICKET="t,"HOST="h,"SEVERITY="s}' ../data/tickets.txt

echo ============37=============
awk -v ORS=',' '$NF=="installed"{print $1}' ../data/packages.txt | sed 's/.$//'

echo ============38=============
awk 'NR>1{printf "%.2fMB\n",($5+0)/1024}' ../data/ps_snapshot.txt

echo ============39=============
awk -F, -v warn=85 -v crit=90 'NR>1 { status=($3>=crit || $4>=crit) ? "CRITICAL" : (($3>=warn || $4>=warn) ? "WARNING" : "OK"); print $1, $2, status }' ../data/metrics.csv

echo ============40=============
awk -v FS=',' -v warn=85 -v crit=90 -f ../tmp/ops_report.awk ../data/metrics.csv














