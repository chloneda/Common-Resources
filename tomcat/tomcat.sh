#!/usr/bin/env bash

# -------------------------------------------------------------------------------
# FileName:    tomcat.sh
# Revision:    1.0
# Email:       chloneda@gmail.com
# Website:     https://chloneda.github.io/
# 说明：        tomcat启动、停止、重启、查看进程状态和日志的脚本
# 使用方法：
#   1、修改java路径：  JAVA_HOME
#   2、修改Tomcat路径： CATALINA_HOME
#   3、启动Tomcat：./tomcat.sh start
# -------------------------------------------------------------------------------

export JAVA_HOME=/opt/tools/jdk1.8.0_151/
export PATH=$JAVA_HOME/bin:$PATH

CATALINA_HOME=/opt/tools/tomcat

# TOMCAT_USER is the default user of tomcat
TOMCAT_USER=root
SHUTDOWN_WAIT=20

TOMCAT_USAGE="Usage: $0 start|stop|restart|status||log"
function help() {
  echo "$TOMCAT_USAGE"
}

function get_tomcat_pid() {
  echo `ps -ef | grep $CATALINA_HOME/ | grep -v grep | tr -s " "|cut -d" " -f2`
}

function user_exists() {
  if id -u $1 >/dev/null 2>&1; then
    echo "1"
  else
    echo "0"
  fi
}

function status() {
  pid=$(get_tomcat_pid)
  if [ -n "$pid" ]; then
    echo -e "Tomcat is running with pid: $pid !"
  else
    echo -e "Tomcat is not running!"
  fi
}

function start() {
  pid=$(get_tomcat_pid)
  if [ -n "$pid" ]; then
    echo -e "Tomcat is already running (pid: $pid) !"
  else
    echo -e "Starting tomcat!"
    if [ `user_exists $TOMCAT_USER` = "1" ]; then
      su $TOMCAT_USER -c $CATALINA_HOME/bin/startup.sh
    else
      $CATALINA_HOME/bin/startup.sh
    fi
    status
  fi
  return 0
}

function stop() {
  pid=$(get_tomcat_pid)
  if [ -n "$pid" ]; then
    echo -e "Stoping tomcat!"
    $CATALINA_HOME/bin/shutdown.sh
    let kwait=$SHUTDOWN_WAIT
    count=0;
    until [ `ps -p $pid | grep -c $pid` = '0' ] || [ $count -gt $kwait ]
    do
      echo -n -e "Waiting for processes to exit!";
      sleep 1
      let count=$count+1;
    done
    if [ $count -gt $kwait ]; then
      echo -n -e "Killing processes which didn't stop after $SHUTDOWN_WAIT seconds!"
      kill -9 $pid
    fi
  else
    echo -e "Tomcat is not running!"
  fi
  return 0
}

function restart() {
  pid=$(get_tomcat_pid)
  if [ -n "$pid" ]; then
    echo -e "Stoping tomcat!"
    kill -9 $pid
  fi
  echo -e "Starting tomcat!"
    if [ `user_exists $TOMCAT_USER` = "1" ]; then
      su $TOMCAT_USER -c $CATALINA_HOME/bin/startup.sh
    else
      $CATALINA_HOME/bin/startup.sh
    fi
    status
}

function log(){
    tail -f $CATALINA_HOME/logs/catalina.out -n 500
}

case $1 in
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
    help
    ;;
esac
exit 0