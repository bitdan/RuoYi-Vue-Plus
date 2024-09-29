#!/bin/bash

# 1. 安装必要的工具
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# 2. 添加Docker仓库（使用阿里云镜像）
sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# 3. 更新yum包索引
sudo yum makecache fast

# 4. 安装Docker
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# 5. 启动Docker服务
sudo systemctl start docker

# 6. 设置Docker开机自启
sudo systemctl enable docker

# 7. 设置Docker镜像和日志配置
sudo mkdir -p /etc/docker
echo '{
  "registry-mirrors": [
      "https://docker.1panel.live"
  ],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "20m",
    "max-file": "3"
  }
}' | sudo tee /etc/docker/daemon.json

# 8. 重启Docker服务以应用更改
sudo systemctl restart docker

echo "Docker 安装与配置完成！"
