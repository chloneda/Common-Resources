#!/usr/bin/env bash

# -------------------------------------------------------------------------------
# FileName:    mysql.sh
# Revision:    1.0
# Email:       chloneda@gmail.com
# Website:     https://chloneda.github.io/
# 说明：        MySql 启动、停止、重启、查看进程状态和日志的脚本
# 使用方法：
#   1、修改MySql路径：          BASE_DIR=xxx
#   2、修改MySql配置文件路径:    CONF_FILE=xxx
#   3、其他参数：               MYSQL_USERNAME=root
#                             MYSQL_PASSWORD=root
#                             MYSQL_PORT=3306
#   4、启动MySql：    ./mysql.sh start
# -------------------------------------------------------------------------------

DIR=$(cd $(dirname $0) && pwd)

# chkconfig: 35 80 15
# description: mysql daemon

# Source function library.
. /etc/rc.d/init.d/functions

NAME=mysql
BASE_DIR=/opt/tools
MYSQL_HOME=$BASE_DIR/$NAME
DATA_DIR=${MYSQL_HOME}/data
CONF_FILE=${MYSQL_HOME}/my.cnf

MYSQL_USERNAME=root
MYSQL_PASSWORD=123456
MYSQL_PORT=3306

LOG=$MYSQL_HOME/logs/mysql.log

function start() {
  status
  REVAL=$?
  if [ $REVAL == 1 ];then
    ${MYSQL_HOME}/bin/mysqld_safe --defaults-file=${CONF_FILE} &
  else
    echo "MySql is running"
  fi
}

function stop() {
  status
  REVAL=$?
  if [ $REVAL == 0 ];then
    ${MYSQL_HOME}/bin/mysqladmin -u${MYSQL_USERNAME} -p${MYSQL_PASSWORD} -h127.0.0.1 -P${MYSQL_PORT} shutdown
    sleep 3
    while(true)
      do
        status
        REVAL=$?
          if [ $REVAL == 1 ];then
            break
          else
            echo "Waiting mysql stop"
            sleep 3
          fi
      done
  else
    echo "mysql already stop"
  fi
}

function status() {
  netstat -nltp | grep mysql
  REVAL=$?
  if [ $REVAL == 0 ];then
    echo "mysql is running"
    return 0
  else
    echo "mysql is not running"
    return 1
  fi
}

function restart() {
  stop
  sleep 3
  start
}

function log() {
  tail -f $LOG -n 500
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    restart
    ;;
  log)
    log
    ;;
  status)
    status
    ;;
  *)
    echo $"Usage: $0 start|stop|restart|status"
    RETVAL=2
esac
exit $RETVAL





