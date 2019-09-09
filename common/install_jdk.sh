#!/usr/bin/env bash

# DIR=$(cd $(dirname $0) && pwd)
export DIR=`dirname $0`

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

yum install -y wget

# BASE_SERVER=192.168.1.11
# wget $BASE_SERVER/soft-all/jdk-7u45-linux-x64.tar.gz

wget http://192.168.12.47/upload/jdk-9.0.1_linux-x64_bin.tar.gz

tar -zxvf jdk-9.0.1_linux-x64_bin.tar.gz -C /opt/tools

mv jdk-9.0.1_linux-x64_bin jdk-9.0.1

cat >> /etc/profile << EOF
export JAVA_HOME=/opt/tools/jdk-9.0.1
export PATH=\$PATH:\$JAVA_HOME/bin
EOF

