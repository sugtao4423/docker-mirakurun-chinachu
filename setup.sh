#/bin/sh
if [ -e docker-compose.yml ]; then
  echo 'docker-compose.yml already exists.'
  exit 1
fi

cp docker-compose.sample.yml docker-compose.yml

cp mirakurun/config/channels.sample.yml mirakurun/config/channels.yml
cp mirakurun/config/server.sample.yml   mirakurun/config/server.yml
cp mirakurun/config/tuners.sample.yml   mirakurun/config/tuners.yml

git clone --depth=1 https://github.com/l3tnun/docker-mirakurun-epgstation.git docker-mirakurun-epgstation
mv docker-mirakurun-epgstation/epgstation/{.*,*} epgstation/
mv epgstation/config/enc.js.template                epgstation/config/enc.js
mv epgstation/config/config.yml.template            epgstation/config/config.yml
mv epgstation/config/operatorLogConfig.sample.yml   epgstation/config/operatorLogConfig.yml
mv epgstation/config/epgUpdaterLogConfig.sample.yml epgstation/config/epgUpdaterLogConfig.yml
mv epgstation/config/serviceLogConfig.sample.yml    epgstation/config/serviceLogConfig.yml
rm -rf docker-mirakurun-epgstation
