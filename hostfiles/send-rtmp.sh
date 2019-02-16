#!/bin/bash

	HOST="x.rtmp.youtube.com"
	APP="live2"
	STREAMKEY="kf5v-1hpj-skk3-av6m"
	PORT="80"

	URI="rtmp://$HOST/$APP/$STREAMKEY"
	echo "URI: $URI"	
	
	bmdcapture -m 9 -C 0 -A 2 -V 4 -F nut -f pipe:1 | \
	ffmpeg -re -i - \
	-c:v libx264 \
	-x264-params keyint=120 \
	-pix_fmt yuv420p \
	-profile:v main \
	-f flv \
	-r 30 \
	-preset veryfast \
	-tune zerolatency \
	-threads 8 \
	-b:v 2500K \
	-c:a aac -ar 48000 \
	-b:a 128k \
	-bufsize 1000k \
	$URI