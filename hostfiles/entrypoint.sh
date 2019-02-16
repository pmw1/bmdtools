#!/bin/bash
bmdcapture -m 9 -C 0 -A 2 -V 4 -F nut -f pipe:1 | ffmpeg -re -i -  -c:v libx264 -x264-params keyint=120 -pix_fmt yuv420p -profile:v main -f flv -r 30 -preset ultrafast -tune zerolatency -threads 8 -b:v 2500K -c:a aac -ar 48000 -bufsize 1000k "rtmp://204.13.45.187:1935/live/stream"
