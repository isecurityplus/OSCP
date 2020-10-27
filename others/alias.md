# Alias 

*将高频率使用的命令编写成 alias 别名，这样可以很大程度提供 Pentest 效率*

## httphere

经常用到需要在本地搭建 http 服务，将文件上传到目标主机的场景，使用别名以后只需要在当前目录输入`httphere`即可：

```
alias httphere='python3 -m http.server 8000'
```
