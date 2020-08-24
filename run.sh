#!/bin/sh
echo "lanching nginx"
#!/bin/sh
confd -onetime -backend env

/docker-entrypoint.sh "nginx" "-g" "daemon off;"
