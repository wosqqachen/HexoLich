---
title: 在CentOS上安装Nginx 相关操作
date: 2023-10-16 18:02:22
tags:
  - nginx命令
categories:
  - Nginx
cover: 
feature: true
---
## 要在CentOS上安装Nginx，请按照以下步骤进行操作：
1.更新系统软件包：
2.安装EPEL存储库（Extra Packages for Enterprise Linux）
3.安装Nginx：
4.启动Nginx服务：
5.设置Nginx开机启动：
6.检查Nginx是否正常运行：
7.在Web浏览器中输入服务器的IP地址，你应该能够看到Nginx的欢迎页面。
8.启动 nginx 成功之后通过 IP 访问失败

``` bash
1.sudo yum update
2.sudo yum install epel-release
3.sudo yum install nginx
4.sudo systemctl start nginx
5.sudo systemctl enable nginx
6.sudo systemctl status nginx
7.
8.systemctl status firewalld.service
systemctl stop firewalld.service
$ nginx常用基础命令

netstat -ntlp #查看端口占用
#停止
/usr/local/nginx/sbin/nginx -s stop/quit
#重新加载
/usr/local/nginx/sbin/nginx -s reload
#修改配置
/usr/local/nginx/conf/nginx.conf
nginx -c /home/xx/nginx.conf
#-c </path/to/config> 为 Nginx 指定一个配置文件，来代替缺省的。 
#例如：nginx -t -c /usr/local/nginx/conf/nginx.conf 判断配置文件是否正确
nginx -t 
nginx -v

#建议一次性安装以下四个依赖库：pcre、zlib、OpenSSL和gd-devel
yum -y install pcre pcre-devel zlib zlib-devel openssl openssl-devel gd gd-devel
```
