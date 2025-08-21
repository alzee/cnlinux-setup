# Kylin V10 (银河麒麟) 环境配置

用于内网（无互联网）环境下的自动化系统环境配置。

### 逻辑
1. 将所需软件包写入`pkgs`，每行一个，如：
    ```
    flex
    bison
    readline-devel
    httpd
    screen
    php
    postgresql
    ```
1. 运行`run.sh`，该脚本将：
    1. 逐个安装`pkgs`中软件包
    1. 优先尝试从专网中仓库安装
    1. 若从仓库安装失败（如没有该软件包），则尝试运行编译安装脚本
    1. 安装完成，执行`Post install`配置脚本
    1. 每个软件包可有一个名称对应的目录，编译安装脚本和配置脚本位于该目录下

* 适用版本
    * Kylin Linux Advanced Server V10 (Sword) 银河麒麟高级服务器操作系统V10。kernel: 4.19.90
    * 包管理为`dnf`的系统

### TODO
    * 适用于多数`Debian` base（apt）的国产系统
    * 适用于多数`Fedora` base（dnf）的国产系统
