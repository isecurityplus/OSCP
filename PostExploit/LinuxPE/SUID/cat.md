如果 cat 拥有 S 权限，我们可以使用它以 root 权限读取文件。
例如使用 cat 读取/etc/passwd 文件：
```
LFILE=/etc/passwd
./cat "$LFILE"
```
