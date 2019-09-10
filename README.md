# Linux常用脚本
简介
这些脚本是我初始化基本Linux环境，或者在使用过程中，或是日常运维期间总结出来的脚本，在此乐意分享出来供大家学习。希望可以给大家带来帮助，如有错误欢迎批评指正。

## 目录
- [Shell脚本代码规范](https://github.com/chloneda/shell/blob/master/markdown/Shell脚本代码规范.md)：Shell脚本代码规范文档，用于规范脚本代码，提高代码质量。

- [common](https://github.com/chloneda/shell/tree/master/common)：主要包含一些基本的脚本，比如安装JDK脚本等。

- [es-shell](https://github.com/chloneda/shell/tree/master/es-shell)：该目录包含Elasticsearch的一些启动、停止脚本。

- [mysql](https://github.com/chloneda/shell/tree/master/mysql)：该目录主要是MySql的备份数据库脚本。

- [tomcat](https://github.com/chloneda/shell/tree/master/tomcat)：该目录主要是tomcat的脚本。

## 下载

通过git命令下载脚本文件至自定义目录：
```
git clone git@github.com:chloneda/shell.git
```

## 用法

1、下载代码后，给文件加可执行权限：
```
chmod -R +x shell
```

2、执行 **deploy.sh** 脚本用于初始化基本环境，具体安装哪些软件可以自主修改！
```
./deploy.sh
```

3、单独安装某个软件请单独执行脚本，例如：
```
./install_tomcat8.sh
```

## 维护者
[Chloneda](https://github.com/chloneda/)

