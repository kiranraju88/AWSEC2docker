#!/bin/bash

# Example for using User Defined Variables with JMeter
# These will be substituted in JMX test script

export Threads="1"

T_DIR=/

# Reporting dir: start fresh
R_DIR=${T_DIR}/report
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/test-plan.jtl ${T_DIR}/jmeter.log  > /dev/null 2>&1

./run.sh -Dlog_level.jmeter=DEBUG \
	-Jthreads=${Threads} \
	-n -t ${T_DIR}/1CApp.jmx -l ${T_DIR}/1CApp.jtl -j ${T_DIR}/jmeter.log \
	-e -o ${R_DIR}

echo "==== jmeter.log ===="
cat ${T_DIR}/jmeter.log

echo "==== Raw Test Report ===="
cat ${T_DIR}/1CApp.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/1CApp.html"