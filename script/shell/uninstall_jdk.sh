#!/bin/bash

# 定义 JDK 安装目录
jdk_install_dir="/usr/local/java"

# 检查 JDK 安装目录是否存在
if [ ! -d "$jdk_install_dir" ]; then
    echo "错误：JDK 安装目录 $jdk_install_dir 不存在"
    exit 1
fi

# 列出安装的 JDK 版本
jdk_dirs=($(ls -d $jdk_install_dir/* 2>/dev/null))

if [ ${#jdk_dirs[@]} -eq 0 ]; then
    echo "错误：没有找到已安装的 JDK"
    exit 1
fi

echo "找到以下已安装的 JDK 版本："
for i in "${!jdk_dirs[@]}"; do
    echo "$((i+1)). ${jdk_dirs[$i]}"
done

# 让用户选择要卸载的 JDK
echo "请选择要卸载的 JDK（输入数字）："
read choice

if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt ${#jdk_dirs[@]} ]; then
    echo "无效的选择"
    exit 1
fi

selected_jdk="${jdk_dirs[$((choice-1))]}"

# 确认卸载操作
echo "您确定要卸载 JDK $selected_jdk 吗？(y/n)"
read confirm

if [[ "$confirm" != "y" ]]; then
    echo "取消卸载"
    exit 0
fi

# 删除选中的 JDK 目录
sudo rm -rf "$selected_jdk"

# 从环境变量中移除 JAVA_HOME 和 PATH 设置
sudo sed -i "\|$selected_jdk|d" /etc/profile

# 提示用户更新环境变量
echo "请重新登录或运行 'source /etc/profile' 以更新环境变量"

echo "JDK $selected_jdk 卸载完成"
