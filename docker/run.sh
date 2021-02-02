#!/bin/bash

# start mirakurun
echo 'start mirakurun'
cd /app
./docker/container-init.sh &

# start chinachu
cd /Chinachu

if [ ! -s rules.json ]; then
  echo [] > rules.json
fi

# wait start mirakurun
echo 'waiting for start mirakurun'
sleep 15

# init chinachu
echo 'init chinachu'
timeout 5 ./chinachu service wui execute

echo 'start chinachu'
pm2 start processes.json
pm2 save
echo 'chinachu started!'


trap_term(){
  echo 'exit'
  exit 0
}
trap 'trap_term' TERM

while :
do
  sleep 1
done

