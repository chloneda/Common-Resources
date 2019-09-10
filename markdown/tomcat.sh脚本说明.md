# tomcat.sh 脚本使用说明

简介

Tomcat是我们常用的服务器，但缺少启动、停止、重启、查看状态和查看日志的统一脚本，而tomcat.sh脚本就提供这样的功能。

## 下载

通过git命令下载脚本文件至自定义目录：
```
git clone git@github.com:chloneda/shell.git
```

下载代码后，给文件加可执行权限：
```
chmod -R +x shell
```

## 修改参数

找到tomcat.sh脚本，修改两个参数：
- 修改为你所在设备的java路径：   JAVA_HOME=xxx
- 修改为你所在设备的Tomcat路径： CATALINA_HOME=xxx

修改后内容如下：
```
export JAVA_HOME=/opt/jdk1.8.0_151/
export PATH=$JAVA_HOME/bin:$PATH

CATALINA_HOME=/opt/tomcat
```

## 使用方法
找到tomcat.sh脚本所在位置.

执行脚本，启动tomcat：
```
./tomcat.sh start
```

停止tomcat：
```
./tomcat.sh stop
```

重启tomcat
```
./tomcat.sh restart
```

查看tomcat进程是否存在：
```
./tomcat.sh status
```

查看tomcat日志：
```
./tomcat.sh log
```


