#!/bin/bash

# 检查当前目录中的JDK压缩包
jdk_files=($(ls jdk*.tar.gz 2>/dev/null))

if [ ${#jdk_files[@]} -eq 0 ]; then
    echo "错误：当前目录中没有找到JDK压缩包"
    exit 1
fi

# 列出可用的JDK压缩包
echo "找到以下JDK压缩包："
for i in "${!jdk_files[@]}"; do
    echo "$((i+1)). ${jdk_files[$i]}"
done

# 让用户选择要安装的JDK
echo "请选择要安装的JDK（输入数字）："
read choice

if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt ${#jdk_files[@]} ]; then
    echo "无效的选择"
    exit 1
fi

selected_jdk="${jdk_files[$((choice-1))]}"

# 创建安装目录
sudo mkdir -p /usr/local/java

# 解压选中的JDK
sudo tar -xvzf "$selected_jdk" -C /usr/local/java

# 获取解压后的目录名
jdk_dir=$(tar -tzf "$selected_jdk" | head -1 | cut -f1 -d"/")

# 设置环境变量
echo "export JAVA_HOME=/usr/local/java/$jdk_dir" | sudo tee -a /etc/profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" | sudo tee -a /etc/profile

# 使环境变量生效
source /etc/profile

# 验证安装
java -version

echo "JDK $selected_jdk 安装完成"
echo "请重新登录或运行 'source /etc/profile' 以使环境变量生效"
