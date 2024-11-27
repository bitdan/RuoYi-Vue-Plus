#!/bin/bash

# 备份旧的 yum 源配置文件
copy /etc/yum.repos.d/CentOS-Base.repo  /etc/yum.repos.d/CentOS-Base.repo.bak

# 下载阿里云 CentOS 7 yum 源配置文件
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

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
