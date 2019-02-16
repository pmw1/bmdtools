#!/bin/bash
user=pmw
sudo docker rm -f /bmdtools
sudo docker run -i -t --name="bmdtools" --device /dev/blackmagic/io0  --entrypoint=/bin/bash -v /home/$user/apps/bmdtools/hostfiles:/apps/hostfiles --privileged pmw1/bmdtools
