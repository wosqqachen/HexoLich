#!/bin/bash

# 生成相关的文件夹地址
mkdir /usr/local/shadowsocks

# shadowsocks 安装
# 进入目标地址
cd /usr/local/shadowsocks

###### v2ray (shadowsocks会从当前目录下获取插件)
wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.2.0/v2ray-plugin-linux-amd64-v1.2.0.tar.gz
tar zxvf v2ray-plugin-linux-amd64-v1.2.0.tar.gz
ln -s ./v2ray-plugin_linux_amd64 ./v2ray

###### shadowsocks
# 下载 socket 服务端应用
wget https://github.com/shadowsocks/go-shadowsocks2/releases/download/v0.1.5/shadowsocks2-linux.gz

# 解压
gzip -d shadowsocks2-linux.gz

# 增加可执行权限
chmod +x shadowsocks2-linux

# 生成运行 shadowsocks 应用的 shell 脚本
echo "#!/bin/bash

nohup ./shadowsocks2-linux -s 'ss://AES-128-GCM:password@:28800' -verbose -plugin v2ray -plugin-opts "server" > log 2>&1 &
" >./start.sh

# 运行这个脚本
sh ./start.sh

# 生成关闭 shadowsocks 应用的 shell 脚本
echo '#!/bin/bash

PID=`ps -ef | grep shadowsocks2-linux | grep -v grep | awk "{print $2}"`
if [[ "" !=  "$PID" ]]; then
echo "killing $PID"
kill -9 $PID
fi' >./stop.sh

# 防火墙  开放shadowsocks端口
firewall-cmd --zone=public --add-port=28800/tcp --permanent
firewall-cmd --reload
