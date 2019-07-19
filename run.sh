#!/bin/bash
#
# Run JMeter Docker image with options
JMETER_VERSION="5.1.1"
NAME="jmeter"
IMAGE="jmeter:${JMETER_VERSION}"

# Finally run
sudo docker stop ${NAME} > /dev/null 2>&1
sudo docker rm ${NAME} > /dev/null 2>&1
sudo docker run --name ${NAME} -i -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} $@