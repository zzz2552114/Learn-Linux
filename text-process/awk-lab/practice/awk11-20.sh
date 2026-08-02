echo ============11============
awk -F= '$(NF-1)="duration_ms"{sum+=$NF;i++} END{print i,sum,sum/i}' ../logs/app.log

echo ============12============
awk '{array[$9]++} END{for ( i in array ) {print i,array[i]}}' ../logs/access.log | sort -nrk2

echo ============13============
awk -v IGNORECASE=1 '$0 ~ /failed password/ {array[$(NF-3)]++} END{for (i in array) {print i,array[i]}}' ../logs/auth.log

echo ============14============
awk 'BEGIN{print "\nTITLE\n"} {print $1,$3;array[$3]++} END{print "\nCOUNT\n";for (i in array) {print i,array[i]}}' ../data/packages.txt

echo ============15============
awk 'NR>1 {if ($5+0>=85) {print $0}}' ../data/disk.txt

echo ============16============
awk -F= '{if($2){print $1"=***REDACTED***"}}' ../conf/app.env

echo ============17============
awk '{if (match($0,/request_id=[^ ]+/,arr)) {print arr[0]}} ; {if (match($0,/path=[^ ]+/)) {print substr($0,RSTART,RLENGTH)}}' ../logs/app.log
# 这里体现了match的两个用法，第一个是存到arr里，第二个是自动设置RSTART和RLENGTH

echo ============18=============
awk -F= '$1 == "API_KEY" || $1 == "TOKEN" { printf "%s length=%d prefix=%s contains_live=%s\n", $1, length($2), substr($2,1,7), (index($2,"live") ? "yes" : "no") }' ../conf/app.env
# 这里，length()表示取长度，substr()表示取子串，index()表示查询是否有这个子串，有返回起始位置，无返回0

echo ============19=============
awk -F '\t' 'NR==1{count+=NF} NR>1{if(NF==count){i++}} END{print i}' ../data/incidents.tsv

echo ============20=============
awk '$0 ~ /^[[:space:]]*(#|$)/ {next} {print NR,$0}' ../conf/sshd_config





