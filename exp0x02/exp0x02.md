## exp0x02 From GUI to CLI

## 实验要求

- 确保本地已经完成**asciinema auth**，并在asciinema成功关联了本地账号和在线账号
- 上传本人亲自动手完成的**vimtutor**操作全程录像
- 在自己的github仓库上新建markdown格式纯文本文件附上asciinema的分享URL

## 实验环境

- Ubuntu-18.04.1-server
- 网卡：NAT、Host-only

## 实验过程与结果

### 准备工作

- 在asciinema注册一个账号

![](/img/asciinema-id.png)

- 在虚拟机上安装asciinema：`sudo apt install asciinema`
- 通过`asciinema auth`关联本地和远程账号
- `asciinema rec`开始录像
- `vimtutor`进入vim指导手册
- `exit`退出录像，`<Enter>`将录像上传

### Lesson 1

- https://asciinema.org/a/DmCdCMV6ljSTK9GNrgVAGZlJz

### Lesson 2

- https://asciinema.org/a/9bg4zwyTdQzePRiLUll0V2pw1

### Lesson 3

- https://asciinema.org/a/0FI5gB8FezBbhlw7unVGhZg6R

### Lesson 4

- https://asciinema.org/a/u37OMH31iXXengZvPRh2OBRyV

### Lesson 5

- https://asciinema.org/a/idknZCIgc7BwjCMnNayRIG21i

### Lesson 6

- https://asciinema.org/a/wRBrRdrYcwhlV5BnaLjjRFhOM

### Lesson 7

- https://asciinema.org/a/RQZ1M7s3eAzK3JUjBV0DepEfI

## vim使用自查测验

- 你了解vim有哪几种工作模式？
  - Normal
  - Insert
  - Visual
- Normal模式下，从当前行开始，一次向下移动光标10行的操作方法？如何快速移动到文件开始行和结束行？如何快速跳转到文件中的第N行？
  - `10j`
  - 开始行：`gg`；结束行：`G`
  - `NG`或`Ngg`
- Normal模式下，如何删除单个字符、单个单词、从当前光标位置一直删除到行尾、单行、当前行开始向下数N行？
  - `x`
  - `dw`
  - `d$`
  - `dd`
  - `Ndd`
- 如何在vim中快速插入N个空行？如何在vim中快速输入80个-？
  - Normal模式下：`No` `ESC`
  - Normal模式下：`80i-` `ESC`
- 如何撤销最近一次编辑操作？如何重做最近一次被撤销的操作？
  - `u`
  - `Ctrl-R`
- vim中如何实现剪切粘贴单个字符？单个单词？单行？如何实现相似的复制粘贴操作呢？
  - `d`操作相当于剪切，同第3题，用`p`进行粘贴
  - 复制使用`y`
- 为了编辑一段文本你能想到哪几种操作方式（按键序列）？
  - 从当前字符之前开始编辑：`i`
  - 从当前字符之后开始编辑：`a`
  - 从当前行之后开始编辑：`o`
  - 从当前行之前开始编辑：`O`
  - 改变当前字符：`c`
- 查看当前正在编辑的文件名的方法？查看当前光标所在行的行号的方法？
  - `Ctrl-G`
- 在文件中进行关键词搜索你会哪些方法？如何设置忽略大小写的情况下进行匹配搜索？如何将匹配的搜索结果进行高亮显示？如何对匹配到的关键词进行批量替换？
  - `/keyword`，keyword为待查的单词，此为向后查找
  - `?keyword`，此为向后查找
  - 忽略大小写：`:set ic`，`Enter`
  - 高亮：`:set hlsearch`
  - 替换：`:s/[old]/[new]`，如果在结尾加一个`/g`则是全局替换
- 在文件中最近编辑过的位置来回快速跳转的方法？
  - 上一次编辑位置：`Ctrl-I`
  - 下一次编辑位置：`Ctrl-O`
- 如何把光标定位到各种括号的匹配项？例如：找到(, [, or {对应匹配的),], or }
  - 将光标挪到待匹配的括号处，`%`
- 在不退出vim的情况下执行一个外部程序的方法？
  - `:![external]`
- 如何使用vim的内置帮助系统来查询一个内置默认快捷键的使用方法？如何在两个不同的分屏窗口中移动光标？
  - `:help [快捷键]`
  - 左右分屏：`vs`
  - 上下分屏：`sv`
  - 将光标移到另一个屏幕中：`Ctrl-W`

## 实验遇到的问题

- 指令的大小写区分问题，如果在大写模式下按`J`，会删除换行

## 参考资料

- http://sec.cuc.edu.cn/huangwei/course/LinuxSysAdmin/chap0x02.exp.md.html#/title-slide
- https://asciinema.org/docs/how-it-works