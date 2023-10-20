---
title: Nginx前端静态项目部署
date: 2023-10-17 18:02:22
tags:
  - nginx命令
categories:
  - Nginx
cover: https://avatars.githubusercontent.com/u/126133433?v=4
feature: true
---
## Nginx 可以部署以下几类不同类型的项目：
**静态网站：**使用 HTML、CSS、JavaScript 等静态文件构建的网站，Nginx 可以将这些静态文件提供给用户。
**动态 Web 应用程序：**使用 PHP、Python、Java、Node.js 等语言开发的 Web 应用程序，Nginx 可以通过 FastCGI、uWSGI、SCGI 等协议与 Web 应用程序进行通信，以提供动态内容。
**反向代理：**以 Nginx 服务器作为代理服务器，可以将客户端的请求转发至后端的其他服务器或 Web 应用程序上，实现负载均衡、缓存加速、安全控制等功能。
**WebSocket 应用程序：**Nginx 可以使用 HTTP/1.1 或 HTTP/2 协议进行 WebSocket 代理，实现实时通信功能。
### 一、简单静态项目部署
1、打开 Nginx 配置文件 nginx.conf，该文件一般位于 /etc/nginx/ 目录下。
2、将 server 块添加到配置文件中，用于定义要部署的网站或 Web 应用程序：
配置定义了一个名为 http://test.com 的虚拟主机，监听 HTTP 80 端口，并将所有请求转发至 /var/www/test 目录下的 index.html 文件。其中 listen 关键字用于定义监听端口，server_name 用于定义虚拟主机的域名或 IP 地址，location 用于定义请求路径和资源文件的位置。

``` bash
使用WinSCP上线web项目到指定文件夹/var/www/test
nginx默认文件目录为/usr/share/nginx/html
vi /etc/nginx/nginx.conf
##编辑文件
server {
    listen 80;
    server_name test.com;
    location / { #新增
        root /var/www/test; #项目目录
        index index.html;
    }
}
:wq
nginx -s reload 
ps -ef | grep nginx 就可以看到Nginx进程是否存在了
```

**参考文章**
[nginx常用配置操作命令](https://blog.csdn.net/lzfaq/article/details/129354700)
[Nginx多种项目部署教程](https://zhuanlan.zhihu.com/p/619291407)
[Nginx部署命令](https://blog.csdn.net/weixin_45292658/article/details/132897256)
