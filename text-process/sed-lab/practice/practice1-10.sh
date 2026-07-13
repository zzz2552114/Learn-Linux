echo ---------p1----------
sed -n "1,5p" ../logs/app.log

echo ---------p2-----------
sed "s#APP_ENV = dev#APP_ENV = prod#" ../conf/app.conf

echo ---------p3------------
sed "s#example\.com#internal\.com#g" ../data/users.csv

echo ---------p4------------
sed -E '/^[[:space:]]*($|#)/d' ../conf/app.conf 

echo ---------p5------------
sed -nE "/WARN|ERROR|FATAL/p" ../logs/app.log

echo ---------p6------------
sed -E "/DEBUG|(health check)/d" ../logs/app.log

echo ---------p7------------
sed -E "s#([0-9]{4})-([0.9]{2})-([0-9]{2})#\3/\2/\1#g" ../data/report.txt

echo ---------p8-------------
sed "/server[[:space:]]*{/i\# managed by sed lab" ../conf/nginx.conf

echo ---------p9-------------
cp ../conf/app.conf ../tmp/app.conf
sed -i.bak "s/DEBUG = true/DEBUG = false/g" ../tmp/app.conf

echo ---------p10-------------
grep "ERROR" ../logs/app.log | sed -E "s#^(.*)[[:space:]]+ERROR[[:space:]]+([^ ]+).*#time=\1 service=\2#g" 
