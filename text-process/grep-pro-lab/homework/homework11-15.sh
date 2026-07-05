echo -----------h11----------
grep -rinE --include=*.{log,env,py,js,md} --exclude-dir={archive,vendor} "password|token|api_key|database_url|jwt_secret|secret" -niER ~/learn-linux/text-process/grep-pro-lab
echo -----------h12----------
grep -nv "^#" ../conf/sshd_config | grep "PermitRootLogin[[:space:]]*yes|Passwordauthentication[[:space:]]yes" -iE

echo -----------h13----------
grep -nv "^[[:space:]]*#" ../conf/nginx.conf | grep "server_tokens on[[:space:]]*;" -iE

echo -----------h14----------
grep -nv "/health" ../logs/access.log | grep -iE "http.*5[0-9][0-9]"

echo -----------h15----------
find ../conf ../src -type f  -exec grep -nEH "TODO|FIXME|PASSWORD|JWT_SECRET" {} +
