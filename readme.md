# 保存个人配置文件的仓库
* Gnome
![Ubuntu_Gnome](./pictures/ubuntu_gnome.png)
* i3wm
![i3wm](./pictures/i3wm.png)
## vim(nvim)
1. 安装插件管理工具vim-plug
2. 将vimrc文件替换
3. 安装插件
4. 安装cmake、python3.x-dev等工具
5. 进入目录安装YouCompleteMe

## zsh
1. 安装插件管理工具zplug
2. 替换zshrc文件
3. 安装插件和主题
4. 配置powerlevel10k（需要安装字体）
5. 安装oh-my-zsh
6. source .zshrc或者重启终端

## conky
* 使用wiki上的配置，修改为全透明背景以及显示位置
1. 配置文件地址：.config/conky/conky.conf
2. i3bar中使用的配置文件地址：.config/conky/conkyrc

## ibus-rime
1. 使用明月简体拼音输入
2. 同时使用东风破管理插件（目前只有表情插件，而且还没有生效）
3. 配置文件地址：.config/ibus/rime/

## i3-gaps
1. 简单的i3配置文件，实现ubuntu+i3wm环境
2. 自定义窗口位置和工作区
3. 设置窗口间距

## compton(picom)
1. 透明管理器
2. 在i3环境中运行时2核虚拟机CPU使用率约为10%，可以设定特定程序透明和毛玻璃特性
3. 设置有很多配置，在ubuntu中编译好的包莫认可用透明gnome-terminal

## alacritty
1. 终端配置
2. 内存使用较高，使用GPU加速

## fcitx-rime
1. 在i3wm中使用更好，使用ubuntu的im-config可以自动配置不同的桌面使用不同的输入法
2. 在ubuntu中apt默认安装的时fcitx4
3. 可以使用github安装新的皮肤

