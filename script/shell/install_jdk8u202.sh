#!/bin/bash

# 请确保以 root 权限运行此脚本

# 检查 JDK 压缩包是否存在
if [ ! -f jdk-8u202-linux-x64.tar.gz ]; then
    echo "错误：jdk-8u202-linux-x64.tar.gz 文件不存在"
    exit 1
fi

# 创建安装目录
sudo mkdir -p /usr/local/java

# 解压 JDK
sudo tar -xvzf jdk-8u202-linux-x64.tar.gz -C /usr/local/java

# 设置环境变量
echo "export JAVA_HOME=/usr/local/java/jdk1.8.0_202" | sudo tee -a /etc/profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" | sudo tee -a /etc/profile

# 使环境变量生效
source /etc/profile

# 验证安装
java -version

echo "JDK 1.8.0_202 安装完成"
echo "请重新登录或运行 'source /etc/profile' 以使环境变量生效"
