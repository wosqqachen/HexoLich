---
title: 在CentOS上一键搭建shadowsocks服务科学上网
date: 2023-10-18 18:02:22
tags:
  - 翻墙
categories:
  - shadowsocks
cover: https://avatars.githubusercontent.com/u/126133433?v=4
feature: true
---

1、首先购买一款VPS，也有免费的，当然这里还是推荐大家自己买一款，免费的太多人用速度延迟不敢保证，另外也有较多限制性，再说VPS的价格也不贵，很多低价便宜的VPS主机商，比起直接买VP恩性价比高不少，而且自由度更高，不会出现限制流量设备网速等问题；这里推荐大家使用<a href="https://my.racknerd.com/aff.php?aff=9315" target="_blank">RackNerd 高性价比便宜</a>和 搬瓦工；注册账号后可以自己选择一款符合需求的VPS；购买好VPS后可以得到一个主机IP，ROOT账号和密码，然后使用工具连接上系统;Shadowsocks 代理协议如果被墙，推荐使用 Trojan或Vless协议。

2、秋水大大的脚本支持CentOS 6+，Debian 7+，Ubuntu 12+等常见的Linux发行版;比较推荐选择shadowsocks的libev版本，尤其是当你的vps配置比较低的时候，libev轻量级的优势就凸显出来了，还支持simple-obfs。

3、下载任意Shadowsocks软件压缩包，下载后解压至任意目录安装。
[【最新版 Shadowsocks-4.1.7.1】](https://github.com/shadowsocks/shadowsocks-windows/releases/download/4.1.7.1/Shadowsocks-4.1.7.1.zip)、[【推荐 Shadowsocks-4.0.10 】](https://github.com/shadowsocks/shadowsocks-windows/releases/download/4.0.10/Shadowsocks-4.0.10.zip)、[【XP系统 Shadowsocks-3.2】](https://github.com/shadowsocks/shadowsocks-windows/releases/download/3.2/Shadowsocks-3.2.zip)、[安卓最新版](https://github.com/shadowsocks/shadowsocks-android/releases/download/v4.6.1/shadowsocks--universal-4.6.1.apk)
[【历史版本】](https://github.com/shadowsocks/shadowsocks-windows/releases)

``` bash
yum -y install wget
#升级内核
yum --enablerepo=elrepo-kernel -y install kernel-ml kernel-ml-devel
#bbr一键脚本：
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh
chmod +x bbr.sh
./bbr.sh

#Shadowsocks 四合一脚本：
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

#推荐安装libev版本，选择AEAD 加密，开启simple-obfs，然后等待脚本安装完毕即可。
#如需手动修改请修改完配置文件后重启对应的 Shadowsocks 服务：
vi /etc/shadowsocks-libev/config.json
#Shadowsocks-libev  开启、停止、重启和查看状态命令：
/etc/init.d/shadowsocks-libev start | stop | restart | status
```

**参考文章**
[轻松配置SSR服务端科学上网](https://getzhuji.com/74.html)
[Shadowsocks 设置教程](https://shadowsockshelp.github.io/Shadowsocks/windows.html)
[2023年国外高性价比便宜 VPS 推荐](https://p3terx.com/archives/cheap-and-costeffective-vps-recommended.html)
[自用翻墙机场推荐](https://jimubiedao.com/1681)