#!/bin/bash

cp $CI_PROJECT_DIR/jmeter/estore.jmx /opt/
/opt/apache-jmeter-4.0/bin/jmeter -n -t /opt/estore.jmx