NR>1 { status=($3>=crit || $4>=crit) ? "CRITICAL" : (($3>=warn || $4>=warn) ? "WARNING" : "OK"); print $1, $2, status }
