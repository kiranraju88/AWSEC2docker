#!/bin/bash
#
# Run JMeter Docker image with options
JMETER_VERSION="5.1.1"
NAME="jmeter"
IMAGE="jmeter:${JMETER_VERSION}"
WORK_DIR="/home/ec2-user"
# Finally run
sudo docker stop ${NAME} > /dev/null 2>&1
sudo docker rm ${NAME} > /dev/null 2>&1
#sudo docker run --name ${NAME} -i -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} $@
sudo docker run --name ${NAME} -i -v ${WORK_DIR}:${WORK_DIR} -w ${WORK_DIR} ${IMAGE}
