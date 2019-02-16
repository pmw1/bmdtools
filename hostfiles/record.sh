#!/bin/bash

FILENAME="recording"
TIMESTAMP=`date +%Y%m%d%H%M%S`
echo "Preparing to record video: $FILENAME-$TIMESTAMP.mp4"
bmdcapture -m 9 -C 0 -A 2 -V 4 -F nut -f pipe:1 | \
ffmpeg -re -i - \
-deinterlace \
-c:v libx264 -pix_fmt yuv420p -profile:v high -level 5 -f mp4 -r 30 \
-b:v 5000K \
-c:a aac -ab 256k \
/apps/hostfiles/recordings/$FILENAME-$TIMESTAMP.mp4
