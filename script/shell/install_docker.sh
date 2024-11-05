#!/bin/bash

# 检查是否以 root 权限运行
if [ "$EUID" -ne 0 ]; then
    echo "请以 root 权限运行此脚本"
    exit 1
fi

# 检查操作系统类型
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
elif [ -f /etc/redhat-release ]; then
    OS="rhel"
else
    echo "无法检测操作系统类型"
    exit 1
fi

# 安装 Docker 的函数定义 - CentOS/RHEL
install_docker_redhat() {
    echo "检测到 ${OS} 系统，开始安装 Docker..."
    # 安装必要的工具
    yum install -y yum-utils device-mapper-persistent-data lvm2
    # 添加 Docker 仓库
    yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
    # 安装 Docker
    yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

# 安装 Docker 的函数定义 - Debian/Ubuntu
install_docker_debian() {
    echo "检测到 ${OS} 系统，开始安装 Docker..."
    # 更新包索引并安装依赖
    apt update
    apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg
    # 添加 Docker GPG 密钥和仓库
    mkdir -p /etc/apt/keyrings
    curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/$(. /etc/os-release; echo "$ID")/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.aliyun.com/docker-ce/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    # 安装 Docker
    apt update
    apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

# 安装 Docker 的函数定义 - OpenSUSE
install_docker_suse() {
    echo "检测到 OpenSUSE 系统，开始安装 Docker..."
    # 添加 Docker 仓库
    zypper addrepo https://mirrors.aliyun.com/docker-ce/linux/opensuse/docker-ce.repo
    # 刷新软件源
    zypper refresh
    # 安装 Docker
    zypper install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

# 安装 Docker 的函数定义 - Fedora
install_docker_fedora() {
    echo "检测到 Fedora 系统，开始安装 Docker..."
    # 添加 Docker 仓库
    dnf config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/fedora/docker-ce.repo
    # 安装 Docker
    dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
}

# 配置 Docker 通用设置
configure_docker() {
    echo "配置 Docker 设置..."
    # 创建 Docker 配置目录
    mkdir -p /etc/docker

    # 配置 Docker 守护进程
    cat > /etc/docker/daemon.json <<EOF
{
    "registry-mirrors": [
        "https://docker.1panel.live"

    ],
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "20m",
        "max-file": "3"
    },
    "storage-driver": "overlay2",
    "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF

    # 创建 systemd 目录
    mkdir -p /etc/systemd/system/docker.service.d

    # 重启 Docker 服务
    systemctl daemon-reload
    systemctl restart docker
    systemctl enable docker

    # 验证安装
    if docker info >/dev/null 2>&1; then
        echo "Docker 安装成功！"
        docker --version
    else
        echo "Docker 安装可能出现问题，请检查系统日志"
        exit 1
    fi
}

# 主安装流程
echo "开始安装 Docker..."

# 检查并删除旧版本
echo "检查并删除旧版本..."
case "$OS" in
    centos|rhel)
        yum remove -y docker \
                    docker-client \
                    docker-client-latest \
                    docker-common \
                    docker-latest \
                    docker-latest-logrotate \
                    docker-logrotate \
                    docker-engine
        ;;
    debian|ubuntu)
        apt remove -y docker docker-engine docker.io containerd runc
        ;;
    opensuse*|sles)
        zypper remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
        ;;
    fedora)
        dnf remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
        ;;
esac

# 根据操作系统执行相应的安装过程
case "$OS" in
    centos|rhel)
        install_docker_redhat
        ;;
    debian|ubuntu)
        install_docker_debian
        ;;
    opensuse*|sles)
        install_docker_suse
        ;;
    fedora)
        install_docker_fedora
        ;;
    *)
        echo "不支持的操作系统：$OS"
        exit 1
        ;;
esac

# 配置 Docker
configure_docker

echo "Docker 安装和配置完成！"
