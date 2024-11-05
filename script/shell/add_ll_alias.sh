#!/bin/bash

# 检查 ~/.bashrc 中是否已经存在 ll 的别名
if ! grep -q "alias ll='ls -l --color=auto'" ~/.bashrc; then
    # 如果没有，添加 ll 别名到 ~/.bashrc
    echo "alias ll='ls -l --color=auto'" >> ~/.bashrc
    echo "别名 ll 已成功添加到 ~/.bashrc 中。"
else
    echo "别名 ll 已经存在于 ~/.bashrc 中，无需重复添加。"
fi

# 重新加载 ~/.bashrc 以应用更改
source ~/.bashrc
