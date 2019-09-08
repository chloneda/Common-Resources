#!/usr/bin/env bash

# DIR=$(cd $(dirname $0) && pwd)

export DIR=`dirname $0`

BASE_SERVER=192.168.1.11

yum install -y wget
wget $BASE_SERVER/soft-all/jdk-7u45-linux-x64.tar.gz

tar -zxvf jdk-7u45-linux-x64.tar.gz -C /opt/tools

cat >> /etc/profile << EOF
export JAVA_HOME=/usr/local/jdk1.7.0_45
export PATH=\$PATH:\$JAVA_HOME/bin
EOF

