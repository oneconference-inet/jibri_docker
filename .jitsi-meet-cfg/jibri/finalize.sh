#!/bin/bash

RECORDINGS_DIR=$1

echo "This is a dummy finalize script" > /tmp/finalize.out
echo "The script was invoked with recordings directory $RECORDINGS_DIR." >> /tmp/finalize.out
echo "You should put any finalize logic (renaming, uploading to a service" >> /tmp/finalize.out
echo "or storage provider, etc.) in this script" >> /tmp/finalize.out
echo "am finallize script customize from amang" >> /tmp/finalize.out


echo $(mkdir -p /config/recordings/records)


_RECORDING_FILENAME=$(find ${RECORDINGS_DIR} -type f -name "*.mp4")

MEETING_ID=$(cat $RECORDINGS_DIR/metadata.json | awk -F'"' '{print $4}' | awk -F'/' '{print $4}')
$(cp ${_RECORDING_FILENAME} /config/recordings/records/${MEETING_ID}.mp4)
curl --location --request GET 'http://172.19.0.1:9213/api/onebox/saveonebox/'${MEETING_ID}


exit 0
