#!/usr/bin/env bash

HOST="127.0.0.1"    #数据库IP
PORT="3306"         #数据库端口
USERNAME="root"     #用户名
PASSWORD="123456"   #密码
DB_NAME="common"     #数据库名称
DB_CHARSET="--default-character-set=utf8 -A"     # 字符集

BASE_MYSQL_DIR="/opt/tools/mysql"           # MySQL部署路径
MYSQL_SHELL=${BASE_MYSQL_DIR}/bin/mysql

datadir="show variables like '%datadir%';"
datadir_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${datadir}")
echo "mysql 数据文件存放位置：" `echo ${datadir_val} | cut -d' ' -f4`

echo "================= 内存配置情况 =================="

mem_dis_1="show variables like 'innodb_buffer_pool_size';"
mem_dis_1_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_1}")
mem_dis_1_val_1=`echo ${mem_dis_1_val} | cut -d' ' -f4`
mem_dis_1_val_2=`echo | awk "{print $mem_dis_1_val_1/1024/1024}"`
echo "InnoDB 数据和索引缓存：" $mem_dis_1_val_1

mem_dis_2="show variables like 'innodb_log_buffer_size';"
mem_dis_2_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_2}")
mem_dis_2_val_1=`echo ${mem_dis_2_val} | cut -d' ' -f4`
mem_dis_2_val_2=`echo | awk "{print $mem_dis_2_val_1/1024/1024}"`
echo "InnoDB 日志缓冲区：" $mem_dis_2_val_1

mem_dis_3="show variables like 'binlog_cache_size';"
mem_dis_3_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_3}")
mem_dis_3_val_1=`echo ${mem_dis_3_val} | cut -d' ' -f4`
mem_dis_3_val_2=`echo | awk "{print $mem_dis_3_val_1/1024/1024}"`
echo "二进制日志缓冲区：" $mem_dis_3_val_1

mem_dis_4="show variables like 'thread_cache_size';"
mem_dis_4_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_4}")
echo "连接线程缓存：" `echo $mem_dis_4_val | cut -d' ' -f4`

mem_dis_5="show variables like 'query_cache_size';"
mem_dis_5_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_5}")
echo "查询缓存：" `echo ${mem_dis_5_val} | cut -d' ' -f4`

mem_dis_6="show variables like 'table_open_cache';"
mem_dis_6_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_6}")
echo "表缓存：" `echo ${mem_dis_6_val} | cut -d' ' -f4`

mem_dis_7="show variables like 'table_definition_cache';"
mem_dis_7_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_7}")
echo "表定义缓存：" `echo ${mem_dis_7_val} | cut -d' ' -f4`

mem_dis_8="show variables like 'max_connections';"
mem_dis_8_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_8}")
echo "最大线程数：" `echo ${mem_dis_8_val} | cut -d' ' -f4`

mem_dis_9="show variables like 'thread_stack';"
mem_dis_9_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_9}")
echo "线程栈信息使用内存：" `echo ${mem_dis_9_val} | cut -d' ' -f4`

mem_dis_10="show variables like 'sort_buffer_size';"
mem_dis_10_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_10}")
echo "排序使用内存：" `echo ${mem_dis_10_val} | cut -d' ' -f4`

mem_dis_11="show variables like 'join_buffer_size';"
mem_dis_11_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_11}")
echo "Join操作使用内存：" `echo ${mem_dis_11_val} | cut -d' ' -f4`

mem_dis_12="show variables like 'read_buffer_size';"
mem_dis_12_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_12}")
echo "顺序读取数据缓冲区使用内存：" `echo ${mem_dis_12_val} | cut -d' ' -f4`

mem_dis_13="show variables like 'read_rnd_buffer_size';"
mem_dis_13_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_13}")
echo "随机读取数据缓冲区使用内存：" `echo ${mem_dis_13_val} | cut -d' ' -f4`

mem_dis_14="show variables like 'tmp_table_size';"
mem_dis_14_val=$(${MYSQL_SHELL} -h${HOST} -u${USERNAME} -p${PASSWORD} ${DB_NAME} -P${PORT} -e "${mem_dis_14}")
echo "临时表使用内存：" `echo ${mem_dis_14_val} | cut -d' ' -f4`

