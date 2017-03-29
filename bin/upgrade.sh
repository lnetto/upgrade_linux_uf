#!/bin/bash

# set splunk path
SPLUNK_HOME=/opt/splunkforwarder

# set desired version
NVER=6.5.2

# determine current version
CVER=`cat $SPLUNK_HOME/etc/splunk.version | grep VERSION | cut -d= -f2`

if [ "$NVER" != "$CVER" ]
then

  echo "Upgrading Splunk to $NVER."
  $SPLUNK_HOME/bin/splunk stop
  tar -xvf $SPLUNK_HOME/etc/apps/upgrade_linux_uf/static/splunkforwarder-6.5.2-67571ef4b87d-Linux-x86_64.tgz -C /opt
  $SPLUNK_HOME/bin/splunk start --accept-license --answer-yes

fi 

