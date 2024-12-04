#!/bin/bash

# 定义主机IP映射
declare -A HOST_IPS=(
    ["master"]="43.156.83.246"
    ["node1"]="43.134.80.61"
)

# 显示机器选择菜单
echo "请选择当前机器的角色："
echo "1. Master"
echo "2. Node1"
echo "4. 退出"

# 读取用户选择
read -p "请输入选择（1/2/4）: " choice

# 根据选择设置主机名和IP
case $choice in
    1)
        HOSTNAME="master"
        ;;
    2)
        HOSTNAME="node1"
        ;;
    4)
        echo "退出脚本"
        exit 0
        ;;
    *)
        echo "无效选择，请重新运行脚本并选择有效选项！"
        exit 1
        ;;
esac

# 设置主机名
hostnamectl set-hostname $HOSTNAME

# 动态生成sed匹配模式
HOSTS_PATTERN=$(IFS=\|; echo "${!HOST_IPS[*]}")

# 删除原有的主机映射
sed -i "/$HOSTS_PATTERN/d" /etc/hosts

# 遍历并写入所有主机信息
for hostname in "${!HOST_IPS[@]}"; do
    echo "${HOST_IPS[$hostname]} $hostname" >> /etc/hosts
done

# 关闭 SELinux
echo "关闭 SELinux"
setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

# 配置网桥的 IPv4 流量
echo "配置网桥的 IPv4 流量"
cat > /etc/sysctl.d/k8s.conf << EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

# 应用 sysctl 设置
sysctl --system

# 网卡信息配置
PARENT_INTERFACE="eth0"
VIRTUAL_INTERFACE="${PARENT_INTERFACE}:1"
NEW_IP="${HOST_IPS[$HOSTNAME]}"
NETMASK="255.255.255.0"

# 创建网卡配置文件
cat > /etc/sysconfig/network-scripts/ifcfg-${VIRTUAL_INTERFACE} << EOF
DEVICE=${VIRTUAL_INTERFACE}
TYPE=Ethernet
BOOTPROTO=static
ONBOOT=yes
IPADDR=${NEW_IP}
NETMASK=${NETMASK}
EOF

# 重启网络服务
systemctl restart network

# 验证配置
ip addr | grep ${NEW_IP}

# 添加 Kubernetes 官方仓库
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF


# 安装 kubernetes 组件
yum install -y kubelet-1.23.0-0 kubectl-1.23.0-0 kubeadm-1.23.0-0

systemctl enable kubelet
systemctl start kubelet
echo "kubelet install ok"

# 查找 10-kubeadm.conf 文件
KUBEADM_CONF=$(find / -name 10-kubeadm.conf 2>/dev/null)

# 检查是否找到文件
if [ -z "$KUBEADM_CONF" ]; then
    echo "未找到 10-kubeadm.conf 文件"
    exit 1
fi

PUBLIC_IP=${HOST_IPS[$HOSTNAME]}

# 备份原始配置文件
cp "$KUBEADM_CONF" "${KUBEADM_CONF}.bak"

# 倒序读取并修改最后一个 ExecStart= 行
tac "$KUBEADM_CONF" | sed '/ExecStart=/s/$/ --node-ip='"$PUBLIC_IP"'/' | tac > "$KUBEADM_CONF"


# 重新加载 systemd 配置
systemctl daemon-reload

echo "10-kubeadm.conf modify ok"

# Master 节点特殊处理
if [ "$HOSTNAME" == "master" ]; then
    # Master 节点初始化
    kubeadm init \
    --apiserver-advertise-address=$PUBLIC_IP \
    --kubernetes-version v1.23.0 \
    --control-plane-endpoint=$PUBLIC_IP \
    --service-cidr=10.96.0.0/12 \
    --pod-network-cidr=10.244.0.0/16 \
    --v=5

    # 配置 kubectl
    mkdir -p $HOME/.kube
    cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    chown $(id -u):$(id -g) $HOME/.kube/config


    # API Server 配置文件路径
    APISERVER_CONFIG="/etc/kubernetes/manifests/kube-apiserver.yaml"

    # 检查文件是否存在
    if [ ! -f "$APISERVER_CONFIG" ]; then
        echo "kube-apiserver.yaml 文件不存在"
        exit 1
    fi

    # 备份原始配置文件
    cp "$APISERVER_CONFIG" "${APISERVER_CONFIG}.bak"

    # 使用 sed 添加 --bind-address=0.0.0.0
    sed -i '/spec:\n  containers:\n  - command:/a\    - --bind-address=0.0.0.0' "$APISERVER_CONFIG"

    # 验证修改
    echo "已添加 --bind-address=0.0.0.0 配置"
    grep -A 3 "spec:" "$APISERVER_CONFIG"
fi


