#!/bin/bash
PID=`ps -eAaf | grep ffmpeg | grep -v grep | awk '{print $2}'`
kill -2 $PID