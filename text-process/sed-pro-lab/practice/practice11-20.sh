echo ===========p11=============
sed -E "s/(^[[:space:]]*[^#]?[[:space:]]*)(PermitRootLogin) yes/\1\2 no/g" ../conf/sshd_config

echo ============p12=============
sed -E 's/(^[[:space:]]*[^#]?[[:space:]]*)(PasswordAuthentication) yes/\1\2 no/g' ../conf/sshd_config >> ../tmp/sshd_config

echo ============p13=============
sed -E "s/(^[[:space:]]*[^#]?[[:space:]]*)server_tokens on\;/\1server_tokens off\;/g" ../conf/nginx.conf

echo ============p14==============
sed -E "/location \/admin/d" ../conf/nginx.conf

echo ============p15===============
sed -n "/production/,/staging/p" ../conf/system.ini | sed -E "s/(log_level=)debug/\1warn/g"

echo =============p16===============
sed -E "s/(DATABASE_URL=|PASSWORD=|API_KEY=).*/\1REDACTED/g" ../conf/app.conf

echo =============p17================
sed -E 's/^.*HTTP.*\" *([0-9]{3}).*/\1/g' ../logs/access.log 
# 这里提取HTTP状态码也可以用grep+管道，其实也不简单
grep -ioE "http.*\"[ ][0-9]{3}" ../logs/access.log | grep -oE "[0-9]{3}"
echo =============p18=================
sed -E ':a; /\\$/ { N; s/[[:space:]]*\\\n[[:space:]]*/ /; ba }' ../conf/long.conf
# 暂时不用会这个，只要知道N是连接两行即可
echo =============p19=================
# 原题是一个关于sed显示行号的命令，sed显示行号非常麻烦，所以改用grep即可
grep -vnE '^[[:space:]]*($|#)[[:space:]]*' ../conf/nginx.conf 
# 但是话又说回来，这个题可以练一下N表示方式
sed -nE '/^[[:space:]]*($|#)[[:space:]]*/! { =; p }'  ../conf/nginx.conf | sed 'N; s/\n/: /g'  
# 这里，/!表示对模式空间规则取反。{}可以放规则和特殊参数。;可以隔开命令，N需要隔开

echo ==============p20================
grep -rlE '^(PASSWORD|API_KEY|DATABASE_URL)=' conf logs data | xargs sed -i.bak -E 's/^(PASSWORD|API_KEY|DATABASE_URL)=.*/\1=REDACTED/'
