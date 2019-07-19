#!/bin/bash

# Example for using User Defined Variables with JMeter
# These will be substituted in JMX test script

ARG Threads="1"
ARG JmxFile="1CApp"
T_DIR=/home/ec2-user/

# Reporting dir: start fresh
# set Folder for report
R_DIR=${T_DIR}/report
#Delete Report folder. better undestanding about "/dev/null 2>&1" https://stackoverflow.com/questions/10508843/what-is-dev-null-21
rm -rf ${R_DIR} > /dev/null 2>&1
# MAKE REPORT FOLDER 
mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/test-plan.jtl ${T_DIR}/jmeter.log  > /dev/null 2>&1
#Run./run file to trigger build
./run.sh -Dlog_level.jmeter=DEBUG \
	-Jthreads=${Threads} \
	-n -t ${T_DIR}/${JmxFile}.jmx -l ${R_DIR}/${JmxFile}.jtl -j ${R_DIR}/jmeter.log \
	-e -o ${R_DIR}

echo "==== jmeter.log ===="
cat ${R_DIR}/jmeter.log

echo "==== Raw Test Report ===="
cat ${R_DIR}/${JmxFile}.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/${JmxFile}.html"
