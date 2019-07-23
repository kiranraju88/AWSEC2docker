#!/bin/bash
#
# Run JMeter Docker image with options
JMETER_VERSION="5.1.1"
NAME="jmeter"
IMAGE="jmeter:${JMETER_VERSION}"
WORK_DIR="/home/ec2-user"
# Finally run 
# start a container in detached mode, you use -d=true or just -d option.
sudo docker stop ${NAME} > /dev/null 2>&1
#https://unix.stackexchange.com/questions/163352/what-does-dev-null-21-mean-in-this-article-of-crontab-basics
sudo docker rm ${NAME} > /dev/null 2>&1
sudo docker run -d --name ${NAME} -i -v ${WORK_DIR}:${WORK_DIR} -w ${WORK_DIR} ${IMAGE}
