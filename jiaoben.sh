#!/bin/bash
-n 屏蔽默认输出
-r 让sed支持扩展正则
-i 修改源文件

sed '1p' /etc/hosts
sed -n '1p' /etc/hosts       ##打印第一行
sed -n '3,6p' /etc/passwd   ##3到6行
sed -n '3;6p' /etc/passwd   ##3行和6行
sed 'd' /etc/passwd      ##删除全部



ssss
