# 国产操作系统环境配置

国产操作系统的环境配置自动化。

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
    1. 若从仓库安装失败（如没有该软件包），则尝试运行编译安装脚本`build.sh`
    1. 安装完成，执行配置脚本`setup.sh`
    1. 每个软件包有一个对应名称的目录，该目录存放该软件的编译安装脚本`build.sh`、配置脚本`setup.sh`、tar包及其它配置文件

### `fork`该仓库，并编写自己的软件包列表和对应脚本

### `pr`欢迎贡献软件包编译安装脚本及配置文件
`pr`的脚本及配置文件应符合标准及通用原则


* 测试版本
    * Kylin Linux Advanced Server V10 (Sword) 银河麒麟高级服务器操作系统V10。kernel: 4.19.90

### TODO
    * 适用于多数`Debian` base（apt）的国产系统
    * 适用于多数`Fedora` base（dnf）的国产系统
