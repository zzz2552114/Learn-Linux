echo ===========41============
gawk -v FPAT="([^,]+)|(\"[^\"]+\")" -v OFS='\t\t' 'BEGIN{print "name","role"} NR>1{print $2,$4}' ../data/quoted_users.csv
# 这里FPAT是指，每一个被分割块长什么样子

echo ===========42============
awk -F '[ =]' '{if($2=="ERROR"){s[$4]++} else if($2=="FATAL"){f[$4]++}} END{print "ERROR";asorti(s,a1);for (i in a1) print a1[i],s[a1[i]];print "FATAL";asorti(f,a2);for (j in a2) print a2[j],f[a2[j]]}' ../logs/app.log

