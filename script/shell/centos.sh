#!/bin/bash

# 判断是否为海外服务器（假设通过检测外网 IP 来判断）
# 这里只是一个示例，你可以根据实际情况修改检查条件，例如通过判断是否可以访问阿里云镜像站点等
if curl -s https://www.cloudflare.com/cdn-cgi/trace | grep -q "loc=CN"; then
    # 备份旧的 yum 源配置文件
    cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak

    # 下载阿里云 CentOS 7 yum 源配置文件
    wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

    echo "阿里云 CentOS 7 yum 源配置文件已下载"
else
    echo "非中国大陆服务器，跳过阿里云源配置"
fi

# 清理 yum 缓存并重建缓存
yum clean all
yum makecache

# 安装 EPEL 源
sudo yum install -y epel-release

# 更新系统
sudo yum update

# 安装开发工具和其他常用软件
sudo yum groupinstall -y 'Development Tools'
sudo yum install -y openssl-devel htop telnet

echo "yum 配置完成！"
