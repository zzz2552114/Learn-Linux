echo ============21=============
awk '$7!="/health"&&$9 ~ /^5[0-9]{2}$/ {key=$7" "$9;mp[key]++} END{for (i in mp) {print i,mp[i]}}' ../logs/access.log

echo ============22=============
awk '$7 ~ /(admin|env|wp-login|\.\.)/ || $NF ~ /sqlmap/ {print $0}' ../logs/access.log

echo ============23=============
awk -v IGNORECASE=1 '$0 ~ /failed password/ {array[$(NF-3)]++} END{for (i in array){if(array[i]>=2){print i,array[i]}}}' ../logs/auth.log

echo ============24============
awk -v threshold=85 'NR>1 { use=$5; gsub(/%/,"",use); if (use >= threshold) print $0}' ../data/disk.txt

echo ============25============
awk -F "[ =]" '/(ERROR|FATAL)/ {mp[$4]++;if($(NF-1)=="duration_ms"){sum+=$NF;p++}} END{for (k in mp) print "SERVICE="k,mp[k];print "\nCOUNT\n";print p,sum,sum/p}' ../logs/app.log

echo ============26============
awk 'NR>1 && $3+0>=50 {print $0};NR>1{array[$NF]+=$(NF-1)} END{for( i in array) print i,array[i]}' ../data/ps_snapshot.txt | sort

echo ============27============
awk '{min=substr($1,12,5);status=toupper($2);if (status ~ /(INFO|WARN|WARNING|ERROR|FATAL)/) {c[min][status]++}} END{for (r in c) {for ( col in c[r]) {print r,col,c[r][col]}}}' ../logs/app.log

echo ============28============
awk '{c=substr($6,1,1); mp[c]++} END{for (i in mp) print i,mp[i]}' ../logs/kubelet.log | sort 

echo ============29=============
find ../conf/ -type f -exec awk '$0 ~ /^[[:space:]](#|$)/ {next};/(PermitRootLogin yes|PasswordAuthentication yes|server_tokens on)/{print FILENAME":"$0}' {} +

echo ============30=============
find ../conf/ ../src -type f -exec awk -v IGNORECASE=1 '$0 ~ /(api_key|^token=|default_password|jwtsecret|database_url|secret@)/ {print FILENAME":"$0}' {} +

