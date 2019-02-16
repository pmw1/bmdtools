#!/bin/bash
user=$USER

sudo docker rm -f recording
sudo docker run -i -t -d --name="recording" --device /dev/blackmagic/io0 -v /home/pmw/apps/bmdtools/hostfiles:/apps/hostfiles --privileged  pmw1/bmdtools
sudo docker exec -d recording bash /apps/hostfiles/record.sh