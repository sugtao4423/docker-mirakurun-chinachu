#!/bin/bash

message=`echo -n $(date +"%m/%d"); echo -n " "; echo "$2" | sed -e ':loop; N; $!b loop; s/\n/\\n/g' | jq -r .title`

php /recordedScripts/RecordTweet.php "$2"
php /recordedScripts/RecordSlack.php "$2"

cd /Chinachu/data
git add recorded.json
git commit -m "$message"
git push
