#!/bin/bash
bmdcapture -m 9 -C 0 -A 2 -V 4 -F nut -f pipe:1 | ffmpeg -re -i -  -c:v libx264 -x264-params keyint=120 -pix_fmt yuv420p -profile:v main -f flv -r 29.97 